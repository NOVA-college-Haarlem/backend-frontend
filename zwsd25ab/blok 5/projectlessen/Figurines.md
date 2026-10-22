# Projectlessen Blok 5: Figurines (Vocaloid Vault)

## 📋 Wat ga je doen?

Voor dit thema is er geen project uit Blok 4. Je begint dus **vanaf nul**. Vocaloid Vault wil een website waarop klanten figurines kunnen bekijken, reserveren en kopen. Die wensen sluiten aan op wat je deze periode in de theorielessen leert.

Je doet dit in twee stappen:
1. **Eerst ontwerpen.** Je leest het verhaal van de opdrachtgever en maakt zelf een databaseontwerp. Dit laat je aftekenen door de docent.
2. **Dan bouwen.** Pas na aftekening ga je bouwen, user story voor user story.

> ⚠️ Er staat bewust **niet** welke tabellen en kolommen je nodig hebt. Dat haal je zelf uit het verhaal. Dat is precies wat een developer bij een echte opdrachtgever ook moet doen.

## ⚙️ Project setup

1. Kloon op Github het project [Docker Template](https://github.com/NOVA-college-Haarlem/docker-template) (je kunt de default settings aanhouden).
2. Kopieer de URL van de repository (via de groene knop "Code").
3. Open de map waarin je je projecten bewaart met VS Code.
4. Open de terminal en run `git clone <PASTE URL>`
5. In de Windows Verkenner (File Explorer): verander de naam "docker-template" naar "figurines".
6. Open dit project in VS Code.
7. In `.env` verander de naam `MYSQL_DATABASE` van "testdb" naar "figurines".
8. Open de terminal en run `docker compose up -d`.
9. Je website draait nu op http://localhost en PhpMyAdmin op http://localhost:8000/.

---

## 🗣️ Het verhaal van de opdrachtgever

*Gesprek met Wendy, eigenaar van Vocaloid Vault:*

"Wij verkopen figurines van Vocaloid-personages zoals Hatsune Miku, Kagamine Rin & Len, Megurine Luka, KAITO en MEIKO. Nu gaat alles via een groepsapp, en dat is chaos. Ik wil een echte website.

Van elke figurine willen we een titel, een omschrijving, een foto, een prijs, een releasedatum en de **voorraad** bijhouden. Elke figurine stelt één personage voor, en van een personage hebben we meestal veel verschillende figurines. Van een personage willen we de naam en een korte beschrijving, zodat klanten op een personagepagina alle figurines van bijvoorbeeld Miku kunnen zien. We delen figurines ook in op **type**: Nendoroid, Scale Figure en Figma. Elke figurine heeft één type.

Er zijn twee soorten gebruikers: **medewerkers** en **leden**. Van iedereen willen we naam, e-mail, gebruikersnaam en wachtwoord. Van een lid willen we ook één **adres**, want we sturen leden een flyer bij een nieuwe release.

Sommige figurines zijn **gelimiteerde edities**. Daarvan maken we maar een vast aantal, bijvoorbeeld 50 stuks. Leden willen die van tevoren **reserveren**, voordat ze uitverkocht zijn. Een lid kan veel figurines reserveren, en een figurine wordt door veel leden gereserveerd. Maar een lid mag dezelfde figurine maar één keer reserveren, en er mogen nooit meer reserveringen zijn dan het aantal stuks dat er gemaakt wordt. We willen weten wanneer de reservering gedaan is.

Verder willen we figurines **online verkopen**. Een klant legt figurines in een winkelmandje en rekent af. Dat noemen we een **bestelling**. In een bestelling kunnen meerdere figurines zitten, en van elke figurine kan de klant er meer dan één kopen. Per bestelling willen we zien wie er besteld heeft, wanneer, welke figurines, hoeveel van elk, en het totaalbedrag. Onze prijzen veranderen weleens. In een oude bestelling moet altijd de prijs blijven staan die de klant **toen** betaalde. Betalen gaat via **iDEAL**, en we willen zien of de betaling gelukt is.

Tot slot: als een medewerker een figurine verwijdert, moet die niet écht weg zijn. Er kunnen al bestellingen en reserveringen voor zijn. Ook willen we bijhouden **wie wat heeft gedaan** in het beheergedeelte."

---

## 🧩 Stap 1: Databaseontwerp (eerste projectles)

Maak een ontwerp waarin het verhaal van Wendy helemaal past. Je hebt nog geen bestaande tabellen, dus je ontwerpt de hele database.

**Lever in:**
- [ ] Een **ERD** (op papier, draw.io of dbdiagram.io) met alle tabellen, kolommen, datatypes, primary keys en foreign keys
- [ ] Bij elke relatie staat of het **1-op-1**, **1-op-veel** of **veel-op-veel** is
- [ ] Een korte lijst: *"Uit deze zin van Wendy haal ik deze tabel/kolom"* (minimaal 8 regels)

**Vragen die je ontwerp moet beantwoorden:**
- Zijn personages en types een eigen tabel of een kolom bij de figurine? Waarom?
- Waar sla je op of iemand medewerker of lid is?
- Waar staat het adres van een lid? Welke relatie is dat?
- Hoe zie je of een figurine een gelimiteerde editie is, en hoeveel stuks er gemaakt worden?
- Hoe voorkom je in de **database** (dus niet alleen in je PHP) dat een lid dezelfde figurine twee keer reserveert?
- Een bestelling bevat meerdere figurines met elk een aantal. Welke tabellen heb je daarvoor nodig?
- Hoe zorg je dat een oude bestelling de oude prijs houdt als de prijs van een figurine verandert?
- Welk datatype gebruik je voor geld? Waarom geen `float`?

> ✅ **Laat je ERD aftekenen voordat je begint met bouwen.** Daarna schrijf je de SQL (`CREATE TABLE` + testdata). Je mag AI gebruiken voor testdata, maar niet voor het ontwerp zelf.

---

## 🛠️ Stap 2: Bouwen

Je bouwt de user stories in de volgorde van de theorielessen. Heb je een hoofdstuk gehad? Dan pas je het in deze projectles toe op je eigen project. Omdat je vanaf nul begint, bevat H1 ook de basis die andere thema's al in Blok 4 hebben gebouwd.

### Hoofdstuk 1: PDO & Prepared Statements
1. Als developer wil ik dat **alle** queries in mijn project via PDO en prepared statements lopen, zodat de site niet kwetsbaar is voor SQL-injectie.
2. Als bezoeker wil ik een overzicht van alle figurines zien (foto, titel, personage, prijs), en op een figurine kunnen klikken voor de detailpagina.
3. Als bezoeker wil ik op een personagepagina alle figurines van dat personage zien.
4. Als medewerker wil ik een nieuwe figurine kunnen toevoegen, met personage en type.

### Hoofdstuk 2: Veilige data
5. Als developer wil ik dat alle output van gebruikers via `htmlspecialchars()` wordt getoond, zodat XSS niet mogelijk is.
6. Als medewerker wil ik foutmeldingen zien als ik een figurine verkeerd invul (geen titel, negatieve prijs, gelimiteerd maar geen aantal stuks).
7. Als bezoeker wil ik me kunnen registreren als lid, met mijn adres. Mijn wachtwoord wordt **gehasht** opgeslagen.
8. Als lid en medewerker wil ik inloggen met `password_verify()` en weer kunnen uitloggen.

### Hoofdstuk 3: Update
9. Als medewerker wil ik de gegevens, prijs en voorraad van een figurine kunnen aanpassen.
10. Als lid wil ik mijn eigen persoonsgegevens en adres kunnen aanpassen.

### Hoofdstuk 4: Soft Delete & AJAX
11. Als medewerker wil ik een figurine kunnen verwijderen zonder dat die echt uit de database verdwijnt (soft delete).
12. Als medewerker wil ik een overzicht van verwijderde figurines zien en een figurine kunnen terugzetten.
13. Als lid wil ik een figurine **in mijn winkelmandje leggen zonder dat de pagina herlaadt** (AJAX), en het aantal kunnen aanpassen.
14. Als lid wil ik een gelimiteerde editie met één klik **reserveren of mijn reservering annuleren** (AJAX), en direct zien hoeveel stuks er nog over zijn.

### Hoofdstuk 5: Security
15. Als developer wil ik dat lidpagina's alleen bereikbaar zijn voor ingelogde leden en beheerpagina's alleen voor medewerkers.
16. Als developer wil ik dat formulieren alleen via `POST` verwerkt worden en dat id's in de URL gecontroleerd worden (`is_numeric()`).
17. Als eigenaar wil ik een **logboek** zien van acties in het beheergedeelte (wie, wat, wanneer).

### Hoofdstuk 6: Filters
18. Als bezoeker wil ik de figurines kunnen filteren op type, personage en "gelimiteerde editie". Filters moeten te combineren zijn.
19. Als medewerker wil ik per gelimiteerde editie zien welke leden gereserveerd hebben, met hun e-mailadres (JOIN).
20. Als lid wil ik een overzicht van **mijn** reserveringen en bestellingen zien.

### Hoofdstuk 7: Custom Error Pages
21. Als bezoeker wil ik een nette 404-pagina zien als een figurine of personage niet bestaat.
22. Als lid wil ik een nette 403-pagina zien als ik een beheerpagina probeer te openen.
23. Als developer wil ik dat databasefouten worden afgevangen (try/catch) en dat de gebruiker een 500-pagina ziet in plaats van een PHP-foutmelding.

### Hoofdstuk 8: Betalen met Mollie
24. Als lid wil ik mijn winkelmandje afrekenen via iDEAL (Mollie testmodus). Er wordt een bestelling met het totaalbedrag opgeslagen.
25. Als lid wil ik na het betalen zien of mijn betaling gelukt is. Na een gelukte betaling gaat de voorraad omlaag.
26. Als medewerker wil ik een overzicht van alle bestellingen zien, met de prijzen die **op dat moment** betaald zijn.

---

## ✅ Aftekenlijst

| Onderdeel | Afgetekend |
|-----------|-----------|
| ERD + onderbouwing (stap 1) | ☐ |
| H1 – PDO & basis (1–4) | ☐ |
| H2 – Veilige data, registreren & inloggen (5–8) | ☐ |
| H3 – Update (9–10) | ☐ |
| H4 – Soft delete & AJAX-mandje/reserveren (11–14) | ☐ |
| H5 – Security & logboek (15–17) | ☐ |
| H6 – Filters & JOINs (18–20) | ☐ |
| H7 – Error pages (21–23) | ☐ |
| H8 – Mollie-betaling (24–26) | ☐ |

> 💡 Ontdek je tijdens het bouwen dat je ontwerp niet klopt? Dat is normaal. Pas je ERD aan en laat de docent zien wat je hebt veranderd en waarom.
