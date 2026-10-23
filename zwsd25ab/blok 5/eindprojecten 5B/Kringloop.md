# Project 5B: Kringloop

## Introductie

Je hebt een intakegesprek met Dewi, bedrijfsleider van kringloopwinkel "Tweede Ronde". Ze vertelt:

> "Mensen brengen bij ons meubels, kleding, servies, elektronica en speelgoed, en wij verkopen dat voor een kleine prijs. Elke dag komt er van alles binnen en gaat er van alles weg. Klanten bellen steeds of 'die groene bank' er nog staat, en tegen de tijd dat ze er zijn, is hij verkocht.
>
> Op de website wil ik alle artikelen laten zien: naam, categorie, een foto, een omschrijving, de **staat** (als nieuw, goed of gebruikt) en de prijs. Klanten willen kunnen filteren op categorie én staat, en sorteren op prijs of op hoe nieuw het artikel in de winkel is.
>
> Klanten maken een account aan en kunnen een artikel **reserveren**: dan leggen wij het drie dagen apart. Een klant kan meerdere artikelen reserveren, en als een reservering verloopt, kan een andere klant hetzelfde artikel reserveren - dus een artikel kan door meerdere klanten na elkaar gereserveerd zijn. Reserveren moet met één klik gaan, zonder dat de pagina opnieuw laadt.
>
> Veel spullen worden gebracht door vaste **donateurs**, en die willen we graag bedanken - van hen bewaren we naam en telefoonnummer. Maar heel veel spullen worden ook **anoniem** gebracht: dan weten we niet van wie het artikel is, en dat is prima. Bij elk artikel noteren we de datum van binnenkomst, en als het verkocht is ook de **verkoopdatum** - die is er natuurlijk nog niet zolang het artikel in de winkel staat.
>
> Mijn medewerkers loggen in op een beheeromgeving. Ze voegen artikelen toe, passen prijzen aan, en halen artikelen uit de winkel als ze kapot blijken - maar die willen we terug kunnen zetten. Ze willen alle reserveringen zien met de klant en het artikel erbij, en een lijst van alle donateurs, **ook die nog niets gebracht hebben**, met het aantal artikelen dat ze gebracht hebben.
>
> En ik wil cijfers: hoeveel artikelen hebben we per categorie, wat is de gemiddelde prijs, wat is het goedkoopste en duurste artikel, en wat hebben we in totaal verkocht? Ook wil ik zien welke categorieën een **gemiddelde prijs boven de 20 euro** hebben. Tot slot wil ik zien welke medewerker wat heeft aangepast."

Jij gaat deze applicatie voor Tweede Ronde bouwen. Setup, technische eisen en checklist staan in **[Eindproject Blok 5B.md](Eindproject%20Blok%205B.md)**.

## Userstories

### Bezoeker
1. Als bezoeker wil ik een overzicht van alle artikelen zien die nog te koop zijn. *(H1)*
2. Als bezoeker wil ik op een artikel klikken voor de detailpagina. Bestaat het artikel niet, dan zie ik een nette 404-pagina. *(H7)*
3. Als bezoeker wil ik filteren op categorie én staat tegelijk. De keuzelijst met categorieën komt uit de database, zonder dubbele waardes. *(H6, DISTINCT)*
4. Als bezoeker wil ik de artikelen sorteren op prijs en op datum van binnenkomst, oplopend en aflopend. *(ORDER BY)*

### Klant
5. Als bezoeker wil ik een account aanmaken; mijn wachtwoord wordt gehasht opgeslagen en het formulier wordt gecontroleerd. *(H2)*
6. Als klant wil ik inloggen en uitloggen. *(H2)*
7. Als klant wil ik met één klik een artikel reserveren, zonder dat de pagina herlaadt. Is het artikel al gereserveerd, dan krijg ik een melding. *(H4, AJAX)*
8. Als klant wil ik een overzicht van **mijn** reserveringen zien, met de naam, categorie en prijs van het artikel. *(H6, INNER JOIN)*
9. Als klant wil ik mijn eigen gegevens kunnen aanpassen. *(H3)*

### Medewerker
10. Als medewerker wil ik inloggen op een apart beheergedeelte. Een klant die een beheerpagina opent, ziet een 403-pagina. *(H5, H7)*
11. Als medewerker wil ik een nieuw artikel toevoegen en optioneel een donateur kiezen; zonder donateur is het artikel anoniem. Lege of foute velden geven een foutmelding. *(H1, H2, NULL)*
12. Als medewerker wil ik de prijs van een artikel aanpassen en een artikel als verkocht markeren (verkoopdatum invullen). *(H3)*
13. Als medewerker wil ik een artikel uit de winkel halen zonder dat het echt verwijderd wordt, en het later terugzetten. *(H4)*
14. Als medewerker wil ik een overzicht van alle reserveringen, met de klant en het artikel erbij. *(H6, INNER JOIN)*
15. Als medewerker wil ik een lijst van **alle** donateurs met het aantal gebrachte artikelen - ook donateurs met 0 artikelen. *(LEFT JOIN, COUNT, GROUP BY)*
16. Als bedrijfsleider wil ik een statistiekenpagina met: het aantal artikelen per categorie, de gemiddelde, laagste en hoogste prijs, de totale verkoopopbrengst, en de categorieën met een gemiddelde prijs boven de 20 euro. *(COUNT, AVG, MIN, MAX, SUM, GROUP BY, HAVING)*
17. Als bedrijfsleider wil ik een logboek zien van wie wat heeft gedaan in het beheergedeelte. *(H5)*

### Developer
18. Als developer wil ik dat alle queries via PDO met prepared statements lopen en alle output via `htmlspecialchars()`. *(H1, H2)*
19. Als developer wil ik dat formulieren alleen via `POST` verwerkt worden en dat id's in de URL gecontroleerd worden met `is_numeric()`. *(H5)*
20. Als developer wil ik dat databasefouten worden afgevangen met `try`/`catch` en dat de gebruiker een 500-pagina ziet. *(H7)*
