# Hoofdstuk 7 - Jobs, Queues & Scheduler

## Introductie

Open je Crypto Dashboard uit Hoofdstuk 3 en 4 en verstuur een bericht via het contactformulier. Let goed op: na het klikken op "Verstuur bericht" duurt het even voordat de pagina terugkomt. Dat komt doordat Laravel **eerst** verbinding maakt met de mailserver van Mailtrap, **dan** de e-mail verstuurt, en pas **daarna** de pagina terugstuurt naar de bezoeker.

Hetzelfde gebeurt bij de knop "Ververs data": de bezoeker staart naar een laadscherm totdat de CoinGecko API heeft geantwoord.

Voor de bezoeker maakt het niet uit *wanneer* de e-mail precies verstuurd wordt. Of dat nu meteen is of 2 seconden later - als hij maar direct "Bedankt voor je bericht!" ziet.

Dit is precies waar **jobs** en **queues** voor zijn: trage taken worden **op de achtergrond** uitgevoerd, zodat de bezoeker niet hoeft te wachten.

### Vergelijking: het restaurant

| In het restaurant | In Laravel |
|---|---|
| Je bestelt bij de ober | De bezoeker verstuurt een formulier (request) |
| De ober schrijft een bonnetje en hangt het op de rail naar de keuken | De controller maakt een **job** aan en zet die in de **queue** |
| De ober loopt direct door naar de volgende tafel | De controller stuurt direct een response terug |
| De kok pakt de bonnetjes één voor één van de rail en maakt het eten | De **worker** pakt de jobs één voor één uit de queue en voert ze uit |
| Is de kok er niet, dan blijven de bonnetjes gewoon hangen | Draait de worker niet, dan blijven de jobs gewoon in de queue staan |

Stel je voor dat de ober zelf het eten zou koken voordat hij de volgende bestelling opneemt. Dat is wat je applicatie nu doet.

### Begrippen

| Begrip | Wat is het? |
|---|---|
| **Job** | Een PHP class met één taak, bijvoorbeeld "verstuur deze e-mail" of "ververs de coinprijzen". Staat in `app/Jobs`. |
| **Queue** | De wachtrij waarin jobs staan te wachten. Wij gebruiken een tabel in de database (`jobs`). |
| **Dispatchen** | Een job in de queue zetten. "Deze taak moet nog gebeuren." |
| **Worker** | Een proces dat continu draait, jobs uit de queue haalt en uitvoert: `php artisan queue:work` |
| **Failed job** | Een job die (meerdere keren) is mislukt. Die komt in de tabel `failed_jobs`. |
| **Scheduler** | Laravel's "wekker": voert taken automatisch uit op vaste tijden, bijvoorbeeld elke 10 minuten. |

**Wat ga je leren?**

- Het verschil tussen *synchroon* (nu, en de bezoeker wacht) en *asynchroon* (later, op de achtergrond)
- Een job aanmaken met `php artisan make:job`
- Een job dispatchen vanuit een controller
- Een worker starten met `php artisan queue:work`
- Mislukte jobs opnieuw proberen met `$tries` en `$backoff`
- Mislukte jobs bekijken en opnieuw uitvoeren
- Taken automatisch laten uitvoeren met de **scheduler**

We werken verder in het **cryptodashboard** project uit Hoofdstuk 3 en 4.

---

## Opdracht 1: Het probleem meten

**Doel:** Zien hoe lang de bezoeker nu moet wachten

### 1.1 Netwerktijd bekijken

1. Open http://cryptodashboard.test/contact
2. Open DevTools (F12) en ga naar het tabblad **Network**
3. Vul het contactformulier in en klik op "Verstuur bericht"
4. Klik in het Network-tabblad op het `contact`-request (method **POST**)
5. Kijk bij **Timing** hoe lang het duurde voordat de server antwoordde (*Waiting for server response*)

Schrijf de tijd op. Doe hetzelfde voor de knop "Ververs data" op `/coins` (request `refresh`).

