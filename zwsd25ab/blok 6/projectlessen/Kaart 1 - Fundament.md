# Kaart 1 — Fundament

| Week | Theorie | Tijd |
|------|---------|------|
| 1 | H1 – H3 | 2 × 1,5 uur |

**Doel:** SoleStore draait, staat op GitHub en laat merken en sneakers uit de database zien.

---

## Stappen

### 1. Project en repository
1. Maak in Laravel Herd een nieuwe site `solestore` (No Starter Kit, met git repo). Zie H1 opdracht 1.
2. Maak op GitHub een **lege** repository `solestore` aan en push je project:
   ```bash
   git remote add origin <URL van je repo>
   git push -u origin main
   ```
3. Kopieer [commitcheck.yml](commitcheck.yml) naar `.github/workflows/commitcheck.yml` in je project en push. Bij elke push controleert GitHub daarna of je commitberichten met een kaartnummer beginnen (zie het tabblad **Actions**).
4. Zet de link naar je repository in de Moodle-opdracht.

### 2. Statische pagina's
5. Maak de routes en views `/`, `/over` en `/contact` met tekst over SoleStore (H1 opdracht 3).

### 3. Merken
6. Maak een model, migration en seeder voor **Brand**: `name`, `country`, `description` (mag leeg zijn). Seed minimaal **5 merken**.
7. Maak een `BrandController` met `index` en `show`.
8. `/brands` toont alle merken, `/brands/{id}` toont één merk.

### 4. Sneakers
9. Maak een model, migration en seeder voor **Sneaker**: `name`, `colorway`, `release_year`, `description`, `brand_id` (foreign key). Seed minimaal **10 sneakers**, verdeeld over de merken.
10. Maak een `SneakerController` met `index` en `show`.
11. `/sneakers` toont alle sneakers, `/sneakers/{id}` toont één sneaker.
12. Bestaat een id niet? Dan zie je een 404 (`findOrFail`).

---

## Aftekencriteria

- [ ] `php artisan migrate:fresh --seed` werkt zonder fouten
- [ ] `/brands`, `/brands/{id}`, `/sneakers` en `/sneakers/{id}` werken; een onbekend id geeft een 404
- [ ] `sneakers.brand_id` is een foreign key naar `brands`
- [ ] Repository staat op GitHub, de commitcheck is groen
- [ ] Minimaal **5 commits** met `K1:` ervoor
- [ ] Tag `kaart-1` is gepusht

## Uitlegvraag (de docent kiest er één)

- Wat gebeurt er van URL tot scherm als je `/sneakers/3` opent? Noem route, controller, model en view.
- Wat is het verschil tussen een migration en een seeder?
- Waarom gebruik je `findOrFail()` en niet `find()`?

---

| Afgetekend | Datum | Commit (tag `kaart-1`) | Paraaf docent |
|------------|-------|------------------------|---------------|
| ☐ | | | |
