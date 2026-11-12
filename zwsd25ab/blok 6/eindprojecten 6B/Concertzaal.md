# Project 6B: Concertzaal

## Introductie

Je hebt een gesprek met Mo Haddou, programmeur van poppodium "De Kelder":

> "Wij hebben elke week een paar **concerten**. Elk concert valt onder één **genre**: pop, hiphop, rock, elektronisch of singer-songwriter. Bezoekers kijken vaak per genre wat er komt.
>
> Van een concert tonen we de artiest, de datum en aanvangstijd, een beschrijving, het maximaal aantal bezoekers en de **ticketprijs**. Soms is er een **voorprogramma**, vaak ook niet.
>
> Bezoekers maken een account aan en kopen online **tickets**. In één **bestelling** kun je tickets voor meerdere concerten kopen, met per concert een aantal. Maximaal 6 tickets per concert per bestelling. Als wij later de prijs van een concert aanpassen, moet in een oude bestelling blijven staan wat de klant toen betaald heeft. Een klant kan een bestelling annuleren zolang het concert nog niet geweest is.
>
> Na een concert willen bezoekers een **review** schrijven: een cijfer van 1 tot 5 en een stukje tekst. Een bezoeker mag alleen zijn eigen review verwijderen. Wij verwijderen soms een review als er gescholden wordt.
>
> Wij zijn de enige die concerten toevoegen, aanpassen en verwijderen. Gewone bezoekers mogen daar niet bij."

Jij bouwt deze applicatie voor De Kelder. Setup, technische eisen en checklist staan in **[Eindproject Blok 6B.md](Eindproject%20Blok%206B.md)**.

## Userstories

### Bezoeker
1. Als bezoeker wil ik een overzicht van alle komende concerten zien, 12 per pagina, met het genre en de prijs. *(H5, H10)*
2. Als bezoeker wil ik de detailpagina van een concert zien, met het voorprogramma als dat er is, het gemiddelde cijfer en alle reviews. *(H5, H9)*
3. Als bezoeker wil ik per genre alle concerten zien. *(H5)*
4. Als bezoeker wil ik zoeken op de naam van een artiest. *(H7)*
5. Als bezoeker wil ik een account aanmaken en inloggen. Ik word automatisch klant. *(H8)*

### Klant
6. Als klant wil ik tickets voor een concert in een bestelling zetten (1 t/m 6 per concert) en bestellen. *(H10)*
7. Als klant wil ik een overzicht van **mijn** bestellingen, met datum, status en totaalbedrag. *(H10)*
8. Als klant wil ik een bestelling openen en per concert het aantal tickets en de prijs van toen zien. *(H10)*
9. Als klant wil ik een bestelling annuleren. Een bestelling van iemand anders kan ik niet openen of annuleren. *(H9, H10)*
10. Als klant wil ik een review schrijven en mijn **eigen** review verwijderen. *(H9)*

### Admin
11. Als admin wil ik concerten toevoegen, aanpassen en verwijderen, met validatie en een melding na elke actie. Een klant die dit probeert, krijgt een 403. *(H7, H8)*
12. Als admin wil ik elke review kunnen verwijderen. *(H9)*

### Developer
13. Als developer wil ik dat alle validatie in FormRequests staat, met Nederlandse foutmeldingen. *(H11)*
