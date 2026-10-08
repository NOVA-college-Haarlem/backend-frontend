# Projectlessen Blok 5: Restaurant (De Gouden Gerechten)

## 📋 Wat ga je doen?

Je werkt verder aan je **eigen Restaurant-project uit Blok 4**. Restaurant De Gouden Gerechten is tevreden met de eerste versie en komt met nieuwe wensen. Die wensen sluiten aan op wat je deze periode in de theorielessen leert.

Je doet dit in twee stappen:
1. **Eerst ontwerpen.** Je leest het verhaal van de opdrachtgever en maakt zelf een databaseontwerp. Dit laat je aftekenen door de docent.
2. **Dan bouwen.** Pas na aftekening ga je bouwen, user story voor user story.

> ⚠️ Er staat bewust **niet** welke tabellen en kolommen je nodig hebt. Dat haal je zelf uit het verhaal. Dat is precies wat een developer bij een echte opdrachtgever ook moet doen.

---

## 🗣️ Het verhaal van de opdrachtgever

*Gesprek met Marco Rossi, eigenaar van De Gouden Gerechten:*

"Onze menukaart staat nu online. Maar gasten bellen nog steeds om te reserveren, en we krijgen elke dag vragen over allergieën. Daar willen we vanaf.

Eerst de **allergenen**. Er zijn veertien officiële allergenen, zoals gluten, noten, melk en ei. Een gerecht kan meerdere allergenen bevatten, en een allergeen zit in meerdere gerechten. Bij elk gerecht willen we zien welke allergenen erin zitten. We willen ook een vaste lijst met **categorieën** (voorgerecht, hoofdgerecht, nagerecht, drank). Elk gerecht valt in één categorie.

Dan **reserveren**. We hebben tafels met een nummer en een aantal stoelen: tafel 1 heeft 2 stoelen, tafel 7 heeft 6 stoelen, enzovoort. Een lid reserveert voor een datum, een tijd en een aantal personen, en kan een opmerking meegeven (bijvoorbeeld 'kinderstoel graag'). Een medewerker wijst daarna een tafel toe. Een lid kan in de loop van de tijd veel reserveringen maken. We willen ook zien **welke medewerker** de tafel heeft toegewezen.

Verder willen we **afhaalbestellingen** online aannemen. Een klant kiest gerechten, van elk gerecht een aantal, en rekent af. Dat noemen we een **bestelling**. Per bestelling willen we zien wie er besteld heeft, wanneer, welke gerechten, hoeveel van elk, het afhaaltijdstip en het totaalbedrag. Onze prijzen veranderen elk seizoen. In een oude bestelling moet altijd de prijs blijven staan die de klant **toen** betaalde. Betalen gaat via **iDEAL**, en we willen zien of de betaling gelukt is.

Tot slot: als een medewerker een gerecht van de kaart haalt, moet het niet écht weg zijn. Seizoensgerechten komen namelijk vaak terug. Ook willen we bijhouden **wie wat heeft gedaan** in het beheergedeelte."

---

## 🧩 Stap 1: Databaseontwerp (eerste projectles)

Maak een ontwerp waarin het verhaal van Marco helemaal past. Je bestaande tabellen (`users`, `addresses`, `dishes`) blijven bestaan. Je mag ze aanpassen.

**Lever in:**
- [ ] Een **ERD** (op papier, draw.io of dbdiagram.io) met alle tabellen, kolommen, datatypes, primary keys en foreign keys
- [ ] Bij elke relatie staat of het **1-op-1**, **1-op-veel** of **veel-op-veel** is
- [ ] Een korte lijst: *"Uit deze zin van Marco haal ik deze tabel/kolom"* (minimaal 6 regels)

**Vragen die je ontwerp moet beantwoorden:**
- Wat verandert er aan je `dishes`-tabel als categorieën een eigen tabel krijgen?
- Hoe sla je op welke allergenen in een gerecht zitten? Waarom kan dat niet met één kolom in `dishes`?
- Hoe voorkom je in de **database** (dus niet alleen in je PHP) dat hetzelfde allergeen twee keer aan een gerecht gekoppeld wordt?
- Bij een reservering horen twee personen: een lid en een medewerker. Hoe sla je dat op als ze allebei in `users` staan?
- Een reservering heeft eerst nog geen tafel. Wat betekent dat voor die kolom?
- Hoe zorg je dat een oude bestelling de oude prijs houdt als de prijs van een gerecht verandert?
- Welk datatype gebruik je voor geld? Waarom geen `float`?

> ✅ **Laat je ERD aftekenen voordat je begint met bouwen.** Daarna schrijf je de SQL (`CREATE TABLE` + testdata). Je mag AI gebruiken voor testdata, maar niet voor het ontwerp zelf.

---

## 🛠️ Stap 2: Bouwen

