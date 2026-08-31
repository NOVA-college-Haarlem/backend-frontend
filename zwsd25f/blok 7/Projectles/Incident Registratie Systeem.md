# Incident Registratie Systeem

## Projectomschrijving: Incident Registratie Systeem

### Opdrachtgever
Een school of bedrijf wil een systeem om veiligheids- en incidentmeldingen (bijv. ongevallen, bijna-ongevallen, vandalisme) centraal te registreren, op te volgen en af te handelen.

### Functionele eisen

Melders (medewerkers/studenten) kunnen:

- Een incident melden via een formulier (titel, beschrijving, locatie, datum/tijd, type incident)
- Eventueel foto’s of documenten toevoegen (optioneel, als bonus)
- De status van hun eigen meldingen bekijken (bijv. nieuw, in onderzoek, opgelost, gesloten)

Coördinatoren (bijv. arbo-/veiligheidscoördinator) kunnen:

- Alle binnengekomen incidentmeldingen inzien en filteren (op type, datum, status, locatie)
- Incidenten toewijzen aan verantwoordelijken (bijv. conciërge, teamleider)
- De status en voortgang bijwerken (notities toevoegen, acties registreren)
- Overzichten en eenvoudige statistieken bekijken (aantal incidenten per type, periode, locatie)

Beheerders kunnen:

- Types incidenten en locaties beheren (toevoegen/bewerken/verwijderen)
- Rollen en gebruikers beheren

### Technische eisen

- Laravel (nieuwste stabiele versie)
- Database met minimaal: `users`, `incidents`, `incident_types`, `locations`
- Authenticatie (Laravel Breeze of Fortify)
- Autorisatie via rollen (bijv. melder/coördinator/admin)

### Aan de slag

- **Bespreek samen**: Welke incidenttypen zijn relevant (ongevallen, bijna-ongevallen, schade, gedrag, anders)?  
  Welke rollen zijn er in jullie systeem?  
  Welke informatie is minimaal verplicht om een melding te kunnen doen?
- **Maak een ERD**: Schets jullie database-structuur voordat je begint.
- **Verdeel het werk**: Wie werkt aan de backend (models, controllers, policies), wie werkt aan de views en UX?

### Github

Maak een nieuwe repository aan op Github.
Zorg ervoor dat je samen kunt werken aan het project door de andere gebruiker een link te geven naar de repository.


Voor authorisatie kun je gebruik maken van Laravel Breeze of van de eerste gebruikte starter kit:

https://github.com/LaravelDaily/starter-kit/

### Eerste stappen in Laravel

```bash
composer create-project laravel/laravel incident-registratie
cd incident-registratie
php artisan make:model Incident -mcr
php artisan make:model IncidentType -mcr
php artisan make:model Location -mcr
```

### Bonusfunctionaliteit (als er tijd over is)

- Uploaden van bijlagen (foto’s, PDF-rapporten) bij een incident
- Exporteren van incidenten naar CSV/Excel
- E-mailnotificaties bij nieuwe meldingen of statuswijzigingen
- Dashboard met grafieken (incidenten per maand, per type, per locatie)

### Tip

Commit regelmatig, werk met feature-branches en gebruik issues/board om taken te verdelen. Succes!

---

## Sprintbacklog

Zie `Sprintplanning Projectlessen.md` voor het volledige 8-weken-overzicht en `Scrum Introductie.md` voor hoe je hiermee werkt.

### Sprint 1 - MVP: melden en volgen
- Als melder wil ik een account kunnen aanmaken en inloggen
- Als melder wil ik een incident kunnen melden (titel, beschrijving, locatie, datum/tijd, type incident)
- Als melder wil ik mijn eigen meldingen en hun status kunnen bekijken

### Sprint 2 - Coördinator: opvolgen
- Als coördinator wil ik alle meldingen kunnen inzien en filteren (op type, datum, status, locatie)
- Als coördinator wil ik een incident aan een verantwoordelijke kunnen toewijzen
- Als coördinator wil ik de status kunnen bijwerken en notities kunnen toevoegen

### Sprint 3 - Beheer
- Als beheerder wil ik incidenttypes en locaties kunnen beheren (toevoegen/bewerken/verwijderen)
- Als beheerder wil ik gebruikers en rollen kunnen beheren
- Als melder wil ik verplichte velden ingevuld moeten hebben voordat ik mijn melding kan versturen

**→ Projectweek 1 + tussentijds assessment (zie `Sprintplanning Projectlessen.md`)**

### Sprint 4 - Overzicht en verfijning
- Als coördinator wil ik overzichten en eenvoudige statistieken zien (aantal incidenten per type, periode, locatie)
- Als melder wil ik duidelijke status-updates zien op mijn melding
- Als gebruiker wil ik duidelijke succes- en foutmeldingen zien bij elke actie

### Sprint 5 - Bonusfunctionaliteit
- Als melder wil ik een foto of document kunnen toevoegen aan mijn melding
- Als coördinator wil ik incidenten kunnen exporteren naar CSV
- Als melder/coördinator wil ik een e-mailnotificatie krijgen bij een nieuwe melding of statuswijziging

### Sprint 6 - Kwaliteit en afronding
- Als coördinator wil ik een dashboard met grafieken zien (incidenten per maand, per type, per locatie)
- Als team willen we alle rollen en autorisatie grondig testen
- Als team willen we de code opschonen en documenteren (README)

**→ Projectweek 2: eindoplevering en demo**

