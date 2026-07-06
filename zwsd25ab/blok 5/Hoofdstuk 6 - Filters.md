# Blok 5 - Hoofdstuk 6 - Filters

## Leerdoelen

Na dit hoofdstuk kun je:

- Een filterbar toevoegen aan een overzichtspagina
- GET-parameters uitlezen en verwerken in een SQL-query
- Dynamisch filterwaardes ophalen uit de database met een `foreach`

## Filtering

Door filters kunnen we de gebruiker helpen om snel de juiste data te vinden. We voegen een sidebar toe aan `tools_index.php` met klikbare filterlinks.

### Opdracht 1

1. Voeg een filterbar toe aan `tools_index.php`. Zet de volgende HTML **binnen** `<main>`, vóór de `<table>`:

```html
<aside>
  <h2>Filters</h2>
  <ul>
    <li><a href="tools_index.php?filter=brands&value=makita">Makita</a></li>
  </ul>
</aside>
```

2. Voeg de class `table` toe aan het `<main>`-element:

```html
<main class="table"></main>
```

> De GET-parameter `filter=brands` gebruik je straks in PHP om te bepalen op welke kolom je filtert.

### Opdracht 2

1. Voeg de volgende CSS toe aan `style.css` zodat de filterbar naast de tabel staat:

```css
.table {
  display: flex;
  flex-direction: row;
}

.table aside {
  display: flex;
  justify-content: start;
  width: 12%;
  flex-direction: column;
}

.table aside h2 {
  font-size: 14px;
}
```

### Opdracht 3

Nu voegen we PHP toe aan `tools_index.php` zodat de filter ook echt werkt. Voeg de volgende code toe **na de eerste `fetchAll()`** (de query die alle tools ophaalt):

```php
if (isset($_GET['filter']) && isset($_GET['value'])) {
    $filter = $_GET['filter'];

    if ($filter === 'brands') {
        $filter = 'brands.brand_name';
    }

    $value = $_GET['value'];

    // we hebben nu TWEE voorwaarden aan de WHERE clause toegevoegd
    $sql = "SELECT * FROM tools JOIN brands ON brands.brand_id = tools.tool_brand WHERE tools.deleted_at IS NULL AND $filter = :value";
    $stmt = $conn->prepare($sql);
    $stmt->execute(['value' => $value]);
    $tools = $stmt->fetchAll(PDO::FETCH_ASSOC);
}
```

Test in de browser: klik op de filterlink en controleer of alleen Makita-tools getoond worden.

### Opdracht 4: Dynamische filterlijst

Een hardcoded link voor één merk is niet handig. Haal alle merken op uit de database en genereer de links automatisch:

```php
// Bovenaan tools_index.php, na de eerste query
$stmt_brands = $conn->prepare("SELECT * FROM brands");
$stmt_brands->execute();
$brands = $stmt_brands->fetchAll(PDO::FETCH_ASSOC);
```

Vervang de hardcoded `<li>` in de sidebar door een foreach:

```php
<?php foreach ($brands as $brand): ?>
    <li>
        <a href="tools_index.php?filter=brands&value=<?= htmlspecialchars($brand['brand_name']) ?>">
            <?= htmlspecialchars($brand['brand_name']) ?>
        </a>
    </li>
<?php endforeach; ?>
```

Voeg ook een "Alle tools"-link toe zodat de gebruiker de filter kan resetten:

```html
<li><a href="tools_index.php">Alle tools</a></li>
```
