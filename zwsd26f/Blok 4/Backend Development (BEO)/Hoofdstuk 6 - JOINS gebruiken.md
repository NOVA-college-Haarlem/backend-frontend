# Hoofdstuk 6 - JOINS gebruiken

Bezoekers schrijven zich in voor workshops. Die inschrijvingen staan in een eigen tabel. Een medewerker wil zien **wie** er naar **welke** workshop komt. Daarvoor heb je gegevens uit twee tabellen tegelijk nodig: een **JOIN**.

## Leerdoelen

Na dit hoofdstuk kun je:
- Uitleggen wat een primary key en een foreign key zijn
- Twee tabellen koppelen met `JOIN ... ON`
- Een `JOIN` combineren met `WHERE`
- Uitleggen wat het verschil is tussen `JOIN` en `LEFT JOIN`

**AI-gebruik:** bij de vragen (Onderzoek) **geen AI**. Bij de opdrachten mag AI, maar je moet elke regel kunnen uitleggen.

---

### Opdracht 1 - De tabel inschrijvingen

1. Importeer `sql/inschrijvingen.sql` in phpMyAdmin
2. Bekijk de tabel

**Onderzoek:**
- In de kolom `workshop_id` staan getallen. Voor welke workshop heeft Lisa Jansen zich ingeschreven? Hoe ben je daarachter gekomen?
- Probeer in phpMyAdmin een inschrijving toe te voegen met `workshop_id` 99. Wat gebeurt er? Waarom?

```
workshops                      inschrijvingen
+----+-------------------+     +----+-------------+-------------------+
| id | titel             |     | id | workshop_id | naam              |
+----+-------------------+     +----+-------------+-------------------+
|  1 | Verse pasta maken |◄────|  1 |      1      | Lisa Jansen       |
|  2 | Sushi voor beg... |◄─┐  |  2 |      1      | Mohamed el Amrani |
|  3 | Brood bakken      |  └──|  3 |      2      | Ahmed Bakker      |
+----+-------------------+     +----+-------------+-------------------+
```

- `workshops.id` is de **primary key**: elke workshop heeft een uniek nummer.
- `inschrijvingen.workshop_id` is een **foreign key**: hij verwijst naar `workshops.id`. De database bewaakt dat die workshop bestaat.

> Waarom niet gewoon de titel van de workshop in de tabel inschrijvingen zetten? Bedenk wat er gebeurt als de titel van een workshop verandert, of als er een typfout in staat.

### Opdracht 2 - Je eerste JOIN, in phpMyAdmin

Voer in het tabblad SQL uit:
```sql
SELECT inschrijvingen.naam, inschrijvingen.aantal, workshops.titel, workshops.datum
FROM inschrijvingen
JOIN workshops ON inschrijvingen.workshop_id = workshops.id;
```

- Lees de query hardop: "Neem de inschrijvingen, en zet bij elke inschrijving de workshop waarvan het `id` gelijk is aan de `workshop_id`."
- Waarom staat de tabelnaam voor elke kolom (`inschrijvingen.naam`)? Wat gebeurt er als je `SELECT id` schrijft?
- Voeg `ORDER BY workshops.datum` toe. Wat verandert er?

### Opdracht 3 - Alle inschrijvingen

Maak `inschrijvingen.php` (alleen voor admin) met een tabel: naam, e-mail, workshop, datum, aantal personen, dieet.

```php
<?php
require 'admin_check.php';
require 'database.php';

$sql = "SELECT inschrijvingen.id, inschrijvingen.naam, inschrijvingen.email,
               inschrijvingen.aantal, inschrijvingen.dieet,
               workshops.titel, workshops.datum
        FROM inschrijvingen
        JOIN workshops ON inschrijvingen.workshop_id = workshops.id
        ORDER BY workshops.datum, inschrijvingen.naam";

$result = mysqli_query($conn, $sql);
$inschrijvingen = mysqli_fetch_all($result, MYSQLI_ASSOC);

$paginatitel = 'Inschrijvingen';
require 'header.php';
?>
```

Maak de HTML-tabel zelf, net als in `workshops_overzicht.php`. Zet een link naar deze pagina op `account.php` (bij Beheer).

> Hier staat `mysqli_query` zonder `?`. Waarom mag dat hier wel?

### Opdracht 4 - Wie komt er naar één workshop?

Maak `workshop_inschrijvingen.php?id=...`: de gegevens van één workshop, met daaronder alleen de inschrijvingen voor die workshop.

1. Zet in `workshops_overzicht.php` per workshop een link:
```php
<td><a href="workshop_inschrijvingen.php?id=<?php echo $workshop['id']; ?>">Inschrijvingen</a></td>
```
2. Haal in `workshop_inschrijvingen.php` eerst de workshop op:
```php
$id = (int) ($_GET['id'] ?? 0);

$result   = mysqli_execute_query($conn, "SELECT * FROM workshops WHERE id = ?", [$id]);
$workshop = mysqli_fetch_assoc($result);
```
3. Bestaat de workshop niet (`$workshop === null`)? Toon "Deze workshop bestaat niet." met een link terug. (Dit kende je uit Blok 3.)
4. Haal de inschrijvingen op met een `JOIN` en een `WHERE`:
```php
$result = mysqli_execute_query(
    $conn,
    "SELECT inschrijvingen.naam, inschrijvingen.email, inschrijvingen.aantal,
            inschrijvingen.dieet, inschrijvingen.opmerking
     FROM inschrijvingen
     JOIN workshops ON inschrijvingen.workshop_id = workshops.id
     WHERE workshops.id = ?
     ORDER BY inschrijvingen.naam",
    [$id]
);
```
5. Toon "Nog geen inschrijvingen." als de lijst leeg is

Test met elke workshop, en met `?id=999`.

### Opdracht 5 - JOIN of LEFT JOIN?

Voer deze twee queries uit in phpMyAdmin en vergelijk:
```sql
SELECT workshops.titel, inschrijvingen.naam
FROM workshops
JOIN inschrijvingen ON inschrijvingen.workshop_id = workshops.id;
```
```sql
SELECT workshops.titel, inschrijvingen.naam
FROM workshops
LEFT JOIN inschrijvingen ON inschrijvingen.workshop_id = workshops.id;
```

- Welke workshop zie je alleen bij de tweede query? Wat staat er bij `naam`?
- Leg in je eigen woorden uit wat het verschil is.

| | `JOIN` | `LEFT JOIN` |
|---|---|---|
| Toont | Alleen rijen die in **beide** tabellen een match hebben | **Alle** rijen uit de linker tabel, ook zonder match |
| Geen match? | Rij valt weg | Kolommen uit de rechter tabel zijn `NULL` |
| Gebruik je voor | "Alle inschrijvingen met hun workshop" | "Alle workshops, ook die zonder inschrijvingen" |

Je hebt `LEFT JOIN` nodig bij het dashboard (Hoofdstuk 9).

### Extra - Mijn inschrijvingen

Maak `mijn_inschrijvingen.php` (voor iedere ingelogde gebruiker): de workshops waarvoor de ingelogde gebruiker is ingeschreven. Koppel op e-mailadres: `WHERE inschrijvingen.email = ?` met `$_SESSION['email']`. Test met `ahmed@voorbeeld.nl`.

### Huiswerk

1. `inschrijvingen.php` en `workshop_inschrijvingen.php` werken, alleen voor admin
2. Een niet-bestaande workshop geeft een nette melding
3. Leg uit: wat is een foreign key, en wanneer gebruik je `LEFT JOIN` in plaats van `JOIN`?
