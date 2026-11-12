# Kaart 4 — Toegang

| Week | Theorie | Tijd |
|------|---------|------|
| 4 | H8 | 2 × 1,5 uur |

**Doel:** Klanten kunnen een account maken en inloggen. Alleen een admin kan sneakers beheren.

---

## User stories

1. Als bezoeker wil ik een account aanmaken en inloggen. Ik krijg automatisch de rol **klant**.
2. Als ingelogde klant wil ik in de navigatie mijn naam en een uitlogknop zien. Als bezoeker zie ik *Inloggen* en *Registreren*.
3. Als bezoeker die niet is ingelogd, word ik naar de loginpagina gestuurd als ik een beheerpagina open.
4. Als klant zie ik geen knoppen voor toevoegen, aanpassen of verwijderen. Typ ik de URL toch in, dan krijg ik een **403**.
5. Als admin kan ik alles uit kaart 3 blijven doen.

## Hints

- Installeer Breeze en koppel je eigen layout aan Breeze (H8 opdracht 0–2).
- Zet de seeder voor rollen (`admin`, `klant`) vóór de users. Maak in je seeder één admin en één klant met een bekend wachtwoord.
- Een nieuwe gebruiker krijgt de rol **op de server**. De rol komt nooit uit het formulier.
- Maak een Gate `beheer-sneakers` en gebruik die in je controller én in je views (`@can`).

---

## Aftekencriteria

- [ ] Registreren, inloggen en uitloggen werken; nieuwe gebruikers zijn klant
- [ ] `@auth` / `@guest` in de navigatie van je eigen layout
- [ ] Schrijfroutes zitten in een `auth`-middlewaregroep
- [ ] Gate `beheer-sneakers` gebruikt in de controller én in de views
- [ ] Demo met twee accounts: de admin kan beheren, de klant krijgt een 403 op `/sneakers/create`
- [ ] Minimaal **4 commits** met `K4:` ervoor
- [ ] Tag `kaart-4` is gepusht

## Uitlegvraag (de docent kiest er één)

- Wat is het verschil tussen de `auth`-middleware en je Gate? Waarom heb je ze allebei nodig?
- Waarom is het niet genoeg om alleen de knoppen te verbergen?
- Waar in je code krijgt een nieuwe gebruiker de rol klant? Waarom daar?
- Wat doet `Auth::user()`, en wanneer is het `null`?

---

| Afgetekend | Datum | Commit (tag `kaart-4`) | Paraaf docent |
|------------|-------|------------------------|---------------|
| ☐ | | | |
