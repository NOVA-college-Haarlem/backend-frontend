# Campus Parking Systeem

## Projectomschrijving: Campus Parking Systeem

### Opdrachtgever
Een school of bedrijfscampus wil een digitaal systeem om parkeerplaatsen te beheren. Medewerkers en studenten moeten een parkeerplaats kunnen reserveren, en beheerders willen inzicht in de bezetting.

### Functionele eisen
Gebruikers kunnen:

- Beschikbare parkeerplaatsen bekijken (per dag/tijdslot)
- Een parkeerplaats reserveren
- Hun eigen reserveringen inzien en annuleren
- Hun voertuig(en) registreren (kenteken, type)

Beheerders kunnen:

Parkeerplaatsen toevoegen, bewerken en verwijderen
Parkeerzones beheren (bijvoorbeeld: bezoekers, personeel, elektrisch)
Overzicht zien van alle reserveringen
Bezettingsgraad en statistieken bekijken

### Technische eisen

Laravel (nieuwste stabiele versie)
Database met minimaal: users, vehicles, parking_spots, reservations
Authenticatie (Laravel Breeze of Fortify)
Autorisatie via rollen (user/admin)

### Aan de slag

Bespreek samen: Hoeveel zones zijn er? Zijn er tijdslots of hele dagen? Mag iemand meerdere voertuigen hebben?
Maak een ERD: Schets jullie database-structuur voordat je begint
Verdeel het werk: Wie doet de backend/models, wie de views/styling?

### Github

Maak een nieuwe repository aan op Github.
Zorg ervoor dat je samen kunt werken aan het project door de andere gebruiker een link te geven naar de repository.


Voor authorisatie kun je gebruik maken van Laravel Breeze of van de eerste gebruikte starter kit:

https://github.com/LaravelDaily/starter-kit/


### Eerste stappen in Laravel
```bash
composer create-project laravel/laravel parking-campus
cd parking-campus
php artisan make:model Vehicle -mcr
php artisan make:model ParkingSpot -mcr
php artisan make:model Reservation -mcr
```

### Bonusfunctionaliteit (als er tijd over is)

Kalenderweergave van beschikbaarheid
E-mailbevestiging bij reservering
Check-in/check-out registratie met tijdstempel
Wachtlijst bij volle bezetting


Tip: Commit regelmatig en werk met feature-branches. Succes!

---

## Sprintbacklog

Zie `Sprintplanning Projectlessen.md` voor het volledige 8-weken-overzicht en `Scrum Introductie.md` voor hoe je hiermee werkt.

### Sprint 1 - MVP: voertuig en overzicht
- Als gebruiker wil ik een account kunnen aanmaken en inloggen
- Als gebruiker wil ik mijn voertuig(en) kunnen registreren (kenteken, type)
- Als gebruiker wil ik beschikbare parkeerplaatsen per dag/tijdslot kunnen bekijken

### Sprint 2 - Reserveren
- Als gebruiker wil ik een parkeerplaats kunnen reserveren voor een dag/tijdslot
- Als gebruiker wil ik mijn eigen reserveringen kunnen inzien
- Als gebruiker wil ik een reservering kunnen annuleren

### Sprint 3 - Beheer
- Als beheerder wil ik parkeerplaatsen kunnen toevoegen, bewerken en verwijderen
- Als beheerder wil ik parkeerzones kunnen beheren (bijv. bezoekers, personeel, elektrisch)
- Als gebruiker wil ik niet kunnen reserveren op een plek/tijdslot die al bezet is (dubbele reservering voorkomen)

**→ Projectweek 1 + tussentijds assessment (zie `Sprintplanning Projectlessen.md`)**

### Sprint 4 - Overzicht en verfijning
- Als beheerder wil ik een overzicht van alle reserveringen zien
- Als beheerder wil ik de bezettingsgraad en statistieken kunnen bekijken
- Als gebruiker wil ik een duidelijke foutmelding zien als een plek al bezet is

### Sprint 5 - Bonusfunctionaliteit
- Als gebruiker wil ik een e-mailbevestiging krijgen bij het maken van een reservering
- Als beheerder wil ik een kalenderweergave van de beschikbaarheid zien
- Als gebruiker wil ik mij op een wachtlijst kunnen zetten als alles bezet is

### Sprint 6 - Kwaliteit en afronding
- Als gebruiker wil ik dat het systeem responsive is zodat het ook op mobiel werkt
- Als team willen we autorisatie testen (kan een gebruiker bij andermans reservering of voertuig?)
- Als team willen we de code opschonen en documenteren (README)

**→ Projectweek 2: eindoplevering en demo**