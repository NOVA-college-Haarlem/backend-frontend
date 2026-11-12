# Eindproject Blok 6B (Hoofdstuk 1 t/m 11)

## 📋 Wat ga je doen?

Deze projectweek bouw je **zelfstandig** een complete Laravel-webapplicatie voor een nieuwe opdrachtgever. Je laat zien dat je **alles uit Blok 6** beheerst: de stof van kaart 1 t/m 6 van SoleStore, maar nu met een ander thema en zonder begeleiding.

De week erna heb je een **mondeling assessment**. Dat levert je cijfer op.

Je begint met een nieuwe repository. Je mag je **eigen code** uit SoleStore en Eindproject 6A als voorbeeld gebruiken. Je bouwt wel voor een ander thema, dus kopiëren zonder aanpassen werkt niet.

## Thema's

De docent wijst je één thema toe. De technische eisen zijn voor alle thema's **exact gelijk**.

1. [Concertzaal](Concertzaal.md): poppodium De Kelder
2. [Bloemist](Bloemist.md): bloemist Het Boeket
3. [Kantine](Kantine.md): schoolkantine Kantine Online
4. [Workshops](Workshops.md): workshophuis De Werkplaats

## 🗓️ Planning van de week

| Dag | Wat |
|-----|-----|
| **Maandag** | Project + repository opzetten, ERD maken (`docs/erd.png`) en **laten aftekenen**. Daarna migrations en seeders |
| **Dinsdag** | Catalogus (overzicht, detail, relaties, zoeken, paginatie) en beheer (CRUD met validatie) |
| **Woensdag** | Breeze, rollen, middleware en Gate. Daarna reviews met een Policy |
| **Donderdag** | Bestellen: formulier, opslaan met de prijs van dat moment, eigen overzicht, annuleren |
| **Vrijdag** | FormRequests, Nederlandse foutmeldingen, checklist afmaken. **Aan het eind van de dag laat je alles aftekenen** |
| **Week erna** | Mondeling assessment |

> ⚠️ **Vrijdag is de deadline om af te tekenen.** Zonder aftekening kun je de week erna niet mondeling beoordeeld worden. Laat je werk gedurende de week tussentijds checken.

## Project setup

1. Maak in Laravel Herd een nieuwe site met de naam van je thema (No Starter Kit, met git repo).
2. Maak een lege GitHub-repository met dezelfde naam en push je project.
3. Kopieer [commitcheck.yml](../projectlessen/commitcheck.yml) naar `.github/workflows/commitcheck.yml`.
4. Zet de link naar je repository in de Moodle-opdracht.

## Let op: geen kant-en-klaar databaseontwerp

In het verhaal van de opdrachtgever staan **geen tabellen of kolommen**. Leid je ERD zelf af, net als in 6A. Let daarnaast op:

- **Bestellen** is een **veel-op-veel** relatie: een bestelling heeft meerdere producten, en een product zit in meerdere bestellingen. Je hebt dus een koppeltabel nodig, met extra kolommen voor het aantal en de prijs van dat moment.
- Iedere gebruiker staat in **één** tabel `users`, met `role_id` als foreign key naar `roles`.

> ✅ **Laat je ERD op maandag aftekenen voordat je de migrations maakt.**

## Technische eisen

### Database (H1, H2, H6, H10)
- Tabellen `roles` en `users` (met `role_id`), een categorietabel, een hoofdtabel, reviews, bestellingen en een koppeltabel voor bestelregels
- Foreign keys in je migrations; bewuste keuzes voor `nullable()`
- Geld in **centen** (integer)
- Seeders: één admin en twee klanten met een bekend wachtwoord, minimaal **15 rijen** in je hoofdtabel, een paar reviews en bestellingen
- `php artisan migrate:fresh --seed` werkt zonder fouten

### Catalogus en beheer (H1 – H7)
- Layout-component met prop `title`, gebruikt door alle views (ook de Breeze-pagina's)
- Overzicht en detail met relaties in beide richtingen, route model binding en eager loading
- Zoeken, en **paginatie** op het overzicht
- Resource-CRUD voor je hoofdtabel, met validatie, `old()`, `@error` en flash messages

### Toegang (H8)
- Registreren, inloggen en uitloggen met Breeze; een nieuwe gebruiker krijgt **op de server** de rol klant
- `@auth` / `@guest` in de navigatie
- Schrijfroutes in een `auth`-middlewaregroep
- Een Gate voor het beheer, gebruikt in de controller én in de views. Een klant krijgt een 403

### Reviews (H9)
- Reviews via een geneste route; `user_id` komt van `Auth::id()`
- Een Policy: een klant verwijdert alleen zijn eigen review, een admin elke review
- Gemiddeld cijfer bij elk product (ook zonder reviews geen fout)

### Bestellen (H10)
- Bestelling plaatsen met `attach()` op de koppeltabel; de prijs van **dat moment** staat in de bestelregel
- Totaalbedrag berekend **op de server**
- Een klant ziet een gepagineerd overzicht van **eigen** bestellingen en de details per bestelling
- Annuleren via een status; een klant kan andermans bestelling niet openen of annuleren (403)

### Kwaliteit (H11)
- Validatie in **FormRequest**-classes, geen `validate()` meer in je controllers
- Nederlandse foutmeldingen

### Git
- Elke commit begint met de userstory: `US12: sla prijs op in bestelregel`
- Elke projectdag commits; geen grote commits met alles in één keer

## ✅ Checklist (aftekenen op vrijdag)

**Database**
- [ ] ERD afgetekend op maandag en opgeleverd als `docs/erd.png`
- [ ] ERD klopt met je migrations, inclusief koppeltabel en `roles`
- [ ] `migrate:fresh --seed` werkt, met admin, klanten en genoeg testdata

**Functionaliteit**
- [ ] Alle userstories van je thema werken
- [ ] Catalogus met relaties, eager loading, zoeken en paginatie
- [ ] Beheer met validatie en flash messages, alleen voor de admin
- [ ] Reviews met Policy en gemiddeld cijfer
- [ ] Bestellen, eigen overzicht en annuleren
- [ ] Oude bestelling toont de oude prijs na een prijswijziging

**Security**
- [ ] Rol wordt op de server gezet, niet uit het formulier
- [ ] `user_id` komt altijd van `Auth::id()`
- [ ] Middleware, Gate en Policy: een klant kan via de URL niets wat niet mag
- [ ] Totaalbedrag en prijzen komen van de server

**Code en Git**
- [ ] FormRequests met Nederlandse foutmeldingen
- [ ] Logische namen, geen dubbele code
- [ ] Commits met `US<n>:` ervoor, verspreid over de week; commitcheck is groen

| Onderdeel | Datum | Paraaf docent |
|-----------|-------|---------------|
| ERD (maandag) | | |
| Eindoplevering (vrijdag) | | |

## 🗣️ Voorbereiding op het mondeling

Alles uit de voorbereiding van [Eindproject 6A](../eindprojecten%206A/Eindproject%20Blok%206A.md), en daarnaast:
- Waarom je een koppeltabel nodig hebt, en waarom de prijs ook in je bestelregel staat
- Het verschil tussen middleware, een Gate en een Policy, en waar je ze elk gebruikt
- Waarom de rol en het `user_id` nooit uit het formulier komen
- Wat een FormRequest doet, en wat er gebeurt als `authorize()` `false` teruggeeft
- Hoe je zorgt dat een klant alleen zijn eigen bestellingen ziet
- Een willekeurige regel uit je eigen code: wat doet die, en waarom staat die er?
