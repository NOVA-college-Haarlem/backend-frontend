# Blok 5 - Hoofdstuk 1 - PDO en Prepared statements

## Inhoudsopgave

- [Leerdoelen](#leerdoelen)
- [Wat weet je nog?](#wat-weet-je-nog)
- [C.R.U.D.](#crud)
  - [Create](#create)
  - [Read](#read)
  - [Delete](#delete)
  - [Update](#update)
- [SQL INJECTIONS](#sql-injections)
  - [Opdracht 0: Project setup](#opdracht-0-project-setup)
  - [Opdracht 0.1 - Database](#opdracht-01---database)
  - [Opdracht 1: SQL-injectie](#opdracht-1-sql-injectie)
- [PREPARED STATEMENTS](#prepared-statements)
  - [Opdracht 2: Database connectie aanpassen](#opdracht-2-database-connectie-aanpassen)
  - [Opdracht 3: Query aanpassen — index.php](#opdracht-3-query-aanpassen--indexphp)
  - [Opdracht 4: Query aanpassen — tool_detail.php](#opdracht-4-query-aanpassen--tool_detailphp)
  - [Opdracht 5: Alle queries aanpassen](#opdracht-5-alle-queries-aanpassen)

Welkom terug.

Wij gaan starten met het project Tools4ever. We gaan een bestaand project verder uitbouwen en veiliger programmeren door gebruik te maken van prepared statements, zodat SQL-injecties niet meer mogelijk zijn.
Je hebt tot dusver de volgende technieken toegepast met betrekking tot Create Read Update Delete (CRUD): create en read.

## Leerdoelen

Na dit hoofdstuk kun je:

- Uitleggen wat een SQL-injectie is en hoe die werkt
- Een PDO-databaseverbinding opzetten in PHP
- Prepared statements gebruiken voor SELECT, INSERT, UPDATE en DELETE
- Basisvalidatie toepassen op GET-parameters met `isset()` en `is_numeric()`

## Wat weet je nog?

_Bespreek klassikaal — max. 10 minuten._

Laat de onderstaande code zien op het scherm en stel de vragen aan de klas:

```php
<?php
$conn = mysqli_connect('localhost', 'root', '', 'tools4ever');

$id = $_GET['id'];
$sql = "SELECT * FROM tools WHERE tool_id = $id";
$result = mysqli_query($conn, $sql);
$tool = mysqli_fetch_assoc($result);
?>
```

**Vragen aan de klas:**

1. Wat doet deze code? Leg elke regel uit.
2. Waar komt de waarde van `$id` vandaan? Wie bepaalt die waarde?
3. Hoe zouden we dit veiliger kunnen maken?

## C.R.U.D.

### Create

Met een POST-formulier kun je data bevragen aan de gebruiker. Daarbij controleer je de ingevoerde data om uiteindelijk met INSERT INTO data op te slaan in de database.

### Read

Met SELECT-query vraag je data op door gebruik te maken van een GET request en associatieve arrays kun je dynamisch data tonen op het scherm.

> **Dit blok gaan we het project uitbreiden met Delete en Update.**

### Delete

De delete query gebruiken we om een enkele rij uit de database te verwijderen op basis van de primary key van diezelfde rij. We gebruiken hiervoor een GET-request. Dit werkt bijna hetzelfde als het benaderen van een detail-pagina.

### Update

Met de Update query kunnen we bestaande records (rijen) wijzigen naar de correcte informatie. Hiervoor gebruiken we ten eerste een GET-request in combinatie met een SELECT WHERE statement om de juiste data op te halen (detail-pagina-techniek). En ten tweede gebruiken we een POST-request in combinatie met de UPDATE WHERE query om het gewenste resultaat te behalen.

We gaan tijdens dit blok met het project Tools4ever aan de slag. Dit project kun je forken en clonen vanaf GitHub: https://github.com/NOVA-college-Haarlem/toolsforever-blok4

In de vorige twee periodes hebben we gebruik gemaakt van eenvoudige functies om de queries uit te voeren. Echter zijn deze functies niet veilig genoeg. Deze manier van coderen met PHP kan leiden tot SQL-injecties met grote negatieve gevolgen. Dit jaar introduceren we een andere wijze van connectie maken met de database en daardoor een iets andere schrijfwijze. We gaan gebruik maken van een object binnen php genaamd pdo.
Om het probleem met sql injecties te demonstreren volgt hieronder een korte toelichting

## SQL INJECTIONS

Je hebt in het vorige blok geleerd om een SQL-statement in een variabele te zetten en deze variabele aan de functie `mysqli_query()` mee te geven:

```php
<?php
$sql = "SELECT * FROM tools";
$result = mysqli_query($conn, $sql);
?>
```

Daarnaast heb je ook geleerd om een variabele te plaatsen in de string als je bijvoorbeeld één tool wilt ophalen:

```php
<?php
$id = $_GET['id'];
$sql = "SELECT * FROM tools WHERE tool_id = $id";
$result = mysqli_query($conn, $sql);
?>
```

Een variabele direct plaatsen in een SQL-statement is gevaarlijk. Het kan namelijk misbruikt worden. Een aanvaller kan de invoer zo aanpassen dat er andere gegevens opgehaald of verwijderd worden, of zelfs de hele database gewist wordt. Dit heet een **SQL-injectie**. Eerst volgt een uitleg over hoe je een SQL-injectie uitvoert. Daarna leer je hoe je je code beveiligt met prepared statements.

### Opdracht 0: Project setup

1. Fork de repository [https://github.com/NOVA-college-Haarlem/toolsforever-blok4](https://github.com/NOVA-college-Haarlem/toolsforever-blok4).
2. Clone de repository naar je projecten map (C:\projecten) `git clone https://github.com/NOVA-college-Haarlem/toolsforever-blok4.git`
3. Open het project in VS Code.
4. Open de terminal in VS Code en type `docker compose up -d` in.

### Opdracht 0.1 - Database

1. Ga in de browser naar `http://localhost:8000`
2. Importeer de bestanden uit de map `sql/opdracht 0` in de database.
   - brands.sql
   - tools.sql
   - user_settings.sql
   - users.sql
3. Controleer of de database correct is ingevoegd.
4. Ga in de browser naar `http://localhost` en bekijk de website.

### Opdracht 1: SQL-injectie

1. Log in met de volgende gegevens:
   - Email: `admin@admin.com`
   - Wachtwoord: `admin`

   Wat zie je? Je wordt via een redirect naar de dashboardpagina gestuurd.

2. Log uit.
3. Open phpMyAdmin (`http://localhost:8000`) en ga naar het tabblad **SQL**.
4. Voer de volgende query uit en bekijk het resultaat:

   ```sql
   SELECT * FROM users WHERE email = '' OR 1=1;
   ```

   Wat geeft de database terug? Hoeveel rijen zie je?

   > **Bespreek klassikaal:** De voorwaarde `1=1` is altijd waar. De database geeft daardoor álle gebruikers terug — zonder dat er een geldig e-mailadres of wachtwoord nodig is.

5. Ga nu terug naar het inlogscherm van de website en vul bij het e-mailadres het volgende in:

   `' or 1=1;#`

   Vul bij wachtwoord iets willekeurigs in en klik op inloggen.

   Lukt het in te loggen? Je hebt zojuist je eigen applicatie gehackt.

**Wat gebeurt er precies?**

- De query `1=1` is altijd waar (TRUE), waardoor de WHERE-voorwaarde altijd klopt
- Het `#` teken zorgt ervoor dat alles na dit teken als commentaar wordt gezien en genegeerd
- De database retourneert nu waarschijnlijk de eerste gebruiker uit de tabel (meestal de admin)
- Je kunt nu inloggen zonder het juiste wachtwoord te kennen!

**Waarom is dit gevaarlijk?**
Dit doe je dus allemaal op de client side, in het formulier. Dit betekent dat ook andere mensen dit kunnen uitvoeren. Dit betekent dat dit een onveilige applicatie is. Een aanvaller kan:

- Inloggen zonder geldige credentials
- Toegang krijgen tot gevoelige gegevens
- Mogelijk de hele database manipuleren of verwijderen

**Andere voorbeelden van SQL-injectie:**

- `' OR '1'='1` - Vergelijkbaar met bovenstaand voorbeeld
- `admin'--` - Logt in als admin (alles na -- wordt genegeerd)
- `' UNION SELECT * FROM users--` - Haalt alle gebruikersgegevens op

Om dit te voorkomen dien je gebruik te maken van **prepared statements**, zoals we in de volgende sectie zullen leren.

## PREPARED STATEMENTS

Met prepared statements stoppen we geen variabelen in een string. We werken met tijdelijke placeholders.

**Waarom werkt dit veilig?**
Bij een prepared statement stuurt PHP de SQL-structuur en de data als twee aparte berichten naar de database. De database verwerkt eerst de structuur en weet daarna precies wat data is en wat SQL-code is. Een ingevoerde waarde zoals `' or 1=1;#` wordt dan behandeld als gewone tekst — niet als SQL-commando. Injecteren is daardoor onmogelijk.

### Opdracht 2: Database connectie aanpassen

Maar eerst maken we een database connectie. Dit gaat op een andere wijze, we maken nu gebruik van PDO (een ander type databaseconnectie):

```php
<?php
$dbhost = 'localhost';
$dbname = 'tools4ever';
$dbuser = 'root';
$dbpass = '';
$conn = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);
?>
```

In onderstaande code willen we een gereedschap opslaan, daarvoor gebruiken we INSERT INTO. Maar nu stoppen we geen variabelen bij VALUES maar placeholders. Let op de dubbele punten. Tevens gebruiken we de Prepare methode. Kortom, we bereiden de query eerst voor, voordat deze naar de database gestuurd wordt.

```php
<?php
$stmt = $conn->prepare("INSERT INTO tools (tool_name, tool_category, tool_price, tool_brand) VALUES (:tool_name, :tool_category, :tool_price, :tool_brand)");

$stmt->execute(['tool_name' => 'Hamer 2000', 'tool_category' => 'Hamers', 'tool_price' => '100', 'tool_brand' => 'Makita']);
?>
```

> VANAF NU gebruiken we alleen nog maar prepared statements om data op te halen, op te slaan, te verwerken en te verwijderen.

### Opdracht 3: Query aanpassen — index.php

1. Op `index.php` passen we de query aan:

```php
<?php
$stmt = $conn->prepare("SELECT * FROM tools");
$stmt->execute();
$tools = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
```

> Let op de fetchAll methode voor het ophalen van alle data.

### Opdracht 4: Query aanpassen — tool_detail.php

1. Pas de query aan die één tool ophaalt in `tool_detail.php`. Gebruik een placeholder voor het id.
2. Voer de `execute()`-methode uit om de query te versturen.

> Let op: controleer altijd of de `$_GET`-parameter bestaat en een geldig getal is voordat je de query uitvoert.

Dit doe je zo:

```php
<?php
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    // id ontbreekt of is geen getal — stuur terug naar de lijst
    header('Location: index.php');
    exit;
}

$id = $_GET['id'];
$stmt = $conn->prepare("SELECT * FROM tools WHERE tool_id = :id");
$stmt->execute(['id' => $id]);
$tool = $stmt->fetch(PDO::FETCH_ASSOC);
?>
```

> Let op de `fetch()`-methode voor het ophalen van één rij data.

### Opdracht 5: Alle queries aanpassen

1. Bekijk de volledige applicatie van Tools4ever.
2. Pas op alle pagina's waar databasequeries staan de code aan naar PDO met prepared statements:
   - `brands_index.php` — gebruik `fetchAll()` voor de lijst
   - `login-process.php` — let op: er staat per ongeluk een dubbele databaseverbinding in dit bestand. Verwijder de overtollige verbinding. Gebruik `fetch()` voor één gebruiker.
   - `users_index.php` — gebruik `fetchAll()` voor de lijst
   - `tools_index.php` — gebruik `fetchAll()` voor de lijst
3. Er zit een bug in de logincode waardoor inloggen als admin niet werkt. Zoek de bug door:
   - De SQL-query in `login-process.php` te lezen
   - Te controleren welke kolomnaam gebruikt wordt voor het wachtwoord (check de tabelstructuur in phpMyAdmin)
   - Te controleren of de vergelijking van het wachtwoord correct is
