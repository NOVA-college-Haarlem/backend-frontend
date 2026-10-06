# Hoofdstuk 7 - Extra: Code lezen en debuggen

Je hebt in Hoofdstuk 1 t/m 6 alles gezien: arrays, `foreach`, `include`, een database connectie, `SELECT`, detailpagina's met `$_GET` en filters. In dit hoofdstuk leer je niets nieuws. Je gaat de code die je al kent **lezen**, **voorspellen** en **repareren**. Dat is wat een developer de hele dag doet.

> **AI staat uit** bij opdracht 1 t/m 3. Je traint je eigen hoofd. Bij opdracht 4 mag AI weer.

Werk in je **Tools4Ever**-project (Hoofdstuk 6). Maak een nieuw bestand `oefenen.php` om de codevoorbeelden in te plakken.

---

## Les 1 - Voorspellen en debuggen

### Opdracht 1: Voorspel de output

Schrijf **eerst** op papier wat de browser laat zien. Pas daarna plak je de code in `oefenen.php` en test je het.

**1a**
```php
<?php
$merken = ['Bosch', 'Makita', 'DeWalt'];
echo $merken[1];
?>
```

**1b**
```php
<?php
$tool = [
    'name' => 'Boormachine',
    'price' => 89.95,
    'brand' => 'Bosch'
];
echo $tool['brand'] . ' - ' . $tool['name'];
?>
```

**1c**
```php
<?php
$prijzen = [10, 25, 5];
$totaal = 0;
foreach ($prijzen as $prijs) {
    $totaal = $totaal + $prijs;
}
echo $totaal;
?>
```

**1d** - De URL is `tools_detail.php?id=3&kleur=rood`
```php
<?php
echo $_GET['kleur'];
echo $_GET['id'];
?>
```

**1e**
```php
<?php
$tools = [
    ['name' => 'Hamer', 'price' => 12],
    ['name' => 'Zaag', 'price' => 25],
    ['name' => 'Tang', 'price' => 8],
];
foreach ($tools as $tool) {
    if ($tool['price'] > 10) {
        echo $tool['name'] . '<br>';
    }
}
?>
```

Hoeveel had je goed? Waar zat je ernaast, en waarom?

---

### Opdracht 2: Lees de foutmelding

PHP vertelt je bijna altijd wát er mis is en op welke **regel**. Koppel elke foutmelding aan de oorzaak.

| Foutmelding | Oorzaak |
|---|---|
| A. `Parse error: syntax error, unexpected token "echo"` | 1. Je gebruikt een key die niet in de array zit |
| B. `Warning: Undefined array key "naam"` | 2. Je bent een `;` vergeten op de regel **ervoor** |
| C. `Warning: Undefined variable $conn` | 3. De pagina is geopend zonder `?id=` in de URL |
| D. `Warning: Undefined array key "id"` | 4. Je bent `require 'database.php';` vergeten |

> **Tip:** Bij een `Parse error` zit de fout vaak op de regel **boven** het regelnummer dat PHP noemt.

---

### Opdracht 3: Bug hunt

Elk stukje code hieronder bevat **één** fout. Zoek de fout, schrijf op wat er mis is en verbeter de code. Test je oplossing in je Tools4Ever-project.

**Bug 1**
```php
<?php
require 'database.php';
$query = "SELECT * FROM tools"
$result = mysqli_query($conn, $query);
?>
```

**Bug 2**
```php
<?php
require 'database.php';
$query = "SELECT * FROM tools";
$result = mysqli_query($conn, $query);
$tools = mysqli_fetch_all($result, MYSQLI_ASSOC);

foreach ($tools as $tool) {
    echo $tools['tool_name'] . '<br>';
}
?>
```

**Bug 3**
```php
<?php
require 'database.php';
$id = $_GET['id'];
$query = "SELECT * FROM tools WHERE tool_id = $id";
$result = mysqli_query($conn, $query);
$tool = mysqli_fetch_all($result, MYSQLI_ASSOC);

echo $tool['tool_name'];
?>
```

**Bug 4**
```php
<a href="tools_detail.php?tool_id=<?php echo $tool['tool_id']; ?>">Bekijk</a>
```
```php
<?php
// tools_detail.php
$id = $_GET['id'];
?>
```

**Bug 5**
```php
<?php foreach ($tools as $tool): ?>
    <tr>
        <td><?php echo $tool['tool_name']; ?></td>
    </tr>
<?php endforeach ?>
<?php endforeach; ?>
```

**Bug 6**
```php
<?php
$value = $_GET['value'];
$query = "SELECT * FROM tools WHERE tool_brand = $value";
?>
```

---

### Opdracht 4: var_dump is je beste vriend

Als je niet weet wat er in een variabele zit: **kijk dan**.

1. Open `tools_detail.php`
2. Zet direct na het ophalen van de tool:
```php
<?php
echo '<pre>';
var_dump($tool);
echo '</pre>';
?>
```
3. Beantwoord:
   - Welke keys heeft `$tool`?
   - Is `$tool` een array met één tool, of een array met daarin weer arrays?
   - Wat zie je als je in de URL een `id` invult dat niet bestaat, bijvoorbeeld `?id=9999`?
4. Haal de `var_dump` weer weg als je klaar bent.

---

## Les 2 - Zelf maken

### Opdracht 5: Niet-bestaande tool afvangen

Bij opdracht 4 zag je dat `?id=9999` niets oplevert (`NULL`). De pagina geeft dan foutmeldingen.

1. Zorg ervoor dat `tools_detail.php` de tekst **"Deze tool bestaat niet"** toont als er geen tool gevonden is.
2. Gebruik een `if`:
```php
<?php if ($tool === null): ?>
    <p>Deze tool bestaat niet.</p>
    <a href="tools_index.php">Terug naar overzicht</a>
<?php else: ?>
    <!-- hier staat je bestaande HTML van de tool -->
<?php endif; ?>
```
3. Test met een bestaand en een niet-bestaand id.

### Opdracht 6: Mini-opdracht zonder voorbeeldcode

Maak een pagina `goedkoop.php` die alleen de tools toont die **minder dan 20 euro** kosten.

> **Let op:** kijk eerst in phpMyAdmin hoe `tool_price` is opgeslagen. Staat er `1499` bij een hamer van € 14,99? Dan moet je in je `WHERE` ook in centen rekenen.

- Gebruik je database connectie
- Gebruik een `SELECT` met `WHERE`
- Toon de tools in een tabel met een `foreach`
- Voeg de pagina toe aan je `navbar.php`

> **AI mag**, maar je moet elke regel aan je docent kunnen uitleggen.

### Opdracht 7 (extra): Breid uit

Kies er één:
- Laat bovenaan `goedkoop.php` zien **hoeveel** goedkope tools er zijn (`count($tools)`)
- Maak de grens instelbaar via de URL: `goedkoop.php?max=50`
- Doe hetzelfde voor `users_index.php`: toon alleen actieve gebruikers (kolom `is_active`)

---

### Checklist

- [ ] Ik heb bij opdracht 1 eerst voorspeld en daarna pas getest
- [ ] Ik kan een foutmelding lezen en het regelnummer vinden
- [ ] Ik heb alle 6 bugs gevonden en kan uitleggen wat er mis was
- [ ] Ik weet het verschil tussen `mysqli_fetch_all` en `mysqli_fetch_assoc`
- [ ] Mijn detailpagina crasht niet meer bij een niet-bestaand id
- [ ] `goedkoop.php` werkt en staat in het menu
