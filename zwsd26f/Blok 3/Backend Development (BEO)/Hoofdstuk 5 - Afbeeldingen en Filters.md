# Hoofdstuk 5 - Afbeeldingen, Filters en Sorteren

## Les 1 - Herhaling

We gaan nu hetzelfde doen als in de vorige les. We gaan nu de data van de circuits tonen. Vorige week hebben we een overzicht gemaakt van teams. We gaan nu de data van de circuits tonen.

### Opdracht 1

1. Voeg data van circuits toe aan de database.
2. Gebruik het bestand `circuits.sql` in de assets folder.
3. Importeer de data in de database via het tabblad SQL in PHPMyAdmin.

### Opdracht 2

1. Maak een nieuw bestand aan genaamd `circuits.php`
2. Voeg de volgende code toe:
```php
<?php

$query = "SELECT * FROM circuits";
$result = mysqli_query($conn, $query);
$circuits = mysqli_fetch_all($result, MYSQLI_ASSOC);
var_dump($circuits);
?>
```
3. Test je code in de browser.
4. De data van de circuits wordt nu getoond in de circuits pagina.

### Opdracht 3

1. Pas het bestand `circuits.php` aan zodat de data van de circuits wordt getoond in een tabel.

### Opdracht 4
1. We gaan nu een link toevoegen naar de detail pagina van de circuits.
2. Voeg de volgende code toe:
```html
<a href="circuit-detail.php?id=<?php echo $circuit['circuitId'] ?>" class="text-blue-500 hover:underline">View Profile</a>
```
3. Test je code in de browser.
4. De link naar de detail pagina van de circuits werkt nu.
5. De detail pagina van de circuits werkt nog niet. Maak een nieuw bestand aan genaamd `circuit-detail.php`.
6. We gaan nu de detail pagina van de circuits maken.
7. Voeg de volgende code toe:
```php
<?php
$circuitId = $_GET['id'];
$query = "SELECT * FROM circuits WHERE circuitId = $circuitId";
$result = mysqli_query($conn, $query);
$circuit = mysqli_fetch_assoc($result);
?>
```

### Opdracht 5

1. Pas het bestand `circuit-detail.php` aan zodat de data netjes wordt getoond zoals de rest van de pagina's.


## Les 2 - Images in PHP

In deze les gaan we images toevoegen aan onze applicatie.
We gaan gebruik maken van de `images` folder in de root van de project.

### Opdracht 1

1. We voegen een kolom toe aan de drivers tabel. Deze kolom heet `image`.
2. Je kunt dit op twee manieren doen:
    - Via PHPMyAdmin en de GUI
    - Via het tabblad SQL
3. Voer de volgende code uit:
```sql
ALTER TABLE drivers ADD COLUMN image VARCHAR(255) NULL;
```

### Opdracht 2

1. Zoek nu op internet voor een image van een driver en voeg deze toe aan de `images` folder in de root van de project.
2. Voeg de naam van de image toe aan de drivers tabel.
3. Echo de naam van de image in de driver-profile.php pagina.
4. Test je code in de browser.
5. De image wordt nu getoond in de driver-profile.php pagina.

### Opdracht 3

1. We doen nu hetzelfde voor de teams tabel.
2. Zoek op internet voor een image van een team en voeg deze toe aan de `images` folder in de root van de project.
3. Voeg de kolom `image` toe aan de teams tabel.
```sql
ALTER TABLE constructors ADD COLUMN image VARCHAR(255) NULL;
```
4. Voer de naam van de afbeelding toe aan de teams tabel.
5. Echo de naam van de image in de team-profile.php pagina.
6. Test je code in de browser.
7. De image wordt nu getoond in de team-profile.php pagina.

### Opdracht 4

