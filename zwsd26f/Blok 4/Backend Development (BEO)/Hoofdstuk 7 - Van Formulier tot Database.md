# Hoofdstuk 7 - Van Formulier tot Database

Bij JavaScript heb je de workshops met `fetch` uit `data/workshops.json` geladen (JS Hoofdstuk 3), en `verwerk.php` laten controleren of een inschrijving klopt (JS Hoofdstuk 5). Maar:
- Een workshop die een medewerker toevoegt (Hoofdstuk 1), staat **niet** op de website.
- Een inschrijving wordt **nergens** opgeslagen. `verwerk.php` laat alleen een bedankpagina zien.

In dit hoofdstuk koppel je alles aan elkaar: de website leest uit de database, en het inschrijfformulier schrijft erin.

## Leerdoelen

Na dit hoofdstuk kun je:
- Een PHP-bestand maken dat JSON teruggeeft, zodat JavaScript het met `fetch` kan ophalen
- `verwerk.php` de workshop laten opzoeken in de database
- Een inschrijving opslaan (`INSERT`) en het aantal vrije plekken bijwerken (`UPDATE`)
- Uitleggen wat het Post/Redirect/Get-patroon oplost

**Voorwaarde:** JS Hoofdstuk 3 (`fetch`) en JS Hoofdstuk 5 (`verwerk.php` met server-side controle) zijn af.

**AI-gebruik:** bij de vragen (Onderzoek) **geen AI**. Bij de opdrachten mag AI, maar je moet elke regel kunnen uitleggen.

---

### Opdracht 1 - PHP die JSON maakt

`fetch` haalt tekst op bij de server. Of die tekst uit een bestand komt of door PHP wordt gemaakt, maakt voor JavaScript niets uit. Zolang het JSON is.

Maak `workshops.php`:
```php
<?php
require 'database.php';

$result = mysqli_query($conn, "SELECT * FROM workshops ORDER BY datum");
$workshops = mysqli_fetch_all($result, MYSQLI_ASSOC);

header('Content-Type: application/json');
echo json_encode($workshops);
```

Open http://localhost/workshops.php en vergelijk met http://localhost/data/workshops.json.

**Onderzoek:**
- Wat doet `json_encode`?
- Vergelijk de prijs en het id. In het JSON-bestand staat `"prijs": 45`. Wat staat er bij `workshops.php`? Waarom is dat een probleem voor je `formatPrijs` uit JS Hoofdstuk 1? (Tip: `"45.00".toFixed(2)`)
- Vergelijk de datum. Wat is er anders?

### Opdracht 2 - JSON in de juiste vorm

**De datum in het Nederlands.** MariaDB kan een datum opmaken met `DATE_FORMAT`. Zet in `database.php`, onderaan:
```php
// Nederlandse dag- en maandnamen bij DATE_FORMAT
mysqli_query($conn, "SET lc_time_names = 'nl_NL'");
```

**De getallen als getal.** Pas `workshops.php` aan:
```php
<?php
require 'database.php';

$result = mysqli_query(
    $conn,
    "SELECT id, titel, categorie, DATE_FORMAT(datum, '%W %e %M') AS datum, prijs, plekken
     FROM workshops
     ORDER BY workshops.datum"
);

$workshops = [];
foreach (mysqli_fetch_all($result, MYSQLI_ASSOC) as $workshop) {
    // Uit de database komt alles als tekst. JavaScript wil getallen.
    $workshop['id']      = (int) $workshop['id'];
    $workshop['prijs']   = (float) $workshop['prijs'];
    $workshop['plekken'] = (int) $workshop['plekken'];
    $workshops[] = $workshop;
}

header('Content-Type: application/json');
echo json_encode($workshops);
```

**Onderzoek:**
- `%W %e %M`: zoek op wat deze drie betekenen. Hoe zou je "5 dec. 2026" maken?
- Waarom staat er `ORDER BY workshops.datum` en niet `ORDER BY datum`? (Tip: wat is `datum` na `AS datum`? Probeer het.)
- Vergelijk nu opnieuw met `data/workshops.json`. Is het precies hetzelfde?
- **Extra:** een workshop die al geweest is, hoort niet meer op de website. Voeg `WHERE workshops.datum >= CURDATE()` toe. Hoeveel workshops zie je nog? (Kijk naar de datum van vandaag.)

### Opdracht 3 - De website leest uit de database

Pas in `js/script.js` één regel aan:
```js
const response = await fetch("workshops.php");
```

Test: voeg als medewerker een nieuwe workshop toe via `workshop_create.php`. Ga naar de website. Staat hij erop? Werken filteren en zoeken (JS Hoofdstuk 4) ook met de nieuwe workshop?

> Je hebt nu één bron van waarheid: de database. De medewerker past hem aan, de website laat hem zien. `data/workshops.json` is niet meer nodig.