| Actie | Tijd |
|---|---|
| Contactformulier versturen | ... ms |
| Ververs data | ... ms |

### 1.2 Wat gebeurt er in die tijd?

```
Bezoeker klikt op "Verstuur"
        │
        ▼
Controller valideert de invoer          ← snel
        │
        ▼
Laravel verbindt met Mailtrap           ← traag (internet)
Laravel verstuurt de e-mail             ← traag (internet)
        │
        ▼
Redirect met "Bedankt!"                 ← bezoeker ziet eindelijk iets
```

De bezoeker wacht op iets dat hij niet eens ziet. En wat als Mailtrap even niet bereikbaar is? Dan krijgt de bezoeker een **foutmelding**, terwijl zijn bericht prima was.

**Denkvraag:** Bedenk nog twee voorbeelden uit apps die je zelf gebruikt waarbij iets op de achtergrond gebeurt. (Tip: denk aan het uploaden van een video, een bevestigingsmail na een bestelling, of een melding op je telefoon.)

**Checkpoint:** Je hebt de tijden opgeschreven en kan in eigen woorden uitleggen waarom de bezoeker moet wachten.

---

## Opdracht 2: De queue instellen

**Doel:** Controleren dat Laravel de database gebruikt als queue

### 2.1 `.env` controleren

Open `.env` en zoek de regel:

```
QUEUE_CONNECTION=database
```

Staat hier iets anders, bijvoorbeeld `sync`? Verander het dan naar `database`.

| Waarde | Betekenis |
|---|---|
| `sync` | Geen echte queue: jobs worden **direct** uitgevoerd, de bezoeker wacht nog steeds. Handig om te debuggen. |
| `database` | Jobs worden opgeslagen in de tabel `jobs` en later door een worker uitgevoerd. |
| `redis` | Zoals `database`, maar sneller. Wordt gebruikt bij grote websites. Voor ons niet nodig. |

### 2.2 De tabellen controleren

Een nieuw Laravel project heeft de tabellen voor de queue al. Kijk in `database/migrations`: daar staat een bestand dat eindigt op `_create_jobs_table.php`. Open het en bekijk welke drie tabellen er worden aangemaakt:

| Tabel | Waarvoor |
|---|---|
| `jobs` | De wachtrij: jobs die nog uitgevoerd moeten worden |
| `job_batches` | Groepen jobs (gebruiken we niet) |
| `failed_jobs` | Jobs die mislukt zijn |

Deze migration is al uitgevoerd toen je in Hoofdstuk 3 `php artisan migrate` deed. Controleer het met:

```bash
php artisan migrate:status
```

Staat de `create_jobs_table` migration niet op **Ran**? Voer dan `php artisan migrate` uit.

### 2.3 Config cache legen

Heb je `.env` aangepast? Voer dan uit:

```bash
php artisan config:clear
```

**Checkpoint:** `QUEUE_CONNECTION=database` staat in `.env` en de `jobs`-migration staat op **Ran**.

---

## Opdracht 3: Je eerste job - contactmail versturen

**Doel:** Het versturen van de contactmail verplaatsen naar een job

### 3.1 Job genereren

```bash
php artisan make:job SendContactMail
```

Dit maakt het bestand `app/Jobs/SendContactMail.php` aan. (De map `app/Jobs` wordt automatisch aangemaakt.)

### 3.2 Job invullen

Open `app/Jobs/SendContactMail.php` en vervang de inhoud:

```php
<?php

namespace App\Jobs;

use App\Mail\ContactMail;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Queue\Queueable;
use Illuminate\Support\Facades\Mail;

class SendContactMail implements ShouldQueue
{
    use Queueable;

    public function __construct(
        public string $senderName,
        public string $senderEmail,
        public string $mailSubject,
        public string $mailMessage,
    ) {}

    public function handle(): void
    {
        Mail::to('admin@cryptodashboard.test')->send(
            new ContactMail(
                senderName: $this->senderName,
                senderEmail: $this->senderEmail,
                mailSubject: $this->mailSubject,
                mailMessage: $this->mailMessage,
            )
        );
    }
}
```

