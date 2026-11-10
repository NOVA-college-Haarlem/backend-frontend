# Hoofdstuk 8 - Zoeken

Er komen steeds meer inschrijvingen binnen. Een medewerker krijgt een mail van "Lisa" en wil snel haar inschrijvingen terugvinden. Je bouwt een zoekfunctie in `inschrijvingen.php`, en je ziet eindelijk waarom je sinds Hoofdstuk 1 altijd `?` gebruikt.

## Leerdoelen

Na dit hoofdstuk kun je:
- Een zoekformulier maken dat met `GET` werkt
- Zoeken met `LIKE` en `%`
- Zoeken in meerdere kolommen tegelijk, ook over een `JOIN`
- Uitleggen wat SQL-injectie is, en waarom `?`-parameters het voorkomen
- Uitleggen wanneer je zoekt op de server en wanneer je filtert in de browser

**AI-gebruik:** bij de vragen (Onderzoek) **geen AI**. Bij de opdrachten mag AI, maar je moet elke regel kunnen uitleggen.

---

### Opdracht 1 - LIKE in phpMyAdmin

```sql
SELECT naam, email FROM inschrijvingen WHERE naam LIKE '%lisa%';
```

- Wat betekent `%`? Probeer `'lisa%'`, `'%jansen'` en `'%a%'`.
- Maakt hoofdletters uit? Probeer `'%LISA%'`.

### Opdracht 2 - Het zoekformulier

Zet boven de tabel in `inschrijvingen.php`:
```php
<form method="get" class="zoekformulier">
    <label for="zoek">Zoek op naam, e-mail of workshop</label>
    <input type="search" id="zoek" name="zoek" value="<?php echo htmlspecialchars($zoek); ?>">
    <button type="submit" class="knop">Zoeken</button>
</form>
```

**Onderzoek:**
- Dit formulier gebruikt `method="get"`. Zoek op "lisa" en kijk in de adresbalk. Waarom is `GET` hier beter dan `POST`? (Denk aan FEO Hoofdstuk 1: wanneer gebruik je GET?)
- Wat kan een medewerker doen met die URL?

### Opdracht 3 - De zoekquery

Pas het PHP-deel van `inschrijvingen.php` aan:
```php
$zoek = trim($_GET['zoek'] ?? '');

$sql = "SELECT inschrijvingen.id, inschrijvingen.naam, inschrijvingen.email,
               inschrijvingen.aantal, inschrijvingen.dieet,
               workshops.titel, workshops.datum
        FROM inschrijvingen
        JOIN workshops ON inschrijvingen.workshop_id = workshops.id";

$parameters = [];

if ($zoek !== '') {
    $sql .= " WHERE inschrijvingen.naam LIKE ?
                 OR inschrijvingen.email LIKE ?
                 OR workshops.titel LIKE ?";
    $zoekterm = '%' . $zoek . '%';
    $parameters = [$zoekterm, $zoekterm, $zoekterm];
}

$sql .= " ORDER BY workshops.datum, inschrijvingen.naam";
$result = mysqli_execute_query($conn, $sql, $parameters);
$inschrijvingen = mysqli_fetch_all($result, MYSQLI_ASSOC);
```

**Onderzoek:**
- Wat doet `.=`?
- Waarom staan de `%`-tekens in PHP om de zoekterm, en niet in de SQL om het vraagteken?
- Er staan drie `?`. Waarom staat `$zoekterm` drie keer in de array?
- Zoek op "sushi". Waarom vind je inschrijvingen, terwijl "sushi" niet in de tabel `inschrijvingen` staat?

### Opdracht 4 - Netjes afmaken

1. Laat boven de tabel zien hoeveel resultaten er zijn: `3 resultaten voor "lisa"` (gebruik `count()`)
2. Geen resultaten? Toon "Geen inschrijvingen gevonden." in plaats van een lege tabel
3. Zet een link "Alles tonen" naast de zoekknop, alleen als er gezocht is

---

### Onderzoek - Waarom altijd `?`

Een student schreef de zoekquery zo, "want dat is korter":
```php
$sql = "SELECT ... WHERE inschrijvingen.naam LIKE '%$zoek%'";
$result = mysqli_query($conn, $sql);
```

Je docent laat dit zien in een **testbestand**. Kijk mee en beantwoord:
1. Zoek op `lisa`. Werkt het? (Ja.)
2. Zoek op `O'Brien`. Wat gebeurt er? Waarom?
3. Zoek op `xyz' OR 1=1 -- ` (let op de spatie aan het eind). Hoeveel resultaten? Schrijf de SQL op zoals de database hem nu ontvangt. Wat doet `--`?
4. Wat zou er kunnen gebeuren als dit geen zoekveld was, maar het e-mailveld van een inlogformulier?

Dit heet **SQL-injectie**: de gebruiker typt geen zoekterm, maar een stuk SQL, en jouw code voert het uit. Het is al jaren een van de meest voorkomende oorzaken van datalekken.

Probeer dezelfde invoer nu in **jouw** `inschrijvingen.php`. Wat gebeurt er?

> Met `?` stuurt PHP de query en de waarden **apart** naar de database. Wat de gebruiker ook typt, het wordt altijd als tekst behandeld, nooit als SQL. Daarom: **alles van een gebruiker gaat via een `?`**.

---

### Zoeken op de server of filteren in de browser?

Bij JavaScript (Hoofdstuk 4) filter je de workshops **in de browser**: alle workshops zijn al geladen, JS laat er een paar zien. Hier zoek je **op de server**: de database geeft alleen de gevonden rijen terug.

| | Filteren in de browser (JS H4) | Zoeken op de server (dit hoofdstuk) |
|---|---|---|
| Waar | JavaScript, met `filter()` | PHP + SQL, met `LIKE` |
| Alle data naar de browser? | Ja | Nee, alleen de resultaten |
| Snel bij weinig data | Ja, geen nieuw verzoek | Elk keer een verzoek naar de server |
| Geschikt voor veel data | Nee | Ja |
| Geheime data? | Nee: alles staat in de browser | Ja: de rest blijft op de server |

**Vraag:** waarom zou je de inschrijvingen (namen, e-mailadressen) nooit allemaal naar de browser sturen om daar te filteren?

### Extra - Filteren per workshop

Voeg aan het zoekformulier een `<select name="workshop">` toe met alle workshops (uit de database). Kies je een workshop, dan zie je alleen de inschrijvingen voor die workshop. Het moet ook samen met de zoekterm werken. Tip: bouw een array `$voorwaarden` en een array `$parameters` op, en plak de voorwaarden aan elkaar met `implode(' AND ', $voorwaarden)`.

### Huiswerk

1. Zoeken op naam, e-mail en workshop werkt, met het aantal resultaten
2. `O'Brien` en `xyz' OR 1=1 -- ` geven geen fout en geen extra resultaten
3. Leg in je eigen woorden uit wat SQL-injectie is en hoe `?` het voorkomt
