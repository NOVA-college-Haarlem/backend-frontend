# Projectlessen Blok 5: Library (De Wijze Uil)

## 📋 Wat ga je doen?

Je werkt verder aan je **eigen Library-project uit Blok 4**. Bibliotheek De Wijze Uil is tevreden met de eerste versie en komt met nieuwe wensen. Die wensen sluiten aan op wat je deze periode in de theorielessen leert.

Je doet dit in twee stappen:
1. **Eerst ontwerpen.** Je leest het verhaal van de opdrachtgever en maakt zelf een databaseontwerp. Dit laat je aftekenen door de docent.
2. **Dan bouwen.** Pas na aftekening ga je bouwen, user story voor user story.

> ⚠️ Er staat bewust **niet** welke tabellen en kolommen je nodig hebt. Dat haal je zelf uit het verhaal. Dat is precies wat een developer bij een echte opdrachtgever ook moet doen.

---

## 🗣️ Het verhaal van de opdrachtgever

*Gesprek met Peter Jansen, hoofd van De Wijze Uil:*

"Leden zoeken nu al online in onze collectie, en dat werkt prima. Nu willen we ook het **uitlenen** in het systeem hebben.

Een lid leent een boek aan de balie. Een medewerker registreert dat. We willen per uitlening weten welk lid het boek heeft, welk boek het is, **welke medewerker** het heeft uitgeleend, op welke datum het is uitgeleend, wanneer het uiterlijk terug moet (altijd drie weken later) en wanneer het echt is teruggebracht. Een lid leent in de loop van de tijd natuurlijk heel veel boeken, en een boek wordt door heel veel verschillende leden geleend. We willen die geschiedenis bewaren, dus een uitlening wordt nooit weggegooid.

Onze categorieën staan nu als tekst bij elk boek. Daardoor staat er de ene keer 'Thriller' en de andere keer 'thriller' of 'Triller'. We willen een vaste lijst met categorieën die een medewerker kan beheren. Elk boek valt in één categorie.

Leden moeten online een boek kunnen **reserveren** als het uitgeleend is. Een lid kan meerdere boeken reserveren, maar hetzelfde boek maar één keer. We willen weten wanneer de reservering gedaan is.

Verder verkopen we **lidmaatschappen**: Jeugd, Volwassen en Plus. Elk lidmaatschap heeft een naam, een omschrijving, het maximum aantal boeken dat je tegelijk mag lenen en een prijs per jaar. De prijzen gaan elk jaar omhoog, maar als iemand vorig jaar €39,50 heeft betaald, moet dat bedrag in ons systeem blijven staan. Leden betalen online via **iDEAL**. Per betaling willen we zien wie er heeft betaald, voor welk lidmaatschap, hoeveel, wanneer, en of de betaling gelukt is.

Tot slot: als een medewerker een boek verwijdert, moet het niet écht weg zijn. Er hangen namelijk uitleningen aan. Ook willen we bijhouden **wie wat heeft gedaan** in het beheergedeelte."

---

## 🧩 Stap 1: Databaseontwerp (eerste projectles)

Maak een ontwerp waarin het verhaal van Peter helemaal past. Je bestaande tabellen (`users`, `addresses`, `books`) blijven bestaan. Je mag ze aanpassen.

**Lever in:**
- [ ] Een **ERD** (op papier, draw.io of dbdiagram.io) met alle tabellen, kolommen, datatypes, primary keys en foreign keys
- [ ] Bij elke relatie staat of het **1-op-1**, **1-op-veel** of **veel-op-veel** is
- [ ] Een korte lijst: *"Uit deze zin van Peter haal ik deze tabel/kolom"* (minimaal 6 regels)

**Vragen die je ontwerp moet beantwoorden:**
- Bij een uitlening horen twee personen: een lid en een medewerker. Hoe sla je dat op als ze allebei in `users` staan?
- Hoe zie je in de database of een boek op dit moment uitgeleend is?
- Wat verandert er aan je `books`-tabel als categorieën een eigen tabel krijgen?
- Hoe voorkom je in de **database** (dus niet alleen in je PHP) dat een lid hetzelfde boek twee keer reserveert?
- Hoe zorg je dat een oude betaling het oude bedrag houdt als de prijs van een lidmaatschap verandert?
- Welk datatype gebruik je voor geld? Waarom geen `float`?
- Hoe "verwijder" je een boek zonder het echt te verwijderen?

> ✅ **Laat je ERD aftekenen voordat je begint met bouwen.** Daarna schrijf je de SQL (`CREATE TABLE` + testdata). Je mag AI gebruiken voor testdata, maar niet voor het ontwerp zelf.

---

## 🛠️ Stap 2: Bouwen

