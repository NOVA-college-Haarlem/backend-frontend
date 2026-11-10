# Hoofdstuk 1 - POST en CREATE

In Blok 3 heb je data **uit** de database gehaald en getoond. Dit blok gaan we data **in** de database zetten. We werken aan dezelfde site als bij Frontend en JavaScript: **De Smaakmakers**. Bij Frontend en JS bouw je de voorkant; bij Backend bouw je wat erachter zit.

We beginnen met een pagina waarop een medewerker van De Smaakmakers een nieuwe workshop kan toevoegen.

## Leerdoelen

Na dit hoofdstuk kun je:
- De database koppelen aan je project (herhaling Blok 3)
- Een formulier maken dat met `POST` gegevens naar de server stuurt
- Gegevens uitlezen met `$_POST`
- Een nieuwe rij opslaan met `INSERT`, op een veilige manier (`?`)
- Na het opslaan doorsturen naar een andere pagina met `header('Location: ...')`

**AI-gebruik:** bij de vragen (Onderzoek) **geen AI**. Bij de opdrachten mag AI, maar je moet elke regel kunnen uitleggen.

---

### Opdracht 0 - Project starten

1. Open de map `starter-website-3` in VS Code (dezelfde map als bij Frontend en JS)
2. Typ in de terminal: `docker compose up -d`. De eerste keer duurt dit even.
3. Open http://localhost: je ziet De Smaakmakers
4. Open phpMyAdmin: http://localhost:8000 (gebruiker `root`, wachtwoord `password`)

### Opdracht 1 - De workshops in de database

Bij JavaScript staan de workshops in `data/workshops.json`. Voor de backend zetten we ze in de database.

1. Klik in phpMyAdmin links op de database `smaakmakers`
2. Open het tabblad **SQL**, plak de inhoud van `sql/workshops.sql` en klik op **Starten**
3. Bekijk de tabel `workshops` en het tabblad **Structuur**

**Onderzoek:**
- Welke kolommen zijn er? Vergelijk ze met de eigenschappen in `data/workshops.json`.
- `datum` is van het type `DATE`, `prijs` van het type `DECIMAL(6,2)`. Wat betekenen die twee getallen bij `DECIMAL`?
- De kolom `id` heeft `AUTO_INCREMENT`. Wat betekent dat als je straks een workshop toevoegt?

### Opdracht 2 - Database connectie

Maak `database.php`, net als in Blok 3:

```php
<?php

$dbhost = 'mariadb';
$dbname = 'smaakmakers';
$dbuser = 'root';
$dbpass = 'password';

$conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
```

### Opdracht 3 - Eén header en footer voor alle PHP-pagina's

Je gaat dit blok veel PHP-pagina's maken. Om niet elke keer dezelfde `<head>` en `<header>` te typen (DRY, weet je nog?), maak je twee bestanden.

`header.php`:
```php
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlspecialchars($paginatitel); ?> - De Smaakmakers</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<header>
    <div class="container header-inner">
        <div class="logo">De Smaakmakers</div>
        <nav>
            <a href="index.html">Website</a>
            <a href="workshops_overzicht.php">Workshops beheren</a>
        </nav>
    </div>
</header>

<main class="container">
```

`footer.php`:
```php
</main>

<footer>
    <div class="container">
        <p>De Smaakmakers - Pannenlaan 12, Haarlem</p>
    </div>
</footer>

</body>
</html>
```

Een pagina gebruikt ze zo:
```php
<?php
$paginatitel = 'Workshops beheren';
require 'header.php';
?>

<h1>Hier komt de inhoud</h1>

<?php require 'footer.php'; ?>
```

**Onderzoek:** `$paginatitel` wordt in de pagina gemaakt, maar in `header.php` gebruikt. Waarom werkt dat? (Tip: wat doet `require` eigenlijk?)

### Opdracht 4 - Overzicht van de workshops (herhaling Blok 3)

Maak `workshops_overzicht.php` met een tabel van alle workshops: titel, categorie, datum, prijs en vrije plekken.

```php
<?php
require 'database.php';

$result = mysqli_query($conn, "SELECT * FROM workshops ORDER BY datum");
$workshops = mysqli_fetch_all($result, MYSQLI_ASSOC);

$paginatitel = 'Workshops beheren';
require 'header.php';
?>

<h1>Workshops beheren</h1>
<p><a href="workshop_create.php" class="knop">Nieuwe workshop</a></p>

<table class="tabel">
    <thead>
        <tr>
            <th>Titel</th>
            <th>Categorie</th>
            <th>Datum</th>
            <th>Prijs</th>
            <th>Vrije plekken</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($workshops as $workshop): ?>
            <tr>
                <td><?php echo htmlspecialchars($workshop['titel']); ?></td>
                <td><?php echo htmlspecialchars($workshop['categorie']); ?></td>
                <td><?php echo date('d-m-Y', strtotime($workshop['datum'])); ?></td>
                <td>€ <?php echo number_format($workshop['prijs'], 2, ',', '.'); ?></td>
                <td><?php echo $workshop['plekken']; ?></td>
            </tr>
        <?php endforeach; ?>
    </tbody>
</table>

<?php require 'footer.php'; ?>
```

