# Project 6A: Theater

## Introductie

Je hebt een gesprek met Sanne Bakker, programmeur van theater "De Coulisse":

> "Wij hebben elk seizoen zo'n twintig **voorstellingen**: cabaret, toneel, muziektheater, jeugdvoorstellingen en dans. Elke voorstelling valt onder één **genre**. Bezoekers zoeken vaak eerst op genre, dus per genre willen we een korte uitleg en alle voorstellingen van dat genre laten zien.
>
> Van een voorstelling willen we de titel, de makers of het gezelschap, een beschrijving, de duur in minuten, de minimumleeftijd en de **ticketprijs** laten zien. Een minimumleeftijd is er niet altijd: bij veel voorstellingen mag iedereen komen.
>
> Een voorstelling speelt meestal meerdere avonden. Zo'n avond noemen wij een **speeldatum**: een datum, een aanvangstijd en of die avond **uitverkocht** is. Op de pagina van een voorstelling wil je alle speeldata zien, de eerstvolgende bovenaan.
>
> Op het overzicht van alle voorstellingen staat bij elke voorstelling het genre. Bezoekers willen ook kunnen **zoeken** op titel.
>
> Wij als medewerkers willen voorstellingen toevoegen, aanpassen en verwijderen. Als we een voorstelling toevoegen, moet het systeem controleren dat alles goed is ingevuld: een prijs kan niet negatief zijn, en een voorstelling duurt minstens 10 minuten."

Jij bouwt deze applicatie voor De Coulisse. Setup, technische eisen en checklist staan in **[Eindproject Blok 6A.md](Eindproject%20Blok%206A.md)**.

## Userstories

### Bezoeker
1. Als bezoeker wil ik een overzicht van alle voorstellingen zien, met bij elke voorstelling het genre en de prijs. *(H2, H5)*
2. Als bezoeker wil ik op een voorstelling klikken voor de detailpagina, met het genre als link. Bestaat de voorstelling niet, dan zie ik een 404. *(H3, H5)*
3. Als bezoeker wil ik op de detailpagina alle speeldata zien, de eerstvolgende bovenaan, en of die avond uitverkocht is. *(H5, H6)*
4. Als bezoeker wil ik een overzicht van alle genres, en per genre een pagina met de uitleg en alle voorstellingen van dat genre. *(H3, H5)*
5. Als bezoeker wil ik zoeken op titel. *(H7)*
6. Als bezoeker wil ik dat elke pagina dezelfde opmaak en navigatie heeft. *(H4)*

### Medewerker
7. Als medewerker wil ik een voorstelling toevoegen. Ik kies het genre uit een keuzelijst. Lege of foute velden geven een foutmelding. *(H7)*
8. Als medewerker wil ik een voorstelling aanpassen, met een vooraf ingevuld formulier. *(H7)*
9. Als medewerker wil ik een voorstelling verwijderen, na een bevestiging. De speeldata gaan dan ook weg. *(H7)*
10. Als medewerker wil ik na elke actie een melding zien. *(H7)*
