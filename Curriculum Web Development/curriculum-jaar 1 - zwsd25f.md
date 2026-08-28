# Curriculum Web Development - Jaar 1 (zwsd25f)

**Opleiding:** MBO niveau 4, Software Development
**Klas:** zwsd25f
**Scope:** Blok 1 t/m Blok 4 (jaar 1) - dit document dekt alleen Blok 3 en 4, zie Openstaande punten
**Bron:** `zwsd25f`

> Dit document staat **los van het curriculum van de overige klassen** (zie `curriculum-jaar 1.md` voor zwsd26ab en `curriculum-jaar 1 - zwsd26f.md` voor zwsd26f). zwsd25f is een ouder cohort met een eigen lesgeschiedenis en eigen materiaal.

---

## 1. Blokoverzicht

| Blok | Status | Frontend | Backend |
|---|---|---|---|
| **1** | *geen materiaal in deze repo* | - | - |
| **2** | *geen materiaal in deze repo* | - | - |
| **3** | Uitgewerkt (deels) | CSS-selectoren & Flexbox - **materiaal onvolledig/inconsistent**, zie let op hieronder | PHP & SQL introductie t/m detailpagina's + eindproject |
| **4** | Uitgewerkt | *geen apart FEO-materiaal dit blok* | CRUD, login/registratie, JOINS, zoeken, dashboard + eindprojecten |

**Let op - ontbrekende Blok 1-2:** deze repo bevat geen lesmateriaal voor Blok 1 en 2 van zwsd25f. Dit cohort is verder in de opleiding dan zwsd26ab/zwsd26f, en de eerste twee blokken zijn vermoedelijk elders gegeven of niet gemigreerd naar deze repo. Neem aan dat de basis (HTML, CSS, PHP-fundamentals) aanwezig is bij aanvang van Blok 3, maar dit document kan daar geen leeruitkomsten over geven.

**Let op - Blok 3 Frontend Development is inconsistent:** de map `blok 3/frontend development (feo)/` bevat alleen Week 1, Week 5 en Week 6 (geen Week 2-4), en de inhoud van Week 1 lijkt afkomstig uit een ander lesprogramma (de kop in het bestand verwijst naar "Blok 2" en Flexbox-introductie, niet naar wat je bij "Blok 3 Week 1" zou verwachten). De `Samenvatting.md` in dezelfde map geeft wel een consistente, cumulatieve bullet-lijst en is hieronder als leidend genomen. Behandel de Blok 3 FEO-leeruitkomsten in dit document daarom als **indicatief, niet volledig geverifieerd**.

**Vanaf Blok 4 geen aparte FEO-map meer:** vanaf Blok 4 is er geen losse "Frontend Development"-map meer - het onderwijs is volledig geïntegreerd in PHP-projecten (HTML wordt binnen de PHP-bestanden gestyled, geen apart CSS-curriculum meer zichtbaar in deze repo).

---

## 2. Blok 3 - PHP & SQL Introductie (Backend) + CSS-selectoren/Flexbox (Frontend, indicatief)

**Duur:** 4 weken les + 1 projectweek (Backend); Frontend-weekindeling onduidelijk (zie let op hierboven)
**Projecten:** "Mijn Eerste Project" (repo `mijn-eerste-project`) en "Formula 1" (repo `formula1-2526`)

### Backend Development (BEO)

| Week | Onderwerp | Leeruitkomsten |
|---|---|---|
| 1 | PHP & SQL Introductie | PHP als server-side taal vs. HTML; SQL als databasetaal; request/response cycle; webserver-setup; Docker + Git; HTML→PHP conversie; DRY-principe (herbruikbaar `menu.php`); dynamisch menu met arrays; `foreach` over associatieve arrays |
| 2 | Database & Dynamic Content | `foreach`-loops; MySQLi databaseconnectie; `SELECT`-queries uitvoeren; dynamische content tonen; phpMyAdmin; praktijkproject (Pokémon-catalogus) met database-gedreven grid-layout |
| 3 | Advanced PHP & Formula 1 Project | Nieuw project opzetten (Formula 1); SQL-databases importeren; complexere array-structuren; dynamische tabellen; modulaire bestandsstructuur (navbar-component); driver-tabel gevoed vanuit de database |
| 4 | Detailpagina's & Navigation | Detailpagina's bouwen; GET-parameters; dynamische `WHERE`-queries; navigatie van overzicht naar detail; data filteren op basis van URL-parameters |

**Eindresultaat Blok 3 (Backend):** dynamische PHP-websites bouwen met een database, data ophalen en tonen, modulaire/DRY code schrijven, Git en Docker gebruiken, en een request/response-cyclus begrijpen.

### Frontend Development (FEO) - indicatief

Op basis van `Samenvatting.md` (cumulatief, dekt vermoedelijk ook eerdere blokken):
- CSS-selectoren: descendant, child, adjacent sibling, multiple selectors
- Navigatie: horizontaal, verticaal, footer-links
- Layout basics: centreren, float, inline-block, 2-kolom layout
- Box-shadow & border-radius voor moderne uitstraling
- Hover-effecten met smooth transitions
- Flexbox: container-properties (`display`, `flex-direction`, `justify-content`, `align-items`), item-properties (`flex-grow`/`shrink`/`basis`), `flex-wrap`, perfect centreren, horizontale/verticale navigatiebalken

### Eindproject Blok 3 (Backend)

