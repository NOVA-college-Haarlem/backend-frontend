# Projectlessen Blok 5: Music (De Notenkraker)

## 📋 Wat ga je doen?

Je werkt verder aan je **eigen Music-project uit Blok 4**. Muziekwinkel De Notenkraker is tevreden met de eerste versie en komt met nieuwe wensen. Die wensen sluiten aan op wat je deze periode in de theorielessen leert.

Je doet dit in twee stappen:
1. **Eerst ontwerpen.** Je leest het verhaal van de opdrachtgever en maakt zelf een databaseontwerp. Dit laat je aftekenen door de docent.
2. **Dan bouwen.** Pas na aftekening ga je bouwen, user story voor user story.

> ⚠️ Er staat bewust **niet** welke tabellen en kolommen je nodig hebt. Dat haal je zelf uit het verhaal. Dat is precies wat een developer bij een echte opdrachtgever ook moet doen.

---

## 🗣️ Het verhaal van de opdrachtgever

*Gesprek met Kees Bakker, eigenaar van De Notenkraker:*

"Klanten bekijken onze albums nu online, maar ze kunnen nog niks kopen. Dat moet veranderen: we willen een echte **webshop**.

Eerst iets wat ons stoort. De naam van de artiest staat nu als tekst bij elk album. Daardoor staat 'The Beatles' er ook als 'Beatles' en 'the beatles'. Een artiest heeft vaak meerdere albums. Van een artiest willen we een naam, een land en een korte biografie bijhouden, zodat klanten op een artiestenpagina al zijn albums kunnen zien.

We verkopen elk album als **cd** en als **vinyl**. Dat zijn verschillende producten met een eigen prijs en een eigen **voorraad**. Van 'Abbey Road' hebben we bijvoorbeeld 4 cd's van €14,99 en 2 lp's van €32,50.

Een klant legt producten in een winkelmandje en rekent af. Dat noemen we een **bestelling**. In een bestelling kunnen meerdere producten zitten, en van elk product kan de klant er meer dan één kopen. Per bestelling willen we zien wie er besteld heeft, wanneer, welke producten, hoeveel van elk, en het totaalbedrag. Onze prijzen veranderen regelmatig door aanbiedingen. In een oude bestelling moet altijd de prijs blijven staan die de klant **toen** betaalde. Betalen gaat via **iDEAL**, en we willen zien of de betaling gelukt is. Na een betaalde bestelling gaat de voorraad omlaag.

Leden willen ook een **verlanglijst** bijhouden. Een lid kan veel albums op zijn verlanglijst zetten, en een album kan op de verlanglijst van veel leden staan. Hetzelfde album twee keer op je lijst zetten mag niet.

Tot slot: als een medewerker een album verwijdert, moet het niet écht weg zijn. Er kunnen al bestellingen voor zijn. Ook willen we bijhouden **wie wat heeft gedaan** in het beheergedeelte."

---

## 🧩 Stap 1: Databaseontwerp (eerste projectles)

Maak een ontwerp waarin het verhaal van Kees helemaal past. Je bestaande tabellen (`users`, `addresses`, `albums`) blijven bestaan. Je mag ze aanpassen.

**Lever in:**
- [ ] Een **ERD** (op papier, draw.io of dbdiagram.io) met alle tabellen, kolommen, datatypes, primary keys en foreign keys
- [ ] Bij elke relatie staat of het **1-op-1**, **1-op-veel** of **veel-op-veel** is
- [ ] Een korte lijst: *"Uit deze zin van Kees haal ik deze tabel/kolom"* (minimaal 6 regels)

**Vragen die je ontwerp moet beantwoorden:**
- Wat verandert er aan je `albums`-tabel als artiesten een eigen tabel krijgen?
- Waar staan prijs en voorraad nu je cd en vinyl apart verkoopt? Nog steeds in `albums`?
- Een bestelling bevat meerdere producten met elk een aantal. Welke tabellen heb je daarvoor nodig?
- Hoe voorkom je in de **database** (dus niet alleen in je PHP) dat een album twee keer op dezelfde verlanglijst staat?
- Hoe zorg je dat een oude bestelling de oude prijs houdt als de prijs van een product verandert?
- Welk datatype gebruik je voor geld? Waarom geen `float`?
- Hoe "verwijder" je een album zonder het echt te verwijderen?

