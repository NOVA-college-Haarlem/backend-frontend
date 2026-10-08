# Projectlessen Blok 5: Movie (De Filmfanaten)

## 📋 Wat ga je doen?

Je werkt verder aan je **eigen Movie-project uit Blok 4**. Bioscoop De Filmfanaten is tevreden met de eerste versie en komt met nieuwe wensen. Die wensen sluiten aan op wat je deze periode in de theorielessen leert.

Je doet dit in twee stappen:
1. **Eerst ontwerpen.** Je leest het verhaal van de opdrachtgever en maakt zelf een databaseontwerp. Dit laat je aftekenen door de docent.
2. **Dan bouwen.** Pas na aftekening ga je bouwen, user story voor user story.

> ⚠️ Er staat bewust **niet** welke tabellen en kolommen je nodig hebt. Dat haal je zelf uit het verhaal. Dat is precies wat een developer bij een echte opdrachtgever ook moet doen.

---

## 🗣️ Het verhaal van de opdrachtgever

*Gesprek met Yasmina el Amrani, manager van De Filmfanaten:*

"Bezoekers kunnen nu zien welke films we hebben. Maar ze willen natuurlijk weten **wanneer** ze kunnen komen, en ze willen online kaartjes kopen.

We hebben drie zalen: Zaal 1 met 120 stoelen, Zaal 2 met 80 en Zaal 3 met 40. Een film draait in een week vaak tientallen keren, in verschillende zalen. Zo'n keer noemen wij een **voorstelling**: een film, in een zaal, op een datum en tijd. In elke zaal kan maar één voorstelling tegelijk. Een avondvoorstelling is duurder dan een middagvoorstelling, dus elke voorstelling heeft een eigen ticketprijs.

Leden moeten online **tickets** kunnen kopen. Je kiest een voorstelling en het aantal kaartjes, en je kunt kaartjes voor meerdere voorstellingen in één keer afrekenen. Dat noemen we een **bestelling**. Per bestelling willen we zien wie het besteld heeft, wanneer, voor welke voorstellingen, hoeveel kaartjes per voorstelling, en wat het totaalbedrag is. Let op: als wij later de prijs van een voorstelling aanpassen, moet in een oude bestelling nog steeds staan wat de klant toen heeft betaald. Betalen gaat via **iDEAL**, en we willen zien of de betaling gelukt is.

Een voorstelling mag nooit meer kaartjes verkopen dan er stoelen in de zaal zijn.

Leden willen ook **reviews** schrijven: een cijfer van 1 tot 5 en een stukje tekst. Een lid kan veel films beoordelen, en een film krijgt veel reviews. Maar een lid mag elke film maar één keer beoordelen.

Tot slot: als een medewerker een film of voorstelling verwijdert, moet die niet écht weg zijn. Er kunnen al kaartjes voor verkocht zijn. Ook willen we bijhouden **wie wat heeft gedaan** in het beheergedeelte."

---

## 🧩 Stap 1: Databaseontwerp (eerste projectles)

Maak een ontwerp waarin het verhaal van Yasmina helemaal past. Je bestaande tabellen (`users`, `addresses`, `movies`) blijven bestaan. Je mag ze uitbreiden.

**Lever in:**
- [ ] Een **ERD** (op papier, draw.io of dbdiagram.io) met alle tabellen, kolommen, datatypes, primary keys en foreign keys
- [ ] Bij elke relatie staat of het **1-op-1**, **1-op-veel** of **veel-op-veel** is
- [ ] Een korte lijst: *"Uit deze zin van Yasmina haal ik deze tabel/kolom"* (minimaal 6 regels)

**Vragen die je ontwerp moet beantwoorden:**
- Zijn zalen een eigen tabel of een kolom bij de voorstelling? Waarom?
- Een bestelling bevat kaartjes voor meerdere voorstellingen. Welke tabellen heb je daarvoor nodig?
- Hoe bereken je hoeveel stoelen er nog vrij zijn voor een voorstelling?
- Hoe voorkom je in de **database** (dus niet alleen in je PHP) dat een lid dezelfde film twee keer beoordeelt?
- Hoe zorg je dat een oude bestelling het oude bedrag houdt als de prijs van een voorstelling verandert?
- Welk datatype gebruik je voor geld? Waarom geen `float`?
- Hoe "verwijder" je iets zonder het echt te verwijderen?

> ✅ **Laat je ERD aftekenen voordat je begint met bouwen.** Daarna schrijf je de SQL (`CREATE TABLE` + testdata). Je mag AI gebruiken voor testdata, maar niet voor het ontwerp zelf.

---

## 🛠️ Stap 2: Bouwen

Je bouwt de user stories in de volgorde van de theorielessen. Heb je een hoofdstuk gehad? Dan pas je het in deze projectles toe op je eigen project.

