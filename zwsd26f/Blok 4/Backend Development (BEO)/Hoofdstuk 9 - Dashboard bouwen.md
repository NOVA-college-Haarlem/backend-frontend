# Hoofdstuk 9 - Dashboard bouwen

De eigenaar van De Smaakmakers wil in één oogopslag zien hoe het gaat: hoeveel inschrijvingen, hoeveel omzet, welke workshops vol zijn. Je bouwt een **dashboard**: één pagina met kerncijfers uit de database.

## Leerdoelen

Na dit hoofdstuk kun je:
- Kerncijfers ophalen met `COUNT`, `SUM` en `MIN`/`MAX`
- Rekenen over twee tabellen met een `JOIN`
- Groeperen met `GROUP BY`
- De "beste" rij vinden met `ORDER BY ... LIMIT 1`
- Resultaten overzichtelijk tonen in kaarten en een tabel

**AI-gebruik:** bij de vragen (Onderzoek) **geen AI**. Bij de opdrachten mag AI, maar je moet elke regel kunnen uitleggen.

---

### Opdracht 1 - Tellen en optellen in phpMyAdmin

Voer uit en bekijk het resultaat:
```sql
SELECT COUNT(*) FROM inschrijvingen;
SELECT SUM(aantal) FROM inschrijvingen;
SELECT MIN(prijs), MAX(prijs) FROM workshops;
SELECT COUNT(*) FROM workshops WHERE plekken = 0;
```

**Onderzoek:**
- Wat is het verschil tussen `COUNT(*)` en `SUM(aantal)` bij de inschrijvingen? Welke is het aantal deelnemers?
- Hoeveel rijen geeft elke query terug?

### Opdracht 2 - De pagina

Maak `dashboard.php`, alleen voor admin. Zet een link op `account.php`.

Bijna elke kaart haalt **één getal** op. In plaats van steeds dezelfde drie regels, schrijf je één functie (zoals in JS Hoofdstuk 1: een functie die iets teruggeeft):
```php
<?php
require 'admin_check.php';
require 'database.php';

function haalGetal($conn, $sql) {
    $result = mysqli_query($conn, $sql);
    $rij = mysqli_fetch_row($result);
    return $rij[0] ?? 0;
}

$aantalInschrijvingen = haalGetal($conn, "SELECT COUNT(*) FROM inschrijvingen");

$paginatitel = 'Dashboard';
require 'header.php';
?>

<h1>Dashboard</h1>

<div class="kaarten">
    <div class="kaart">
        <h2>Inschrijvingen</h2>
        <p class="waarde"><?php echo $aantalInschrijvingen; ?></p>
    </div>
</div>

<?php require 'footer.php'; ?>
```

**Onderzoek:**
- `mysqli_fetch_row` geeft een array zonder sleutels. Waarom is `[0]` hier genoeg?
- Waarom `?? 0`?
- Waarom hier geen `?` in de queries?

Voeg de CSS toe (je kent flexbox uit FEO):
```css
.kaarten {
    display: flex;
    flex-wrap: wrap;
    gap: var(--ruimte);
    margin-bottom: var(--ruimte);
}

.kaart {
    flex: 1 1 200px;
    background-color: white;
    padding: var(--ruimte);
    border-radius: 8px;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.waarde {
    font-size: 32px;
    font-weight: bold;
    color: var(--kleur-primair);
}
```

### Opdracht 3 - Meer kaarten

Maak met `haalGetal` deze kaarten:
1. Aantal workshops
2. Totaal aantal deelnemers
3. Volle workshops
4. Klanten met een account (tabel `gebruikers`, rol `klant`)

### Opdracht 4 - Verwachte omzet: rekenen over een JOIN

De omzet is per inschrijving: aantal personen × prijs van de workshop. De prijs staat in een andere tabel.
```sql
SELECT SUM(inschrijvingen.aantal * workshops.prijs)
FROM inschrijvingen
JOIN workshops ON inschrijvingen.workshop_id = workshops.id
```
- Voer de query eerst uit **zonder** `SUM`, met `inschrijvingen.aantal * workshops.prijs` als kolom. Wat zie je per rij?
- Toon de omzet als bedrag: `€ <?php echo number_format($omzet, 2, ',', '.'); ?>`

> **Let op:** de prijs komt uit de tabel `workshops`, niet uit de tabel `inschrijvingen`. Klopt dit bedrag nog als een workshop later duurder wordt? Wat zou een echte webshop anders doen? (Bespreek het met je buurman; je hoeft het niet te bouwen.)

### Opdracht 5 - Per categorie: GROUP BY

Een totaal is handig, maar de eigenaar wil weten **welke soort** workshops het goed doen.
```sql
SELECT workshops.categorie,
       COUNT(inschrijvingen.id) AS inschrijvingen,
       COALESCE(SUM(inschrijvingen.aantal), 0) AS deelnemers,
       COALESCE(SUM(inschrijvingen.aantal * workshops.prijs), 0) AS omzet
FROM workshops
LEFT JOIN inschrijvingen ON inschrijvingen.workshop_id = workshops.id
GROUP BY workshops.categorie
ORDER BY omzet DESC
```

**Onderzoek:**
- Haal `GROUP BY` weg. Wat krijg je dan?
- `GROUP BY workshops.categorie` maakt van alle rijen met dezelfde categorie één groep. `COUNT` en `SUM` rekenen dan per groep. Hoeveel rijen krijg je terug?
- Waarom `LEFT JOIN`? Welke categorie zou je missen met een gewone `JOIN` als er een categorie zonder inschrijvingen was? (Hoofdstuk 6, Opdracht 5)
- Wat doet `COALESCE(..., 0)`? Probeer het zonder.

Toon het resultaat in een tabel onder de kaarten (`mysqli_fetch_all` en `foreach`).

### Opdracht 6 - De populairste workshop

```sql
SELECT workshops.titel, SUM(inschrijvingen.aantal) AS deelnemers
FROM inschrijvingen
JOIN workshops ON inschrijvingen.workshop_id = workshops.id
GROUP BY workshops.id, workshops.titel
ORDER BY deelnemers DESC
LIMIT 1
```
- Wat doet `LIMIT 1`? Wat zie je zonder?
- Toon het op het dashboard: "Populairste workshop: Sushi voor beginners (10 deelnemers)".

### Opdracht 7 - Zelf bedenken

Bedenk zelf één kaart of tabel die de eigenaar zou willen zien, en bouw hem. Bijvoorbeeld:
- Het aantal vegetarische en veganistische deelnemers (handig voor de inkoop)
- De workshop met de minste vrije plekken die nog niet vol is
- Het aantal inschrijvingen van de afgelopen 7 dagen (`aangemaakt_op >= NOW() - INTERVAL 7 DAY`)
- Het aantal workshops dat nog moet komen (`datum >= CURDATE()`)

### Huiswerk

1. Het dashboard toont minstens 6 kaarten, de tabel per categorie en de populairste workshop
2. Het dashboard is alleen bereikbaar voor admin, en ziet er op mobiel goed uit
3. Schrijf je in via de website en ververs het dashboard. Veranderen de cijfers?
4. Leg uit wat `GROUP BY` doet, met een voorbeeld uit je eigen dashboard
