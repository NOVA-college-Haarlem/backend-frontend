# Project 5B: Fietsverhuur

## Introductie

Je hebt een intakegesprek met Joost, eigenaar van fietsverhuur "Trapkracht" vlak bij het station. Hij vertelt:

> "Toeristen en dagjesmensen huren bij ons fietsen om naar het strand of door de duinen te fietsen. We hebben stadsfietsen, e-bikes, tandems en bakfietsen. Reserveren gaat nu via de telefoon en een schrift achter de balie, en dat gaat regelmatig mis: twee mensen op dezelfde fiets.
>
> Op de website wil ik alle fietsen laten zien: het type, het merk, de framemaat, een foto en de **dagprijs**. Bezoekers willen kunnen filteren op type én op framemaat, en sorteren op dagprijs.
>
> Klanten maken een account aan en **reserveren** een fiets voor een of meer dagen: een ophaaldatum en een terugbrengdatum. Een klant kan natuurlijk vaker huren, maar elke reservering is voor één fiets. Een fiets kan in de loop van het jaar vaak gereserveerd worden. Onze prijzen veranderen elk voorjaar, dus bij een reservering moet de **totaalprijs van dat moment** bewaard blijven. Op de pagina van een fiets moet een klant met één klik kunnen zien of de fiets in een bepaalde periode **nog vrij** is, zonder dat de pagina opnieuw laadt.
>
> Als een fiets wordt teruggebracht, noteren we de **inleverdatum**. Zolang de fiets nog onderweg is, is die nog niet bekend. Soms schrijven we er een **opmerking** bij, zoals 'lekke band' - maar meestal niet.
>
> Mijn medewerkers loggen in op een beheeromgeving. Ze voegen fietsen toe, passen dagprijzen aan, en halen kapotte fietsen uit de verhuur - maar die moeten terug te zetten zijn als ze gerepareerd zijn. Ze willen alle reserveringen zien met de klant en de fiets erbij, en een lijst van fietsen die **nog nooit verhuurd** zijn - die verkopen we misschien.
>
> Verder wil ik weten: hoeveel fietsen hebben we per type, wat is de gemiddelde dagprijs, wat is de goedkoopste en duurste fiets, en wat is de totale omzet per type? En welke types zijn **meer dan vijf keer** verhuurd? Tot slot wil ik kunnen zien welke medewerker wat heeft aangepast."

Jij gaat deze applicatie voor Trapkracht bouwen. Setup, technische eisen en checklist staan in **[Eindproject Blok 5B.md](Eindproject%20Blok%205B.md)**.

## Userstories

### Bezoeker
1. Als bezoeker wil ik een overzicht van alle beschikbare fietsen zien. *(H1)*
2. Als bezoeker wil ik op een fiets klikken voor de detailpagina. Bestaat de fiets niet, dan zie ik een nette 404-pagina. *(H7)*
3. Als bezoeker wil ik filteren op type én framemaat tegelijk. De keuzelijst met types komt uit de database, zonder dubbele waardes. *(H6, DISTINCT)*
4. Als bezoeker wil ik de fietsen sorteren op dagprijs, laag-hoog en hoog-laag. *(ORDER BY)*

### Klant
5. Als bezoeker wil ik een account aanmaken; mijn wachtwoord wordt gehasht opgeslagen en het formulier wordt gecontroleerd. *(H2)*
6. Als klant wil ik inloggen en uitloggen. *(H2)*
7. Als klant wil ik een fiets reserveren voor een ophaal- en terugbrengdatum; de totaalprijs wordt op de server berekend en bewaard. Een terugbrengdatum vóór de ophaaldatum geeft een foutmelding. *(H1, H2)*
8. Als klant wil ik op de pagina van een fiets met één klik zien of die in een bepaalde periode nog vrij is, zonder dat de pagina herlaadt. *(H4, AJAX)*
9. Als klant wil ik een overzicht van **mijn** reserveringen zien, met het type en merk van de fiets en de totaalprijs. *(H6, LEFT JOIN)*
10. Als klant wil ik mijn eigen gegevens kunnen aanpassen. *(H3)*

### Medewerker
11. Als medewerker wil ik inloggen op een apart beheergedeelte. Een klant die een beheerpagina opent, ziet een 403-pagina. *(H5, H7)*
12. Als medewerker wil ik een nieuwe fiets toevoegen; lege of foute velden geven een foutmelding. *(H1, H2)*
13. Als medewerker wil ik de dagprijs van een fiets aanpassen, en bij een reservering de inleverdatum en een opmerking invullen. Inleverdatum en opmerking mogen leeg zijn. *(H3, NULL)*
14. Als medewerker wil ik een fiets uit de verhuur halen zonder dat die echt verwijderd wordt, en hem later terugzetten. *(H4)*
15. Als medewerker wil ik een overzicht van alle reserveringen, met de klant en de fiets erbij. *(H6, LEFT JOIN)*
16. Als medewerker wil ik een lijst van fietsen die **nog nooit verhuurd** zijn. *(LEFT JOIN)*
17. Als eigenaar wil ik een statistiekenpagina met: het aantal fietsen per type, de gemiddelde, laagste en hoogste dagprijs, de omzet per type, en de types die meer dan vijf keer verhuurd zijn. *(COUNT, AVG, MIN, MAX, SUM, GROUP BY, HAVING)*
18. Als eigenaar wil ik een logboek zien van wie wat heeft gedaan in het beheergedeelte. *(H5)*

### Developer
19. Als developer wil ik dat alle queries via PDO met prepared statements lopen en alle output via `htmlspecialchars()`. *(H1, H2)*
20. Als developer wil ik dat formulieren alleen via `POST` verwerkt worden en dat id's in de URL gecontroleerd worden met `is_numeric()`. *(H5)*
21. Als developer wil ik dat databasefouten worden afgevangen met `try`/`catch` en dat de gebruiker een 500-pagina ziet. *(H7)*