### Hoofdstuk 1: PDO & Prepared Statements
1. Als developer wil ik dat **alle** bestaande queries in mijn project via PDO en prepared statements lopen, zodat de site niet kwetsbaar is voor SQL-injectie.
2. Als bezoeker wil ik bij een film alle komende voorstellingen zien (datum, tijd, zaal, prijs).
3. Als medewerker wil ik een nieuwe voorstelling inplannen (film, zaal, datum, tijd, prijs).

### Hoofdstuk 2: Veilige data
4. Als developer wil ik dat alle output van gebruikers via `htmlspecialchars()` wordt getoond, zodat XSS niet mogelijk is. Let op: reviews zijn tekst die leden zelf typen.
5. Als lid wil ik een review schrijven. Ik krijg een foutmelding als het cijfer niet tussen 1 en 5 ligt of als de tekst leeg is.
6. Als bezoeker wil ik me kunnen registreren als lid, waarbij mijn wachtwoord **gehasht** wordt opgeslagen.
7. Als lid wil ik inloggen met `password_verify()`. Bestaande leden met een niet-gehasht wachtwoord moet je eerst omzetten.

### Hoofdstuk 3: Update
8. Als medewerker wil ik een voorstelling kunnen aanpassen (andere zaal, tijd of prijs).
9. Als lid wil ik mijn eigen review kunnen aanpassen.
10. Als lid wil ik mijn eigen persoonsgegevens en adres kunnen aanpassen.

### Hoofdstuk 4: Soft Delete & AJAX
11. Als medewerker wil ik een film of voorstelling kunnen verwijderen zonder dat die echt uit de database verdwijnt (soft delete).
12. Als medewerker wil ik een overzicht van verwijderde films zien en een film kunnen terugzetten.
13. Als lid wil ik kaartjes voor een voorstelling **in mijn winkelmandje leggen zonder dat de pagina herlaadt** (AJAX), en het aantal kunnen aanpassen.
14. Als lid wil ik een melding krijgen als er niet genoeg stoelen meer vrij zijn.

### Hoofdstuk 5: Security
15. Als developer wil ik dat lidpagina's alleen bereikbaar zijn voor ingelogde leden en beheerpagina's alleen voor medewerkers.
16. Als developer wil ik dat formulieren alleen via `POST` verwerkt worden en dat id's in de URL gecontroleerd worden (`is_numeric()`). Een lid mag alleen zijn **eigen** review aanpassen.
17. Als manager wil ik een **logboek** zien van acties in het beheergedeelte (wie, wat, wanneer).

### Hoofdstuk 6: Filters
18. Als bezoeker wil ik alle voorstellingen kunnen filteren op datum, genre en zaal. Filters moeten te combineren zijn.
19. Als bezoeker wil ik bij een film het gemiddelde cijfer en alle reviews zien, met de voornaam van de schrijver (JOIN).
20. Als lid wil ik een overzicht van **mijn** bestellingen zien, met per bestelling de films, voorstellingen en het aantal kaartjes.

### Hoofdstuk 7: Custom Error Pages
21. Als bezoeker wil ik een nette 404-pagina zien als een film of voorstelling niet bestaat.
22. Als lid wil ik een nette 403-pagina zien als ik een beheerpagina probeer te openen.
23. Als developer wil ik dat databasefouten worden afgevangen (try/catch) en dat de gebruiker een 500-pagina ziet in plaats van een PHP-foutmelding.

### Hoofdstuk 8: Betalen met Mollie
24. Als lid wil ik mijn winkelmandje afrekenen via iDEAL (Mollie testmodus). Er wordt een bestelling met het totaalbedrag opgeslagen.
25. Als lid wil ik na het betalen zien of mijn betaling gelukt is.
26. Als medewerker wil ik een overzicht van alle bestellingen zien, met het bedrag dat **op dat moment** betaald is.

---

## ✅ Aftekenlijst

| Onderdeel | Afgetekend |
|-----------|-----------|
| ERD + onderbouwing (stap 1) | ☐ |
| H1 – PDO & voorstellingen (1–3) | ☐ |
| H2 – Veilige data & hashing (4–7) | ☐ |
| H3 – Update (8–10) | ☐ |
| H4 – Soft delete & AJAX-winkelmandje (11–14) | ☐ |
| H5 – Security & logboek (15–17) | ☐ |
| H6 – Filters & JOINs (18–20) | ☐ |
| H7 – Error pages (21–23) | ☐ |
| H8 – Mollie-betaling (24–26) | ☐ |

> 💡 Ontdek je tijdens het bouwen dat je ontwerp niet klopt? Dat is normaal. Pas je ERD aan en laat de docent zien wat je hebt veranderd en waarom.