### 3.3 Uitleg van de job

| Onderdeel | Wat het doet |
|---|---|
| `implements ShouldQueue` | Vertelt Laravel: "deze job moet in de queue, niet direct uitgevoerd worden". Zonder deze regel wordt de job alsnog meteen uitgevoerd. |
| `use Queueable` | Geeft de job extra mogelijkheden, zoals een vertraging (`delay`) of een andere queue kiezen. |
| `__construct(...)` | Ontvangt de gegevens die de job nodig heeft. Deze worden **opgeslagen in de database** zolang de job in de queue staat. |
| `handle()` | Het eigenlijke werk. Deze methode wordt pas uitgevoerd als de **worker** de job oppakt. |

Vergelijk dit met de `ContactMail` uit Hoofdstuk 4: de constructor ziet er bijna hetzelfde uit. Het verschil:
- De **Mailable** beschrijft *hoe de e-mail eruitziet*
- De **Job** beschrijft *de taak om de e-mail te versturen*

### 3.4 Controller aanpassen

Open `app/Http/Controllers/ContactController.php`. Vervang in de `send` methode het `Mail::to(...)->send(...)` blok door:

```php
SendContactMail::dispatch(
    senderName: $validated['name'],
    senderEmail: $validated['email'],
    mailSubject: $validated['subject'],
    mailMessage: $validated['message'],
);
```

Pas bovenaan de `use`-regels aan. `Mail` en `ContactMail` heb je in de controller niet meer nodig:

```php
use App\Jobs\SendContactMail;
use Illuminate\Http\Request;
```

De volledige `send` methode ziet er nu zo uit:

```php
public function send(Request $request)
{
    $validated = $request->validate([
        'name' => 'required|min:2',
        'email' => 'required|email',
        'subject' => 'required|min:3',
        'message' => 'required|min:10',
    ]);

    SendContactMail::dispatch(
        senderName: $validated['name'],
        senderEmail: $validated['email'],
        mailSubject: $validated['subject'],
        mailMessage: $validated['message'],
    );

    return redirect('/contact')->with('success', 'Bedankt voor je bericht! We nemen zo snel mogelijk contact op.');
}
```

`SendContactMail::dispatch(...)` leest als: "Maak een nieuwe SendContactMail-job met deze gegevens en zet hem in de queue."

**Checkpoint:** De controller gebruikt geen `Mail::to()` meer, maar `SendContactMail::dispatch()`.

---

## Opdracht 4: De queue in actie

**Doel:** Zien wat er gebeurt met en zonder worker

### 4.1 Zonder worker

1. Verstuur een bericht via het contactformulier
2. Kijk in het Network-tabblad: hoe lang duurt het nu? Vergelijk met je tijd uit opdracht 1
3. Kijk in je Mailtrap inbox. Is de e-mail aangekomen?

De e-mail is **niet** aangekomen. Klopt dat? Ja! De job staat in de queue te wachten, maar er is nog geen "kok" die hem oppakt.

### 4.2 De job in de database bekijken

Open een terminal en start **Tinker** (een PHP-console voor je Laravel project):

```bash
php artisan tinker
```

Typ:

```php
DB::table('jobs')->count();
```

Je ziet `1` (of meer, als je vaker op verstuur hebt geklikt). Bekijk de job zelf:

```php
DB::table('jobs')->first();
```

In het veld `payload` zie je de naam van de job (`App\\Jobs\\SendContactMail`) en de gegevens uit het formulier. Zo onthoudt Laravel wat er nog moet gebeuren.

Sluit Tinker af met `exit`.

### 4.3 De worker starten

Open een **tweede terminal** in VS Code (klik op het **+** icoon in het terminalpaneel). Voer uit:

```bash
php artisan queue:work
```

Je ziet zoiets als:

```
  INFO  Processing jobs from the [default] queue.

  2026-09-30 10:15:02 App\Jobs\SendContactMail ........... RUNNING
  2026-09-30 10:15:03 App\Jobs\SendContactMail ........... 1s DONE
```

Kijk nu in Mailtrap: de e-mail is binnen!

**Laat de worker draaien** en verstuur nog een bericht. Je ziet de job direct voorbijkomen in de tweede terminal.

### 4.4 Belangrijk: de worker onthoudt je code

`queue:work` laadt je code **één keer** bij het starten. Pas je daarna iets aan in een job, dan merkt de worker dat **niet**. Stop de worker (`Ctrl+C`) en start hem opnieuw na elke wijziging.

Tijdens het ontwikkelen kan je ook dit commando gebruiken:

```bash
php artisan queue:listen
```

`queue:listen` laadt de code bij elke job opnieuw. Iets langzamer, maar je hoeft niet steeds te herstarten.

| Commando | Wanneer |
|---|---|
| `php artisan queue:work` | Op een echte server (sneller) - herstarten na codewijziging |
| `php artisan queue:listen` | Tijdens het ontwikkelen (laadt code steeds opnieuw) |

**Checkpoint:** Zonder worker blijft de job in de tabel `jobs` staan. Met worker wordt de e-mail binnen een seconde verstuurd, en de bezoeker hoeft er niet op te wachten.

---

## Opdracht 5: De snelle manier voor e-mail

**Doel:** Weten dat e-mails ook zonder eigen job-class in de queue kunnen

Een e-mail in de queue zetten is zo gewoon, dat Laravel er een kortere manier voor heeft. Kijk nog eens naar je `ContactMail` uit Hoofdstuk 4:

```php
class ContactMail extends Mailable
{
    use Queueable, SerializesModels;
```

Die `Queueable` stond er al! Een Mailable kan zichzelf in de queue zetten. In plaats van `->send()` gebruik je dan `->queue()`:

```php
Mail::to('admin@cryptodashboard.test')->queue(
    new ContactMail(...)
);
```

Laravel maakt dan zelf op de achtergrond een job aan.

| | Eigen job (`SendContactMail`) | `Mail::...->queue()` |
|---|---|---|
| **Hoeveel code** | Extra class | Eén woord aanpassen |
| **Wanneer handig** | Als je in de job méér wil doen dan alleen mailen (bijv. ook iets opslaan of loggen) | Als je alleen een e-mail wil versturen |

**Opdracht:** Je hoeft de controller niet om te bouwen. Beantwoord alleen de vraag: welke van de twee zou jij kiezen voor het contactformulier, en waarom? We houden in dit hoofdstuk de eigen job aan, omdat je daarmee beter ziet hoe jobs werken.

**Checkpoint:** Je kan uitleggen wat het verschil is tussen `->send()` en `->queue()`.

---

## Opdracht 6: Job voor het verversen van de coins

**Doel:** De API-aanroep naar CoinGecko verplaatsen naar een job

Kijk naar je `CoinController`. De `foreach` met `Coin::updateOrCreate(...)` staat er **twee keer** in: in `index()` én in `refresh()`. Dat is dubbele code. Met een job lossen we twee problemen tegelijk op: de bezoeker hoeft niet te wachten, én de code staat op één plek.

### 6.1 Job genereren

```bash
php artisan make:job RefreshCoinPrices
```

### 6.2 Job invullen

Open `app/Jobs/RefreshCoinPrices.php` en vervang de inhoud:

```php
<?php

namespace App\Jobs;

use App\Models\Coin;
use App\Services\CoinGeckoService;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Queue\Queueable;

class RefreshCoinPrices implements ShouldQueue
{
    use Queueable;

    public function handle(CoinGeckoService $service): void
    {
        $apiCoins = $service->getTopCoins();

        foreach ($apiCoins as $apiCoin) {
            Coin::updateOrCreate(
                ['coin_id' => $apiCoin['id']],
                [
                    'symbol' => $apiCoin['symbol'],
                    'name' => $apiCoin['name'],
                    'image' => $apiCoin['image'],
                    'current_price' => $apiCoin['current_price'],
                    'market_cap' => $apiCoin['market_cap'],
                    'market_cap_rank' => $apiCoin['market_cap_rank'],
                    'price_change_percentage_24h' => $apiCoin['price_change_percentage_24h'],
                    'fetched_at' => now(),
                ]
            );
        }
    }
}
```

### 6.3 Uitleg

- Deze job heeft **geen constructor**: hij heeft geen gegevens van buitenaf nodig. Hij haalt gewoon de top 10 op.
- `handle(CoinGeckoService $service)`: Laravel maakt automatisch een `CoinGeckoService` aan en geeft die mee. Dit heet **dependency injection**. Je hoeft dus geen `new CoinGeckoService()` meer te schrijven.
- De rest is precies dezelfde code als in je controller uit Hoofdstuk 3, alleen staat hij nu op één plek.

### 6.4 Controller aanpassen

Pas de `refresh` methode in `CoinController.php` aan:

```php
public function refresh()
{
    RefreshCoinPrices::dispatch();

    return redirect('/coins')->with('status', 'De prijzen worden ververst. Herlaad de pagina over een paar seconden.');
}
```

En pas in de `index` methode het blok binnen `if ($dataIsExpired)` aan:

```php
if ($dataIsExpired) {
    RefreshCoinPrices::dispatchSync();
    $fromCache = false;
} else {
    $fromCache = true;
}
```

Voeg bovenaan de controller toe:

```php
use App\Jobs\RefreshCoinPrices;
```

De `use App\Services\CoinGeckoService;` regel heb je in de controller niet meer nodig.

### 6.5 `dispatch()` of `dispatchSync()`?

Waarom gebruiken we in `index()` iets anders dan in `refresh()`?

| | `dispatch()` | `dispatchSync()` |
|---|---|---|
| **Wat gebeurt er** | Job gaat in de queue, worker voert hem later uit | Job wordt **nu meteen** uitgevoerd, zonder queue |
| **Bezoeker wacht** | Nee | Ja |
| **Gebruikt in** | `refresh()` | `index()` |

In `index()` tonen we **direct daarna** de coins. Als de database leeg is (eerste bezoek) en we de job in de queue zetten, ziet de bezoeker een lege tabel. Daarom voeren we de job daar direct uit. In `refresh()` maakt dat niet uit: de bezoeker ziet de oude prijzen, en na een paar seconden de nieuwe.

Handig: dezelfde job kan je op beide manieren gebruiken. De code staat maar op één plek.

### 6.6 Statusmelding tonen

Voeg in `resources/views/coins/index.blade.php` onder de `<nav>` toe:

```html
@if (session('status'))
    <div style="margin-bottom: 15px; padding: 10px; border-radius: 5px; background-color: #1565c0;">
        {{ session('status') }}
    </div>
@endif
```

**Checkpoint:** Klik op "Ververs data". De pagina komt direct terug met de blauwe melding. In de terminal van de worker zie je `RefreshCoinPrices ... DONE`. Herlaad de pagina: de tijd bij "Laatst opgehaald" is bijgewerkt.

---

## Opdracht 7: Als een job mislukt

**Doel:** Begrijpen wat er gebeurt als een job fout gaat, en hoe je dat oplost

Een API kan down zijn, een mailserver kan even niet reageren. Bij een gewone request krijgt de bezoeker dan een foutmelding. Bij een job kan Laravel het **automatisch opnieuw proberen**.

### 7.1 Fout zichtbaar maken

Kijk naar `CoinGeckoService`: als de API faalt, geeft hij een lege array terug. De job doet dan... niks, en denkt dat alles goed ging. Dat willen we niet. Pas de `handle` methode van `RefreshCoinPrices` aan:

```php
public function handle(CoinGeckoService $service): void
{
    $apiCoins = $service->getTopCoins();

    if (empty($apiCoins)) {
        throw new \Exception('CoinGecko API gaf geen data terug.');
    }

    foreach ($apiCoins as $apiCoin) {
        // ... (blijft hetzelfde)
    }
}
```

Door een **exception** te gooien, weet Laravel dat de job mislukt is.

### 7.2 Opnieuw proberen met `$tries` en `$backoff`

Voeg bovenaan in de class `RefreshCoinPrices` (onder `use Queueable;`) toe:

```php
public $tries = 3;

public $backoff = 10;
```

| Property | Betekenis |
|---|---|
| `$tries = 3` | Probeer de job maximaal 3 keer |
| `$backoff = 10` | Wacht 10 seconden tussen de pogingen |

Waarom wachten? Als een API net even overbelast is, heeft het geen zin om direct opnieuw te proberen. Even wachten geeft de API tijd om te herstellen.

### 7.3 Een fout simuleren

1. Open `app/Services/CoinGeckoService.php` en maak expres een typfout in de URL:
```php
protected $baseUrl = 'https://api.coingecko.com/api/v3/FOUT/';
```
2. **Herstart de worker** (`Ctrl+C` en opnieuw `php artisan queue:work`) - weet je nog waarom?
3. Klik op "Ververs data"
4. Kijk in de terminal van de worker. Je ziet de job drie keer voorbijkomen, met telkens 10 seconden ertussen, en daarna `FAIL`

### 7.4 Mislukte jobs bekijken

```bash
php artisan queue:failed
```

Je ziet een lijst met mislukte jobs, met een ID, de naam van de job en wanneer hij faalde. De volledige foutmelding staat in de tabel `failed_jobs` (kolom `exception`).

### 7.5 Fout herstellen en opnieuw uitvoeren

1. Haal de typfout weg uit `CoinGeckoService`
2. Herstart de worker
3. Voer de mislukte job opnieuw uit:
```bash
php artisan queue:retry all
```
4. Kijk in de worker: de job wordt nu wel uitgevoerd

Handig om te weten:

| Commando | Wat het doet |
|---|---|
| `php artisan queue:failed` | Toont alle mislukte jobs |
| `php artisan queue:retry all` | Zet alle mislukte jobs opnieuw in de queue |
| `php artisan queue:retry <id>` | Zet één mislukte job opnieuw in de queue |
| `php artisan queue:flush` | Verwijdert alle mislukte jobs |

**Dit is het grote voordeel van jobs:** er gaat niets verloren. Een contactbericht dat niet verstuurd kon worden omdat Mailtrap even down was, staat gewoon in `failed_jobs` en kan later alsnog verstuurd worden.

**Checkpoint:** Je hebt een job zien mislukken, hem in `queue:failed` teruggevonden en met `queue:retry` alsnog uitgevoerd.

---

## Opdracht 8: De scheduler - automatisch verversen

**Doel:** De coinprijzen elke 10 minuten automatisch laten verversen, zonder dat er een bezoeker nodig is

Op dit moment worden de prijzen alleen ververst als een bezoeker de pagina opent (of op de knop klikt). De eerste bezoeker na 10 minuten moet dus nog steeds wachten. Beter: laat de server het **zelf** doen, elke 10 minuten. Daarvoor gebruik je de **scheduler**.

### 8.1 Taak inplannen

Open `routes/console.php` en voeg onderaan toe:

```php
use App\Jobs\RefreshCoinPrices;
use Illuminate\Support\Facades\Schedule;

Schedule::job(new RefreshCoinPrices)->everyTenMinutes();
```

(Zet de `use`-regels bovenaan het bestand, bij de andere `use`-regels.)

Dit leest als: "Zet elke 10 minuten een nieuwe `RefreshCoinPrices`-job in de queue."

Andere mogelijkheden:

