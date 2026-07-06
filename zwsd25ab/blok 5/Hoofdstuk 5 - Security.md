# Blok 5 - Hoofdstuk 5 - Security

## Leerdoelen

Na dit hoofdstuk kun je:

- Pagina's beveiligen met een sessiecheck en rolcheck
- Gebruikersinvoer valideren met `isset()`, `is_numeric()` en integer-cast
- Foutafhandeling toepassen na een databaseoperatie
- Een eenvoudig logboek bijhouden van acties

## Les 1 — Security

In deze les gaan we security toevoegen aan onze applicatie.

### Opdracht 1: Sessiecheck en rolcheck

Niet-ingelogde gebruikers mogen `tools_delete.php` niet kunnen bereiken. Bovendien mag alleen een administrator tools verwijderen.

Voeg bovenaan `tools_delete.php` (na `session_start()`) de volgende code toe:

```php
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

if ($_SESSION['role'] !== 'administrator') {
    header('Location: tools_index.php');
    exit;
}
```

> **Waar komt `$_SESSION['role']` vandaan?**
> Bij het inloggen sla je de gebruikersdata op in de sessie. Zorg ervoor dat je in `login_process.php` ook de `role` opslaat:
>
> ```php
> $_SESSION['role'] = $user['role'];
> ```
>
> De waarde `'administrator'` moet overeenkomen met de waarde in de `role`-kolom van de `users`-tabel.

### Opdracht 2: Inputvalidatie

Vóór de query moet je controleren of het meegestuurde `id` geldig is. Voeg dit toe onder de sessiecheck:

```php
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    header('Location: tools_index.php');
    exit;
}
$id = (int) $_GET['id'];
```

Pas daarna de query aan met een prepared statement:

```php
require 'db.php';

$stmt = $conn->prepare("UPDATE tools SET deleted_at = NOW() WHERE tool_id = :id");
$result = $stmt->execute([':id' => $id]);
```

### Opdracht 3: Foutafhandeling

Voeg na de `execute()` de volgende foutafhandeling toe:

```php
if ($result) {
    header('Location: tools_index.php?deleted=success');
    exit;
} else {
    header('Location: tools_index.php?deleted=failure');
    exit;
}
```

````

### Opdracht 4: Volledige code

Hieronder de gecombineerde, correcte versie van beide bestanden:
```php
<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

if ($_SESSION['role'] !== 'administrator') {
    header('Location: tools_index.php');
    exit;
}

if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
    header('Location: tools_index.php');
    exit;
}

if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    header('Location: tools_index.php');
    exit;
}

$id = (int) $_GET['id'];

require 'db.php';

$sql = "UPDATE tools SET deleted_at = NOW() WHERE tool_id = :id";
$stmt = $conn->prepare($sql);
$result = $stmt->execute([':id' => $id]);

if ($result) {
    header('Location: tools_index.php?deleted=success');
    exit;
}

header('Location: tools_index.php?deleted=failure');
exit;
````

En `tools_index.php` moet er nu als volgt uit zien:

```php
<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}

if ($_SESSION['role'] !== 'administrator') {
    header('Location: tools_index.php');
    exit;
}

require 'db.php';

$sql = "SELECT * FROM tools JOIN brands ON brands.brand_id = tools.tool_brand WHERE tools.deleted_at IS NULL";
$stmt = $conn->prepare($sql);
$stmt->execute();
$tools = $stmt->fetchAll(PDO::FETCH_ASSOC);

require 'header.php';
?>
<main class="table">

    <?php if (isset($_GET['deleted']) && $_GET['deleted'] === 'success'): ?>
        <div class="alert-box">
            Tool is verwijderd!
        </div>
    <?php endif; ?>

    <table>
        <thead>
            <tr>
                <th>Naam</th>
                <th>Categorie</th>
                <th>Prijs</th>
                <th>Merk</th>
                <th>Acties</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($tools as $tool) : ?>
                <tr>
                    <td><?php echo htmlspecialchars($tool['tool_name']) ?></td>
                    <td><?php echo htmlspecialchars($tool['tool_category']) ?></td>
                    <td><?php echo htmlspecialchars($tool['tool_price']) ?></td>
                    <td><?php echo htmlspecialchars($tool['brand_name']) ?></td>
                    <td>
                        <a href="tools_detail.php?id=<?php echo $tool['tool_id'] ?>">Bekijk</a>
                        <a href="tools_update.php?id=<?php echo $tool['tool_id'] ?>">Wijzig</a>
                        <a href="tools_delete.php?id=<?php echo $tool['tool_id'] ?>"
                           onclick="return confirm('Weet je zeker dat je deze tool wilt verwijderen?')">
                            Verwijder
                        </a>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</main>
```

### Opdracht 5: Logboek

1. Optioneel: voeg een logboek toe dat bijhoudt wie welke tool heeft verwijderd.

```php
if ($result) {
    file_put_contents('../logs/delete.log', date('Y-m-d H:i:s') . " - Tool $id deleted by user {$_SESSION['user_id']}\n", FILE_APPEND);
}
```

> ⚠️ Zet het logbestand **niet** in de webroot (`www/`), want dan is het via de browser bereikbaar (`http://localhost/delete.log`). Gebruik een map boven de webroot, zoals `../logs/delete.log`. Maak de map `logs/` aan naast de `www/`-map.