1. We doen nu hetzelfde voor de circuits tabel.
2. Zoek op internet voor een image van een circuit en voeg deze toe aan de `images` folder in de root van de project.
3. Voeg de kolom `image` toe aan de circuits tabel.
```sql
ALTER TABLE circuits ADD COLUMN image VARCHAR(255) NULL;
```
1. Voer de naam van de afbeelding toe aan de circuits tabel.
2. Echo de naam van de image in the circuit-detail.php pagina.
3. Test je code in de browser.
4. De image wordt nu getoond in the circuit-detail.php pagina.

### Opdracht 5.

1. Aangezien we heel veel drivers hebben is dit een hele omslachtige wijze om afbeeldingen toe te voegen.
2. We gaan het nu op een andere manier doen. We gaan gebruik maken van een API.
3. Wat is een API?
4. Een API is een interface die gebruikt wordt om data te verkrijgen van een server.
5. Wij maken gebruik van de API van Wikipedia.
6. In de assets folder staat een nieuw bestand genaamd `api.php`.
7. Open het bestand `api.php` en bestudeer de code.
8. Dit bestand hebben we nodig in de driver-profile.php pagina. Hiervoor gebruiken we `include`.
9. In `driver-profile.php` kunnen we nu - nadat we de `$driver` hebben opgehaald - de bijbehorende foto ophalen via de api:
```php
$driverData = fetchWikipediaPhoto($driver['forename'] . ' ' . $driver['surname']);
$image = isset($driverData['photo_url']) ? $driverData['photo_url'] : '';
```
10. Gebruik nu de `$image`-variabele om de afbeelding te tonen.

## Les 3 - Filter

We gaan op de pagina drivers-table.php een filter toevoegen. We beperken ons met een GET request

### Opdracht 1

1. We gaan een filter toevoegen op de pagina drivers-table.php.
2. Voeg de volgende code toe:
```php
<?php
if(isset($_GET['filter'])){
    $filter = $_GET['filter'];
}
?>
```

### Opdracht 2

1. Zoals je eerder geleerd hebt, kunnen we een GET-array vullen met data uit de URL.
2. We voegne de volgende link toe aan de drivers-table.php pagina:
```html
<a href="drivers-table.php?filter=nationality&value=Dutch" class="text-blue-500 hover:underline">Dutch</a>
```
3. We gaan nu de code aanpassen zodat de gebruiker op drivers kan filteren.
4. Voeg de volgende code toe aan de drivers-table.php pagina:
```php
<?php
//toevoegen aan de if-statement
$filter = $_GET['filter'];
$value = $_GET['value'];
$query = "SELECT * FROM drivers WHERE $filter = '$value'";
$result = mysqli_query($conn, $query);
$drivers = mysqli_fetch_all($result, MYSQLI_ASSOC);
?>
```

### Opdracht 3

1. Maak zelf nog twee filters aan. Bijvoorbeeld voor de teams en de circuits.




## Les 4 - Sorteren

Met een filter bepaal je **welke** rijen je ziet. Met sorteren bepaal je **in welke volgorde** je ze ziet. Dat doe je in SQL met `ORDER BY`.

```sql
SELECT * FROM drivers ORDER BY surname ASC
```

- `ORDER BY surname` - sorteer op de kolom `surname`
- `ASC` - oplopend: A → Z, klein → groot, oud → nieuw (dit is de standaard)
- `DESC` - aflopend: Z → A, groot → klein, nieuw → oud

`ORDER BY` staat altijd **achteraan** in de query, dus ook ná een `WHERE`:

```sql
SELECT * FROM drivers WHERE nationality = 'Dutch' ORDER BY surname ASC
```

### Opdracht 0: Geboortedatum omzetten naar een echte datum

In de tabel `drivers` staat de geboortedatum (`dob`) als **tekst**, bijvoorbeeld `07/01/1985` (dag/maand/jaar). Tekst wordt teken voor teken gesorteerd, dus eigenlijk op de **dag**: `01/12/1999` komt dan vóór `07/01/1985`. Om goed op leeftijd te kunnen sorteren, zetten we de kolom eerst om naar het type `DATE`.

