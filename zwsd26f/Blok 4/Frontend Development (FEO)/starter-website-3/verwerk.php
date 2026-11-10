<?php
// Verwerkt het inschrijfformulier.
// Let op: deze pagina controleert NIETS. Alles wat binnenkomt wordt geloofd.
// Dat los je op in JS Hoofdstuk 5 (server-side validatie).

$naam     = $_POST['naam'] ?? '';
$email    = $_POST['email'] ?? '';
$workshop = $_POST['workshop'] ?? '';
$aantal   = $_POST['aantal'] ?? '';
$prijs    = $_POST['prijs'] ?? '';

$totaal = (float) $prijs * (int) $aantal;
?>
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inschrijving ontvangen - De Smaakmakers</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<main class="container">
    <h1>Bedankt voor je inschrijving!</h1>
    <p>Naam: <?php echo htmlspecialchars($naam); ?></p>
    <p>E-mail: <?php echo htmlspecialchars($email); ?></p>
    <p>Workshop: <?php echo htmlspecialchars($workshop); ?></p>
    <p>Aantal personen: <?php echo htmlspecialchars($aantal); ?></p>
    <p>Totaal te betalen: € <?php echo number_format($totaal, 2, ',', '.'); ?></p>
    <p><a href="index.html" class="knop">Terug</a></p>
</main>
</body>
</html>
