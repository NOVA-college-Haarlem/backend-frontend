# Projectlessen Blok 5: Fitness (Work4Me)

## 📋 Wat ga je doen?

Je werkt verder aan je **eigen Fitness-project uit Blok 4**. Work4Me is tevreden met de eerste versie en komt met nieuwe wensen. Die wensen sluiten aan op wat je deze periode in de theorielessen leert.

Je doet dit in twee stappen:
1. **Eerst ontwerpen.** Je leest het verhaal van de opdrachtgever en maakt zelf een databaseontwerp. Dit laat je aftekenen door de docent.
2. **Dan bouwen.** Pas na aftekening ga je bouwen, user story voor user story.

> ⚠️ Er staat bewust **niet** welke tabellen en kolommen je nodig hebt. Dat haal je zelf uit het verhaal. Dat is precies wat een developer bij een echte opdrachtgever ook moet doen.

---

## 🗣️ Het verhaal van de opdrachtgever

*Gesprek met Sandra de Vries, eigenaar van Work4Me:*

"De website ziet er goed uit en onze leden gebruiken hem echt. Maar we willen nu een stap verder.

We geven elke week **groepslessen**. Zo'n les is altijd gebaseerd op een van onze workouts. Op maandag om 19:00 hebben we bijvoorbeeld een Spinning-les en op woensdag om 19:00 wéér een Spinning-les. Elke les heeft een datum, een begintijd en een zaal. Elke les wordt gegeven door **één trainer**, en dat is altijd een van onze medewerkers. Een trainer geeft natuurlijk meerdere lessen per week.

In elke les is maar een beperkt aantal plekken. Dat verschilt per les: in de spinningzaal passen 15 mensen, in de grote zaal 30. Leden moeten zich voor een les kunnen **inschrijven**. Een lid kan zich voor veel lessen inschrijven en een les heeft veel leden. Een lid mag zich natuurlijk niet twee keer voor dezelfde les inschrijven. We willen ook graag weten **wanneer** iemand zich heeft ingeschreven.

Verder willen we **abonnementen** verkopen via de website. We hebben nu drie soorten: Basic, Premium en All-in. Elk abonnement heeft een naam, een omschrijving en een prijs per maand. Die prijzen veranderen weleens. Als iemand in januari €29,95 heeft betaald en wij verhogen de prijs in maart, dan moet in ons systeem nog steeds staan dat hij €29,95 heeft betaald. Leden betalen online via **iDEAL**. We willen per betaling zien wie er heeft betaald, voor welk abonnement, hoeveel, wanneer, en of de betaling gelukt is.

Tot slot: als een medewerker een workout of les verwijdert, moet die niet écht weg zijn. Het gebeurt namelijk weleens dat er per ongeluk iets verwijderd wordt. Ook willen we bijhouden **wie wat heeft gedaan** in het beheergedeelte, bijvoorbeeld wie een les heeft aangepast en wanneer."

---

## 🧩 Stap 1: Databaseontwerp (eerste projectles)

Maak een ontwerp waarin het verhaal van Sandra helemaal past. Je bestaande tabellen (`users`, `addresses`, `workouts`) blijven bestaan. Je mag ze uitbreiden.

**Lever in:**
- [ ] Een **ERD** (op papier, draw.io of dbdiagram.io) met alle tabellen, kolommen, datatypes, primary keys en foreign keys
- [ ] Bij elke relatie staat of het **1-op-1**, **1-op-veel** of **veel-op-veel** is
- [ ] Een korte lijst: *"Uit deze zin van Sandra haal ik deze tabel/kolom"* (minimaal 6 regels)

**Vragen die je ontwerp moet beantwoorden:**
- Hoe weet je welke trainer een les geeft?
- Waar sla je op dat een lid ingeschreven is voor een les? Waarom kan dat niet met één kolom in `users` of in de lessentabel?
- Hoe voorkom je in de **database** (dus niet alleen in je PHP) dat een lid zich twee keer voor dezelfde les inschrijft?
- Hoe zorg je dat een oude betaling het oude bedrag houdt als de prijs van een abonnement verandert?
- Welk datatype gebruik je voor geld? Waarom geen `float`?
- Hoe "verwijder" je iets zonder het echt te verwijderen?

> ✅ **Laat je ERD aftekenen voordat je begint met bouwen.** Daarna schrijf je de SQL (`CREATE TABLE` + testdata). Je mag AI gebruiken voor testdata, maar niet voor het ontwerp zelf.

---

## 🛠️ Stap 2: Bouwen

Je bouwt de user stories in de volgorde van de theorielessen. Heb je een hoofdstuk gehad? Dan pas je het in deze projectles toe op je eigen project.

