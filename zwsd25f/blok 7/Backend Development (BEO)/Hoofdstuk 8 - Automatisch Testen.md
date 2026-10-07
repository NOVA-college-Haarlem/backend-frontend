# Hoofdstuk 8 - Automatisch Testen

## Introductie

In Hoofdstuk 7 heb je de `CoinController` en de `ContactController` flink omgebouwd. Eerlijke vraag: heb je daarna nog gecontroleerd of je API uit Hoofdstuk 5 het nog doet? En de validatie van `POST /api/coins`? En de 404 bij een coin die niet bestaat?

Waarschijnlijk niet. Om dat te controleren moet je Postman openen, tien requests opnieuw versturen en bij elk request goed kijken of de response klopt. Dat kost een kwartier, en dat ga je niet na elke wijziging doen.

Daarom schrijven ontwikkelaars **automatische tests**: kleine stukjes code die je applicatie controleren. Eén commando, en binnen een paar seconden weet je of alles nog werkt.

```
php artisan test

   PASS  Tests\Feature\CoinApiTest
  ✓ lijst van coins is leeg als er geen coins zijn            0.08s
  ✓ coins worden gesorteerd op rank                           0.02s
  ✓ onbekende coin geeft 404                                  0.01s
  ...

  Tests:    14 passed (38 assertions)
  Duration: 0.61s
```

### Vergelijking: de APK-keuring

| Bij de APK | Bij automatisch testen |
|---|---|
| De monteur loopt een vaste checklist af: remmen, lampen, banden | Een test controleert een vaste lijst dingen: statuscodes, JSON, database |
| Elk punt is goed of fout, er is geen "een beetje" | Elke **assertion** slaagt of faalt |
| De monteur rijdt niet echt naar Groningen om de remmen te testen | Een test stuurt geen echte e-mail en belt niet echt de CoinGecko API, maar gebruikt een **fake** |
| Na een reparatie loop je de checklist opnieuw af | Na elke codewijziging draai je de tests opnieuw |

### Begrippen

| Begrip | Wat is het? |
|---|---|
| **Test** | Een methode die één ding controleert, bijvoorbeeld "een onbekende coin geeft een 404" |
| **Assertion** | Eén controle binnen een test: "ik verwacht dat dit klopt". Bijvoorbeeld `assertStatus(404)` |
| **Feature test** | Test die een echte request naar je applicatie doet (route → controller → database → response). Staat in `tests/Feature` |
| **Unit test** | Test die één klein stukje code los test, zonder Laravel eromheen. Staat in `tests/Unit`. Gebruiken we in dit hoofdstuk niet |
| **Testdatabase** | Een aparte database die alleen tijdens de tests bestaat. Je echte data blijft ongemoeid |
| **Factory** | Een class die nep-records voor je database maakt, bijvoorbeeld 5 willekeurige coins |
| **Fake** | Een nepversie van iets van buitenaf (API, mail, queue). Laravel onthoudt wat je ermee probeerde te doen, zodat je dat kan controleren |

**Wat ga je leren?**

- De testomgeving veilig instellen, zodat je echte database niet leeg wordt gemaakt
- Een feature test schrijven met `php artisan make:test`
- Een test opbouwen volgens **Arrange - Act - Assert**
- Testdata maken met een **factory**
- Je REST API uit Hoofdstuk 5 testen: statuscodes, JSON, validatie
- Een test bewust laten falen en de foutmelding lezen
- De CoinGecko API faken met `Http::fake()`
- Jobs en e-mail faken met `Queue::fake()` en `Mail::fake()`

We werken verder in het **cryptodashboard** project uit Hoofdstuk 3, 4, 5 en 7.

---

## Opdracht 1: De testomgeving klaarzetten

**Doel:** Tests kunnen draaien zonder dat je echte database wordt geleegd

### 1.1 De map `tests` bekijken

Open de map `tests` in je project. Een nieuw Laravel project heeft al een paar voorbeeldtests:

```
tests/
├── Feature/
│   └── ExampleTest.php
├── Unit/
│   └── ExampleTest.php
└── TestCase.php
```

Staat er ook een bestand `tests/Pest.php`? Dan heeft Herd je project gemaakt met **Pest**, een andere schrijfwijze voor tests. Dat is geen probleem: Pest kan ook de tests uitvoeren die we in dit hoofdstuk schrijven. Je hoeft niets om te bouwen.

### 1.2 `phpunit.xml` controleren - belangrijk!

Open `phpunit.xml` in de hoofdmap van je project. Zoek het blok met `<env ...>` regels. Je ziet onder andere:

```xml
<env name="APP_ENV" value="testing"/>
<env name="CACHE_STORE" value="array"/>
<env name="DB_CONNECTION" value="sqlite"/>
<env name="DB_DATABASE" value=":memory:"/>
<env name="MAIL_MAILER" value="array"/>
<env name="QUEUE_CONNECTION" value="sync"/>
<env name="SESSION_DRIVER" value="array"/>
```

