# Project 6B: Kantine

## Introductie

Je hebt een gesprek met Ilse Smit, beheerder van de schoolkantine:

> "In de pauze staat er een enorme rij. Daarom willen we **Kantine Online**: studenten bestellen vooraf en halen hun bestelling op.
>
> We verkopen **producten** in een paar **categorieën**: broodjes, warme snacks, salades, drinken en zoet. Elk product hoort bij één categorie.
>
> Van een product tonen we de naam, een beschrijving, de **prijs** en of het vegetarisch is. Bij sommige producten vermelden we de **allergenen**, bijvoorbeeld 'gluten, melk'. Bij een flesje water hoeft dat niet.
>
> Studenten maken een account aan en **bestellen**. In één bestelling kunnen meerdere producten zitten, elk met een aantal, maximaal 10 per product. Bij de bestelling kiest de student een **afhaaltijd**: de kleine pauze of de grote pauze. Als wij later een prijs aanpassen, moet in een oude bestelling blijven staan wat de student toen betaald heeft. Een student kan een bestelling annuleren zolang die nog niet is opgehaald.
>
> Studenten mogen producten **beoordelen** met een cijfer van 1 tot 5 en een stukje tekst. Een student mag alleen zijn eigen beoordeling verwijderen. Wij kunnen elke beoordeling verwijderen.
>
> Alleen wij voegen producten toe, passen ze aan en verwijderen ze."

Jij bouwt deze applicatie voor de kantine. Setup, technische eisen en checklist staan in **[Eindproject Blok 6B.md](Eindproject%20Blok%206B.md)**.

## Userstories

### Bezoeker
1. Als bezoeker wil ik een overzicht van alle producten zien, 12 per pagina, met de categorie, de prijs en of het vegetarisch is. *(H5, H10)*
2. Als bezoeker wil ik de detailpagina van een product zien, met de allergenen als die er zijn, het gemiddelde cijfer en alle beoordelingen. *(H5, H9)*
3. Als bezoeker wil ik per categorie alle producten zien. *(H5)*
4. Als bezoeker wil ik zoeken op productnaam. *(H7)*
5. Als bezoeker wil ik een account aanmaken en inloggen. Ik word automatisch klant. *(H8)*

### Klant (student)
6. Als klant wil ik producten bestellen, met per product een aantal (1 t/m 10) en een afhaaltijd. *(H10)*
7. Als klant wil ik een overzicht van **mijn** bestellingen, met afhaaltijd, status en totaalbedrag. *(H10)*
8. Als klant wil ik een bestelling openen en per product het aantal en de prijs van toen zien. *(H10)*
9. Als klant wil ik een bestelling annuleren. Een bestelling van iemand anders kan ik niet openen of annuleren. *(H9, H10)*
10. Als klant wil ik een beoordeling schrijven en mijn **eigen** beoordeling verwijderen. *(H9)*

### Admin
11. Als admin wil ik producten toevoegen, aanpassen en verwijderen, met validatie en een melding na elke actie. Een klant die dit probeert, krijgt een 403. *(H7, H8)*
12. Als admin wil ik elke beoordeling kunnen verwijderen. *(H9)*

### Developer
13. Als developer wil ik dat alle validatie in FormRequests staat, met Nederlandse foutmeldingen. *(H11)*
