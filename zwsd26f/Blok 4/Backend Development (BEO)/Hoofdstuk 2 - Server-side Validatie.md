# Hoofdstuk 2 - Server-side Validatie

In Hoofdstuk 1 controleerde `workshop_create_process.php` maar een paar dingen, en bij een fout kreeg je een kaal wit scherm met één zin. Je ingevulde gegevens waren weg. In dit hoofdstuk maak je een controle die **alles** nakijkt, de fouten **bij het juiste veld** laat zien, en je ingevulde waarden **bewaart**.

## Leerdoelen

Na dit hoofdstuk kun je:
- Formulier en verwerking in één PHP-bestand zetten
- Fouten verzamelen in een `$fouten`-array, per veld
- Na een fout de ingevulde waarden terugzetten in het formulier
- Controleren op: verplicht, lengte, keuze uit een lijst, geldige datum, getal binnen grenzen
- Met een `SELECT` controleren of iets al bestaat, vóórdat je het opslaat
- Uitleggen waarom de server altijd moet controleren, ook als het formulier `required` heeft

**AI-gebruik:** bij de vragen (Onderzoek) **geen AI**. Bij de opdrachten mag AI, maar je moet elke regel kunnen uitleggen.

---

### Onderzoek - Waarom de server?

Je formulier heeft `required`, `type="number"` en `min`. De browser controleert dus al. Probeer dit:
1. Open `workshop_create.php` en open DevTools → **Elements**
2. Haal bij titel het `required` weg, en verander bij de categorie de `value` van een `<option>` in `Hacken`
3. Verstuur met een lege titel en categorie "Hacken"

- Wat komt er in de database terecht?
- Wat zegt dit over de controle van de browser?

> **Regel:** de browser controleert voor het **gemak** van de gebruiker. De server controleert voor de **veiligheid** van je data. De server doet het altijd, want de browser kan worden omzeild. (Bij JavaScript Hoofdstuk 5 ga je hier dieper op in.)

Verwijder de foute workshop in phpMyAdmin.

### Opdracht 1 - Eén bestand

We zetten formulier en verwerking in **één** bestand. Het formulier stuurt naar zichzelf. Bovenaan staat de PHP die alleen iets doet als het formulier verstuurd is.

Vervang `workshop_create.php` door deze opzet, en verwijder daarna `workshop_create_process.php`:

```php
<?php
require 'database.php';

$categorieen = ['Italiaans', 'Aziatisch', 'Bakken', 'Vegetarisch'];

$fouten    = [];
$titel     = '';
$categorie = '';
$datum     = '';
$prijs     = '';
$plekken   = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $titel     = trim($_POST['titel'] ?? '');
    $categorie = $_POST['categorie'] ?? '';
    $datum     = $_POST['datum'] ?? '';
    $prijs     = $_POST['prijs'] ?? '';
    $plekken   = $_POST['plekken'] ?? '';

    if (strlen($titel) < 3 || strlen($titel) > 100) {
        $fouten['titel'] = 'De titel moet tussen de 3 en 100 tekens lang zijn.';
    }

    // Hier komen straks de andere controles

    if (count($fouten) === 0) {
        mysqli_execute_query(
            $conn,
            "INSERT INTO workshops (titel, categorie, datum, prijs, plekken) VALUES (?, ?, ?, ?, ?)",
            [$titel, $categorie, $datum, $prijs, $plekken]
        );

        header('Location: workshops_overzicht.php');
        exit;
    }
}

$paginatitel = 'Nieuwe workshop';
require 'header.php';
?>
```

Pas in het formulier het `<form>`-element aan, zodat het naar zichzelf stuurt:
```html
<form method="post" class="formulier">
```

**Onderzoek:**
- Een `<form>` zonder `action`: waar gaat het naartoe?
- `$_SERVER['REQUEST_METHOD']` is `GET` als je de pagina opent, en `POST` als je het formulier verstuurt. Waarom is dat belangrijk voor de `if`?
- Wat doet `?? ''`? Wat zou er gebeuren zonder, als iemand een veld weghaalt in DevTools?
- `$fouten` is een array met **sleutels** (`'titel'`). Waarom is dat handiger dan een lijst zonder sleutels?