**Let op:** staan de regels met `DB_CONNECTION` en `DB_DATABASE` tussen `<!--` en `-->`? Dan zijn ze uitgeschakeld. Haal de `<!--` en `-->` weg, zodat ze eruitzien zoals hierboven.

Waarom is dit zo belangrijk? Onze tests maken bij **elke test** de database helemaal leeg. Zonder deze twee regels gebruiken de tests je echte `database.sqlite`, en ben je na de eerste testrun al je coins kwijt.

| Instelling | Betekenis tijdens de tests |
|---|---|
| `DB_DATABASE=:memory:` | De database bestaat alleen in het geheugen en verdwijnt na de test. Supersnel, en je echte data blijft veilig |
| `MAIL_MAILER=array` | E-mails worden niet verstuurd, alleen onthouden |
| `QUEUE_CONNECTION=sync` | Jobs worden direct uitgevoerd, er is geen worker nodig |

### 1.3 De tests draaien

```bash
php artisan test
```

Je ziet zoiets als:

```
   PASS  Tests\Unit\ExampleTest
  ✓ that true is true

   PASS  Tests\Feature\ExampleTest
  ✓ the application returns a successful response

  Tests:    2 passed (2 assertions)
```

Open `tests/Feature/ExampleTest.php` en bekijk de test. Kan je uitleggen wat hij controleert?

**Checkpoint:** De `DB_`-regels in `phpunit.xml` staan aan en `php artisan test` geeft 2 groene tests.

---

## Opdracht 2: Je eerste test

**Doel:** Een test schrijven die controleert dat `GET /api/coins` werkt

### 2.1 Testbestand genereren

```bash
php artisan make:test CoinApiTest --phpunit
```

Dit maakt `tests/Feature/CoinApiTest.php` aan. (`--phpunit` zorgt ervoor dat je dezelfde schrijfwijze krijgt als in dit hoofdstuk, ook als je project Pest gebruikt.)

### 2.2 Test invullen

Open `tests/Feature/CoinApiTest.php` en vervang de inhoud:

```php
<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class CoinApiTest extends TestCase
{
    use RefreshDatabase;

    public function test_lijst_van_coins_is_leeg_als_er_geen_coins_zijn(): void
    {
        $response = $this->getJson('/api/coins');

        $response->assertStatus(200);
        $response->assertJson(['data' => []]);
    }
}
```

### 2.3 Uitleg

| Onderdeel | Wat het doet |
|---|---|
| `extends TestCase` | Geeft je test alle Laravel-hulpmiddelen, zoals `getJson()` en `assertStatus()` |
| `use RefreshDatabase` | Voert vóór elke test alle migrations uit op een **lege** database. Elke test begint dus schoon |
| `test_...` | Elke methode die begint met `test_` is een test. De naam beschrijft wat je controleert |
| `$this->getJson('/api/coins')` | Doet een GET request naar je API, met de header `Accept: application/json` (zoals in Postman!) |
| `assertStatus(200)` | Controleert de statuscode |
| `assertJson(['data' => []])` | Controleert dat de JSON een lege `data`-lijst bevat |

Merk op: de test gebruikt geen URL zoals `http://cryptodashboard.test`. De request gaat niet via de browser of Herd, maar rechtstreeks de applicatie in. Daarom is een test zo snel.

### 2.4 Test draaien

```bash
php artisan test
```

Je ziet je nieuwe test groen in de lijst staan. Wil je alleen de tests uit één bestand draaien?

```bash
php artisan test --filter=CoinApiTest
```

**Checkpoint:** `php artisan test` geeft 3 groene tests.

---

## Opdracht 3: Testdata maken met een factory

**Doel:** Snel nep-coins in de testdatabase zetten

Een lege lijst testen is een begin, maar je wil ook weten of de API coins **goed** teruggeeft. Daarvoor heb je coins in je testdatabase nodig. Die ga je niet met de hand invoeren: daar is een **factory** voor.

### 3.1 Factory genereren

```bash
php artisan make:factory CoinFactory
```

Open `database/factories/CoinFactory.php` en vul de `definition` methode in:

```php
public function definition(): array
{
    return [
        'coin_id' => fake()->unique()->slug(2),
        'symbol' => fake()->lexify('???'),
        'name' => fake()->unique()->word(),
        'image' => 'https://example.com/coin.png',
        'current_price' => fake()->randomFloat(2, 1, 90000),
        'market_cap' => fake()->numberBetween(1000000, 1000000000),
        'market_cap_rank' => fake()->unique()->numberBetween(1, 100),
        'price_change_percentage_24h' => fake()->randomFloat(2, -10, 10),
        'fetched_at' => now(),
    ];
}
```