Studenten kiezen één van zeven themaprojecten (Gaming, Recipes, Cars, Fitness/Workouts, Holidays/Destinations, Bookstore, Jewelry), elk met een kant-en-klare database (SQL-import) en een bestaande overzichtspagina. Opdracht: uitbreiden met een detailpagina en extra functionaliteit (plain PHP + MySQL, geen framework).

---

## 3. Blok 4 - CRUD, Authenticatie & Data-analyse (Backend)

**Duur:** 8 hoofdstukken
**Projecten:** "Regenboog School" (schoolsysteem-app, Hoofdstuk 1-3) en Formula1-256 (Hoofdstuk 5-7 vervolg op Blok 3)
**Stack:** plain PHP + MySQLi (nog geen PDO/frameworks - dat volgt in Blok 5/6)

| # | Hoofdstuk | Leeruitkomsten |
|---|---|---|
| 1 | Herhaling, Create en Validatie | Herhaling Blok 3 (variabelen, datatypes, arrays, condities, loops, databaseconnectie); nieuw project opzetten; database importeren en aansluiten |
| 2 | Inloggen | Loginformulier bouwen (email/wachtwoord); formuliervelden matchen op databasekolommen; login-verwerkingsproces |
| 3 | Registreren | Registratieformulier met volledig gebruikersprofiel (naam, email, wachtwoord, rol, adres); nieuwe gebruiker opslaan in de database |
| 4 | Samenvatting Week 1-3 | Consolidatie: create-functionaliteit en validatie van hoofdstuk 1-3 herhalen en verdiepen |
| 5 | JOINS gebruiken | SQL `JOIN` om gerelateerde tabellen te koppelen (bijv. standings + drivers); waarom losse ID's niet leesbaar zijn voor gebruikers |
| 6 | Zoeken | Zoekformulier met `GET`-parameters; `search_process.php`-patroon; input-validatie vóór een query |
| 7 | Dashboard bouwen | Aggregatiequeries (`COUNT`, `MAX`) met `WHERE`- en `JOIN`-clausules; dashboard-statistieken tonen (bijv. aantal drivers per land, hoogste positie per team) |
| 8 | Herhaling Opdrachten | Zelfstandig een nieuw project (categorieën/producten/bestellingen) opzetten en overzichtspagina's bouwen ter voorbereiding op het eindproject |

**Eindresultaat Blok 4:** CRUD-basis (create/read), authenticatie (login/registratie) zonder wachtwoord-hashing (dat komt in Blok 5), JOIN-queries, zoekfunctionaliteit, en dashboard-aggregaties - allemaal in plain PHP/MySQLi.

### Eindprojecten Blok 4

Twee groepen (4A en 4B), elk met een eigen setje themaprojecten:
- **4A:** Fitness, Library, Movie, Music, Restaurant
- **4B:** Art Gallery, Car Rental, Event Management, Music, Pet Shelter, Travel Agency

**Beoordelingsrubriek (100 punten, 10 min. verdediging):**
- Responsive Design (15 pt)
- Styling (15 pt)
- Database & Functionaliteit (70 pt): database-opzet (15 pt), authenticatie & rollen (20 pt), formulieren & validatie (15 pt), CRUD of zoeken (20 pt)

---

## 4. Eindbeeld na Jaar 1 (Blok 3-4, zoals aanwezig in deze repo)

Na deze twee blokken kan een zwsd25f-student:
- Dynamische PHP-websites bouwen met een MySQL-database (MySQLi, nog geen PDO)
- CRUD (create/read, deels update via losse hoofdstukken) implementeren
- Basis-authenticatie bouwen (login/registratie, nog zonder wachtwoord-hashing)
- JOIN-queries schrijven om gerelateerde data te combineren
- Zoek- en filterfunctionaliteit bouwen met GET-parameters
- Dashboard-statistieken tonen met aggregatiequeries
- (Indicatief, Blok 3) CSS-selectoren en Flexbox toepassen

**Vergelijking met zwsd26ab:** dit is inhoudelijk verder dan zwsd26ab na Blok 4 (dat cohort heeft backend pas net geïntroduceerd via de PRIMM-pilot in Blok 3, met Laravel-basis - zie `curriculum-jaar 1.md` §4b). zwsd25f werkt hier al met JOINs, zoeken en dashboards in plain PHP, wat qua backend-diepgang dichter bij zwsd26ab's Blok 3-4 backend-plan (PRIMM week 3-8) ligt, maar dan zonder Laravel - dat volgt bij zwsd25f pas in Blok 6 (zie `curriculum-jaar 2 - zwsd25f.md`).

---

## 5. Openstaande punten

- **Blok 1 en 2 ontbreken volledig** in deze repo voor zwsd25f - geen leeruitkomsten te documenteren.
- **Blok 3 Frontend Development-materiaal is onvolledig en deels inconsistent** (zie let op in §1) - de leeruitkomsten in §2 zijn gebaseerd op de samenvatting, niet op volledig geverifieerde lesuitwerkingen. Aanbevolen: dit materiaal opschonen of aanvullen als het nog gebruikt wordt.
- **Geen apart Frontend-curriculum vanaf Blok 4** - onduidelijk of dit een bewuste keuze was (frontend volledig geïntegreerd in de PHP-projecten) of ontbrekend materiaal. Waard om te verifiëren bij de betrokken docent(en).
- Zie ook `.claude/todo.md` voor de actuele stand van openstaand werk.
