# Project 6B: Workshops

## Introductie

Je hebt een gesprek met Ruben de Groot, eigenaar van workshophuis "De Werkplaats":

> "Bij ons kun je **workshops** volgen: pottenbakken, houtbewerken, fotografie, koken en schilderen. Elke workshop valt in één **categorie**. Mensen kijken vaak per categorie wat er te doen is.
>
> Van een workshop tonen we de titel, een beschrijving, de datum en tijd, hoe lang hij duurt, het maximaal aantal deelnemers en de **prijs per persoon**. Bij sommige workshops moet je zelf iets **meenemen**, zoals een camera of een schort. Bij de meeste niet.
>
> Klanten maken een account aan en **boeken**. In één boeking kun je meerdere workshops boeken, en per workshop voor hoeveel personen, maximaal 4. Als wij later de prijs van een workshop aanpassen, moet in een oude boeking blijven staan wat de klant toen betaald heeft. Een klant kan een boeking annuleren zolang de workshop nog niet geweest is.
>
> Na een workshop willen klanten een **review** schrijven: een cijfer van 1 tot 5 en een stukje tekst. Een klant mag alleen zijn eigen review verwijderen. Wij kunnen elke review verwijderen.
>
> Alleen wij voegen workshops toe, passen ze aan en verwijderen ze."

Jij bouwt deze applicatie voor De Werkplaats. Setup, technische eisen en checklist staan in **[Eindproject Blok 6B.md](Eindproject%20Blok%206B.md)**.

## Userstories

### Bezoeker
1. Als bezoeker wil ik een overzicht van alle komende workshops zien, 12 per pagina, met de categorie, de datum en de prijs per persoon. *(H5, H10)*
2. Als bezoeker wil ik de detailpagina van een workshop zien, met wat ik moet meenemen als dat er is, het gemiddelde cijfer en alle reviews. *(H5, H9)*
3. Als bezoeker wil ik per categorie alle workshops zien. *(H5)*
4. Als bezoeker wil ik zoeken op titel. *(H7)*
5. Als bezoeker wil ik een account aanmaken en inloggen. Ik word automatisch klant. *(H8)*

### Klant
6. Als klant wil ik workshops boeken, met per workshop het aantal personen (1 t/m 4). *(H10)*
7. Als klant wil ik een overzicht van **mijn** boekingen, met datum, status en totaalbedrag. *(H10)*
8. Als klant wil ik een boeking openen en per workshop het aantal personen en de prijs van toen zien. *(H10)*
9. Als klant wil ik een boeking annuleren. Een boeking van iemand anders kan ik niet openen of annuleren. *(H9, H10)*
10. Als klant wil ik een review schrijven en mijn **eigen** review verwijderen. *(H9)*

### Admin
11. Als admin wil ik workshops toevoegen, aanpassen en verwijderen, met validatie en een melding na elke actie. Een klant die dit probeert, krijgt een 403. *(H7, H8)*
12. Als admin wil ik elke review kunnen verwijderen. *(H9)*

### Developer
13. Als developer wil ik dat alle validatie in FormRequests staat, met Nederlandse foutmeldingen. *(H11)*
