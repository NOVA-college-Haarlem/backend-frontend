# Project 6B: Bloemist

## Introductie

Je hebt een gesprek met Lotte van Dam, eigenaar van bloemist "Het Boeket":

> "Wij willen een webwinkel. We verkopen **producten** in een paar **soorten**: boeketten, losse bloemen, kamerplanten en cadeautjes zoals kaarsen en vazen. Elk product hoort bij één soort.
>
> Van een product tonen we de naam, een beschrijving, de **prijs** en of het seizoensgebonden is. Bij losse bloemen en boeketten zetten we de **bloeiperiode** erbij, bij cadeautjes natuurlijk niet.
>
> Klanten maken een account aan en **bestellen**. In één bestelling kunnen meerdere producten zitten, elk met een aantal. Bij een bestelling kiest de klant een **bezorgdatum**, die minstens morgen is. De klant kan een tekst voor op het **kaartje** meegeven, maar dat hoeft niet. Als wij later een prijs aanpassen, moet in een oude bestelling blijven staan wat de klant toen betaald heeft. Een klant kan een bestelling annuleren zolang die nog niet bezorgd is.
>
> Klanten schrijven graag een **review**: een cijfer van 1 tot 5 en een stukje tekst. Een klant mag alleen zijn eigen review verwijderen. Wij kunnen elke review verwijderen.
>
> Alleen wij voegen producten toe, passen ze aan en verwijderen ze."

Jij bouwt deze applicatie voor Het Boeket. Setup, technische eisen en checklist staan in **[Eindproject Blok 6B.md](Eindproject%20Blok%206B.md)**.

## Userstories

### Bezoeker
1. Als bezoeker wil ik een overzicht van alle producten zien, 12 per pagina, met de soort en de prijs. *(H5, H10)*
2. Als bezoeker wil ik de detailpagina van een product zien, met de bloeiperiode als die er is, het gemiddelde cijfer en alle reviews. *(H5, H9)*
3. Als bezoeker wil ik per soort alle producten zien. *(H5)*
4. Als bezoeker wil ik zoeken op productnaam. *(H7)*
5. Als bezoeker wil ik een account aanmaken en inloggen. Ik word automatisch klant. *(H8)*

### Klant
6. Als klant wil ik producten bestellen, met per product een aantal, een bezorgdatum (minstens morgen) en eventueel een kaarttekst. *(H10)*
7. Als klant wil ik een overzicht van **mijn** bestellingen, met bezorgdatum, status en totaalbedrag. *(H10)*
8. Als klant wil ik een bestelling openen en per product het aantal en de prijs van toen zien. *(H10)*
9. Als klant wil ik een bestelling annuleren. Een bestelling van iemand anders kan ik niet openen of annuleren. *(H9, H10)*
10. Als klant wil ik een review schrijven en mijn **eigen** review verwijderen. *(H9)*

### Admin
11. Als admin wil ik producten toevoegen, aanpassen en verwijderen, met validatie en een melding na elke actie. Een klant die dit probeert, krijgt een 403. *(H7, H8)*
12. Als admin wil ik elke review kunnen verwijderen. *(H9)*

### Developer
13. Als developer wil ik dat alle validatie in FormRequests staat, met Nederlandse foutmeldingen. *(H11)*