Je bouwt de user stories in de volgorde van de theorielessen. Heb je een hoofdstuk gehad? Dan pas je het in deze projectles toe op je eigen project.

### Hoofdstuk 1: PDO & Prepared Statements
1. Als developer wil ik dat **alle** bestaande queries in mijn project via PDO en prepared statements lopen, zodat de site niet kwetsbaar is voor SQL-injectie.
2. Als bezoeker wil ik bij elk gerecht de categorie en de allergenen zien.
3. Als lid wil ik een reservering maken (datum, tijd, aantal personen, opmerking).

### Hoofdstuk 2: Veilige data
4. Als developer wil ik dat alle output van gebruikers via `htmlspecialchars()` wordt getoond, zodat XSS niet mogelijk is. Let op: de opmerking bij een reservering is tekst die leden zelf typen.
5. Als lid wil ik een foutmelding zien als ik een reservering verkeerd invul (datum in het verleden, 0 personen, meer dan 10 personen).
6. Als bezoeker wil ik me kunnen registreren als lid, waarbij mijn wachtwoord **gehasht** wordt opgeslagen.
7. Als lid wil ik inloggen met `password_verify()`. Bestaande leden met een niet-gehasht wachtwoord moet je eerst omzetten.

### Hoofdstuk 3: Update
8. Als medewerker wil ik een tafel aan een reservering toewijzen.
9. Als medewerker wil ik een gerecht aanpassen, inclusief de prijs en de allergenen.
10. Als lid wil ik mijn eigen persoonsgegevens en adres kunnen aanpassen.

### Hoofdstuk 4: Soft Delete & AJAX
11. Als medewerker wil ik een gerecht van de kaart kunnen halen zonder dat het echt uit de database verdwijnt (soft delete).
12. Als medewerker wil ik een overzicht van verwijderde gerechten zien en een gerecht kunnen terugzetten op de kaart.
13. Als lid wil ik een gerecht **in mijn afhaalmandje leggen zonder dat de pagina herlaadt** (AJAX), en het aantal kunnen aanpassen.
14. Als lid wil ik dat het totaalbedrag van mijn mandje direct meeverandert.

### Hoofdstuk 5: Security
15. Als developer wil ik dat lidpagina's alleen bereikbaar zijn voor ingelogde leden en beheerpagina's alleen voor medewerkers.
16. Als developer wil ik dat formulieren alleen via `POST` verwerkt worden en dat id's in de URL gecontroleerd worden (`is_numeric()`). Een lid mag alleen zijn **eigen** reserveringen zien.
17. Als eigenaar wil ik een **logboek** zien van acties in het beheergedeelte (wie, wat, wanneer).

### Hoofdstuk 6: Filters
18. Als bezoeker wil ik de menukaart kunnen filteren op categorie en "zonder allergeen X" (bijvoorbeeld: alles zonder noten). Filters moeten te combineren zijn.
19. Als medewerker wil ik de reserveringen van een gekozen dag zien, met naam van het lid, aantal personen en tafelnummer (JOIN).
20. Als lid wil ik een overzicht van **mijn** bestellingen en reserveringen zien.

### Hoofdstuk 7: Custom Error Pages
21. Als bezoeker wil ik een nette 404-pagina zien als een gerecht niet bestaat.
22. Als lid wil ik een nette 403-pagina zien als ik een beheerpagina probeer te openen.
23. Als developer wil ik dat databasefouten worden afgevangen (try/catch) en dat de gebruiker een 500-pagina ziet in plaats van een PHP-foutmelding.

### Hoofdstuk 8: Betalen met Mollie
24. Als lid wil ik mijn afhaalmandje afrekenen via iDEAL (Mollie testmodus), met een gekozen afhaaltijdstip. Er wordt een bestelling met het totaalbedrag opgeslagen.
25. Als lid wil ik na het betalen zien of mijn betaling gelukt is.
26. Als medewerker wil ik een overzicht van alle bestellingen van vandaag zien, met de prijzen die **op dat moment** betaald zijn.

---

## ✅ Aftekenlijst

| Onderdeel | Afgetekend |
|-----------|-----------|
| ERD + onderbouwing (stap 1) | ☐ |
| H1 – PDO & allergenen/reserveren (1–3) | ☐ |
| H2 – Veilige data & hashing (4–7) | ☐ |
| H3 – Update (8–10) | ☐ |
| H4 – Soft delete & AJAX-afhaalmandje (11–14) | ☐ |
| H5 – Security & logboek (15–17) | ☐ |
| H6 – Filters & JOINs (18–20) | ☐ |
| H7 – Error pages (21–23) | ☐ |
| H8 – Mollie-betaling (24–26) | ☐ |

> 💡 Ontdek je tijdens het bouwen dat je ontwerp niet klopt? Dat is normaal. Pas je ERD aan en laat de docent zien wat je hebt veranderd en waarom.
