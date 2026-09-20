# Project 2: Library Management

## Introductie

Je hebt een intakegesprek met Fatima, bibliothecaris van bibliotheek "De Wijze Uil". Ze vertelt:

> "We hebben een mooie collectie boeken, maar we houden nog bij op papieren kaartjes wie welk boek heeft geleend. Regelmatig raken we het overzicht kwijt van wie wat heeft, en wanneer het terug moet.
>
> Ik wil een website waar bezoekers kunnen zien welke boeken we in de collectie hebben, met titel, auteur, categorie en een omslagfoto. Leden moeten kunnen inloggen op hun eigen account, en ik wil dat ze kunnen zien welke boeken zij op dit moment geleend hebben, en welke boeken ze in het verleden hebben geleend. Als een medewerker een boek uitleent, moet dat digitaal worden vastgelegd in plaats van op een kaartje.
>
> Mijn medewerkers moeten via een apart account kunnen inloggen op een beheeromgeving: nieuwe boeken toevoegen, bestaande boeken aanpassen, en zien wie welk boek heeft geleend. Gewone bezoekers mogen dat natuurlijk niet kunnen zien.
>
> Verder willen we, puur voor de post, de adresgegevens van onze leden bijhouden - denk aan een herinnering als een boek te laat wordt teruggebracht."

Jij gaat deze applicatie voor De Wijze Uil bouwen.

## Project setup

1. Kloon op Github het project [Docker Template](https://github.com/NOVA-college-Haarlem/docker-template) (je kunt de default settings aanhouden).
2. Kopieer de URL van de repository (via de groene knop "Code").
3. Open de map waarin je je projecten bewaart met VS Code.
4. Open de terminal en run `git clone <PASTE URL>`
5. In de Windows Verkenner (File Explorer): verander de naam "docker-template" naar de naam van je project, bijvoorbeeld "fitness" of "library".
6. Open dit project in VS Code.
7. In `.env` verander de naam `MYSQL_DATABASE` van "testdb" naar de naam van je project.
8. Open de terminal en run `docker compose up -d`.
9. Je website draait nu op http://localhost en PhpMyAdmin op http://localhost:8000/.

## Technische eisen

Deze eisen gelden voor alle projectthema's, ongeacht welk thema jouw groep heeft gekozen:

- **Rollen**: er zijn twee soorten gebruikers die kunnen inloggen: Medewerker en Lid. Pagina's die alleen voor medewerkers bedoeld zijn, moeten afgeschermd zijn met een sessie- én rolcheck.
- **PDO & prepared statements** (Hoofdstuk 1): al je queries gebruiken PDO met prepared statements - geen variabelen direct in een SQL-string.
- **Veilige data** (Hoofdstuk 2): wachtwoorden worden gehasht (`password_hash()` / `password_verify()`), alle getoonde data wordt ge-escaped met `htmlspecialchars()`, en formulieren worden gevalideerd vóórdat ze worden opgeslagen.
- **Database-ontwerp**: bedenk zelf, op basis van het verhaal hierboven, welke tabellen en kolommen je nodig hebt. Je database bevat minimaal **1 één-op-veel relatie**. Kun je ook een **één-op-één relatie** verantwoorden in je ontwerp? Dat mag, maar hoeft niet.
- **Optioneel** (Hoofdstuk 3): bouw Update-functionaliteit voor minimaal 1 van je tabellen (bijv. een medewerker die een boek kan aanpassen).

## Userstories

### Bezoeker

1. Als bezoeker wil ik een overzicht zien van alle boeken in de collectie, zodat ik snel kan bladeren door het aanbod.
2. Als bezoeker wil ik op een boek kunnen klikken om de detailpagina te bekijken, zodat ik meer informatie krijg.
3. Als bezoeker wil ik kunnen filteren op categorie en zoeken op titel of auteur, zodat ik snel een passend boek vind.

### Lid

4. Als lid wil ik kunnen inloggen, zodat ik toegang krijg tot mijn eigen omgeving.
5. Als lid wil ik mijn sessie kunnen beëindigen via een uitlog-link.
6. Als lid wil ik een boek kunnen lenen, zodat ik het mee naar huis kan nemen.
7. Als lid wil ik een overzicht zien van de boeken die ik heb geleend, ook boeken die ik al heb teruggebracht, zodat ik mijn geschiedenis kan terugvinden.
8. Als lid wil ik mijn eigen gegevens kunnen inzien, zodat ik weet wat er over mij bekend is.

### Medewerker

9. Als medewerker wil ik kunnen inloggen op een apart beheergedeelte, zodat gewone bezoekers dit niet kunnen zien.
10. Als medewerker wil ik een overzicht zien van alle boeken in tabelvorm, zodat ik weet wat er in de collectie zit.
11. Als medewerker wil ik een nieuw boek kunnen toevoegen, zodat de collectie up-to-date blijft.
12. Als medewerker wil ik zien wie welk boek heeft geleend, zodat ik kan bijhouden wat er nog terug moet komen.
13. Als medewerker wil ik een overzicht van alle leden kunnen bekijken en op naam kunnen zoeken, zodat ik snel iemand kan terugvinden.
14. Optioneel (Hoofdstuk 3): Als medewerker wil ik gegevens van een boek kunnen bijwerken, zodat foutieve informatie gecorrigeerd kan worden.