1. Kijk in PHPMyAdmin naar de tabel `drivers`, tabblad **Structuur**. Welk type heeft de kolom `dob`?
2. Ga naar het tabblad **SQL** van de database `formula1` en voer de volgende code uit:
```sql
-- 1. Datums als 07/01/1985 (dag/maand/jaar) omzetten naar 1985-01-07
UPDATE drivers SET dob = DATE_FORMAT(STR_TO_DATE(dob, '%d/%m/%Y'), '%Y-%m-%d') WHERE dob LIKE '__/__/____';
-- 2. Lege datums leegmaken (NULL)
UPDATE drivers SET dob = NULL WHERE dob LIKE '';
-- 3. De kolom omzetten van tekst naar een echte datum
ALTER TABLE drivers MODIFY dob DATE NULL;
```
3. Kijk opnieuw bij **Structuur**: `dob` heeft nu het type `date`.
4. Bekijk je driver-pagina's in de browser. De geboortedatum staat nu als `1985-01-07` (jaar-maand-dag) - zo slaat een database een datum op.

> Je hoeft dit script maar **één keer** uit te voeren. Doe je het per ongeluk nog een keer, dan is dat niet erg: alle datums zijn dan al omgezet en er verandert niets meer.

### Opdracht 1

1. Open `drivers-table.php`.
2. Pas de query aan zodat de drivers op achternaam gesorteerd worden:
```php
$query = "SELECT * FROM drivers ORDER BY surname ASC";
```
3. Test je code in de browser. Staan de drivers nu op alfabet?
4. Verander `ASC` in `DESC`. Wat zie je nu?
5. Sorteer op geboortedatum (`dob`). Wie staat er bovenaan bij `ASC`: de oudste of de jongste driver?

### Opdracht 2

De bezoeker moet zelf kunnen kiezen hoe er gesorteerd wordt. Net als bij het filter gebruiken we daarvoor de URL.

1. Voeg boven de tabel in `drivers-table.php` de volgende links toe:
```html
<a href="drivers-table.php?sort=naam" class="text-blue-500 hover:underline">Naam (A-Z)</a>
<a href="drivers-table.php?sort=leeftijd" class="text-blue-500 hover:underline">Oudste eerst</a>
```
2. Vervang de query bovenaan `drivers-table.php` door deze code:
```php
<?php
if (isset($_GET['sort']) && $_GET['sort'] == 'naam') {
    $query = "SELECT * FROM drivers ORDER BY surname ASC";
} elseif (isset($_GET['sort']) && $_GET['sort'] == 'leeftijd') {
    $query = "SELECT * FROM drivers ORDER BY dob ASC";
} else {
    $query = "SELECT * FROM drivers";
}
$result = mysqli_query($conn, $query);
$drivers = mysqli_fetch_all($result, MYSQLI_ASSOC);
?>
```
3. Test beide links in de browser. Kijk ook naar de URL.
4. Typ zelf `drivers-table.php?sort=hallo` in de adresbalk. Wat gebeurt er, en waarom?

> **Waarom een `if` per sortering?** Je zou ook `ORDER BY $sort` kunnen schrijven, maar dan komt alles wat iemand in de URL typt rechtstreeks in je query terecht. Met een `if` per sortering bepaal jij welke queries er bestaan. Wat er ook in de URL staat: er draait altijd een query die jij geschreven hebt.

### Opdracht 3

1. Voeg twee sorteringen toe aan `drivers-table.php`:
    - `Naam (Z-A)` met `?sort=naam-za`
    - `Jongste eerst` met `?sort=jongste`
2. Je hebt hiervoor een extra `elseif` per sortering nodig. Welk woord verander je in de query?
3. Voeg ook een link **"Standaard"** toe (`drivers-table.php` zonder `?sort=`).

### Opdracht 4

1. Maak zelf een sortering op de pagina met teams of circuits. Kies zelf op welke kolom (kijk in PHPMyAdmin welke kolommen er zijn).
2. **Extra:** combineer je filter met sorteren. Zet `ORDER BY` achter de `WHERE` uit Les 3, zodat de Nederlandse drivers op achternaam staan.
