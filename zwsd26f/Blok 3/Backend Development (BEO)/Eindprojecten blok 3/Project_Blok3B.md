# Eindproject Blok 3B - Filters en een robuuste detailpagina (Projectweek 2)

## 📋 Projectomschrijving

Je bouwt verder op de **Boulder Base-website** die je in Blok 3A (Projectweek 1) een backend hebt gegeven. Dezelfde repository, dezelfde site - nu een stap verder. Bezoekers moeten de lessen kunnen **filteren**, en de detailpagina mag niet meer kapot gaan als iemand een verkeerd `id` in de URL zet.

Je leert in dit project niets nieuws: alles wat je nodig hebt, heb je in Hoofdstuk 1 t/m 7 al gezien. Het verschil is dat je het nu zelf toepast op een site die je al kent.

## ✅ Wat je al hebt (uit Blok 3A)

- Je eigen fork van de `boulderbase-start`-repository, met de front-end bugs opgelost
- `index.php` - overzichtspagina met de lessen uit de database
- `les-detail.php` - detailpagina van één les via `?id=...`
- `database.php` - database connectie
- `menu.php` - dynamisch menu
- Docker-omgeving en de geïmporteerde tabel `lessen` (`sql/lessen.sql`)

> Werkt iets hiervan nog niet? Maak het eerst af. Blok 3B bouwt erop verder.

## 🛠️ Wat je moet bouwen

### 1. Filter op niveau (Verplicht, Hoofdstuk 5 en 6)

Bezoekers kunnen op `index.php` kiezen welke lessen ze willen zien, op basis van de kolom `niveau`.

**Vereisten:**
- Boven de lessen-kaarten staan links, één per niveau (bekijk in PHPMyAdmin welke niveaus er in de tabel staan), bijvoorbeeld:
```html
<a href="index.php?filter=niveau&value=Beginner">Beginner</a>
```
- Een link **"Alle lessen"** (`index.php` zonder parameters) die het filter weer opheft
- Gebruik `isset($_GET['filter'])` om te bepalen welke query je uitvoert:
  - Geen filter: `SELECT * FROM lessen`
  - Wel filter: `SELECT * FROM lessen WHERE ... = '...'` (zoals in Hoofdstuk 5, Les 3)
- De kaarten blijven dezelfde HTML/CSS houden als in Blok 3A
- Style de filterlinks in de stijl van de site, inclusief `:hover`- en `:focus`-state (zoals bij je knoppen in Blok 3A)

### 2. Niet-bestaande les afvangen (Verplicht, Hoofdstuk 7)

Probeer `les-detail.php?id=9999`. Je krijgt dan geen les terug (`NULL`) en waarschijnlijk foutmeldingen.

**Vereisten:**
- Als er geen les gevonden is, toont `les-detail.php` de tekst **"Deze les bestaat niet."** en een link terug naar `index.php`
- Gebruik een `if` met `=== null`, zoals in Hoofdstuk 7, Opdracht 5
- Als de les wél bestaat, ziet de pagina er precies zo uit als in Blok 3A
- Test met een bestaand én een niet-bestaand `id`, en gebruik `var_dump()` om te zien wat je query teruggeeft

### 3. Pagina met voordelige lessen (Verplicht, Hoofdstuk 7)

Maak een nieuwe pagina `voordelig.php` die alleen de lessen toont die **minder dan 50 euro** kosten.

**Vereisten:**
- Kijk eerst in PHPMyAdmin hoe de kolom `prijs` is opgeslagen
- Gebruik je database connectie (`require 'database.php';`)
- Gebruik een `SELECT` met `WHERE` op `prijs`
- Toon de lessen met een `foreach`, met dezelfde kaarten als op `index.php`
- Voeg de pagina toe aan de array in `menu.php`, zodat hij op elke pagina in het menu staat

### 4. Uitbreiding (kies 1 van de 4)

#### A: Aantal tonen (Hoofdstuk 7)
- Laat boven de kaarten zien **hoeveel** lessen er getoond worden, zowel op `index.php` (ook als er een filter aanstaat) als op `voordelig.php`
- Gebruik `count($lessen)`