### Opdracht 4 - verwerk.php: de workshop uit de database

Je `verwerk.php` uit JS Hoofdstuk 5 zoekt de workshop op in `data/workshops.json`. Vervang dat stuk:
```php
// Oud: json_decode(file_get_contents(...)) en een foreach
// Nieuw:
$result  = mysqli_execute_query($conn, "SELECT * FROM workshops WHERE id = ?", [$workshopId]);
$gekozen = mysqli_fetch_assoc($result);
```
Zet bovenaan `require 'database.php';`. De controles op `$gekozen === null` en `$gekozen['plekken'] < $aantal` blijven werken. Waarom?

**Meer controleren.** Het formulier stuurt ook telefoon, dieetwens en opmerking. Die gaan straks de database in, dus die controleer je ook:
```php
$telefoon  = trim($_POST['telefoon'] ?? '');
$dieet     = $_POST['dieet'] ?? 'geen';
$opmerking = trim($_POST['opmerking'] ?? '');

if ($telefoon !== '' && !preg_match('/^0[0-9]{9}$/', $telefoon)) {
    $fouten[] = 'Vul een telefoonnummer in van 10 cijfers, of laat het leeg.';
}
if (!in_array($dieet, ['geen', 'vegetarisch', 'veganistisch'])) {
    $fouten[] = 'Kies een dieetwens uit de lijst.';
}
if (strlen($opmerking) > 500) {
    $fouten[] = 'Je opmerking mag maximaal 500 tekens zijn.';
}
```
Herken je het patroon `0[0-9]{9}`? Waar stond het eerder? (FEO Hoofdstuk 3.)

### Opdracht 5 - Opslaan

Als er geen fouten zijn, sla je de inschrijving op en verlaag je het aantal vrije plekken:
```php
if (count($fouten) === 0) {
    mysqli_execute_query(
        $conn,
        "INSERT INTO inschrijvingen (workshop_id, naam, email, telefoon, aantal, dieet, opmerking)
         VALUES (?, ?, ?, ?, ?, ?, ?)",
        [$workshopId, $naam, $email, $telefoon === '' ? null : $telefoon, $aantal, $dieet, $opmerking === '' ? null : $opmerking]
    );

    mysqli_execute_query($conn, "UPDATE workshops SET plekken = plekken - ? WHERE id = ?", [$aantal, $workshopId]);
}
```

**Onderzoek:**
- `$telefoon === '' ? null : $telefoon`: wat betekent dit? Waarom liever `NULL` in de database dan een lege tekst?
- `UPDATE workshops SET plekken = plekken - ?`: lees dit hardop. Waarom rekent de database het uit, en niet PHP?
- Schrijf je in voor Brood bakken met 2 personen. Kijk in `inschrijvingen.php` en op de website: klopt alles?
- Wat kost de inschrijving als je in DevTools het verborgen prijsveld op `0.01` zet? Waarom?

### Opdracht 6 - F5 is gevaarlijk

1. Schrijf je in voor een workshop
2. Druk op de bedankpagina op **F5** (verversen). Wat vraagt de browser? Klik op "Doorgaan"
3. Kijk in `inschrijvingen.php` en naar het aantal vrije plekken

Wat is er gebeurd? Waarom?

De oplossing heet **Post/Redirect/Get**: na een geslaagde `POST` stuur je de browser door naar een gewone pagina (`GET`). Verversen herhaalt dan alleen die `GET`.

In `verwerk.php`, ná de `UPDATE`:
```php
$_SESSION['bevestiging'] = [
    'naam'     => $naam,
    'workshop' => $gekozen['titel'],
    'datum'    => $gekozen['datum'],
    'aantal'   => $aantal,
    'totaal'   => $gekozen['prijs'] * $aantal,
];

header('Location: bedankt.php');
exit;
```
Zet `session_start();` bovenaan `verwerk.php`.

Maak `bedankt.php`: start de session, haal `$_SESSION['bevestiging']` op en toon het (naam, workshop, datum, aantal, totaalprijs). Haal de bevestiging daarna weg met `unset($_SESSION['bevestiging']);`. Bestaat er geen bevestiging (iemand opent `bedankt.php` zomaar)? Stuur dan door naar `index.html`.

Test F5 opnieuw.

> De bevestiging gaat via de session en niet via de URL (`bedankt.php?id=12`). Waarom? Wat zou iemand kunnen doen met `bedankt.php?id=13`?

### Huiswerk

1. De website toont de workshops uit de database, inclusief nieuwe workshops
2. Een inschrijving wordt opgeslagen en de vrije plekken worden bijgewerkt
3. F5 op de bedankpagina schrijft niet opnieuw in
4. Teken de reis van één inschrijving: van het formulier (FEO), via de controle in de browser (JS) en `verwerk.php` (PHP), tot de tabel `inschrijvingen`. Zet bij elke stap wat er gecontroleerd wordt.