`fake()` maakt willekeurige data: `slug(2)` geeft iets als `"quia-dolor"`, `lexify('???')` drie willekeurige letters, zoals `"kqz"`. `unique()` zorgt dat er geen dubbele waardes ontstaan (`coin_id` en de rank moeten uniek zijn).

### 3.2 Het model koppelen aan de factory

Open `app/Models/Coin.php`. Staat `use HasFactory;` al in de class? Zo niet, voeg het toe:

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Coin extends Model
{
    use HasFactory;

    protected $fillable = [
        // ... (blijft hetzelfde)
    ];
```

### 3.3 De factory gebruiken

| Code | Wat het doet |
|---|---|
| `Coin::factory()->create()` | Maakt 1 coin met willekeurige data |
| `Coin::factory()->count(5)->create()` | Maakt 5 coins |
| `Coin::factory()->create(['name' => 'Bitcoin'])` | Maakt 1 coin, maar met de naam die jij kiest. De rest is willekeurig |

### 3.4 Test: coins worden gesorteerd op rank

Voeg bovenaan in `CoinApiTest.php` toe:

```php
use App\Models\Coin;
```

Voeg deze test toe aan de class:

```php
public function test_coins_worden_gesorteerd_op_rank(): void
{
    // Arrange: zet de juiste data klaar
    Coin::factory()->create(['name' => 'Ethereum', 'market_cap_rank' => 2]);
    Coin::factory()->create(['name' => 'Solana', 'market_cap_rank' => 3]);
    Coin::factory()->create(['name' => 'Bitcoin', 'market_cap_rank' => 1]);

    // Act: voer de actie uit
    $response = $this->getJson('/api/coins');

    // Assert: controleer het resultaat
    $response->assertStatus(200);
    $response->assertJsonCount(3, 'data');
    $response->assertJsonPath('data.0.name', 'Bitcoin');
    $response->assertJsonPath('data.2.name', 'Solana');
}
```

### 3.5 Arrange - Act - Assert

Bijna elke test bestaat uit dezelfde drie stappen:

| Stap | Wat | In deze test |
|---|---|---|
| **Arrange** | De situatie klaarzetten | Drie coins in de database, expres in de verkeerde volgorde |
| **Act** | De actie uitvoeren die je wil testen | `GET /api/coins` |
| **Assert** | Controleren of het resultaat klopt | 3 coins, Bitcoin eerst, Solana laatst |

`assertJsonPath('data.0.name', 'Bitcoin')` leest als: "In de JSON, ga naar `data`, pak het eerste element (`0`), en controleer dat `name` gelijk is aan `Bitcoin`."

Waarom maken we de coins expres in de verkeerde volgorde aan? Als je ze in de goede volgorde aanmaakt, slaagt de test ook als de `orderBy` in je controller ontbreekt. Dan test je eigenlijk niks.

### 3.6 Test: de API Resource

In Hoofdstuk 5 heb je met `CoinResource` bepaald welke velden de API teruggeeft. Ook dat kan je testen:

```php
public function test_api_geeft_alleen_de_velden_uit_de_resource_terug(): void
{
    Coin::factory()->create(['coin_id' => 'bitcoin', 'symbol' => 'btc']);

    $response = $this->getJson('/api/coins');

    $response->assertJsonStructure([
        'data' => [
            ['rank', 'id', 'name', 'symbol', 'price_eur', 'change_24h', 'market_cap', 'image'],
        ],
    ]);
    $response->assertJsonPath('data.0.id', 'bitcoin');
    $response->assertJsonPath('data.0.symbol', 'BTC');
    $response->assertJsonMissingPath('data.0.fetched_at');
    $response->assertJsonMissingPath('data.0.created_at');
}
```

| Assertion | Controleert |
|---|---|
| `assertJsonStructure([...])` | Dat deze velden bestaan (de waarde maakt niet uit) |
| `assertJsonPath('data.0.symbol', 'BTC')` | Dat `strtoupper()` in de Resource werkt: in de database staat `btc` |
| `assertJsonMissingPath('data.0.fetched_at')` | Dat interne velden **niet** naar buiten lekken |

**Checkpoint:** `php artisan test --filter=CoinApiTest` geeft 3 groene tests.

---

## Opdracht 4: Een test laten falen

**Doel:** Ervaren wat een test oplevert als er iets stuk gaat, en de foutmelding leren lezen

Een test die nooit faalt, is niks waard. Laten we kijken wat er gebeurt als iemand (per ongeluk) je code verandert.

### 4.1 Iets kapot maken

Open `app/Http/Resources/CoinResource.php` en verander **tijdelijk**:

```php
'price_eur'     => $this->current_price,
```

in:

```php
'price'         => $this->current_price,
```

Dit lijkt onschuldig: de naam is zelfs korter. Maar elke app die jouw API gebruikt en `price_eur` uitleest, krijgt nu `undefined`.

### 4.2 Tests draaien

```bash
php artisan test --filter=CoinApiTest
```

Je ziet nu zoiets als:

```
   FAIL  Tests\Feature\CoinApiTest
  ✓ lijst van coins is leeg als er geen coins zijn
  ✓ coins worden gesorteerd op rank
  ⨯ api geeft alleen de velden uit de resource terug
  ──────────────────────────────────────────────────
   FAILED  Tests\Feature\CoinApiTest > api geeft alleen de velden uit de resource terug
  Failed asserting that an array has the key 'price_eur'.
```

### 4.3 De foutmelding lezen

Een foutmelding van een test vertelt je drie dingen:

| Vraag | Antwoord in de foutmelding |
|---|---|
| **Welke test?** | `api geeft alleen de velden uit de resource terug` |
| **Wat werd er verwacht?** | Een veld `price_eur` |
| **Waar in de test?** | Het regelnummer in `CoinApiTest.php` (staat onder de melding) |

Dankzij de duidelijke testnaam weet je meteen waar je moet zoeken, zonder Postman te openen.

### 4.4 Herstellen

Zet `'price_eur'` terug en draai de tests opnieuw. Alles is weer groen.

**Denkvraag:** Stel dat je deze tests niet had. Wanneer zou je de fout dan ontdekt hebben? En door wie?

**Checkpoint:** Je hebt een test rood zien worden, kan uitleggen wat de foutmelding betekent, en alles is weer groen.

---

## Opdracht 5: Detail endpoint en 404 testen

**Doel:** Het gedrag van `GET /api/coins/{coin}` vastleggen in tests

Voeg twee tests toe aan `CoinApiTest`:

```php
public function test_een_coin_kan_worden_opgehaald_op_coin_id(): void
{
    Coin::factory()->create(['coin_id' => 'bitcoin', 'name' => 'Bitcoin']);

    $response = $this->getJson('/api/coins/bitcoin');

    $response->assertStatus(200);
    $response->assertJsonPath('data.name', 'Bitcoin');
}

public function test_onbekende_coin_geeft_404(): void
{
    $response = $this->getJson('/api/coins/bestaatniet');

    $response->assertStatus(404);
    $response->assertJson(['error' => 'Coin niet gevonden']);
}
```

Let op het verschil met de lijst: bij één coin staat de coin direct onder `data`, dus `data.name` in plaats van `data.0.name`.

Laravel heeft voor de bekende statuscodes ook kortere assertions. Deze twee regels doen hetzelfde:

| Lang | Kort |
|---|---|
| `assertStatus(200)` | `assertOk()` |
| `assertStatus(201)` | `assertCreated()` |
| `assertStatus(204)` | `assertNoContent()` |
| `assertStatus(404)` | `assertNotFound()` |
| `assertStatus(422)` | `assertUnprocessable()` |

Je mag zelf kiezen welke je gebruikt. In de rest van dit hoofdstuk gebruiken we de korte.

**Checkpoint:** 5 groene tests in `CoinApiTest`.

---

## Opdracht 6: POST en validatie testen

**Doel:** Controleren dat goede data wordt opgeslagen en foute data wordt geweigerd

Dit is het belangrijkste deel van je API om te testen: hier komt data van buitenaf je database in.

> **Heb je in Hoofdstuk 5 bonusopdracht A (API-token) gemaakt?** Dan geven deze tests een `401`. Stuur het token mee door in elke POST- en DELETE-test `$this->withHeaders(['X-API-Token' => config('app.api_token')])->postJson(...)` te gebruiken in plaats van `$this->postJson(...)`.

### 6.1 Een geldige coin toevoegen

```php
public function test_een_geldige_coin_wordt_opgeslagen(): void
{
    $response = $this->postJson('/api/coins', [
        'coin_id' => 'dogecoin',
        'symbol' => 'doge',
        'name' => 'Dogecoin',
        'current_price' => 0.18,
        'market_cap' => 25000000000,
        'market_cap_rank' => 11,
    ]);

    $response->assertCreated();
    $response->assertJsonPath('symbol', 'DOGE');
    $this->assertDatabaseHas('coins', [
        'coin_id' => 'dogecoin',
        'name' => 'Dogecoin',
    ]);
}
```

Twee nieuwe dingen:

| Code | Wat het doet |
|---|---|
| `$this->postJson('/api/coins', [...])` | Doet een POST request met deze array als JSON body (zoals de **Body → raw → JSON** in Postman) |
| `$this->assertDatabaseHas('coins', [...])` | Controleert dat er in de tabel `coins` een rij bestaat met deze waardes |

Waarom staat hier `symbol` en niet `data.symbol`? Kijk naar je `store` methode: daar staat `response()->json(new CoinResource($coin), 201)`. Daardoor wordt de coin **niet** in `data` verpakt. Een test laat zulke verschillen meteen zien.

### 6.2 Een lege body

```php
public function test_lege_body_geeft_validatiefouten(): void
{
    $response = $this->postJson('/api/coins', []);

    $response->assertUnprocessable();
    $response->assertJsonValidationErrors(['coin_id', 'symbol', 'name', 'current_price']);
    $this->assertDatabaseCount('coins', 0);
}
```

`assertJsonValidationErrors` controleert dat er voor **elk** van deze velden een foutmelding in de JSON staat. `assertDatabaseCount('coins', 0)` controleert dat er echt niets is opgeslagen.

### 6.3 Zelf schrijven

Schrijf nu zelf twee tests. Gebruik de tests hierboven als voorbeeld.

**Test A:** `test_coin_id_moet_uniek_zijn`
- Arrange: maak met de factory een coin met `coin_id` `bitcoin`
- Act: stuur een POST met verder geldige data, maar ook met `coin_id` `bitcoin`
- Assert: statuscode 422, een validatiefout op `coin_id`, en er staat nog steeds maar **1** coin in de database

**Test B:** `test_negatieve_prijs_wordt_geweigerd`
- Act: stuur een POST met `current_price` `-5` (en verder geldige data)
- Assert: statuscode 422, een validatiefout op `current_price`, en er is niets opgeslagen

**Tip:** Laat je test eerst expres falen om te controleren dat hij echt iets test. Haal bijvoorbeeld `|min:0` tijdelijk weg uit de validatie in `CoinApiController`. Wordt test B rood? Goed zo. Zet het daarna terug.

**Checkpoint:** 9 groene tests in `CoinApiTest`.

---

## Opdracht 7: DELETE testen

**Doel:** Het verwijderen van coins testen

Schrijf zelf de volgende twee tests:

**Test A:** `test_een_coin_kan_worden_verwijderd`
- Arrange: maak een coin met `coin_id` `bitcoin`
- Act: `$this->deleteJson('/api/coins/bitcoin')`
- Assert: statuscode 204, en de coin staat niet meer in de database

**Test B:** `test_verwijderen_van_onbekende_coin_geeft_404`

Je hebt hiervoor een assertion nodig die je nog niet kent. Raad eens hoe hij heet, als het tegenovergestelde van `assertDatabaseHas`?

**Checkpoint:** 11 groene tests in `CoinApiTest`. Je hebt nu de complete API uit Hoofdstuk 5 getest. Elke volgende wijziging aan de API controleer je met één commando.

---

## Opdracht 8: De CoinGecko API faken

**Doel:** De pagina `/coins` testen zonder de echte CoinGecko API aan te roepen

De pagina `/coins` haalt data op van CoinGecko als de database leeg of verouderd is (Hoofdstuk 3). In een test wil je de echte API **niet** aanroepen:

- De test wordt traag (internet)
- De test faalt als CoinGecko even down is, terwijl jouw code prima is
- De prijzen zijn elke keer anders, dus je weet niet wat je moet verwachten
- CoinGecko heeft een rate limit: draai je je tests vaak, dan word je geblokkeerd

Daarom gebruik je `Http::fake()`: Laravel's HTTP client geeft dan een **nepantwoord** terug dat jij zelf bepaalt.

### 8.1 Testbestand aanmaken

```bash
php artisan make:test CoinPageTest --phpunit
```

Vervang de inhoud van `tests/Feature/CoinPageTest.php`:

```php
<?php

namespace Tests\Feature;

use App\Models\Coin;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Http;
use Tests\TestCase;

class CoinPageTest extends TestCase
{
    use RefreshDatabase;

    private function fakeCoinGecko(): void
    {
        Http::fake([
            'api.coingecko.com/*' => Http::response([
                [
                    'id' => 'bitcoin',
                    'symbol' => 'btc',
                    'name' => 'Bitcoin',
                    'image' => 'https://example.com/btc.png',
                    'current_price' => 82345.67,
                    'market_cap' => 1623456789012,
                    'market_cap_rank' => 1,
                    'price_change_percentage_24h' => 2.45,
                ],
                [
                    'id' => 'ethereum',
                    'symbol' => 'eth',
                    'name' => 'Ethereum',
                    'image' => 'https://example.com/eth.png',
                    'current_price' => 2345.67,
                    'market_cap' => 282345678901,
                    'market_cap_rank' => 2,
                    'price_change_percentage_24h' => -1.23,
                ],
            ], 200),
        ]);
    }

    public function test_lege_database_wordt_gevuld_vanuit_de_api(): void
    {
        $this->fakeCoinGecko();

        $response = $this->get('/coins');

        $response->assertOk();
        $response->assertSee('Bitcoin');
        $response->assertSee('Ethereum');
        $this->assertDatabaseCount('coins', 2);
        Http::assertSentCount(1);
    }
}
```

### 8.2 Uitleg

| Onderdeel | Wat het doet |
|---|---|
| `private function fakeCoinGecko()` | Een hulpmethode. Begint **niet** met `test_`, dus het is zelf geen test. Zo hoef je het nepantwoord maar één keer te schrijven |
| `Http::fake([...])` | Vanaf nu gaat geen enkel `Http::get()` meer echt het internet op |
| `'api.coingecko.com/*'` | Elke URL die hiermee begint, krijgt het nepantwoord. Het `*` betekent "alles wat hierna komt" |
| `Http::response([...], 200)` | Het nepantwoord: deze JSON met statuscode 200. Precies de velden die je `CoinGeckoService` gebruikt |
| `$this->get('/coins')` | Een gewone GET request (geen `getJson`): we verwachten HTML, geen JSON |
| `assertSee('Bitcoin')` | Controleert dat de tekst `Bitcoin` ergens in de HTML staat |
| `Http::assertSentCount(1)` | Controleert dat er precies één request naar "de API" is gestuurd |

Bijzonder: je `CoinGeckoService` en je `RefreshCoinPrices` job weten niet dat ze een nepantwoord krijgen. Je hoeft er **geen regel** aan te veranderen.

### 8.3 Test: de cache werkt

Het hele idee van Hoofdstuk 3 was: is de data nog vers (jonger dan 10 minuten), roep de API dan **niet** aan. Dat kan je nu eindelijk echt controleren:

```php
public function test_verse_data_komt_uit_de_database(): void
{
    Coin::factory()->create(['name' => 'Bitcoin', 'fetched_at' => now()]);
    Http::fake();

    $response = $this->get('/coins');

    $response->assertOk();
    $response->assertSee('Bitcoin');
    Http::assertNothingSent();
}
```

`Http::fake()` zonder iets ertussen faket **alle** requests. `Http::assertNothingSent()` controleert dat er geen enkele request is verstuurd.

### 8.4 Zelf schrijven

Schrijf de test `test_verouderde_data_wordt_ververst`:
- Arrange: maak een coin met `fetched_at` van 20 minuten geleden (`now()->subMinutes(20)`) en roep `$this->fakeCoinGecko()` aan
- Act: `GET /coins`
- Assert: statuscode 200, en er is precies 1 request naar de API gestuurd

Extra controle: met `Http::assertSent()` kan je ook kijken **naar welke URL** de request ging:

```php
Http::assertSent(function ($request) {
    return str_contains($request->url(), 'coins/markets');
});
```

**Checkpoint:** 3 groene tests in `CoinPageTest`. Je hebt de cachelogica uit Hoofdstuk 3 getest zonder één echte API call.

---

## Opdracht 9: Jobs en e-mail faken

**Doel:** Het contactformulier en de jobs uit Hoofdstuk 7 testen

Hetzelfde idee als `Http::fake()` bestaat ook voor de queue en voor e-mail.

| Fake | Wat er gebeurt | Controleren met |
|---|---|---|
| `Queue::fake()` | Jobs worden **niet** uitgevoerd, alleen onthouden | `Queue::assertPushed(...)`, `Queue::assertNothingPushed()` |
| `Mail::fake()` | E-mails worden **niet** verstuurd, alleen onthouden | `Mail::assertSent(...)`, `Mail::assertNothingSent()` |

### 9.1 Het contactformulier

```bash
php artisan make:test ContactTest --phpunit
```

Vervang de inhoud van `tests/Feature/ContactTest.php`:

```php
<?php

namespace Tests\Feature;

use App\Jobs\SendContactMail;
use App\Mail\ContactMail;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Queue;
use Tests\TestCase;

class ContactTest extends TestCase
{
    use RefreshDatabase;

    public function test_contactformulier_zet_een_mail_job_in_de_queue(): void
    {
        Queue::fake();

        $response = $this->post('/contact', [
            'name' => 'Jan Jansen',
            'email' => 'jan@example.com',
            'subject' => 'Vraag over Bitcoin',
            'message' => 'Hoe vaak worden de prijzen ververst?',
        ]);

        $response->assertRedirect('/contact');
        $response->assertSessionHas('success');
        Queue::assertPushed(SendContactMail::class, function ($job) {
            return $job->senderEmail === 'jan@example.com';
        });
    }
}
```

| Onderdeel | Wat het doet |
|---|---|
| `$this->post('/contact', [...])` | Verstuurt het formulier, alsof een bezoeker op "Verstuur bericht" klikt. (Je hebt geen `@csrf` token nodig: Laravel slaat die controle over tijdens tests) |
| `assertRedirect('/contact')` | Controleert dat de bezoeker wordt teruggestuurd |
| `assertSessionHas('success')` | Controleert dat de melding "Bedankt voor je bericht!" klaarstaat |
| `Queue::assertPushed(SendContactMail::class, function ...)` | Controleert dat er een `SendContactMail`-job in de queue is gezet, **met het juiste e-mailadres** |

### 9.2 Zelf schrijven: ongeldig formulier

Schrijf de test `test_ongeldig_formulier_zet_geen_job_in_de_queue`:
- Arrange: `Queue::fake()`
- Act: post het formulier met `name` `J`, `email` `geen-email`, zonder `subject` en met `message` `kort`
- Assert: `$response->assertSessionHasErrors([...])` met alle vier de velden, en `Queue::assertNothingPushed()`

Let op: bij een webformulier gebruik je `assertSessionHasErrors`, bij de API `assertJsonValidationErrors`. Weet je nog waarom? (Kijk terug in Hoofdstuk 5, opdracht 6.3.)

### 9.3 De job zelf testen

De test hierboven controleert dat de job in de queue komt. Maar verstuurt de job ook echt de juiste e-mail? Dat test je los:

```php
public function test_job_verstuurt_de_contactmail_naar_de_beheerder(): void
{
    Mail::fake();

    $job = new SendContactMail(
        senderName: 'Jan Jansen',
        senderEmail: 'jan@example.com',
        mailSubject: 'Vraag over Bitcoin',
        mailMessage: 'Hoe vaak worden de prijzen ververst?',
    );
    $job->handle();

    Mail::assertSent(ContactMail::class, function ($mail) {
        return $mail->hasTo('admin@cryptodashboard.test')
            && $mail->mailSubject === 'Vraag over Bitcoin';
    });
}
```

Hier roepen we `handle()` gewoon zelf aan, net als de worker zou doen. Zo test je de job zonder queue en zonder Mailtrap.

**Waarom twee aparte tests?** De eerste test controleert de **controller** (komt de job in de queue?). De tweede controleert de **job** (verstuurt hij de juiste mail?). Gaat er iets mis, dan weet je meteen in welk deel.

### 9.4 Zelf schrijven: de coin-jobs

Voeg aan `CoinPageTest` drie tests toe. Vergeet de juiste `use`-regels bovenaan niet (`App\Jobs\RefreshCoinPrices`, `App\Services\CoinGeckoService`, `Illuminate\Support\Facades\Queue`).

**Test A:** `test_ververs_knop_zet_een_job_in_de_queue`
- `Queue::fake()`, dan `GET /coins/refresh`
- Controleer de redirect naar `/coins` en dat `RefreshCoinPrices` in de queue is gezet

**Test B:** `test_refresh_job_slaat_coins_op`
- Roep `$this->fakeCoinGecko()` aan
- Voer de job uit: `(new RefreshCoinPrices)->handle(new CoinGeckoService);`
- Controleer met `assertDatabaseHas` dat `bitcoin` in de tabel `coins` staat

**Test C:** `test_refresh_job_faalt_als_de_api_niets_teruggeeft`

In Hoofdstuk 7 (opdracht 7.1) heb je de job een exception laten gooien als de API faalt. Test dat:

```php
Http::fake([
    'api.coingecko.com/*' => Http::response([], 500),
]);

$this->expectException(\Exception::class);

(new RefreshCoinPrices)->handle(new CoinGeckoService);
```

`expectException` staat **vóór** de actie: je vertelt de test van tevoren "hierna verwacht ik een exception". Komt die niet, dan faalt de test.

**Checkpoint:** `php artisan test` geeft alles groen: je API, de coinpagina, de cache, het contactformulier en beide jobs.

---

## Kennischeck

Beantwoord deze vragen in je eigen woorden, zonder AI:

1. Wat is het verschil tussen testen met Postman en een automatische test? Noem een voordeel van allebei.
2. Waarom moet `DB_DATABASE` in `phpunit.xml` op `:memory:` staan? Wat gebeurt er als je dat vergeet?
3. Wat doet `use RefreshDatabase`, en waarom wil je dat elke test met een lege database begint?
4. Leg Arrange - Act - Assert uit aan de hand van een test die je zelf hebt geschreven.
5. Waarom gebruik je `Http::fake()` in plaats van de echte CoinGecko API? Noem twee redenen.
6. Een test is groen. Betekent dat dat je code geen fouten bevat? Leg uit.
7. Wat is het verschil tussen `assertJsonValidationErrors` en `assertSessionHasErrors`?

---

## Bonusopdracht A: Een bug vinden met een test

Wat gebeurt er als een bezoeker `/coins` opent terwijl de database **leeg** is **en** CoinGecko down is?

1. Schrijf een test: fake de API met een `500`, open `/coins`, en verwacht `assertOk()`
2. Draai de test. Wat gebeurt er? Kijk goed naar de foutmelding
3. Pas je code aan zodat de bezoeker een nette melding krijgt ("De prijzen zijn op dit moment niet beschikbaar") in plaats van een foutpagina
4. Draai de test opnieuw tot hij groen is

Dit is een echte bug in je applicatie, die je met een test hebt gevonden voordat een bezoeker hem vond.

## Bonusopdracht B: Tests bij elke push op GitHub

Je kan GitHub je tests automatisch laten draaien bij elke `git push`. Maak het bestand `.github/workflows/tests.yml`:

```yaml
name: Tests

on: [push]

jobs:
  tests:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: shivammathur/setup-php@v2
        with:
          php-version: '8.3'
      - run: composer install --no-interaction
      - run: cp .env.example .env
      - run: php artisan key:generate
      - run: php artisan test
```

Commit en push. Kijk op GitHub bij het tabblad **Actions**: je ziet je tests draaien. Bij een groen vinkje is alles in orde. Maak daarna expres een test kapot en push opnieuw. Wat zie je?

Dit heet **Continuous Integration (CI)**. In teams kan je instellen dat een pull request pas gemerged mag worden als de tests groen zijn. Kijk nog eens naar je git workflow uit de projectlessen: waar zou dit passen?

## Bonusopdracht C: Tests voor je projectles-project

Kies uit je project van de projectlessen één functionaliteit die echt niet stuk mag gaan (bijvoorbeeld: een ticket aanmaken, of alleen een beheerder mag iets verwijderen). Schrijf er minstens drie tests voor:

1. Het werkt met goede invoer
2. Het wordt geweigerd met foute invoer
3. Iemand zonder de juiste rechten krijgt een foutmelding (tip: zoek `actingAs` op in de Laravel documentatie)

---

## Samenvatting

In dit hoofdstuk heb je geleerd:

| Concept | Wat je hebt geleerd |
|---|---|
| **Feature test** | Een test die een echte request door je applicatie stuurt, in `tests/Feature` |
| **`php artisan test`** | Alle tests draaien. Met `--filter=Naam` alleen bepaalde tests |
| **`phpunit.xml`** | Instellingen voor tijdens de tests, zoals een database in het geheugen |
| **`RefreshDatabase`** | Elke test begint met een lege database |
| **Arrange - Act - Assert** | Klaarzetten, uitvoeren, controleren |
| **Factory** | `Coin::factory()->create([...])` maakt nep-records voor je tests |
| **`Http::fake()`** | De externe API vervangen door een nepantwoord |
| **`Queue::fake()`** | Jobs onthouden in plaats van uitvoeren |
| **`Mail::fake()`** | E-mails onthouden in plaats van versturen |
| **Falende test** | Een rode test vertelt je welke test, wat er verwacht werd en op welke regel |

**Veelgebruikte assertions**

| Assertion | Controleert |
|---|---|
| `assertOk()`, `assertCreated()`, `assertNoContent()`, `assertNotFound()`, `assertUnprocessable()` | De statuscode (200, 201, 204, 404, 422) |
| `assertJson([...])` | Dat dit stukje JSON in de response staat |
| `assertJsonPath('data.0.name', 'Bitcoin')` | De waarde op één plek in de JSON |
| `assertJsonCount(3, 'data')` | Het aantal items in een lijst |
| `assertJsonStructure([...])` | Dat bepaalde velden bestaan |
| `assertJsonMissingPath('data.0.fetched_at')` | Dat een veld **niet** bestaat |
| `assertJsonValidationErrors([...])` | Validatiefouten bij een API |
| `assertSee('Bitcoin')` | Tekst in de HTML |
| `assertRedirect('/contact')` | Een redirect |
| `assertSessionHas('success')` | Een sessiemelding |
| `assertSessionHasErrors([...])` | Validatiefouten bij een webformulier |
| `assertDatabaseHas('coins', [...])` | Een rij bestaat in de database |
| `assertDatabaseMissing('coins', [...])` | Een rij bestaat **niet** in de database |
| `assertDatabaseCount('coins', 0)` | Het aantal rijen in een tabel |

**Wat test je wel en niet?**

| Test wel | Voorbeeld |
|---|---|
| Wat binnenkomt van buitenaf | Validatie van formulieren en API-requests |
| Wat anderen van je verwachten | De JSON-structuur van je API, statuscodes |
| Logica met keuzes (`if`) | Cache vers of verlopen, coin gevonden of niet |
| Wat echt niet stuk mag | Betalingen, rechten, het versturen van berichten |

| Test **niet** | Waarom |
|---|---|
| De echte externe API | Niet jouw code, traag en onvoorspelbaar: fake hem |
| Laravel zelf | Of `Coin::create()` werkt, is al door Laravel getest |
| De opmaak van een pagina | Kleuren en marges verander je vaak, en dat zie je beter met je eigen ogen |
