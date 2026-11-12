# Kaart 5 — Reviews

| Week | Theorie | Tijd |
|------|---------|------|
| 5 | H9 | 2 × 1,5 uur |

**Doel:** Klanten schrijven reviews, en alleen de schrijver (of een admin) kan een review verwijderen.

---

## User stories

1. Als klant wil ik op de detailpagina van een sneaker een review schrijven: een cijfer van 1 tot 5 en een tekst. Een fout cijfer of een lege tekst geeft een foutmelding.
2. Als bezoeker wil ik alle reviews van een sneaker zien, met de voornaam van de schrijver en de datum. De nieuwste staat bovenaan.
3. Als bezoeker wil ik bij een sneaker het **gemiddelde cijfer** en het aantal reviews zien. Zijn er nog geen reviews, dan staat er *"Nog geen reviews"*.
4. Als klant wil ik mijn **eigen** review verwijderen. Bij reviews van anderen zie ik geen verwijderknop.
5. Als admin wil ik elke review kunnen verwijderen, bijvoorbeeld bij scheldwoorden.
6. Als bezoeker die niet is ingelogd, zie ik in plaats van het formulier een link *"Log in om een review te schrijven"*.

## Hints

- Gebruik een geneste route: `sneakers/{sneaker}/reviews` (H9 opdracht 2).
- Het `user_id` van de review komt van `Auth::id()`, **nooit** uit het formulier.
- Maak een `ReviewPolicy` met een `delete`-methode. Gebruik de policy in de controller én met `@can('delete', $review)` in de view.
- Het gemiddelde bereken je met Eloquent: `$sneaker->reviews()->avg('rating')`.

---

## Aftekencriteria

- [ ] Demo: alle 6 user stories werken, met twee klantaccounts en één admin
- [ ] Geneste route voor reviews
- [ ] `user_id` komt van `Auth::id()`
- [ ] `ReviewPolicy` gebruikt in de controller én in de view
- [ ] Een klant die via een eigen formulier of Postman andermans review verwijdert, krijgt een 403
- [ ] Gemiddelde met 1 decimaal, ook zonder reviews geen fout
- [ ] Minimaal **4 commits** met `K5:` ervoor
- [ ] Tag `kaart-5` is gepusht

## Uitlegvraag (de docent kiest er één)

- Wat is het verschil tussen een Gate (kaart 4) en een Policy? Waarom gebruik je hier een Policy?
- Wat zou er misgaan als `user_id` een verborgen veld in je formulier was?
- Hoe weet Laravel in `sneakers/{sneaker}/reviews` welke sneaker bedoeld wordt?

---

| Afgetekend | Datum | Commit (tag `kaart-5`) | Paraaf docent |
|------------|-------|------------------------|---------------|
| ☐ | | | |
