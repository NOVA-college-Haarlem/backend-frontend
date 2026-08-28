# Helpdesk Ticketsysteem

## Projectomschrijving: Helpdesk Ticketsysteem

### Opdrachtgever
Een IT-afdeling van een school of bedrijf wil een digitaal systeem om IT-problemen te registreren, tickets toe te wijzen aan medewerkers en de status van deze tickets te volgen.

### Functionele eisen

Gebruikers (melders) kunnen:

- IT-problemen melden via een formulier (titel, beschrijving, prioriteit, categorie)
- De status van hun eigen tickets bekijken (bijv. nieuw, in behandeling, opgelost, gesloten)
- Reacties/updates van de helpdesk op hun tickets lezen
- Eventueel aanvullingen of reacties plaatsen op hun eigen ticket

Medewerkers (helpdesk) kunnen:

- Binnengekomen tickets inzien en filteren (op status, prioriteit, categorie, medewerker)
- Tickets aan zichzelf of collega’s toewijzen
- De status van een ticket aanpassen (bijv. nieuw → in behandeling → opgelost)
- Reacties plaatsen op tickets (vragen stellen, voortgang melden)

Beheerders kunnen:

- Categorieën en prioriteiten beheren (toevoegen/bewerken/verwijderen)
- Medewerkersaccounts beheren
- Overzichten en eenvoudige statistieken bekijken (aantal open tickets, gemiddelde afhandeltijd, tickets per categorie)

### Technische eisen

- Laravel (nieuwste stabiele versie)
- Database met minimaal: `users`, `tickets`, `categories`, `ticket_statuses` (of status als kolom in `tickets`), `ticket_assignments` (of een `assigned_to`-kolom in `tickets`)
- Authenticatie (Laravel Breeze of Fortify)
- Autorisatie via rollen (bijv. user/medewerker/admin)

### Aan de slag

- **Bespreek samen**: Welke statussen gebruiken jullie? (bijv. nieuw, in behandeling, on hold, opgelost, gesloten)  
  Welke prioriteiten zijn er? (laag, normaal, hoog, kritiek)  
  Welke categorieën zijn belangrijk? (netwerk, hardware, software, account, overig)
- **Maak een ERD**: Schets jullie database-structuur voordat je begint.
- **Verdeel het werk**: Wie richt de modellen/migrations/controllers in, wie maakt de views en styling?
  
### Github

Maak een nieuwe repository aan op Github.
Zorg ervoor dat je samen kunt werken aan het project door de andere gebruiker een link te geven naar de repository.

Voor authorisatie kun je gebruik maken van Laravel Breeze of van de eerste gebruikte starter kit:

https://github.com/LaravelDaily/starter-kit/

### Eerste stappen in Laravel

```bash
composer create-project laravel/laravel helpdesk-ticketsysteem
cd helpdesk-ticketsysteem
php artisan make:model Ticket -mcr
php artisan make:model Category -mcr
php artisan make:model TicketStatus -mcr
```

Kies zelf of je een aparte `TicketStatus`-tabel gebruikt, of statussen als enum/string-kolom in `tickets` opslaat.

### Bonusfunctionaliteit (als er tijd over is)

- E-mailnotificatie bij nieuwe tickets of statuswijzigingen
- Zoeken en filteren op meerdere velden tegelijk (status, prioriteit, categorie, meldingsdatum)
- Bijlagen uploaden bij een ticket (schermafbeeldingen, logs)
- Dashboard voor medewerkers met eigen openstaande tickets en takenlijst

### Tip

Commit regelmatig en werk met feature-branches. Succes!

---

## Sprintbacklog

Zie `Sprintplanning Projectlessen.md` voor het volledige 8-weken-overzicht en `Scrum Introductie.md` voor hoe je hiermee werkt.

### Sprint 1 - MVP: melden en volgen
- Als bezoeker wil ik een account kunnen aanmaken en inloggen zodat ik toegang krijg tot het systeem
- Als melder wil ik een ticket kunnen aanmaken met titel, beschrijving, prioriteit en categorie zodat mijn probleem geregistreerd wordt
- Als melder wil ik mijn eigen tickets in een overzicht zien zodat ik weet wat ik heb gemeld
- Als melder wil ik de status van mijn ticket zien (nieuw/in behandeling/opgelost/gesloten)

### Sprint 2 - Medewerker: behandelen
- Als medewerker wil ik alle binnengekomen tickets zien zodat ik weet wat er speelt
- Als medewerker wil ik tickets kunnen filteren op status/prioriteit/categorie zodat ik snel het juiste ticket vind
- Als medewerker wil ik een ticket aan mezelf of een collega kunnen toewijzen
- Als medewerker wil ik de status van een ticket kunnen aanpassen

### Sprint 3 - Reacties en beheer
- Als medewerker wil ik een reactie op een ticket kunnen plaatsen zodat de melder op de hoogte blijft
- Als melder wil ik reacties van de helpdesk op mijn ticket kunnen lezen
- Als beheerder wil ik categorieën en prioriteiten kunnen beheren (toevoegen/bewerken/verwijderen)
- Als beheerder wil ik medewerkersaccounts kunnen beheren

**→ Projectweek 1 + tussentijds assessment (zie `Sprintplanning Projectlessen.md`)**

### Sprint 4 - Overzicht en verfijning
- Als beheerder wil ik een overzicht zien met eenvoudige statistieken (aantal open tickets, gemiddelde afhandeltijd, tickets per categorie)
- Als melder wil ik zelf een aanvulling/reactie op mijn eigen ticket kunnen plaatsen
- Als gebruiker wil ik duidelijke succes- en foutmeldingen zien bij elke actie

### Sprint 5 - Bonusfunctionaliteit
- Als melder wil ik een e-mailnotificatie ontvangen bij een statuswijziging van mijn ticket
- Als medewerker wil ik tickets kunnen zoeken op meerdere velden tegelijk (status, prioriteit, categorie, meldingsdatum)
- Als medewerker wil ik een dashboard met mijn eigen openstaande tickets zien

### Sprint 6 - Kwaliteit en afronding
- Als gebruiker wil ik dat het systeem responsive is zodat het ook op mobiel werkt
- Als team willen we alle rollen en autorisatie grondig testen zodat niemand bij data komt die niet voor hem is
- Als team willen we de code opschonen en documenteren (README) zodat het project overdraagbaar is

**→ Projectweek 2: eindoplevering en demo**