### Hoofdstuk 1: PDO & Prepared Statements
1. Als developer wil ik dat **alle** bestaande queries in mijn project via PDO en prepared statements lopen, zodat de site niet kwetsbaar is voor SQL-injectie.
2. Als bezoeker wil ik het lesrooster van deze week zien (workout, dag, tijd, zaal en naam van de trainer), zodat ik weet wanneer ik kan komen.
3. Als medewerker wil ik een nieuwe les inplannen (workout, trainer, datum, tijd, zaal, aantal plekken), zodat het rooster up-to-date is.

### Hoofdstuk 2: Veilige data
4. Als developer wil ik dat alle output van gebruikers via `htmlspecialchars()` wordt getoond, zodat XSS niet mogelijk is.
5. Als medewerker wil ik foutmeldingen zien als ik een les verkeerd invul (geen datum, 0 plekken, datum in het verleden), zodat er geen foute data in de database komt.
6. Als bezoeker wil ik me kunnen registreren als lid, waarbij mijn wachtwoord **gehasht** wordt opgeslagen.
7. Als lid wil ik inloggen met `password_verify()`. Bestaande leden met een niet-gehasht wachtwoord moet je eerst omzetten.

### Hoofdstuk 3: Update
8. Als medewerker wil ik een les kunnen aanpassen (bijv. andere zaal of trainer), zodat het rooster klopt.
9. Als medewerker wil ik de prijs van een abonnement kunnen aanpassen.
10. Als lid wil ik mijn eigen persoonsgegevens en adres kunnen aanpassen.

### Hoofdstuk 4: Soft Delete & AJAX
11. Als medewerker wil ik een workout of les kunnen verwijderen zonder dat die echt uit de database verdwijnt (soft delete).
12. Als medewerker wil ik een overzicht van verwijderde lessen zien en een les kunnen terugzetten.
13. Als lid wil ik me met één klik voor een les **inschrijven en uitschrijven zonder dat de pagina herlaadt** (AJAX), en zie ik direct hoeveel plekken er nog over zijn.
14. Als lid wil ik een melding krijgen als een les vol is, zodat ik weet dat inschrijven niet meer kan.

### Hoofdstuk 5: Security
15. Als developer wil ik dat lidpagina's alleen bereikbaar zijn voor ingelogde leden en beheerpagina's alleen voor medewerkers.
16. Als developer wil ik dat formulieren alleen via `POST` verwerkt worden en dat id's in de URL gecontroleerd worden (`is_numeric()`).
17. Als eigenaar wil ik een **logboek** zien van acties in het beheergedeelte (wie, wat, wanneer).

### Hoofdstuk 6: Filters
18. Als bezoeker wil ik het lesrooster kunnen filteren op dag, trainer en workout. Filters moeten te combineren zijn.
19. Als lid wil ik een overzicht van **mijn** inschrijvingen zien, met de les en de trainer erbij (JOIN).
20. Als trainer wil ik per les zien welke leden ingeschreven zijn.

### Hoofdstuk 7: Custom Error Pages
21. Als bezoeker wil ik een nette 404-pagina zien als een les of workout niet bestaat.
22. Als lid wil ik een nette 403-pagina zien als ik een beheerpagina probeer te openen.
23. Als developer wil ik dat databasefouten worden afgevangen (try/catch) en dat de gebruiker een 500-pagina ziet in plaats van een PHP-foutmelding.

### Hoofdstuk 8: Betalen met Mollie
24. Als lid wil ik een abonnement kiezen en betalen via iDEAL (Mollie testmodus).
25. Als lid wil ik na het betalen zien of mijn betaling gelukt is.
26. Als medewerker wil ik een overzicht van alle betalingen zien, met het bedrag dat **op dat moment** betaald is.

---

## ✅ Aftekenlijst

| Onderdeel | Afgetekend |
|-----------|-----------|
| ERD + onderbouwing (stap 1) | ☐ |
| H1 – PDO & lesrooster (1–3) | ☐ |
| H2 – Veilige data & hashing (4–7) | ☐ |
| H3 – Update (8–10) | ☐ |
| H4 – Soft delete & AJAX-inschrijving (11–14) | ☐ |
| H5 – Security & logboek (15–17) | ☐ |
| H6 – Filters & JOINs (18–20) | ☐ |
| H7 – Error pages (21–23) | ☐ |
| H8 – Mollie-betaling (24–26) | ☐ |

> 💡 Ontdek je tijdens het bouwen dat je ontwerp niet klopt? Dat is normaal. Pas je ERD aan en laat de docent zien wat je hebt veranderd en waarom.