### Opdracht 2 - Fouten bij het veld tonen, waarden terugzetten

Pas het titelveld aan:
```php
<div class="veld">
    <label for="titel">Titel</label>
    <input type="text" id="titel" name="titel" value="<?php echo htmlspecialchars($titel); ?>" required>
    <?php if (isset($fouten['titel'])): ?>
        <p class="fout"><?php echo $fouten['titel']; ?></p>
    <?php endif; ?>
</div>
```

- Test met de titel `ab`. Staat de fout onder het veld? Staat `ab` er nog in?
- Waarom `htmlspecialchars` in de `value`? Probeer eens de titel `Pasta "Napoli"` zonder `htmlspecialchars`. Wat zie je?

Doe hetzelfde voor datum, prijs en plekken.

De `<select>` is anders: de gekozen optie moet `selected` krijgen. Maak de opties met een `foreach` over `$categorieen`:
```php
<select id="categorie" name="categorie" required>
    <option value="">-- Kies een categorie --</option>
    <?php foreach ($categorieen as $optie): ?>
        <option value="<?php echo $optie; ?>" <?php if ($optie === $categorie) echo 'selected'; ?>>
            <?php echo $optie; ?>
        </option>
    <?php endforeach; ?>
</select>
```

### Opdracht 3 - De controles

Voeg deze controles toe op de plek "Hier komen straks de andere controles":

**Categorie: alleen een waarde uit de lijst**
```php
if (!in_array($categorie, $categorieen)) {
    $fouten['categorie'] = 'Kies een categorie uit de lijst.';
}
```
Waarom is dit de oplossing voor de "Hacken"-categorie uit het onderzoek?

**Datum: een echte datum, niet in het verleden**
```php
$datumObject = DateTime::createFromFormat('Y-m-d', $datum);
if (!$datumObject || $datumObject->format('Y-m-d') !== $datum) {
    $fouten['datum'] = 'Vul een geldige datum in.';
} elseif ($datum < date('Y-m-d')) {
    $fouten['datum'] = 'De datum mag niet in het verleden liggen.';
}
```
- Wat geeft `date('Y-m-d')`? Probeer `echo date('Y-m-d');`
- `createFromFormat` probeert van de tekst een datum te maken. Waarom controleren we daarna nog of het formaat precies klopt? (Probeer `2027-02-31`.)

**Zelf schrijven:**
- Prijs: een getal (`is_numeric`) van 0 tot en met 500
- Plekken: een heel getal van 1 tot en met 20. Tip: `ctype_digit($plekken)` is alleen `true` als er alleen cijfers in staan.

Test elke controle door het formulier fout in te vullen, ook met DevTools (`required` weg, `min` weg, een `value` aanpassen).

### Opdracht 4 - Bestaat hij al?

Twee workshops met dezelfde titel is verwarrend. Controleer met een `SELECT` of de titel al bestaat, **voordat** je opslaat:

```php
if (strlen($titel) < 3 || strlen($titel) > 100) {
    $fouten['titel'] = 'De titel moet tussen de 3 en 100 tekens lang zijn.';
} else {
    $result = mysqli_execute_query($conn, "SELECT id FROM workshops WHERE titel = ?", [$titel]);
    if (mysqli_num_rows($result) > 0) {
        $fouten['titel'] = 'Er bestaat al een workshop met deze titel.';
    }
}
```
- Wat geeft `mysqli_num_rows`?
- Waarom staat de `SELECT` in de `else`? (Wat heeft het voor zin om in de database te zoeken naar een titel van 1 teken?)

Dit patroon (eerst zoeken, dan pas opslaan) heb je in Hoofdstuk 3 weer nodig.

### Huiswerk

1. `workshop_create.php` controleert alle vijf de velden, toont de fout bij het juiste veld en bewaart de ingevulde waarden
2. Een workshop met een bestaande titel wordt tegengehouden
3. Je kunt met DevTools geen ongeldige workshop meer in de database krijgen
4. Leg uit: je formulier heeft `required`. Waarom moet de server toch controleren?