Je bouwt de user stories in de volgorde van de theorielessen. Heb je een hoofdstuk gehad? Dan pas je het in deze projectles toe op je eigen project.

### Hoofdstuk 1: PDO & Prepared Statements
1. Als developer wil ik dat **alle** bestaande queries in mijn project via PDO en prepared statements lopen, zodat de site niet kwetsbaar is voor SQL-injectie.
2. Als medewerker wil ik een uitlening registreren (lid, boek). Uitleendatum en inleverdatum worden automatisch ingevuld.
3. Als medewerker wil ik een overzicht zien van alle boeken die op dit moment uitgeleend zijn, met de naam van het lid en de inleverdatum.

### Hoofdstuk 2: Veilige data
4. Als developer wil ik dat alle output van gebruikers via `htmlspecialchars()` wordt getoond, zodat XSS niet mogelijk is.
5. Als medewerker wil ik een foutmelding zien als ik een boek wil uitlenen dat al uitgeleend is, of aan een lid dat al het maximum aantal boeken heeft.
6. Als bezoeker wil ik me kunnen registreren als lid, waarbij mijn wachtwoord **gehasht** wordt opgeslagen.
7. Als lid wil ik inloggen met `password_verify()`. Bestaande leden met een niet-gehasht wachtwoord moet je eerst omzetten.

### Hoofdstuk 3: Update
8. Als medewerker wil ik een boek als **teruggebracht** kunnen markeren.
9. Als medewerker wil ik de gegevens van een boek en de prijs van een lidmaatschap kunnen aanpassen.
10. Als lid wil ik mijn eigen persoonsgegevens en adres kunnen aanpassen.

### Hoofdstuk 4: Soft Delete & AJAX
11. Als medewerker wil ik een boek of categorie kunnen verwijderen zonder dat die echt uit de database verdwijnt (soft delete).
12. Als medewerker wil ik een overzicht van verwijderde boeken zien en een boek kunnen terugzetten.
13. Als lid wil ik een uitgeleend boek met één klik **reserveren of mijn reservering annuleren zonder dat de pagina herlaadt** (AJAX).
14. Als lid wil ik een teller in de navigatie zien met het aantal reserveringen dat ik heb. Die past zich direct aan.

### Hoofdstuk 5: Security
15. Als developer wil ik dat lidpagina's alleen bereikbaar zijn voor ingelogde leden en beheerpagina's alleen voor medewerkers.
16. Als developer wil ik dat formulieren alleen via `POST` verwerkt worden en dat id's in de URL gecontroleerd worden (`is_numeric()`).
17. Als hoofd van de bibliotheek wil ik een **logboek** zien van acties in het beheergedeelte (wie, wat, wanneer).

### Hoofdstuk 6: Filters
18. Als bezoeker wil ik de collectie kunnen filteren op categorie, auteur en "nu beschikbaar". Filters moeten te combineren zijn.
19. Als lid wil ik mijn **leengeschiedenis** zien, met de titel van het boek en de medewerker die het heeft uitgeleend (JOIN).
20. Als medewerker wil ik alle uitleningen zien die **te laat** zijn, met naam en e-mail van het lid.

### Hoofdstuk 7: Custom Error Pages
21. Als bezoeker wil ik een nette 404-pagina zien als een boek niet bestaat.
22. Als lid wil ik een nette 403-pagina zien als ik een beheerpagina probeer te openen.
23. Als developer wil ik dat databasefouten worden afgevangen (try/catch) en dat de gebruiker een 500-pagina ziet in plaats van een PHP-foutmelding.

### Hoofdstuk 8: Betalen met Mollie
24. Als lid wil ik een lidmaatschap kiezen en betalen via iDEAL (Mollie testmodus).
25. Als lid wil ik na het betalen zien of mijn betaling gelukt is.
26. Als medewerker wil ik een overzicht van alle betalingen zien, met het bedrag dat **op dat moment** betaald is.

---

## ✅ Aftekenlijst

| Onderdeel | Afgetekend |
|-----------|-----------|
| ERD + onderbouwing (stap 1) | ☐ |
| H1 – PDO & uitlenen (1–3) | ☐ |
| H2 – Veilige data & hashing (4–7) | ☐ |
| H3 – Update (8–10) | ☐ |
| H4 – Soft delete & AJAX-reserveren (11–14) | ☐ |
| H5 – Security & logboek (15–17) | ☐ |
| H6 – Filters & JOINs (18–20) | ☐ |
| H7 – Error pages (21–23) | ☐ |
| H8 – Mollie-betaling (24–26) | ☐ |

> 💡 Ontdek je tijdens het bouwen dat je ontwerp niet klopt? Dat is normaal. Pas je ERD aan en laat de docent zien wat je hebt veranderd en waarom.
