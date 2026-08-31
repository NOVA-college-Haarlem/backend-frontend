# Hardware Uitleen Systeem

## Projectomschrijving: Hardware Uitleensysteem

### Opdrachtgever
Een bedrijf/instelling wil een digitaal systeem om hun hardware (laptops, kabels, adapters, camera's, etc.) uit te lenen aan medewerkers of studenten.
### Functionele eisen

Gebruikers kunnen:

- Beschikbare hardware bekijken
- Een uitleenverzoek indienen
- Hun eigen uitleenhistorie inzien

Beheerders kunnen:
- Hardware toevoegen, bewerken en verwijderen
- Uitleenverzoeken goedkeuren of afwijzen
- Overzicht zien van alle uitleningen (actief, te laat, retour)

### Technische eisen

- Laravel (nieuwste stabiele versie)
- Database met minimaal: users, hardware_items, loans
- Authenticatie (Laravel Breeze of Fortify)
- Autorisatie via rollen (user/admin)

### Aan de slag

Bespreek samen: Welke hardware-categorieën zijn er? Wat is de uitleentermijn?
Maak een ERD: Schets jullie database-structuur voordat je begint
Verdeel het werk: Wie doet de backend/models, wie de views/styling?

### Github

Maak een nieuwe repository aan op Github.
Zorg ervoor dat je samen kunt werken aan het project door de andere gebruiker een link te geven naar de repository.


Voor authorisatie kun je gebruik maken van Laravel Breeze of van de eerste gebruikte starter kit:

https://github.com/LaravelDaily/starter-kit/

### Eerste stappen in Laravel
```bash
composer create-project laravel/laravel hardware-uitleen
cd hardware-uitleen
php artisan make:model HardwareItem -mcr
php artisan make:model Loan -mcr
```

### Bonusfunctionaliteit (als er tijd over is)

- E-mailnotificatie bij goedkeuring of te laat inleveren
- Zoeken en filteren op categorie
- QR-codes voor snelle registratie


### Tip: Commit regelmatig en werk met feature-branches. Succes!

---

## Sprintbacklog

Zie `Sprintplanning Projectlessen.md` voor het volledige 8-weken-overzicht en `Scrum Introductie.md` voor hoe je hiermee werkt.

### Sprint 1 - MVP: bekijken en aanvragen
- Als gebruiker wil ik een account kunnen aanmaken en inloggen
- Als gebruiker wil ik beschikbare hardware kunnen bekijken
- Als gebruiker wil ik een uitleenverzoek kunnen indienen

### Sprint 2 - Beheer en goedkeuring
- Als gebruiker wil ik mijn eigen uitleenhistorie kunnen inzien
- Als beheerder wil ik uitleenverzoeken kunnen goedkeuren of afwijzen
- Als beheerder wil ik hardware kunnen toevoegen, bewerken en verwijderen

### Sprint 3 - Overzicht van uitleningen
- Als beheerder wil ik een overzicht zien van alle uitleningen (actief, te laat, retour)
- Als gebruiker wil ik zien wanneer ik hardware moet terugbrengen
- Als beheerder wil ik een item als "geretourneerd" kunnen markeren

**→ Projectweek 1 + tussentijds assessment (zie `Sprintplanning Projectlessen.md`)**

### Sprint 4 - Categorieën en verfijning
- Als beheerder wil ik hardware kunnen indelen in categorieën
- Als gebruiker wil ik duidelijke statusmeldingen zien bij mijn verzoek (in afwachting/goedgekeurd/afgewezen)
- Als beheerder wil ik in één oogopslag zien welke items te laat zijn

### Sprint 5 - Bonusfunctionaliteit
- Als gebruiker wil ik een e-mailnotificatie krijgen bij goedkeuring van mijn verzoek of als een item te laat is
- Als gebruiker wil ik hardware kunnen zoeken en filteren op categorie
- Als beheerder wil ik (optioneel) een QR-code kunnen genereren voor snelle registratie

### Sprint 6 - Kwaliteit en afronding
- Als gebruiker wil ik dat het systeem responsive is zodat het ook op mobiel werkt
- Als team willen we autorisatie testen (kan een gebruiker bij andermans uitleenhistorie?)
- Als team willen we de code opschonen en documenteren (README)

**→ Projectweek 2: eindoplevering en demo**
