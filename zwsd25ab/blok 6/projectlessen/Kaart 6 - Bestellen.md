# Kaart 6 — Bestellen

| Week | Theorie | Tijd |
|------|---------|------|
| 6 | H10 – H11 | 2 × 1,5 uur |

**Doel:** Klanten kunnen bestellen en annuleren, en de validatie staat in FormRequests. Hiermee is SoleStore af.

---

## User stories

1. Als klant wil ik op de detailpagina van een sneaker een aantal kiezen (1 t/m 5) en bestellen.
2. Als klant wil ik dat in mijn bestelling de prijs van **dat moment** bewaard blijft, ook als de admin de prijs later aanpast.
3. Als klant wil ik een overzicht van **mijn** bestellingen: datum, status en totaalbedrag, 10 per pagina.
4. Als klant wil ik een bestelling openen en zien welke sneakers erin zitten, met het aantal en de prijs per regel.
5. Als klant wil ik een bestelling met status `ordered` annuleren. Een bestelling van iemand anders kan ik niet openen of annuleren (403).
6. Als bezoeker wil ik dat het sneakeroverzicht 12 sneakers per pagina toont.
7. Als developer wil ik dat de validatie van sneakers en reviews in een **FormRequest** staat, met Nederlandse foutmeldingen.

## Hints

- Bestelling plaatsen, opslaan en annuleren: H10 opdracht 3, 4 en 7.
- De totaalprijs reken je uit **op de server**, met de huidige prijs uit de database. Een prijs uit het formulier vertrouw je niet.
- Bestellingen van één klant: `Auth::user()->orders()->latest()->paginate(10)`.
- FormRequests en Nederlandse foutmeldingen: H11 opdracht 1.

---

## Aftekencriteria

- [ ] Demo: bestellen, overzicht, details en annuleren werken
- [ ] Demo: de admin past een prijs aan, de oude bestelling toont nog de oude prijs
- [ ] `orders` en `orderrows` worden goed gevuld; de totaalprijs komt van de server
- [ ] Een klant kan andermans bestelling niet openen of annuleren
- [ ] Paginatie op bestellingen en sneakers
- [ ] `SneakerRequest` en `ReviewRequest` gebruikt; de controllers bevatten geen `validate()` meer
- [ ] Foutmeldingen zijn Nederlands
- [ ] Minimaal **5 commits** met `K6:` ervoor
- [ ] Tag `kaart-6` is gepusht

## Uitlegvraag (de docent kiest er één)

- Waarom staat de prijs ook in `orderrows`, terwijl die al in `prices` staat?
- Waarom reken je het totaal uit op de server en niet in het formulier?
- Wat doet de `authorize()`-methode in je FormRequest?
- Hoe zorg je dat een klant alleen zijn eigen bestellingen ziet? Laat de regel zien.

---

| Afgetekend | Datum | Commit (tag `kaart-6`) | Paraaf docent |
|------------|-------|------------------------|---------------|
| ☐ | | | |
