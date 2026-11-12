# Kaart 2 — Datamodel

| Week | Theorie | Tijd |
|------|---------|------|
| 2 | H4 – H6 | 2 × 1,5 uur |

**Doel:** SoleStore heeft één gedeelde layout, laat relaties zien en heeft de complete database.

---

## Stappen

### 1. Layout (H4)
1. Maak een layout-component met een prop `title` (standaardwaarde `SoleStore`), een navigatie en een footer.
2. Laat **alle** views deze layout gebruiken. Elke pagina heeft een eigen titel.

### 2. Relaties in views (H5)
3. Voeg `belongsTo()` toe aan `Sneaker` en `hasMany()` aan `Brand`.
4. De detailpagina van een sneaker toont de naam van het merk, met een link naar dat merk.
5. De detailpagina van een merk toont alle sneakers van dat merk.
6. Gebruik route model binding: `show(Sneaker $sneaker)`.
7. Het sneakeroverzicht gebruikt **eager loading** (`Sneaker::with('brand')`).

### 3. ERD (eerst laten aftekenen!)
8. Lees het verhaal van Jayden in de [README](README.md) opnieuw. Teken het **volledige ERD** van SoleStore: `brands`, `sneakers`, `prices`, `reviews`, `orders`, `orderrows`, `roles`, `users`.
   - Bij elke tabel: kolommen, datatypes, PK en FK's
   - Bij elke relatie: 1-op-veel (kraaienpoot)
9. Sla het op als `docs/erd.png` in je repository.

> ✅ **Laat je ERD aftekenen voordat je de migrations maakt** (onderaan deze kaart).

### 4. Nieuwe entiteiten (H6)
10. Maak models, migrations en seeders voor `Price`, `Review`, `Order`, `Orderrow` en `Role`, zoals in H6. Geld sla je op in **centen** (integer).
11. Voeg de relaties toe aan alle models.
12. De detailpagina van een sneaker toont de **huidige prijs**: de prijs met de laatste `in_effect_date` die niet in de toekomst ligt.

---

## Aftekencriteria

- [ ] Alle pagina's gebruiken de layout, met een eigen titel
- [ ] Merk ↔ sneakers is in beide richtingen zichtbaar en aanklikbaar
- [ ] Eager loading op het sneakeroverzicht
- [ ] `docs/erd.png` is afgetekend en klopt met je migrations
- [ ] `php artisan migrate:fresh --seed` vult alle 8 tabellen
- [ ] De huidige prijs staat op de detailpagina in euro's (bijv. `€ 129,95`)
- [ ] Minimaal **5 commits** met `K2:` ervoor
- [ ] Tag `kaart-2` is gepusht

## Uitlegvraag (de docent kiest er één)

- Wat is het N+1-probleem, en hoe lost `with('brand')` dat op?
- Waarom staat de foreign key in `sneakers` en niet in `brands`?
- Waarom sla je prijzen op in centen en niet als `float`?
- Hoe vind je in je code de huidige prijs van een sneaker?

---

| Onderdeel | Datum | Commit | Paraaf docent |
|-----------|-------|--------|---------------|
| ERD | | | |
| Kaart 2 (tag `kaart-2`) | | | |
