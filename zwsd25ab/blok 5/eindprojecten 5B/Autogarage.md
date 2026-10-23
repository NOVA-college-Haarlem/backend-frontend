# Project 5B: Autogarage

## Introductie

Je hebt een intakegesprek met Rachid, eigenaar van garage "Sleutelwerk". Hij vertelt:

> "We doen APK-keuringen, kleine en grote beurten, en we wisselen banden. Afspraken worden nu gemaakt via de telefoon en een whiteboard in de werkplaats. Als het whiteboard vol staat, raken we afspraken kwijt.
>
> Op de website wil ik onze **diensten** laten zien: de naam, een omschrijving, hoe lang het ongeveer duurt in minuten, en de prijs. Bezoekers willen de diensten kunnen sorteren op prijs of duur.
>
> Klanten maken een account aan en voegen hun **auto's** toe: kenteken, merk, model en bouwjaar. Veel klanten hebben meer dan één auto. Daarna maken ze een **afspraak**: welke auto, welke dienst, welke datum en hoe laat. Een auto komt natuurlijk vaker terug, en een dienst wordt voor heel veel auto's geboekt. Klanten willen met één klik zien welke tijden er op een dag **nog vrij** zijn, zonder dat de pagina opnieuw laadt.
>
> Bij elke afspraak wijzen wij een **monteur** toe - dat is altijd een van onze medewerkers. Maar als de afspraak net gemaakt is, weten we nog niet wie hem doet. Na afloop noteert de monteur de **kilometerstand** en eventueel een opmerking, bijvoorbeeld 'remblokken bijna op'. Vóór de afspraak weten we die nog niet. De prijs van de afspraak moet bewaard blijven, ook als wij later onze prijzen verhogen.
>
> Mijn medewerkers loggen in op een beheeromgeving. Ze voegen diensten toe, passen prijzen aan, wijzen monteurs toe en zetten diensten uit die we niet meer aanbieden - maar die moeten terug te zetten zijn. Ze willen de afspraken kunnen filteren op monteur én op dienst, en een lijst zien van auto's die **nog nooit een afspraak** hebben gehad.
>
> En ik wil cijfers: hoeveel afspraken per dienst, wat is de gemiddelde prijs per afspraak, wat is de oudste en nieuwste auto bij ons (bouwjaar), en wat is de totale omzet per dienst? Ook wil ik zien van welke **merken we meer dan twee auto's** in ons systeem hebben. Tot slot wil ik zien welke medewerker wat heeft aangepast."

Jij gaat deze applicatie voor Sleutelwerk bouwen. Setup, technische eisen en checklist staan in **[Eindproject Blok 5B.md](Eindproject%20Blok%205B.md)**.

## Userstories

### Bezoeker
1. Als bezoeker wil ik een overzicht van alle diensten zien. *(H1)*
2. Als bezoeker wil ik op een dienst klikken voor de detailpagina. Bestaat de dienst niet, dan zie ik een nette 404-pagina. *(H7)*
3. Als bezoeker wil ik de diensten sorteren op prijs en op duur, oplopend en aflopend. *(ORDER BY)*

### Klant
4. Als bezoeker wil ik een account aanmaken; mijn wachtwoord wordt gehasht opgeslagen en het formulier wordt gecontroleerd. *(H2)*
5. Als klant wil ik inloggen en uitloggen. *(H2)*
6. Als klant wil ik mijn auto's toevoegen en aanpassen; een leeg kenteken of een bouwjaar in de toekomst geeft een foutmelding. *(H1, H2, H3)*
7. Als klant wil ik met één klik zien welke tijden er op een dag nog vrij zijn, zonder dat de pagina herlaadt. *(H4, AJAX)*
8. Als klant wil ik een afspraak maken voor een van **mijn eigen** auto's; de prijs wordt op de server opgehaald en bij de afspraak bewaard. *(H1, H5)*
9. Als klant wil ik een overzicht van **mijn** afspraken zien, met het kenteken, de dienst en de prijs. *(H6, INNER JOIN)*
10. Als klant wil ik mijn eigen gegevens kunnen aanpassen. *(H3)*

### Medewerker
11. Als medewerker wil ik inloggen op een apart beheergedeelte. Een klant die een beheerpagina opent, ziet een 403-pagina. *(H5, H7)*
12. Als medewerker wil ik een nieuwe dienst toevoegen en de prijs aanpassen; lege of foute velden geven een foutmelding. *(H1, H2, H3)*
13. Als medewerker wil ik bij een afspraak een monteur toewijzen en na afloop de kilometerstand en een opmerking invullen. Monteur, kilometerstand en opmerking mogen leeg zijn. *(H3, NULL)*
14. Als medewerker wil ik een dienst uitzetten zonder dat die echt verwijderd wordt, en hem later terugzetten. *(H4)*
15. Als medewerker wil ik alle afspraken zien met klant, kenteken, dienst en monteur erbij, en filteren op monteur én dienst tegelijk. De keuzelijst met monteurs komt uit de database, zonder dubbele waardes. Afspraken **zonder** monteur staan er ook in. *(H6, INNER JOIN, LEFT JOIN, DISTINCT)*
16. Als medewerker wil ik een lijst van auto's die **nog nooit een afspraak** hebben gehad. *(LEFT JOIN)*
17. Als eigenaar wil ik een statistiekenpagina met: het aantal afspraken per dienst, de gemiddelde prijs per afspraak, het oudste en nieuwste bouwjaar, de omzet per dienst, en de merken waarvan we meer dan twee auto's hebben. *(COUNT, AVG, MIN, MAX, SUM, GROUP BY, HAVING)*
18. Als eigenaar wil ik een logboek zien van wie wat heeft gedaan in het beheergedeelte. *(H5)*

### Developer
19. Als developer wil ik dat alle queries via PDO met prepared statements lopen en alle output via `htmlspecialchars()`. *(H1, H2)*
20. Als developer wil ik dat formulieren alleen via `POST` verwerkt worden en dat id's in de URL gecontroleerd worden met `is_numeric()`. *(H5)*
21. Als developer wil ik dat databasefouten worden afgevangen met `try`/`catch` en dat de gebruiker een 500-pagina ziet. *(H7)*