#### B: Instelbare prijsgrens (Hoofdstuk 4 en 7)
- Maak de grens van `voordelig.php` instelbaar via de URL: `voordelig.php?max=30`
- Zonder `max` in de URL blijft de grens 50 euro (gebruik `isset`)
- Toon op de pagina welke grens er nu gebruikt wordt, bijv. "Lessen onder € 30"

#### C: Statistiekenpagina (Hoofdstuk 6)
- Maak `statistieken.php` en voeg deze toe aan `menu.php`
- Toon minimaal het totaal aantal lessen met `SELECT COUNT(*) as totaal FROM lessen`, zoals in Hoofdstuk 6, Opdracht 11
- Toon ook hoeveel lessen er per niveau zijn: één `COUNT(*)`-query met een `WHERE` per niveau

#### D: Sorteren (Hoofdstuk 5, Les 4)
- Voeg op `index.php` sorteerlinks toe: minimaal **prijs laag → hoog** en **prijs hoog → laag** (`?sort=...`)
- Gebruik een `if`/`elseif` per sortering met `ORDER BY prijs ASC` of `ORDER BY prijs DESC`, zoals in Hoofdstuk 5, Les 4
- Een link **"Standaard"** zet de volgorde weer terug
- Staat er een filter aan? Dan mag sorteren dat filter weer opheffen - je hoeft filter en sortering niet te combineren

## 📁 Bestandsstructuur

```
jouw-project/
├── index.php              # Overzichtspagina + filter op niveau (aangepast)
├── les-detail.php         # Detailpagina + niet-bestaande les afvangen (aangepast)
├── voordelig.php          # Lessen onder een prijsgrens (nieuw)
├── statistieken.php       # Alleen als je uitbreiding C kiest (nieuw)
├── database.php           # Database connectie (al gemaakt)
├── menu.php               # Dynamisch menu, uitgebreid met de nieuwe pagina('s)
├── css/
│   └── style.css          # Boulder Base-styling (+ styling voor de filterlinks)
├── js/
│   └── script.js          # Boulder Base-JS (al gemaakt)
├── docker-compose.yml     # Al aanwezig in de repository
└── sql/
    └── lessen.sql         # Al geïmporteerd
```

## 🎓 Technieken uit Hoofdstuk 1 t/m 7

Je **moet** de volgende technieken gebruiken:

### Hoofdstuk 1 - Introductie PHP
- ✅ Include/require voor menu en database
- ✅ Associatieve array + foreach voor het menu (uitgebreid met nieuwe pagina's)

### Hoofdstuk 2 en 3 - Data ophalen en tonen
- ✅ SELECT query met `mysqli_query` en `mysqli_fetch_all`
- ✅ Foreach loop met database data

### Hoofdstuk 4 - Detailpagina
- ✅ `$_GET['id']` uitlezen
- ✅ SELECT WHERE voor één rij met `mysqli_fetch_assoc`

### Hoofdstuk 5 en 6 - Filters
- ✅ `isset($_GET[...])` om te controleren of er een filter in de URL staat
- ✅ SELECT WHERE met een waarde uit de URL
- ✅ `ORDER BY ... ASC/DESC` met een `if` per sortering (alleen bij uitbreiding D)

### Hoofdstuk 7 - Code lezen en debuggen
- ✅ `if ($les === null)` voor een niet-bestaand item
- ✅ `var_dump()` om te controleren wat je query teruggeeft
- ✅ SELECT WHERE met een vergelijking (`<`) op een getal

### Code Kwaliteit
- ✅ DRY-principe: menu en database in een apart bestand, niet gekopieerd
- ✅ Duidelijke variabele namen (`$lessen` voor alle lessen, `$les` voor één les)

## 🚀 Stappenplan (Projectweek 2)

Je hebt 4,5 dag (08:30-14:00, met een uur pauze). Loop je voor op schema? Kies dan nog een tweede uitbreiding.

**Dag 1 - Startklaar en filter**
1. 📝 Controleer dat `index.php`, `les-detail.php` en het menu uit Blok 3A nog werken
2. 📝 Importeer de extra lessen: het tweede `INSERT`-blok in `sql/lessen.sql`
3. 📝 Bekijk in PHPMyAdmin welke niveaus en prijzen er in `lessen` staan
4. 📝 Bouw de filterlinks en de `isset`-check op `index.php`

**Dag 2 - Filter afmaken en detailpagina**
5. 📝 Test elk filter én "Alle lessen", los fouten op met `var_dump()`
6. 📝 Vang de niet-bestaande les af in `les-detail.php`, test met `?id=9999`
7. 📝 Commit en push

**Dag 3 - Voordelige lessen**
8. 📝 Maak `voordelig.php` met een `WHERE` op `prijs`
9. 📝 Voeg `voordelig.php` toe aan `menu.php` en test het menu op alle pagina's
10. 📝 Commit en push

**Dag 4 - Uitbreiding en styling**
11. 📝 Kies je uitbreiding (A, B, C of D) en bouw die
12. 📝 Style de filterlinks en nieuwe pagina's in de stijl van Boulder Base

**Dag 5 (ochtend) - Afronden en verantwoorden**
13. 📝 Test alle pagina's en alle links, code opschonen
14. 📝 Final check met de checklist, laatste push
15. 📝 Verantwoordingsgesprek met je docent

## ✅ Checklist voor Inleveren

Geen punten of percentages - de docent loopt onderstaande checklist met je na, en je moet elk afgevinkt onderdeel kort kunnen toelichten: wat het doet, en waarom je het zo hebt opgelost. Verwacht vragen als *"waarom staat die `isset` hier?"* of *"wat gebeurt er als ik `?id=9999` invul?"*

**Functionaliteit:**
- [ ] Filterlinks op `index.php` werken voor elk niveau
- [ ] "Alle lessen" toont weer alle lessen
- [ ] `les-detail.php?id=9999` toont "Deze les bestaat niet." zonder PHP errors
- [ ] `voordelig.php` toont alleen lessen onder de prijsgrens
- [ ] De nieuwe pagina('s) staan in het menu op elke pagina
- [ ] Gekozen uitbreiding (A, B, C of D) werkt
- [ ] Geen PHP errors

**Code Kwaliteit:**
- [ ] Menu in `menu.php`, database connectie in `database.php` - niet gekopieerd
- [ ] `isset` gebruikt waar een GET-parameter kan ontbreken
- [ ] Duidelijke variabele namen
- [ ] Nette indentatie

**Behoud van het Boulder Base-design:**
- [ ] Filterlinks en nieuwe pagina's passen bij de stijl van de rest van de site
- [ ] Filterlinks hebben een `:hover`- en `:focus`-state

**Git:**
- [ ] Reguliere commits met duidelijke messages
- [ ] Code gepusht naar GitHub

## 💡 Tips

1. **Eén ding tegelijk**: maak eerst het filter werkend voordat je aan `voordelig.php` begint
2. **Kijk terug**: het filter is bijna hetzelfde als `drivers-table.php` (Hoofdstuk 5) en de Tools4Ever-filter (Hoofdstuk 6); `voordelig.php` is bijna hetzelfde als `goedkoop.php` (Hoofdstuk 7)
3. **Let op hoofdletters**: `Beginner` in de URL moet precies zo geschreven zijn als in de database
4. **var_dump()**: zet `var_dump($_GET);` bovenaan je pagina om te zien wat er in de URL meekomt
5. **AI mag**, maar je moet elke regel aan je docent kunnen uitleggen

## 📚 Referenties

- **Hoofdstuk 4**: detailpagina, `$_GET['id']`, SELECT WHERE
- **Hoofdstuk 5, Les 3**: filter met `?filter=...&value=...`
- **Hoofdstuk 5, Les 4**: sorteren met `?sort=...` en `ORDER BY`
- **Hoofdstuk 6**: filter op tool brand, statistieken met `COUNT(*)`
- **Hoofdstuk 7**: Opdracht 5 (niet-bestaand item afvangen), Opdracht 6 en 7 (`goedkoop.php`, `count()`, `?max=`)

## 📅 Deadline

**Inleverdatum**: Zie planning van je docent

**Inleveren via**: Submit je project in GitHub