**Onderzoek:**
- In de database staat de datum als `2026-12-05`. Wat doen `strtotime` en `date('d-m-Y', ...)`?
- Wat doet `number_format($prijs, 2, ',', '.')`? Probeer het met `1234.5`.

### Opdracht 5 - Het formulier

Maak `workshop_create.php`:

```php
<?php
$paginatitel = 'Nieuwe workshop';
require 'header.php';
?>

<h1>Nieuwe workshop</h1>

<form action="workshop_create_process.php" method="post" class="formulier">
    <div class="veld">
        <label for="titel">Titel</label>
        <input type="text" id="titel" name="titel" required>
    </div>

    <div class="veld">
        <label for="categorie">Categorie</label>
        <select id="categorie" name="categorie" required>
            <option value="">-- Kies een categorie --</option>
            <option value="Italiaans">Italiaans</option>
            <option value="Aziatisch">Aziatisch</option>
            <option value="Bakken">Bakken</option>
            <option value="Vegetarisch">Vegetarisch</option>
        </select>
    </div>

    <div class="veld">
        <label for="datum">Datum</label>
        <input type="date" id="datum" name="datum" required>
    </div>

    <div class="veld">
        <label for="prijs">Prijs per persoon (€)</label>
        <input type="number" id="prijs" name="prijs" step="0.01" min="0" required>
    </div>

    <div class="veld">
        <label for="plekken">Aantal plekken</label>
        <input type="number" id="plekken" name="plekken" min="1" required>
    </div>

    <button type="submit" class="verstuur">Workshop opslaan</button>
</form>

<?php require 'footer.php'; ?>
```

**Onderzoek** (je kent dit van Frontend Hoofdstuk 1):
- Naar welk bestand gaat dit formulier? Met welke methode?
- Welk attribuut bepaalt onder welke naam een veld aankomt op de server?
- Waarom `post` en niet `get`?

### Opdracht 6 - De verwerking

Maak `workshop_create_process.php`. Begin met kijken wat er binnenkomt:

```php
<?php
var_dump($_POST);
```

Vul het formulier in en verstuur. `$_POST` is een **associatieve array**: de sleutels zijn de `name`'s van je velden.

Vervang de `var_dump` door de echte verwerking:

```php
<?php
require 'database.php';

// Eerste, eenvoudige controle (in Hoofdstuk 2 maken we dit veel beter)
if (empty($_POST['titel'])) {
    echo "Vul een titel in.";
    exit;
}
if (!is_numeric($_POST['prijs'])) {
    echo "De prijs moet een getal zijn.";
    exit;
}

$sql = "INSERT INTO workshops (titel, categorie, datum, prijs, plekken) VALUES (?, ?, ?, ?, ?)";

mysqli_execute_query($conn, $sql, [
    $_POST['titel'],
    $_POST['categorie'],
    $_POST['datum'],
    $_POST['prijs'],
    $_POST['plekken']
]);

header('Location: workshops_overzicht.php');
exit;
```

Voeg een workshop toe. Staat hij in het overzicht? En in phpMyAdmin?

### Wat zijn die vraagtekens?

In Blok 3 schreef je queries zo: `"SELECT * FROM drivers WHERE driverId = $driverId"`. De waarde stond direct in de SQL.

Vanaf nu doe je dat **nooit** meer met iets dat van een gebruiker komt. Je zet een `?` in de query en geeft de waarden apart mee, in een array. De database vult ze zelf veilig in, in dezelfde volgorde.

| Blok 3 | Vanaf nu |
|---|---|
| `mysqli_query($conn, "... WHERE id = $id")` | `mysqli_execute_query($conn, "... WHERE id = ?", [$id])` |

Waarom dit zo belangrijk is, zie je in Hoofdstuk 8. Onthoud voor nu: **alles van een gebruiker gaat via een `?`**.

**Onderzoek:**
- Hoeveel `?` staan er in de `INSERT`? Hoeveel waarden in de array? Wat moet er altijd kloppen?
- Wat doet `header('Location: workshops_overzicht.php')`? Waarom staat er `exit` achter?
- Geef de titel een lege waarde (haal `required` weg in DevTools). Wat zie je? Is dat een prettige melding voor een gebruiker?

### Opdracht 7 - Zelf doen

1. Voeg aan `workshop_create_process.php` een controle toe: de datum mag niet leeg zijn
2. Voeg een controle toe: plekken moet een getal zijn
3. Voeg drie workshops toe en controleer ze in het overzicht

> **Let op:** de nieuwe workshops staan in de database, maar nog **niet** op de website (`index.html`). Die leest nog `data/workshops.json`. Dat koppelen we in Hoofdstuk 7.

### Huiswerk

1. `workshops_overzicht.php` en `workshop_create.php` werken
2. Een nieuwe workshop komt in de database en je wordt teruggestuurd naar het overzicht
3. Leg in je eigen woorden uit: waarom zet je `?` in de query in plaats van de variabele?
