# Project 5B: Camping

## Introductie

Je hebt een intakegesprek met Henk en Ayşe, de eigenaren van camping "De Duinpan". Ze vertellen:

> "We hebben ruim veertig plekken: tentplaatsen, caravanplaatsen en een paar chalets. Sommige plekken hebben **stroom**, andere niet, en sommige liggen aan het water. In de zomer zijn we vol, en dan bellen mensen de hele dag om te vragen of er nog iets vrij is.
>
> Op de website willen we alle plekken laten zien: het nummer, het soort plek, de grootte in vierkante meters, of er stroom is, een foto, het maximaal aantal personen en de **prijs per nacht**. Gasten willen kunnen filteren op soort plek én op stroom, en sorteren op prijs of grootte.
>
> Gasten maken een account aan en **reserveren** een plek: een aankomstdatum, een vertrekdatum en het aantal personen. Een gast komt vaak elk jaar terug, maar elke reservering is voor één plek. Een plek wordt in een seizoen vaak gereserveerd. Bij een reservering kan een gast een **opmerking** achterlaten, zoals 'we komen pas laat aan' - maar dat hoeft niet. En als iemand een **kenteken** opgeeft, mag die op de camping parkeren; zonder kenteken kan dat niet, en dat is ook prima. De prijs van de hele reservering moet bewaard blijven, ook als wij volgend jaar de prijzen verhogen. Op de pagina van een plek moet een gast met één klik kunnen zien of de plek in een bepaalde week **nog vrij** is, zonder dat de pagina opnieuw laadt.
>
> Wij en ons personeel loggen in op een beheeromgeving. We voegen plekken toe, passen prijzen aan, en zetten een plek uit als er onderhoud is - die moet daarna weer terug te zetten zijn. We willen alle reserveringen zien met de gast en de plek erbij, en een lijst van plekken die **dit seizoen nog niet gereserveerd** zijn, zodat we daar een aanbieding voor kunnen maken.
>
> Verder willen we weten: hoeveel plekken hebben we per soort, wat is de gemiddelde prijs per nacht, wat is de goedkoopste en duurste plek, wat is de totale omzet per soort plek, en wat is het gemiddelde aantal personen per reservering? En welke soorten plekken hebben **meer dan tien** reserveringen? Tot slot willen we zien wie van het personeel wat heeft aangepast."

Jij gaat deze applicatie voor De Duinpan bouwen. Setup, technische eisen en checklist staan in **[Eindproject Blok 5B.md](Eindproject%20Blok%205B.md)**.

## Userstories

### Bezoeker
1. Als bezoeker wil ik een overzicht van alle beschikbare plekken zien. *(H1)*
2. Als bezoeker wil ik op een plek klikken voor de detailpagina. Bestaat de plek niet, dan zie ik een nette 404-pagina. *(H7)*
3. Als bezoeker wil ik filteren op soort plek én stroom tegelijk. De keuzelijst met soorten komt uit de database, zonder dubbele waardes. *(H6, DISTINCT)*
4. Als bezoeker wil ik de plekken sorteren op prijs per nacht en op grootte, oplopend en aflopend. *(ORDER BY)*

### Gast
5. Als bezoeker wil ik een account aanmaken; mijn wachtwoord wordt gehasht opgeslagen en het formulier wordt gecontroleerd. *(H2)*
6. Als gast wil ik inloggen en uitloggen. *(H2)*
7. Als gast wil ik op de pagina van een plek met één klik zien of die in een bepaalde week nog vrij is, zonder dat de pagina herlaadt. *(H4, AJAX)*
8. Als gast wil ik een plek reserveren; een vertrekdatum vóór de aankomstdatum of te veel personen geeft een foutmelding. Opmerking en kenteken mogen leeg blijven. De totaalprijs wordt op de server berekend en bewaard. *(H1, H2, NULL)*
9. Als gast wil ik een overzicht van **mijn** reserveringen zien, met het nummer en soort van de plek en de totaalprijs. *(H6, LEFT JOIN)*
10. Als gast wil ik mijn eigen gegevens kunnen aanpassen. *(H3)*

### Medewerker
11. Als medewerker wil ik inloggen op een apart beheergedeelte. Een gast die een beheerpagina opent, ziet een 403-pagina. *(H5, H7)*
12. Als medewerker wil ik een nieuwe plek toevoegen; lege of foute velden geven een foutmelding. *(H1, H2)*
13. Als medewerker wil ik de gegevens en prijs van een plek kunnen aanpassen. *(H3)*
14. Als medewerker wil ik een plek uitzetten voor onderhoud zonder dat die echt verwijderd wordt, en hem later terugzetten. *(H4)*
15. Als medewerker wil ik een overzicht van alle reserveringen, met de gast en de plek erbij. *(H6, LEFT JOIN)*
16. Als medewerker wil ik een lijst van plekken **zonder reserveringen**. *(LEFT JOIN)*

### Admin (eigenaar)
17. Als admin wil ik een statistiekenpagina met: het aantal plekken per soort, de gemiddelde, laagste en hoogste prijs per nacht, de omzet per soort, het gemiddeld aantal personen per reservering, en de soorten met meer dan tien reserveringen. *(COUNT, AVG, MIN, MAX, SUM, GROUP BY, HAVING)*
18. Als admin wil ik een logboek zien van wie wat heeft gedaan in het beheergedeelte. Een medewerker die de statistieken of het logboek opent, ziet een 403-pagina. *(H5, H7)*

### Developer
19. Als developer wil ik dat alle queries via PDO met prepared statements lopen en alle output via `htmlspecialchars()`. *(H1, H2)*
20. Als developer wil ik dat formulieren alleen via `POST` verwerkt worden en dat id's in de URL gecontroleerd worden met `is_numeric()`. *(H5)*
21. Als developer wil ik dat databasefouten worden afgevangen met `try`/`catch` en dat de gebruiker een 500-pagina ziet. *(H7)*
