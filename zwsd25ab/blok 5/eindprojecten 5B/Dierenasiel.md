# Project 5B: Dierenasiel

## Introductie

Je hebt een intakegesprek met Mirjam, coördinator van dierenasiel "Pootjes & Co". Ze vertelt:

> "We vangen honden, katten, konijnen en knaagdieren op die een nieuw thuis zoeken. Nu hangen er foto's op een prikbord bij de ingang, en aanvragen komen binnen via mail, telefoon en briefjes. We raken het overzicht kwijt.
>
> Ik wil een website waar bezoekers alle dieren kunnen bekijken: naam, soort, ras, geslacht, een foto, een beschrijving van het karakter en de adoptieprijs. Van sommige dieren weten we de **geboortedatum** niet, omdat ze gevonden zijn - dan laten we dat veld leeg. Hetzelfde geldt voor de **chip**: niet elk dier heeft er een als het binnenkomt. Bezoekers willen kunnen zoeken op soort én op geslacht tegelijk, en het aanbod sorteren op prijs of op naam.
>
> Wie een dier wil adopteren, maakt een account aan en dient een **adoptie-aanvraag** in. Iemand kan voor meerdere dieren een aanvraag doen, en voor een populair dier komen vaak meerdere aanvragen binnen. Bij elke aanvraag willen we de datum weten, een korte motivatie, en de status: nieuw, goedgekeurd of afgewezen. Het indienen moet snel gaan - gewoon één klik op de pagina van het dier, zonder dat alles opnieuw laadt.
>
> Onze verzorgers loggen in op een beheeromgeving. Zij voegen nieuwe dieren toe, passen gegevens aan en zetten dieren die geadopteerd zijn uit de lijst - maar we willen ze nooit écht kwijt, voor ons archief. Ze willen alle aanvragen zien met het dier en de aanvrager erbij, en ook een lijst van dieren **waar nog niemand op heeft gereageerd**, zodat we die extra kunnen promoten.
>
> En ik wil cijfers: hoeveel dieren hebben we per soort, wat is de gemiddelde adoptieprijs, wat is de goedkoopste en duurste adoptie, en hoeveel hebben goedgekeurde adopties dit jaar opgebracht? Ook wil ik zien welke soorten **meer dan drie** aanvragen hebben gekregen. Tot slot wil ik terug kunnen zien welke verzorger wat heeft aangepast."

Jij gaat deze applicatie voor Pootjes & Co bouwen. Setup, technische eisen en checklist staan in **[Eindproject Blok 5B.md](Eindproject%20Blok%205B.md)**.

## Userstories

### Bezoeker
1. Als bezoeker wil ik een overzicht van alle beschikbare dieren zien, zodat ik kan bladeren door het aanbod. *(H1)*
2. Als bezoeker wil ik op een dier klikken voor de detailpagina. Bestaat het dier niet, dan zie ik een nette 404-pagina. *(H7)*
3. Als bezoeker wil ik filteren op soort én geslacht tegelijk. De keuzelijst met soorten komt uit de database, zonder dubbele waardes. *(H6, DISTINCT)*
4. Als bezoeker wil ik de dieren sorteren op prijs (laag-hoog en hoog-laag) en op naam. *(ORDER BY)*

### Lid
5. Als bezoeker wil ik een account aanmaken; mijn wachtwoord wordt gehasht opgeslagen en het formulier wordt gecontroleerd. *(H2)*
6. Als lid wil ik inloggen en uitloggen. *(H2)*
7. Als lid wil ik op de detailpagina met één klik een adoptie-aanvraag indienen, zonder dat de pagina herlaadt. Heb ik al een aanvraag voor dit dier, dan krijg ik daar een melding van. *(H4, AJAX)*
8. Als lid wil ik een overzicht van **mijn** aanvragen zien, met de naam en soort van het dier en de status. *(H6, INNER JOIN)*
9. Als lid wil ik mijn eigen gegevens kunnen aanpassen. *(H3)*

### Medewerker (verzorger)
10. Als verzorger wil ik inloggen op een apart beheergedeelte. Een lid dat een beheerpagina opent, ziet een 403-pagina. *(H5, H7)*
11. Als verzorger wil ik een nieuw dier toevoegen; lege of foute velden geven een foutmelding. Geboortedatum en chipnummer mogen leeg blijven. *(H1, H2, NULL)*
12. Als verzorger wil ik de gegevens van een dier en de status van een aanvraag kunnen aanpassen. *(H3)*
13. Als verzorger wil ik een dier uit de lijst halen zonder dat het echt verwijderd wordt, en het later kunnen terugzetten. *(H4)*
14. Als verzorger wil ik een overzicht van alle aanvragen, met het dier en de aanvrager erbij. *(H6, INNER JOIN)*
15. Als verzorger wil ik een lijst van dieren **zonder aanvragen** zien. *(LEFT JOIN)*
16. Als coördinator wil ik een statistiekenpagina met: het aantal dieren per soort, de gemiddelde, laagste en hoogste adoptieprijs, de opbrengst van goedgekeurde adopties, en de soorten met meer dan drie aanvragen. *(COUNT, AVG, MIN, MAX, SUM, GROUP BY, HAVING)*
17. Als coördinator wil ik een logboek zien van wie wat heeft gedaan in het beheergedeelte. *(H5)*

### Developer
18. Als developer wil ik dat alle queries via PDO met prepared statements lopen en alle output via `htmlspecialchars()`. *(H1, H2)*
19. Als developer wil ik dat formulieren alleen via `POST` verwerkt worden en dat id's in de URL gecontroleerd worden met `is_numeric()`. *(H5)*
20. Als developer wil ik dat databasefouten worden afgevangen met `try`/`catch` en dat de gebruiker een 500-pagina ziet. *(H7)*
