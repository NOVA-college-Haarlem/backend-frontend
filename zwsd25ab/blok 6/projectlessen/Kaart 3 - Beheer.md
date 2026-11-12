# Kaart 3 — Beheer

| Week | Theorie | Tijd |
|------|---------|------|
| 3 | H7 | 2 × 1,5 uur |

**Doel:** Een medewerker kan sneakers toevoegen, aanpassen en verwijderen, en een bezoeker kan zoeken.

> Inloggen komt pas in kaart 4. Voor nu mag iedereen het beheer gebruiken.

---

## User stories

1. Als medewerker wil ik een nieuwe sneaker toevoegen. Ik kies het merk uit een keuzelijst. Lege of foute velden geven een foutmelding.
2. Als medewerker wil ik een sneaker aanpassen. Het formulier is vooraf ingevuld met de huidige gegevens.
3. Als medewerker wil ik een sneaker verwijderen. Ik moet het verwijderen eerst bevestigen.
4. Als medewerker wil ik na elke actie een melding zien, bijvoorbeeld *"Sneaker opgeslagen"*.
5. Als bezoeker wil ik sneakers zoeken op naam. Mijn zoekterm blijft in het zoekveld staan.

## Hints

- Gebruik `Route::resource('sneakers', SneakerController::class)` (H7).
- Validatieregels die je nodig hebt: `required`, `string|max:255`, `integer|min:1980`, `exists:brands,id`.
- Bij een fout blijft de ingevulde waarde staan dankzij `old()`. De foutmelding toon je met `@error`.
- Wat gebeurt er met de prijzen en reviews van een sneaker als je hem verwijdert? Kijk naar je foreign keys (`cascadeOnDelete()`).

---

## Aftekencriteria

- [ ] Demo: alle 5 user stories werken, ook met een **foute** invoer
- [ ] Resource route en resource controller gebruikt
- [ ] Validatie op alle velden; `release_year` kan niet in de toekomst liggen
- [ ] Foutmelding per veld, ingevulde waarden blijven staan
- [ ] Flash messages na opslaan, aanpassen en verwijderen
- [ ] Een sneaker met prijzen kan verwijderd worden zonder databasefout
- [ ] Minimaal **5 commits** met `K3:` ervoor
- [ ] Tag `kaart-3` is gepusht

## Uitlegvraag (de docent kiest er één)

- Welke 7 methodes maakt een resource controller, en welke HTTP-methode hoort bij `update` en `destroy`?
- Waarom staat `@csrf` in je formulier? Wat gebeurt er zonder?
- Wat doet `exists:brands,id`, en wat gaat er mis zonder die regel?
- Laat de regel zien waar je zoekt. Wat doet `%` in je query?

---

| Afgetekend | Datum | Commit (tag `kaart-3`) | Paraaf docent |
|------------|-------|------------------------|---------------|
| ☐ | | | |