| Methode | Wanneer |
|---|---|
| `->everyMinute()` | Elke minuut |
| `->everyFiveMinutes()` | Elke 5 minuten |
| `->hourly()` | Elk uur |
| `->dailyAt('08:00')` | Elke dag om 8:00 |
| `->weekdays()->at('09:00')` | Op werkdagen om 9:00 |

### 8.2 Controleren wat er gepland staat

```bash
php artisan schedule:list
```

Je ziet je taak, met wanneer hij de volgende keer wordt uitgevoerd.

### 8.3 De scheduler draaien

De scheduler moet zelf ook draaien. Open een **derde terminal** en voer uit:

```bash
php artisan schedule:work
```

Deze terminal kijkt elke minuut of er een taak uitgevoerd moet worden. Om de 10 minuten zet hij een `RefreshCoinPrices`-job in de queue, en je worker (tweede terminal) voert die uit.

Wil je niet 10 minuten wachten? Zet het tijdelijk op `->everyMinute()`, en daarna weer terug.

### 8.4 Hoe hangt alles samen?

```
┌───────────────────┐      elke 10 min      ┌──────────────┐
│ Scheduler         │ ────────────────────▶ │  Queue       │
│ (schedule:work)   │   zet job in queue    │  (jobs-tabel)│
└───────────────────┘                       └──────┬───────┘
                                                   │ pakt job op
┌───────────────────┐   dispatch()                 ▼
│ Controller        │ ──────────────────▶  ┌──────────────┐     ┌──────────────┐
│ (refresh-knop)    │                      │  Worker      │ ──▶ │ CoinGecko API│
└───────────────────┘                      │ (queue:work) │     └──────────────┘
                                           └──────┬───────┘
                                                  │ updateOrCreate
                                                  ▼
                                           ┌──────────────┐
                                           │  coins-tabel │ ◀── index() leest hieruit
                                           └──────────────┘
```

Je hebt nu drie terminals open:

| Terminal | Commando | Rol in het restaurant |
|---|---|---|
| 1 | (vrij, voor artisan-commando's) | - |
| 2 | `php artisan queue:work` | De kok |
| 3 | `php artisan schedule:work` | De wekker die elke 10 minuten een bonnetje ophangt |

(De website zelf wordt door Herd gedraaid - daar heb je geen terminal voor nodig.)

### 8.5 Op een echte server

Op een echte server open je geen terminals. Daar:
- draait de **worker** continu op de achtergrond (met een programma als *Supervisor*, dat de worker herstart als hij crasht)
- start een **cronjob** elke minuut `php artisan schedule:run`

Dat hoef je nu nog niet in te stellen, maar het is goed om te weten dat het zo werkt.

**Checkpoint:** `php artisan schedule:list` toont je taak. Met `schedule:work` en `queue:work` draaiend worden de prijzen automatisch ververst - je ziet de tijd bij "Laatst opgehaald" veranderen zonder dat je op de knop klikt.

---

## Kennischeck

Beantwoord deze vragen in je eigen woorden, zonder AI:

1. Wat is het verschil tussen een job en een worker?
2. Je dispatcht een job, maar er gebeurt niets. Wat is de meest waarschijnlijke oorzaak?
3. Je hebt de `handle` methode van een job aangepast, maar de worker voert nog steeds de oude code uit. Hoe kan dat, en hoe los je het op?
4. Waarom gebruiken we in `index()` `dispatchSync()` en in `refresh()` `dispatch()`?
5. Wat gebeurt er met een job die 3 keer mislukt als `$tries = 3`?
6. Noem twee taken uit je eigen projecten (of de projectlessen) waarvoor je een job zou gebruiken. Leg uit waarom.

---

## Bonusopdracht A: Prijsalert als job

In Hoofdstuk 4 (bonusopdracht A) heb je misschien een prijsalert-mail gemaakt die je via een route start. Bouw dit om:

1. Maak een job `CheckPriceAlerts` die de coins zoekt met een prijsverandering van meer dan 5% (of minder dan -5%)
2. Verstuur voor die coins een `PriceAlertMail` (gebruik `Mail::...->queue()`)
3. Plan de job in met de scheduler: elk uur

**Hint:** Je kan in `routes/console.php` meerdere taken onder elkaar inplannen.

## Bonusopdracht B: Vertraagde job

Stuur de bezoeker van het contactformulier 5 minuten na zijn bericht een bevestigingsmail ("We hebben je bericht ontvangen").

1. Maak een Mailable `ContactConfirmationMail`
2. Maak een job `SendContactConfirmation`
3. Dispatch de job met een vertraging:
```php
SendContactConfirmation::dispatch($validated['email'], $validated['name'])
    ->delay(now()->addMinutes(5));
```
4. Controleer in Tinker dat de job in de `jobs`-tabel staat, en kijk naar de kolom `available_at`

## Bonusopdracht C: Jobs aan elkaar koppelen

Soms moet taak B pas starten als taak A klaar is. Bijvoorbeeld: eerst de prijzen verversen, **daarna** pas de prijsalerts controleren (anders controleer je oude prijzen).

Zoek in de Laravel documentatie op hoe `Bus::chain()` werkt en gebruik het in de scheduler:

```php
Schedule::call(function () {
    Bus::chain([
        new RefreshCoinPrices,
        new CheckPriceAlerts,
    ])->dispatch();
})->hourly();
```

Vergeet niet bovenaan `use Illuminate\Support\Facades\Bus;` toe te voegen.

Wat gebeurt er met `CheckPriceAlerts` als `RefreshCoinPrices` mislukt? Test het met de typfout uit opdracht 7.

---

## Samenvatting

In dit hoofdstuk heb je geleerd:

| Concept | Wat je hebt geleerd |
|---|---|
| **Synchroon vs. asynchroon** | Synchroon = de bezoeker wacht. Asynchroon = het gebeurt op de achtergrond. |
| **Job** | Een class in `app/Jobs` met één taak in de `handle()` methode |
| **`ShouldQueue`** | Zorgt ervoor dat een job in de queue gaat in plaats van direct uitgevoerd wordt |
| **Queue** | De wachtrij met jobs, bij ons de tabel `jobs` (`QUEUE_CONNECTION=database`) |
| **`dispatch()`** | Een job in de queue zetten |
| **`dispatchSync()`** | Een job direct uitvoeren, zonder queue |
| **Worker** | `php artisan queue:work` voert jobs uit de queue uit |
| **`queue:listen`** | Worker die je code steeds opnieuw laadt, handig tijdens ontwikkelen |
| **`Mail::...->queue()`** | Een e-mail in de queue zetten zonder eigen job-class |
| **Dependency injection** | Laravel geeft automatisch een `CoinGeckoService` mee aan `handle()` |
| **`$tries` / `$backoff`** | Hoe vaak een job opnieuw geprobeerd wordt, en hoe lang er gewacht wordt |
| **Failed jobs** | `queue:failed` om ze te bekijken, `queue:retry` om ze opnieuw uit te voeren |
| **Scheduler** | `Schedule::job(...)->everyTenMinutes()` in `routes/console.php`, draaien met `schedule:work` |

**Wanneer gebruik je een job?**

| Gebruik een job als... | Voorbeeld |
|---|---|
| De taak traag is en de bezoeker het resultaat niet direct hoeft te zien | E-mail versturen, PDF genereren, afbeelding verkleinen |
| De taak afhankelijk is van een externe dienst die kan falen | API aanroepen, betaling verwerken |
| De taak op een vast moment moet gebeuren | Elke nacht een rapport, elke 10 minuten prijzen verversen |
| De taak later moet gebeuren | Herinneringsmail na 3 dagen |

| Gebruik **geen** job als... | Voorbeeld |
|---|---|
| De bezoeker het resultaat direct nodig heeft | Inloggen, zoeken, een formulier valideren |
| De taak heel snel is | Eén record opslaan in de database |
