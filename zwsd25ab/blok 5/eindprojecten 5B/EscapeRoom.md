# Project 5B: Escape Room

## Introductie

Je hebt een intakegesprek met Noor, eigenaar van escape room "Locked Inn". Ze vertelt:

> "We hebben zes rooms, elk met een eigen thema - een gevangenis, een laboratorium, een spookhuis. Groepen van twee tot acht spelers proberen binnen een uur te ontsnappen. Boekingen komen nu binnen via een formulier dat naar mijn mailbox gaat, en ik plan alles met de hand in.
>
> Op de website wil ik alle rooms laten zien: de naam, het thema, een sfeerfoto, een korte verhaallijn, de **moeilijkheidsgraad** van 1 tot 5, het minimale en maximale aantal spelers en de prijs per persoon. Bezoekers willen kunnen filteren op thema én moeilijkheidsgraad, en sorteren op prijs of moeilijkheid.
>
> Wie wil spelen, maakt een account aan en **boekt** een room op een datum en tijdstip, voor een bepaald aantal spelers. Iemand kan vaker boeken, maar elke boeking is voor één room. Een room wordt natuurlijk vaak geboekt. Het aantal spelers moet natuurlijk binnen het minimum en maximum van de room vallen. Op de pagina van een room willen spelers met één klik zien of een tijdstip **nog vrij** is, zonder dat de pagina opnieuw laadt.
>
> Na afloop noteert de spelleider de **ontsnaptijd** in minuten. Zolang er nog niet gespeeld is, is die er niet - en als een groep niet ontsnapt, blijft hij ook leeg. Soms geeft de spelleider een of meer **hints**, maar dat noteren we alleen als het gebeurt.
>
> Spelleiders loggen in op een beheeromgeving. Ze voegen rooms toe, passen ze aan, en zetten een room tijdelijk uit als we hem ombouwen - maar die moet terug te zetten zijn. Ze willen alle boekingen zien met de room en de speler erbij, en een lijst van rooms die **nog nooit geboekt** zijn.
>
> En ik wil een scorebord en cijfers: hoeveel boekingen per room, wat is de **snelste** en **langzaamste** ontsnaptijd per room, wat is de gemiddelde ontsnaptijd, en wat is de totale omzet? Ook wil ik zien welke rooms een **gemiddelde ontsnaptijd van meer dan 50 minuten** hebben - die zijn misschien te moeilijk. Tot slot wil ik zien welke spelleider wat heeft aangepast."

Jij gaat deze applicatie voor Locked Inn bouwen. Setup, technische eisen en checklist staan in **[Eindproject Blok 5B.md](Eindproject%20Blok%205B.md)**.

## Userstories

### Bezoeker
1. Als bezoeker wil ik een overzicht van alle rooms zien. *(H1)*
2. Als bezoeker wil ik op een room klikken voor de detailpagina. Bestaat de room niet, dan zie ik een nette 404-pagina. *(H7)*
3. Als bezoeker wil ik filteren op thema én moeilijkheidsgraad tegelijk. De keuzelijst met thema's komt uit de database, zonder dubbele waardes. *(H6, DISTINCT)*
4. Als bezoeker wil ik de rooms sorteren op prijs en op moeilijkheid, oplopend en aflopend. *(ORDER BY)*

### Speler
5. Als bezoeker wil ik een account aanmaken; mijn wachtwoord wordt gehasht opgeslagen en het formulier wordt gecontroleerd. *(H2)*
6. Als speler wil ik inloggen en uitloggen. *(H2)*
7. Als speler wil ik op de pagina van een room met één klik zien of een datum en tijdstip nog vrij is, zonder dat de pagina herlaadt. *(H4, AJAX)*
8. Als speler wil ik een room boeken; een aantal spelers buiten het minimum en maximum van de room geeft een foutmelding. *(H1, H2)*
9. Als speler wil ik een overzicht van **mijn** boekingen zien, met de naam van de room en mijn ontsnaptijd (als die er is). *(H6, LEFT JOIN)*
10. Als speler wil ik mijn eigen gegevens kunnen aanpassen. *(H3)*

### Medewerker (spelleider)
11. Als spelleider wil ik inloggen op een apart beheergedeelte. Een speler die een beheerpagina opent, ziet een 403-pagina. *(H5, H7)*
12. Als spelleider wil ik een nieuwe room toevoegen; lege of foute velden geven een foutmelding. *(H1, H2)*
13. Als spelleider wil ik een room aanpassen, en bij een boeking de ontsnaptijd en het aantal hints invullen. Beide mogen leeg zijn. *(H3, NULL)*
14. Als spelleider wil ik een room tijdelijk uitzetten zonder dat die echt verwijderd wordt, en hem later terugzetten. *(H4)*
15. Als spelleider wil ik een overzicht van alle boekingen, met de room en de speler erbij. *(H6, LEFT JOIN)*
16. Als spelleider wil ik een lijst van rooms die **nog nooit geboekt** zijn. *(LEFT JOIN)*
17. Als eigenaar wil ik een statistiekenpagina met: het aantal boekingen per room, de snelste, langzaamste en gemiddelde ontsnaptijd per room, de totale omzet, en de rooms met een gemiddelde ontsnaptijd van meer dan 50 minuten. *(COUNT, MIN, MAX, AVG, SUM, GROUP BY, HAVING)*
18. Als eigenaar wil ik een logboek zien van wie wat heeft gedaan in het beheergedeelte. *(H5)*

### Developer
19. Als developer wil ik dat alle queries via PDO met prepared statements lopen en alle output via `htmlspecialchars()`. *(H1, H2)*
20. Als developer wil ik dat formulieren alleen via `POST` verwerkt worden en dat id's in de URL gecontroleerd worden met `is_numeric()`. *(H5)*
21. Als developer wil ik dat databasefouten worden afgevangen met `try`/`catch` en dat de gebruiker een 500-pagina ziet. *(H7)*