> ✅ **Laat je ERD aftekenen voordat je begint met bouwen.** Daarna schrijf je de SQL (`CREATE TABLE` + testdata). Je mag AI gebruiken voor testdata, maar niet voor het ontwerp zelf.

---

## 🛠️ Stap 2: Bouwen

Je bouwt de user stories in de volgorde van de theorielessen. Heb je een hoofdstuk gehad? Dan pas je het in deze projectles toe op je eigen project.

### Hoofdstuk 1: PDO & Prepared Statements
1. Als developer wil ik dat **alle** bestaande queries in mijn project via PDO en prepared statements lopen, zodat de site niet kwetsbaar is voor SQL-injectie.
2. Als bezoeker wil ik op een artiestenpagina de gegevens van de artiest en al zijn albums zien.
3. Als medewerker wil ik een nieuwe artiest en een nieuw product (album, cd of vinyl, prijs, voorraad) kunnen toevoegen.

### Hoofdstuk 2: Veilige data
4. Als developer wil ik dat alle output van gebruikers via `htmlspecialchars()` wordt getoond, zodat XSS niet mogelijk is.
5. Als medewerker wil ik foutmeldingen zien als ik een product verkeerd invul (negatieve prijs, negatieve voorraad, geen type gekozen).
6. Als bezoeker wil ik me kunnen registreren als lid, waarbij mijn wachtwoord **gehasht** wordt opgeslagen.
7. Als lid wil ik inloggen met `password_verify()`. Bestaande leden met een niet-gehasht wachtwoord moet je eerst omzetten.

### Hoofdstuk 3: Update
8. Als medewerker wil ik de prijs en voorraad van een product kunnen aanpassen.
9. Als medewerker wil ik de gegevens van een artiest kunnen aanpassen.
10. Als lid wil ik mijn eigen persoonsgegevens en adres kunnen aanpassen.

### Hoofdstuk 4: Soft Delete & AJAX
11. Als medewerker wil ik een album of product kunnen verwijderen zonder dat het echt uit de database verdwijnt (soft delete).
12. Als medewerker wil ik een overzicht van verwijderde albums zien en een album kunnen terugzetten.
13. Als lid wil ik een product **in mijn winkelmandje leggen zonder dat de pagina herlaadt** (AJAX), en het aantal kunnen aanpassen.
14. Als lid wil ik een album met één klik op mijn verlanglijst zetten of eraf halen (AJAX).

### Hoofdstuk 5: Security
15. Als developer wil ik dat lidpagina's alleen bereikbaar zijn voor ingelogde leden en beheerpagina's alleen voor medewerkers.
16. Als developer wil ik dat formulieren alleen via `POST` verwerkt worden en dat id's in de URL gecontroleerd worden (`is_numeric()`).
17. Als eigenaar wil ik een **logboek** zien van acties in het beheergedeelte (wie, wat, wanneer).

### Hoofdstuk 6: Filters
18. Als bezoeker wil ik de albums kunnen filteren op genre, artiest, type (cd/vinyl) en "op voorraad". Filters moeten te combineren zijn.
19. Als lid wil ik mijn verlanglijst zien met titel, artiest en de laagste prijs van het album (JOIN).
20. Als lid wil ik een overzicht van **mijn** bestellingen zien, met per bestelling de producten en aantallen.

### Hoofdstuk 7: Custom Error Pages
21. Als bezoeker wil ik een nette 404-pagina zien als een album of artiest niet bestaat.
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
| H1 – PDO & artiesten/producten (1–3) | ☐ |
| H2 – Veilige data & hashing (4–7) | ☐ |
| H3 – Update (8–10) | ☐ |
| H4 – Soft delete & AJAX-winkelmandje (11–14) | ☐ |
| H5 – Security & logboek (15–17) | ☐ |
| H6 – Filters & JOINs (18–20) | ☐ |
| H7 – Error pages (21–23) | ☐ |
| H8 – Mollie-betaling (24–26) | ☐ |

> 💡 Ontdek je tijdens het bouwen dat je ontwerp niet klopt? Dat is normaal. Pas je ERD aan en laat de docent zien wat je hebt veranderd en waarom.
