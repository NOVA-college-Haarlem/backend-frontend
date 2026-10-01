# Blok 5 - Hoofdstuk 8 - Betalen met een API (Mollie)

## Inhoudsopgave

- [Leerdoelen](#leerdoelen)
- [Les 1 — Van winkelwagen naar bestelling](#les-1--van-winkelwagen-naar-bestelling)
  - [Opdracht 1](#opdracht-1)
  - [Opdracht 2](#opdracht-2)
  - [Opdracht 3](#opdracht-3)
  - [Opdracht 4](#opdracht-4)
  - [Opdracht 5](#opdracht-5)
- [Les 2 — Betalen via de Mollie API](#les-2--betalen-via-de-mollie-api)
  - [Opdracht 6](#opdracht-6)
  - [Opdracht 7](#opdracht-7)
  - [Opdracht 8](#opdracht-8)
  - [Opdracht 9](#opdracht-9)
  - [Opdracht 10](#opdracht-10)
  - [Opdracht 11](#opdracht-11)
  - [Opdracht 12 (verdieping)](#opdracht-12-verdieping)
- [Samenvatting](#samenvatting)

## Leerdoelen

Na dit hoofdstuk kun je:

- Uitleggen wat een API is en hoe een betaalprovider zoals Mollie werkt
- Een winkelwagen omzetten naar een bestelling in een `orders` tabel
- Met PHP en cURL een request naar een externe API sturen en de JSON-respons verwerken
- Een API key veilig opslaan, buiten je code en buiten Git
- Uitleggen waarom je de prijs en de betaalstatus **nooit** van de browser mag aannemen
- Uitleggen wat een webhook is en waarom een betaalprovider die gebruikt

---

## Les 1 — Van winkelwagen naar bestelling

In Hoofdstuk 4 heb je een winkelwagen gemaakt met AJAX. Tools4ever kan nu bijhouden wat een gebruiker wil kopen, maar er kan nog niet betaald worden. In dit hoofdstuk koppelen we de webshop aan **Mollie**, een Nederlandse betaalprovider. Via Mollie kan een klant betalen met iDEAL, creditcard, PayPal, enzovoort.

### Wat is een API?

Een **API** (Application Programming Interface) is een manier waarop twee programma's met elkaar praten. In Hoofdstuk 4 heb je eigenlijk al een kleine API gemaakt: `add_to_cart.php` ontvangt JSON en stuurt JSON terug.

Nu doen we het andersom: **onze PHP-code** stuurt een verzoek naar **de server van Mollie**, en Mollie stuurt JSON terug.

| Hoofdstuk 4 (AJAX)                          | Hoofdstuk 8 (Mollie API)                           |
| ------------------------------------------- | -------------------------------------------------- |
| JavaScript → onze PHP-server                | onze PHP-server → server van Mollie                |
| `fetch()` in de browser                     | `cURL` in PHP                                      |
| Geen wachtwoord nodig (zelfde website)      | **API key** nodig (Mollie moet weten wie je bent)  |

### Waarom niet zelf betalingen afhandelen?

Je wilt **nooit** zelf creditcardnummers of bankgegevens opslaan. Dat is juridisch en technisch heel risicovol. Een betaalprovider regelt dat voor je. Jouw webshop krijgt alleen te horen: "deze betaling is gelukt" of "deze betaling is mislukt".

### Hoe verloopt een betaling?

```
Klant            Tools4ever (PHP)                 Mollie
  |                    |                             |
  |-- "Afrekenen" ---->|                             |
  |                    |-- 1. bestelling opslaan     |
  |                    |-- 2. POST /v2/payments ---->|
  |                    |<-- id + checkout-link ------|
  |<-- 3. redirect ----|                             |
  |------------------- 4. betalen bij Mollie ------->|
  |<------------------ 5. redirect terug ------------|
  |-- payment_return ->|                             |
  |                    |-- 6. GET /v2/payments/id -->|
  |                    |<-- status: "paid" ----------|
  |<-- "Bedankt!" -----|                             |
```

Belangrijk: in stap 6 **vragen wij zelf** aan Mollie wat de status is. We geloven niet zomaar wat de browser ons vertelt. Daar komen we in Les 2 op terug.

### Opdracht 1

We maken een gratis testaccount aan bij Mollie. In **testmodus** wordt er nooit echt geld afgeschreven.

1. Ga naar [mollie.com](https://www.mollie.com) en maak een account aan.
2. Je hoeft je bedrijf **niet** te verifiëren om te testen. Sla die stappen over.
3. Ga in het dashboard naar **Developers → API keys**.
4. Kopieer de **Test API key**. Deze begint met `test_`.

> **Let op:** gebruik in dit hoofdstuk altijd de key die begint met `test_`. Een key die begint met `live_` werkt met echt geld.

> **Docent:** heeft een student geen account kunnen aanmaken, dan kan tijdelijk een test-key van de docent gebruikt worden. Een test-key kan geen echt geld verplaatsen.

### Opdracht 2

Een API key is net zo geheim als een wachtwoord. Die zet je **niet** midden in je code en zeker **niet** op GitHub.

1. Maak een nieuw bestand aan genaamd `config.php`:

```php
<?php
// Geheime instellingen - dit bestand NIET op GitHub zetten!
define('MOLLIE_API_KEY', 'test_HIER_JOUW_KEY');

// Het adres waarop jouw website draait (zonder / aan het einde)
define('BASE_URL', 'http://localhost');
```

2. Vervang `test_HIER_JOUW_KEY` door jouw eigen test key.
3. Controleer in de browser op welk adres jouw Tools4ever-site draait en pas `BASE_URL` aan als dat nodig is (bijvoorbeeld `http://localhost:8080`).
4. Maak in de hoofdmap van je project een bestand `.gitignore` aan (of open het als het al bestaat) en voeg deze regel toe:

```
config.php
```

5. Maak ook een bestand `config.example.php` aan. Dit bestand mag wél op GitHub, zodat een teamgenoot weet welke instellingen nodig zijn:

```php
<?php
// Kopieer dit bestand naar config.php en vul je eigen gegevens in
define('MOLLIE_API_KEY', 'test_...');
define('BASE_URL', 'http://localhost');
```

> **Waarom `define()`?** Met `define()` maak je een **constante**: een waarde die niet meer kan veranderen. Je gebruikt hem zonder `$`, dus `MOLLIE_API_KEY` en niet `$MOLLIE_API_KEY`.

### Opdracht 3

Een winkelwagen is tijdelijk: de klant kan er nog van alles aan veranderen. Een **bestelling** is definitief. Daarom maken we een nieuwe tabel `orders`, met één rij per bestelling: wie heeft besteld, hoeveel moet er betaald worden en wat is de status van de betaling.

Eén gebruiker kan meerdere bestellingen hebben, maar een bestelling hoort bij precies één gebruiker. Dit is een **één-op-veel relatie**, net als bij de `cart` tabel. Daarom krijgt `orders` een foreign key naar `users`.

```
users                 orders
+----+-------+        +----+---------+-------+--------+
| id | email |        | id | user_id | total | status |
+----+-------+        +----+---------+-------+--------+
| 1  | anna  |---+--->| 1  | 1       | 45.00 | paid   |
|    |       |   +--->| 2  | 1       | 12.50 | open   |
| 2  | bram  |------->| 3  | 2       | 99.95 | paid   |
+----+-------+        +----+---------+-------+--------+
```

1. Open PHPMyAdmin en ga naar de `tools4ever` database.
2. Klik op het tabblad SQL en voer de volgende code uit:

```sql
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'open',
  `mollie_payment_id` varchar(50) NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paid_at` datetime NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB;
```

3. Bekijk de kolom `total`. Die kun je toch altijd uitrekenen met de prijzen in de `tools` tabel? Waarom slaan we het totaal **apart** op?

<details>
<summary>Antwoord</summary>

Prijzen veranderen. Als een hamer vandaag €20 kost en jij verhoogt de prijs volgende week naar €25, dan heeft de klant van vandaag nog steeds €20 betaald. Daarom sla je het bedrag op **op het moment van bestellen**. Dit heet een _snapshot_.

</details>

4. Bekijk de kolom `total`. Waarom gebruiken we `decimal(10,2)` en niet `int` of `float`?

<details>
<summary>Antwoord</summary>

`int` kan geen centen opslaan. `float` kan kleine afrondfouten geven (bijvoorbeeld `0.1 + 0.2` is in een computer `0.30000000000000004`). Bij geld wil je precies rekenen, daarom gebruik je `decimal` met 2 cijfers achter de komma.

</details>

### Opdracht 4

Nu passen we `cart.php` aan, zodat de klant het totaalbedrag ziet en kan afrekenen.

1. Open `cart.php`. Vervang de query uit Hoofdstuk 4 door een query **met een JOIN**, zodat je ook de naam en prijs van elke tool hebt:

```php
<?php
session_start();
require 'db.php';

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

$sql = "SELECT cart.tool_id, cart.quantity, tools.tool_name, tools.tool_price
        FROM cart
        JOIN tools ON cart.tool_id = tools.tool_id
        WHERE cart.user_id = :user_id
        AND tools.deleted_at IS NULL";
$stmt = $conn->prepare($sql);
$stmt->execute(['user_id' => $_SESSION['user_id']]);
$items = $stmt->fetchAll(PDO::FETCH_ASSOC);

$total = 0;
foreach ($items as $item) {
    $total += $item['tool_price'] * $item['quantity'];
}

require 'header.php';
?>
```

2. Toon de items in een tabel met de kolommen **Tool**, **Aantal**, **Prijs** en **Subtotaal** (prijs × aantal). Vergeet `htmlspecialchars()` niet.
3. Toon onder de tabel het totaalbedrag. Gebruik `number_format()` om het netjes weer te geven:

```php
<p><strong>Totaal: € <?php echo number_format($total, 2, ',', '.'); ?></strong></p>
```

4. Voeg onder het totaal een knop toe om af te rekenen. Let op: dit is een **formulier met POST**, geen link:

```php
<?php if (count($items) > 0): ?>
    <form action="checkout.php" method="POST">
        <button type="submit" class="btn">Afrekenen</button>
    </form>
<?php else: ?>
    <p>Je winkelwagen is leeg.</p>
<?php endif; ?>
```

5. Bekijk het formulier nog eens. We sturen **geen** totaalbedrag en **geen** prijzen mee. Waarom niet?

<details>
<summary>Antwoord</summary>

Alles wat uit de browser komt, kan de gebruiker aanpassen (met de Developer Tools of met Postman). Als we het totaalbedrag via het formulier zouden meesturen, kan een slimme klant er `0.01` van maken. Daarom rekent de server het bedrag **zelf** opnieuw uit met de prijzen uit de database.

</details>

### Opdracht 5

We maken `checkout.php`. Dit bestand rekent het totaal van de winkelwagen uit en slaat een bestelling op. In Les 2 voegen we hier de betaling aan toe.

1. Maak een nieuw bestand aan genaamd `checkout.php`:

```php
<?php
session_start();
require 'db.php';

// Alleen POST-requests toestaan (zie Hoofdstuk 5)
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Location: cart.php');
    exit;
}

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

$user_id = $_SESSION['user_id'];

// 1. Haal de winkelwagen op MET de actuele prijzen uit de database
$sql = "SELECT cart.tool_id, cart.quantity, tools.tool_price
        FROM cart
        JOIN tools ON cart.tool_id = tools.tool_id
        WHERE cart.user_id = :user_id
        AND tools.deleted_at IS NULL";
$stmt = $conn->prepare($sql);
$stmt->execute(['user_id' => $user_id]);
$items = $stmt->fetchAll(PDO::FETCH_ASSOC);

if (count($items) === 0) {
    header('Location: cart.php');
    exit;
}

// 2. Bereken het totaal op de server
$total = 0;
foreach ($items as $item) {
    $total += $item['tool_price'] * $item['quantity'];
}

// 3. Sla de bestelling op
try {
    $stmt = $conn->prepare("INSERT INTO orders (user_id, total) VALUES (:user_id, :total)");
    $stmt->execute(['user_id' => $user_id, 'total' => $total]);
    $order_id = $conn->lastInsertId(); // het id van de bestelling die we net hebben gemaakt
} catch (PDOException $e) {
    header('Location: cart.php?error=bestelling');
    exit;
}

// In Les 2 maken we hier de betaling aan.
echo "Bestelling #" . $order_id . " is opgeslagen. Totaal: € " . number_format($total, 2, ',', '.');
```

2. Test het: voeg een paar tools toe aan je winkelwagen en klik op **Afrekenen**.
3. Controleer in PHPMyAdmin of er een rij in `orders` staat met de juiste `user_id`, het juiste totaal en de status `open`.
4. Reken het totaal zelf na met de prijzen in de `tools` tabel. Klopt het?
5. Wat doet `$conn->lastInsertId()`? Waarom hebben we het `id` van de nieuwe bestelling straks nodig?
6. Toon in `cart.php` een foutmelding als `$_GET['error']` gelijk is aan `bestelling`.

> **Let op:** de winkelwagen is nog niet leeg na het afrekenen. Dat is bewust! We legen de winkelwagen pas als de betaling **gelukt** is. Stel je voor dat de klant de betaling annuleert: dan wil hij zijn winkelwagen terug.

---

## Les 2 — Betalen via de Mollie API

### Een API aanroepen met cURL

In JavaScript gebruik je `fetch()` om een request te sturen. In PHP gebruiken we **cURL**. Het idee is hetzelfde:

| `fetch()` in JavaScript                    | cURL in PHP                                       |
| ------------------------------------------ | ------------------------------------------------- |
| `fetch(url, ...)`                          | `curl_init($url)`                                 |
| `method: 'POST'`                           | `CURLOPT_CUSTOMREQUEST => 'POST'`                 |
| `headers: { ... }`                         | `CURLOPT_HTTPHEADER => [ ... ]`                   |
| `body: JSON.stringify(data)`               | `CURLOPT_POSTFIELDS => json_encode($data)`        |
| `.then(response => response.json())`       | `json_decode(curl_exec($ch), true)`               |

De Mollie API heeft verschillende **endpoints**. Wij gebruiken er twee:

| Methode | Endpoint                                  | Wat doet het?                    |
| ------- | ----------------------------------------- | -------------------------------- |
| `POST`  | `https://api.mollie.com/v2/payments`      | Een nieuwe betaling aanmaken     |
| `GET`   | `https://api.mollie.com/v2/payments/{id}` | De status van een betaling opvragen |

Elke request moet een **Authorization header** hebben met jouw API key. Zo weet Mollie dat het verzoek van jou komt:

```
Authorization: Bearer test_jouwkey
```

### Opdracht 6

We maken één functie die we overal kunnen gebruiken om met Mollie te praten. Zo hoeven we de cURL-code niet steeds opnieuw te schrijven (DRY).

1. Maak een nieuw bestand aan genaamd `mollie.php`:

```php
<?php
require_once 'config.php';

/**
 * Stuurt een request naar de Mollie API en geeft het antwoord terug als array.
 *
 * $method   'GET' of 'POST'
 * $endpoint bijvoorbeeld 'payments' of 'payments/tr_abc123'
 * $data     de gegevens die we meesturen (alleen bij POST)
 */
function mollie_request($method, $endpoint, $data = null)
{
    $ch = curl_init('https://api.mollie.com/v2/' . $endpoint);

    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);   // geef het antwoord terug in plaats van het te echo'en
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, $method);
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        'Authorization: Bearer ' . MOLLIE_API_KEY,
        'Content-Type: application/json',
    ]);

    if ($data !== null) {
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
    }

    $response = curl_exec($ch);

    // Kon er helemaal geen verbinding gemaakt worden?
    if ($response === false) {
        throw new Exception('Geen verbinding met Mollie: ' . curl_error($ch));
    }

    $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    $result = json_decode($response, true);

    // Een HTTP-code van 400 of hoger betekent: er ging iets mis
    if ($http_code >= 400) {
        throw new Exception('Mollie gaf een fout (' . $http_code . '): ' . ($result['detail'] ?? 'onbekend'));
    }

    return $result;
}
```

2. Lees de code regel voor regel en beantwoord:
   - Waarom staat de API key in een **header** en niet in de URL?
   - Wat gebeurt er als je API key verkeerd is? Welke HTTP-statuscode verwacht je? (Denk terug aan Hoofdstuk 7.)

> **`require_once` in plaats van `require`?** `mollie.php` laadt `config.php`, maar `checkout.php` doet dat misschien ook al. Met `require_once` laadt PHP een bestand maar één keer, ook als je het twee keer vraagt. Anders krijg je de fout dat de constante `MOLLIE_API_KEY` al bestaat.

### Opdracht 7

Nu maken we in `checkout.php` echt een betaling aan.

1. Voeg bovenaan `checkout.php`, onder `require 'db.php';`, deze regel toe:

```php
require 'mollie.php';
```

2. Vervang de laatste regel (`echo "Bestelling #" ...`) door de volgende code:

```php
// 4. Maak een betaling aan bij Mollie
try {
    $payment = mollie_request('POST', 'payments', [
        'amount' => [
            'currency' => 'EUR',
            'value'    => number_format($total, 2, '.', ''), // Mollie wil precies "12.50"
        ],
        'description' => 'Tools4ever bestelling #' . $order_id,
        'redirectUrl' => BASE_URL . '/payment_return.php?order_id=' . $order_id,
        'metadata'    => ['order_id' => $order_id],
    ]);
} catch (Exception $e) {
    header('Location: cart.php?error=betaling');
    exit;
}

// 5. Sla het id van de betaling op bij de bestelling
$stmt = $conn->prepare("UPDATE orders SET mollie_payment_id = :payment_id WHERE id = :order_id");
$stmt->execute(['payment_id' => $payment['id'], 'order_id' => $order_id]);

// 6. Stuur de klant door naar de betaalpagina van Mollie
header('Location: ' . $payment['_links']['checkout']['href']);
exit;
```

3. Bekijk `number_format($total, 2, '.', '')`. In Opdracht 4 gebruikten we `number_format($total, 2, ',', '.')`. Wat is het verschil en waarom heeft Mollie de eerste nodig?
4. Test het: rond een bestelling af. Je komt nu op een betaalpagina van Mollie in **testmodus**.
5. Kies een betaalmethode (bijvoorbeeld iDEAL). Je krijgt een scherm waarin je zelf kunt kiezen wat er gebeurt: **Paid**, **Failed**, **Canceled**, **Expired** of **Open**. Kies **Paid**.
6. Je wordt teruggestuurd naar `payment_return.php`. Die bestaat nog niet, dus je krijgt een 404. Dat lossen we in de volgende opdracht op.
7. Kijk in PHPMyAdmin: staat er een `mollie_payment_id` (begint met `tr_`) bij je bestelling?
8. Kijk in je Mollie-dashboard bij **Betalingen**. Zie je jouw testbetaling?

> **Foutmelding "SSL certificate problem"?** Je PHP-installatie kan het beveiligde certificaat van Mollie niet controleren. Vraag je docent om hulp. Zet **nooit** `CURLOPT_SSL_VERIFYPEER` op `false`: dan kan iemand anders zich voordoen als Mollie.

### Opdracht 8

Na het betalen stuurt Mollie de klant terug naar `payment_return.php?order_id=...`. Maar let op: in de URL staat **niet** of de betaling gelukt is. Dat moeten we zelf aan Mollie vragen.

We maken eerst een functie die de status bij Mollie ophaalt en de bestelling bijwerkt. Die functie gaan we in Opdracht 12 opnieuw gebruiken.

1. Voeg deze functie toe onderaan `mollie.php`:

```php
/**
 * Vraagt de actuele status van een betaling op bij Mollie
 * en werkt de bestelling in de database bij.
 */
function sync_order_status($conn, $order)
{
    $payment = mollie_request('GET', 'payments/' . $order['mollie_payment_id']);
    $status = $payment['status']; // open, pending, paid, failed, canceled of expired

    if ($status === 'paid' && $order['status'] !== 'paid') {
        // Betaling gelukt: bestelling op betaald zetten en winkelwagen legen
        $stmt = $conn->prepare("UPDATE orders SET status = 'paid', paid_at = NOW() WHERE id = :id");
        $stmt->execute(['id' => $order['id']]);

        $stmt = $conn->prepare("DELETE FROM cart WHERE user_id = :user_id");
        $stmt->execute(['user_id' => $order['user_id']]);
    } elseif ($status !== 'paid') {
        $stmt = $conn->prepare("UPDATE orders SET status = :status WHERE id = :id");
        $stmt->execute(['status' => $status, 'id' => $order['id']]);
    }

    return $status;
}
```

2. Maak een nieuw bestand aan genaamd `payment_return.php`:

```php
<?php
session_start();
require 'db.php';
require 'mollie.php';

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

if (!isset($_GET['order_id']) || !is_numeric($_GET['order_id'])) {
    header('Location: 404.php');
    exit;
}

// Haal de bestelling op - alleen als die van de ingelogde gebruiker is!
$stmt = $conn->prepare("SELECT * FROM orders WHERE id = :id AND user_id = :user_id");
$stmt->execute(['id' => $_GET['order_id'], 'user_id' => $_SESSION['user_id']]);
$order = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$order) {
    header('Location: 404.php');
    exit;
}

// Vraag de echte status op bij Mollie
try {
    $status = sync_order_status($conn, $order);
} catch (Exception $e) {
    $status = 'unknown';
}

require 'header.php';
?>
<main style="text-align: center; padding: 60px 20px;">
    <?php if ($status === 'paid'): ?>
        <h1>Bedankt voor je bestelling!</h1>
        <p>Bestelling #<?php echo htmlspecialchars($order['id']); ?> is betaald.</p>
        <a href="tools_index.php" class="btn">Verder winkelen</a>
    <?php elseif ($status === 'open' || $status === 'pending'): ?>
        <h1>Je betaling wordt nog verwerkt</h1>
        <p>Ververs deze pagina over een paar seconden.</p>
    <?php elseif ($status === 'unknown'): ?>
        <h1>We konden de status niet controleren</h1>
        <p>Probeer het later opnieuw of neem contact met ons op.</p>
    <?php else: ?>
        <h1>De betaling is niet gelukt</h1>
        <p>Je winkelwagen is bewaard. Je kunt het opnieuw proberen.</p>
        <a href="cart.php" class="btn">Terug naar winkelwagen</a>
    <?php endif; ?>
</main>
<?php require 'footer.php'; ?>
```

3. Test opnieuw met de status **Paid**. Zie je de bedankpagina? Is je winkelwagen nu leeg? Staat de bestelling in de database op `paid` met een datum bij `paid_at`?
4. Kijk naar de query in `payment_return.php`. Waarom staat er `AND user_id = :user_id` in? Wat zou er gebeuren zonder deze regel?

<details>
<summary>Antwoord</summary>

Zonder die regel kan elke ingelogde gebruiker `?order_id=1`, `?order_id=2`, enzovoort proberen en zo de bestellingen van andere klanten bekijken. Je controleert dus altijd of een record **van de ingelogde gebruiker** is.

</details>

### Opdracht 9

Een goede ontwikkelaar test niet alleen het "happy path". Test alle situaties en vul de tabel in:

| Status kiezen bij Mollie | Wat ziet de klant? | Status in `orders` | Winkelwagen leeg? |
| ------------------------ | ------------------ | ------------------ | ----------------- |
| Paid                     |                    |                    |                   |
| Failed                   |                    |                    |                   |
| Canceled                 |                    |                    |                   |
| Expired                  |                    |                    |                   |
| Open                     |                    |                    |                   |

Probeer daarna ook:

1. Ververs de bedankpagina een paar keer. Wordt `paid_at` elke keer overschreven? Waarom niet? (Kijk naar de `if` in `sync_order_status()`.)
2. Log in als een **andere** gebruiker en open `payment_return.php?order_id=` met het nummer van een bestelling van de eerste gebruiker. Wat gebeurt er?
3. Zet tijdelijk een foute API key in `config.php` en probeer af te rekenen. Wat ziet de klant? Zet daarna je echte key terug.

### Opdracht 10

**Wat gaat hier mis?** Een collega-developer heeft een andere versie van de betaling gemaakt. Bekijk de code hieronder en beschrijf **twee** beveiligingsproblemen. Leg bij elk probleem uit hoe een kwaadwillende gebruiker er misbruik van kan maken.

`cart.php` (deel):

```php
<form action="checkout.php" method="POST">
    <input type="hidden" name="total" value="<?php echo $total; ?>">
    <button type="submit" class="btn">Afrekenen</button>
</form>
```

`checkout.php` (deel):

```php
$total = $_POST['total'];

$payment = mollie_request('POST', 'payments', [
    'amount' => ['currency' => 'EUR', 'value' => number_format($total, 2, '.', '')],
    'description' => 'Tools4ever bestelling #' . $order_id,
    'redirectUrl' => BASE_URL . '/payment_return.php?order_id=' . $order_id . '&status=paid',
]);
```

`payment_return.php` (deel):

```php
if ($_GET['status'] === 'paid') {
    $stmt = $conn->prepare("UPDATE orders SET status = 'paid' WHERE id = :id");
    $stmt->execute(['id' => $_GET['order_id']]);
    echo "Bedankt voor je betaling!";
}
```

<details>
<summary>Antwoord</summary>

1. **Het bedrag komt uit de browser.** Met de Developer Tools kan de klant het hidden field aanpassen naar `0.01` en voor één cent een hele bestelling betalen. Oplossing: bereken het totaal altijd op de server met de prijzen uit de database.
2. **De status komt uit de URL.** Iedereen kan zelf `payment_return.php?order_id=5&status=paid` intypen zonder te betalen. Oplossing: vraag de status altijd zelf op bij Mollie met het opgeslagen `mollie_payment_id`.
3. (Bonus) Er wordt niet gecontroleerd of de bestelling bij de ingelogde gebruiker hoort.

**Vuistregel:** alles wat uit de browser komt (`$_GET`, `$_POST`, cookies, hidden fields) kan de gebruiker aanpassen. Vertrouw het nooit voor geld of rechten.

</details>

### Opdracht 11

De klant wil zijn bestellingen terugzien.

1. Maak een pagina `orders.php` die alle bestellingen van de **ingelogde** gebruiker toont, de nieuwste bovenaan (`ORDER BY created_at DESC`).
2. Toon per bestelling: het bestelnummer, de datum, het totaalbedrag en de status.
3. Vertaal de status naar Nederlands voor de klant: `paid` → "Betaald", `open` → "Wacht op betaling", `failed` → "Mislukt", `canceled` → "Geannuleerd", `expired` → "Verlopen". Tip: gebruik een array:

```php
$statusLabels = [
    'paid'     => 'Betaald',
    'open'     => 'Wacht op betaling',
    // vul zelf aan...
];
echo $statusLabels[$order['status']] ?? $order['status'];
```

4. Geef bestellingen met de status `open` of `failed` een andere kleur dan betaalde bestellingen (bijvoorbeeld met een CSS-class).
5. Voeg in `header.php` een link "Mijn bestellingen" toe die alleen zichtbaar is als iemand is ingelogd.
6. **Extra:** maak voor de administrator een pagina `admin_orders.php` met alle bestellingen van alle klanten. Gebruik de rolcontrole uit Hoofdstuk 5 en een **JOIN** met `users`, zodat je bij elke bestelling het e-mailadres van de klant ziet in plaats van alleen het `user_id`.
7. **Extra:** voeg op `admin_orders.php` een filter toe op status (bijvoorbeeld alleen `paid`), zoals je in Hoofdstuk 6 hebt geleerd.

### Opdracht 12 (verdieping)

#### Wat is een webhook?

Er is nog een probleem. Wat gebeurt er als de klant betaalt, maar daarna zijn browser sluit **voordat** hij terug is op `payment_return.php`? Dan wordt `sync_order_status()` nooit aangeroepen en blijft de bestelling op `open` staan, terwijl er wel betaald is.

Daarvoor bestaan **webhooks**. Een webhook is een URL op jouw server die **Mollie zelf aanroept** zodra de status van een betaling verandert. Mollie wacht dus niet tot de klant terugkomt.

```
Mollie                              Tools4ever (webhook.php)
  |                                          |
  |-- POST id=tr_abc123 -------------------->|
  |                                          |-- GET /v2/payments/tr_abc123
  |<-----------------------------------------|   (status zelf opvragen!)
  |------------------- status: "paid" ------>|
  |                                          |-- bestelling bijwerken
  |<-- 200 OK -------------------------------|
```

Let op: Mollie stuurt alleen het **id** van de betaling mee, niet de status. Zo kan iemand die zich voordoet als Mollie geen nep-status sturen: jij vraagt de status altijd zelf op.

#### Het probleem met localhost

Mollie draait op internet. Jouw website draait op `localhost`, dat is alleen bereikbaar vanaf je eigen computer. Mollie kan jouw webhook dus niet bereiken. Daarom hebben we de webhook tot nu toe weggelaten.

Met een tool als **ngrok** kun je je lokale website tijdelijk bereikbaar maken via een openbare URL. Dit is de verdiepingsopdracht.

1. Maak een nieuw bestand aan genaamd `webhook.php`:

```php
<?php
require 'db.php';
require 'mollie.php';

// Mollie stuurt het id van de betaling als gewone POST-data mee
if (!isset($_POST['id'])) {
    http_response_code(400);
    exit;
}

$stmt = $conn->prepare("SELECT * FROM orders WHERE mollie_payment_id = :payment_id");
$stmt->execute(['payment_id' => $_POST['id']]);
$order = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$order) {
    http_response_code(404);
    exit;
}

try {
    sync_order_status($conn, $order); // dezelfde functie als in payment_return.php!
} catch (Exception $e) {
    http_response_code(500); // Mollie probeert het later opnieuw
    exit;
}

http_response_code(200);
```

2. Waarom staat er geen `session_start()` en geen login-controle in dit bestand?

<details>
<summary>Antwoord</summary>

Het is niet de klant die deze pagina aanroept, maar de server van Mollie. Mollie heeft geen sessie en is niet ingelogd. De beveiliging zit erin dat we de status **zelf** bij Mollie opvragen: een nep-request met een verzonnen id levert niets op.

</details>

3. Installeer [ngrok](https://ngrok.com), maak een gratis account en start het met de poort waarop jouw site draait, bijvoorbeeld:

```
ngrok http 80
```

4. ngrok toont een openbare URL, zoals `https://abcd-1234.ngrok-free.app`. Zet die als `BASE_URL` in `config.php`.
5. Voeg in `checkout.php` bij het aanmaken van de betaling een extra regel toe:

```php
'webhookUrl'  => BASE_URL . '/webhook.php',
```

6. Test: betaal een bestelling, kies **Paid** en **sluit het tabblad** voordat je wordt teruggestuurd. Kijk in PHPMyAdmin: staat de bestelling toch op `paid`?
7. In het ngrok-venster (of op `http://127.0.0.1:4040`) zie je de requests die Mollie naar jouw webhook stuurt. Bekijk er een.
8. Zet na afloop `BASE_URL` terug naar je localhost-adres en haal de `webhookUrl`-regel weer weg (of zet er een `if` omheen).

---

## Samenvatting

### Nieuwe bestanden

| Bestand                | Wat doet het?                                                       |
| ---------------------- | ------------------------------------------------------------------- |
| `config.php`           | Geheime instellingen (API key, BASE_URL) - **niet** in Git          |
| `config.example.php`   | Voorbeeld van `config.php` zonder geheimen - wél in Git             |
| `mollie.php`           | `mollie_request()` en `sync_order_status()`                         |
| `checkout.php`         | Winkelwagen → bestelling → betaling → doorsturen                   |
| `payment_return.php`   | Klant komt terug, status opvragen bij Mollie, resultaat tonen       |
| `orders.php`           | Overzicht van eigen bestellingen                                    |
| `admin_orders.php`     | (extra) Alle bestellingen voor de administrator                     |
| `webhook.php`          | (verdieping) Mollie meldt zelf een statuswijziging                  |

### Belangrijkste regels

- **Prijs en totaal** bereken je altijd op de **server**, met prijzen uit de database.
- **De betaalstatus** vraag je altijd zelf op bij de betaalprovider, nooit uit `$_GET` of `$_POST`.
- **API keys** staan in een apart configbestand dat in `.gitignore` staat.
- **Geld** sla je op als `decimal(10,2)`, niet als `float`.
- **Het totaalbedrag** van een bestelling sla je op als snapshot in `orders`.
- **De winkelwagen** leeg je pas als de betaling gelukt is.
- **Controleer altijd** of een bestelling van de ingelogde gebruiker is.

### Checklist

- [ ] Ik heb een Mollie testaccount en mijn test API key staat in `config.php`
- [ ] `config.php` staat in `.gitignore`
- [ ] De tabel `orders` bestaat, met een foreign key naar `users`
- [ ] `cart.php` toont prijzen, subtotalen en een totaal
- [ ] `checkout.php` slaat een bestelling op en stuurt door naar Mollie
- [ ] `payment_return.php` vraagt de status op bij Mollie en toont het juiste bericht
- [ ] Ik heb alle vijf de statussen getest (Opdracht 9)
- [ ] Een gebruiker kan alleen zijn eigen bestellingen zien
- [ ] Ik kan uitleggen waarom het bedrag en de status niet uit de browser mogen komen
