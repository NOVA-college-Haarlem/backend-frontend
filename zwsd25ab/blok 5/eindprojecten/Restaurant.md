# Project 4: Restaurant

## Introductie

Je hebt een intakegesprek met Marco, eigenaar van restaurant "De Gouden Gerechten". Hij vertelt:

> "We hebben een mooie kaart met gerechten, maar mensen bellen ons de hele dag door om te vragen wat erop staat en om vast iets te bestellen om af te halen. Dat is met twee man in de keuken niet meer te doen.
>
> Ik wil een website waar bezoekers kunnen zien welke gerechten we serveren, met een omschrijving, categorie en een foto. Leden moeten kunnen inloggen op hun eigen account, en ik wil dat ze alvast een gerecht kunnen bestellen om af te halen - nu moet dat allemaal telefonisch, en dat kost te veel tijd. Een lid moet ook terug kunnen zien welke gerechten hij of zij heeft besteld, ook bestellingen die al zijn opgehaald.
>
> Mijn medewerkers moeten via een apart account kunnen inloggen op een beheeromgeving: nieuwe gerechten toevoegen, bestaande gerechten aanpassen, en zien wie welk gerecht besteld heeft. Gewone bezoekers mogen dat natuurlijk niet kunnen zien.
>
> Verder willen we, puur voor de post, de adresgegevens van onze leden bijhouden - denk aan een kortingskaart of een flyer bij een nieuw seizoensmenu."

Jij gaat deze applicatie voor De Gouden Gerechten bouwen.

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
- **Optioneel** (Hoofdstuk 3): bouw Update-functionaliteit voor minimaal 1 van je tabellen (bijv. een medewerker die een gerecht kan aanpassen).

## Userstories

### Bezoeker

1. Als bezoeker wil ik een overzicht zien van alle beschikbare gerechten, zodat ik snel kan bladeren door het menu.
2. Als bezoeker wil ik op een gerecht kunnen klikken om de detailpagina te bekijken, zodat ik meer informatie krijg.
3. Als bezoeker wil ik kunnen filteren op categorie en zoeken op naam, zodat ik snel een passend gerecht vind.

### Lid

4. Als lid wil ik kunnen inloggen, zodat ik toegang krijg tot mijn eigen omgeving.
5. Als lid wil ik mijn sessie kunnen beëindigen via een uitlog-link.
6. Als lid wil ik een gerecht kunnen bestellen, zodat ik het kan komen ophalen.
7. Als lid wil ik een overzicht zien van de gerechten die ik heb besteld, ook bestellingen die al zijn opgehaald, zodat ik mijn geschiedenis kan terugvinden.
8. Als lid wil ik mijn eigen gegevens kunnen inzien, zodat ik weet wat er over mij bekend is.

### Medewerker

9. Als medewerker wil ik kunnen inloggen op een apart beheergedeelte, zodat gewone bezoekers dit niet kunnen zien.
10. Als medewerker wil ik een overzicht zien van alle gerechten in tabelvorm, zodat ik weet wat er aangeboden wordt.
11. Als medewerker wil ik een nieuw gerecht kunnen toevoegen, zodat het menu up-to-date blijft.
12. Als medewerker wil ik zien wie welk gerecht besteld heeft, zodat ik de bestelling kan klaarzetten.
13. Als medewerker wil ik een overzicht van alle leden kunnen bekijken en op naam kunnen zoeken, zodat ik snel iemand kan terugvinden.
14. Optioneel (Hoofdstuk 3): Als medewerker wil ik gegevens van een gerecht kunnen bijwerken, zodat foutieve informatie gecorrigeerd kan worden.
