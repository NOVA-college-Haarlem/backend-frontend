# Blok 5 - Hoofdstuk 3 - Update

## Inhoudsopgave

- [Leerdoelen](#leerdoelen)
- [Update](#update)
- [Het update-patroon](#het-update-patroon)
  - [Opdracht 1: Wijzig-link fixen](#opdracht-1-wijzig-link-fixen)
  - [Opdracht 2: Updateformulier met vooringevulde data](#opdracht-2-updateformulier-met-vooringevulde-data)
  - [Opdracht 3: Update verwerken](#opdracht-3-update-verwerken)
  - [Opdracht 4: Update uitbreiden](#opdracht-4-update-uitbreiden)

## Update

## Leerdoelen

Na dit hoofdstuk kun je:

- Uitleggen wat het update-patroon is (GET → formulier → POST → UPDATE)
- Bestaande data ophalen en voorinvullen in een HTML-formulier
- Een UPDATE-query uitvoeren met een prepared statement
- De WHERE-clausule correct toepassen zodat slechts één rij wordt bijgewerkt

## Update

We bouwen verder aan de CRUD-applicatie. Create en Read zijn al klaar. Nu voegen we **Update** toe: het bijwerken van bestaande data in de database.

## Het update-patroon

Een update bestaat altijd uit twee stappen:

1. **GET-request** — haal de huidige data op uit de database en toon een formulier dat al vooringevuld is met die data
2. **POST-request** — verwerk het ingestuurde formulier en sla de nieuwe waarden op met een UPDATE-query

> ⚠️ **Let op de WHERE-clausule!**
> Een `UPDATE`-query zonder `WHERE` overschrijft **alle rijen** in de tabel. Controleer altijd of je `WHERE tool_id = :id` hebt staan.

### Opdracht 1: Wijzig-link fixen

1. Ga naar `tools_index.php`. Je ziet een tabel met tools — de "Wijzig"-link werkt nog niet.
2. Pas de link aan zodat die verwijst naar `tool_update.php` met het id van de tool als GET-parameter:

```php
<a href="tool_update.php?id=<?= $tool['tool_id'] ?>">Wijzig</a>
```

### Opdracht 2: Updateformulier met vooringevulde data

Maak het bestand `tool_update.php`. Dit bestand doet twee dingen:

1. Haal de huidige data op uit de database op basis van het id in de URL
2. Toon een formulier dat al vooringevuld is met die data

```php
<?php
require 'db.php';

if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    header('Location: tools_index.php');
    exit;
}

$id = $_GET['id'];
$stmt = $conn->prepare("SELECT * FROM tools WHERE tool_id = :id");
$stmt->execute(['id' => $id]);
$tool = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$tool) {
    header('Location: tools_index.php');
    exit;
}
?>

<form method="POST" action="tool_update_process.php">
    <!-- Stuur het id mee als verborgen veld -->
    <input type="hidden" name="tool_id" value="<?= $tool['tool_id'] ?>">

    <label>Naam</label>
    <input type="text" name="tool_name" value="<?= htmlspecialchars($tool['tool_name']) ?>">

    <label>Categorie</label>
    <input type="text" name="tool_category" value="<?= htmlspecialchars($tool['tool_category']) ?>">

    <label>Prijs</label>
    <input type="number" name="tool_price" value="<?= htmlspecialchars($tool['tool_price']) ?>">

    <button type="submit">Opslaan</button>
</form>
```

> Let op `htmlspecialchars()` bij de `value`-attributen — ook hier kan XSS optreden.

### Opdracht 3: Update verwerken

Maak het bestand `tool_update_process.php`. Dit bestand ontvangt de POST-data en slaat de nieuwe waarden op in de database.

```php
<?php
require 'db.php';

$id            = $_POST['tool_id'];
$tool_name     = $_POST['tool_name'];
$tool_category = $_POST['tool_category'];
$tool_price    = $_POST['tool_price'];

// LET OP: vergeet WHERE niet — anders worden ALLE tools bijgewerkt!
$stmt = $conn->prepare(
    "UPDATE tools
     SET tool_name = :tool_name,
         tool_category = :tool_category,
         tool_price = :tool_price
     WHERE tool_id = :id"
);
$stmt->execute([
    'tool_name'     => $tool_name,
    'tool_category' => $tool_category,
    'tool_price'    => $tool_price,
    'id'            => $id,
]);

header('Location: tools_index.php');
exit;
?>
```

Test de code:

1. Klik op "Wijzig" bij een tool
2. Pas een waarde aan en sla op
3. Controleer in de lijst of de wijziging zichtbaar is
4. Controleer in phpMyAdmin of de database is bijgewerkt

### Opdracht 4: Update uitbreiden

Pas nu hetzelfde patroon toe voor de andere entiteiten:

1. **Brands** — maak `brand_update.php` en `brand_update_process.php`
   - Velden: `brand_name`
2. **Users** — maak `user_update.php` en `user_update_process.php`
   - Velden: `firstname`, `lastname`, `email`, `role`
   - Wachtwoord **niet** in dit formulier — dat is een apart proces

Gebruik telkens hetzelfde patroon als bij tools:

- GET: data ophalen → formulier voorinvullen
- POST: data valideren → UPDATE uitvoeren → redirect
