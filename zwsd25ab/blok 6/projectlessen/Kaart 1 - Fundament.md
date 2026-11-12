# Kaart 1 — Fundament

| Week | Theorie | Tijd |
|------|---------|------|
| 1 | H1 – H3 | 2 × 1,5 uur |

**Doel:** SoleStore draait, staat op GitHub en laat merken en sneakers uit de database zien.

> 💡 Op deze kaart staat bij elke stap precies wat je in de terminal typt. Vanaf kaart 2 doe je het commit-deel zelf: na elke stap die werkt, commit en push je.

---

## Deel A — Project en GitHub

### Stap 1: Controleer je git-instellingen

Open een terminal (in VS Code: **Terminal → New Terminal**) en typ:

```bash
git config --global user.name
git config --global user.email
```

Zie je geen naam of geen e-mailadres? Stel ze dan in. Gebruik het e-mailadres van je GitHub-account:

```bash
git config --global user.name "Voornaam Achternaam"
git config --global user.email "jouw@email.nl"
```

Zet daarna `main` als standaardnaam voor nieuwe branches:

```bash
git config --global init.defaultBranch main
```

### Stap 2: Maak het project

1. Start Laravel Herd en kies **New site**.
2. Kies **No Starter Kit**.
3. Project Name: `solestore`. Zet het vinkje bij **git repository** aan.
4. Ga naar http://solestore.test. Je ziet de welkomstpagina van Laravel.
5. Open de map `solestore` in VS Code.

### Stap 3: Controleer je branch

Typ in de terminal van VS Code:

```bash
git branch
```

Staat er `* main`? Ga dan door naar stap 4.

Staat er `* master`? Hernoem de branch dan naar `main`:

```bash
git branch -M main
```

Typ nog een keer `git branch`. Nu moet er `* main` staan.

### Stap 4: Maak een repository op GitHub

1. Ga naar https://github.com en log in.
2. Klik rechtsboven op **+** en kies **New repository**.
3. Repository name: `solestore`.
4. Laat **alles** verder leeg: geen README, geen .gitignore, geen license.
5. Klik op **Create repository**.
6. Je ziet nu een pagina met een URL zoals `https://github.com/jouwnaam/solestore.git`. Kopieer die URL.

### Stap 5: Koppel je project aan GitHub en push

Typ in de terminal (plak jouw URL):

```bash
git remote add origin https://github.com/jouwnaam/solestore.git
git push -u origin main
```

Ververs de pagina op GitHub. Je ziet nu de bestanden van je project.

> ❗ Zie je `error: src refspec main does not match any`? Dan heet je branch nog `master`. Ga terug naar stap 3.

### Stap 6: Zet de commitcheck aan

1. Maak in je project de map `.github`, en daarin de map `workflows`. Let op de punt voor `github`.
2. Kopieer het bestand [commitcheck.yml](commitcheck.yml) naar `.github/workflows/commitcheck.yml`.
3. Commit en push:

```bash
git add .
git commit -m "K1: voeg commitcheck toe"
git push
```

4. Klik op GitHub op het tabblad **Actions**. Je ziet een groen vinkje bij *Commitcheck*.

> 💡 Vanaf nu controleert GitHub bij elke push of je commitberichten met `K1:`, `K2:`, ... beginnen. Een rood kruis betekent dat er een commit zonder kaartnummer tussen zat. Daar krijg je geen straf voor, maar zorg dat de volgende wel goed is.

### Stap 7: Lever je link in

Zet de link naar je repository (`https://github.com/jouwnaam/solestore`) in de Moodle-opdracht.

---

## Deel B — Bouwen

Na **elke** stap die werkt, maak je een commit. Altijd dezelfde drie commando's:

```bash
git add .
git commit -m "K1: wat je gedaan hebt"
git push
```

> ✍️ **Een goed commitbericht** begint met `K1:` en zegt in een paar woorden **wat** je hebt gedaan.
> - ✅ `K1: voeg Brand model en migration toe`
> - ❌ `update`, `fix`, `K1: dingen`

### Stap 8: Statische pagina's
Maak de routes en views `/`, `/over` en `/contact` met tekst over SoleStore (zie H1 opdracht 3).

```bash
git add .
git commit -m "K1: voeg home, over en contact pagina toe"
git push
```

### Stap 9: Merken in de database
Maak een model, migration en seeder voor **Brand** met de kolommen `name`, `country` en `description` (mag leeg zijn: `nullable()`). Seed minimaal **5 merken**. Controleer met `php artisan migrate:fresh --seed`.

```bash
git add .
git commit -m "K1: voeg Brand model, migration en seeder toe"
git push
```

### Stap 10: Merken tonen
Maak een `BrandController` met `index` en `show`. `/brands` toont alle merken, `/brands/{id}` toont één merk. Een id dat niet bestaat, geeft een 404 (`findOrFail`).

```bash
git add .
git commit -m "K1: toon overzicht en detailpagina van merken"
git push
```

### Stap 11: Sneakers in de database
Maak een model, migration en seeder voor **Sneaker** met de kolommen `name`, `colorway`, `release_year`, `description` en `brand_id`. Maak `brand_id` een foreign key: `$table->foreignId('brand_id')->constrained();`. Seed minimaal **10 sneakers**, verdeeld over de merken.

> Let op: de seeder van merken moet in `DatabaseSeeder` **vóór** de seeder van sneakers staan. Waarom?

```bash
git add .
git commit -m "K1: voeg Sneaker model, migration en seeder toe"
git push
```

### Stap 12: Sneakers tonen
Maak een `SneakerController` met `index` en `show`. `/sneakers` toont alle sneakers, `/sneakers/{id}` toont één sneaker. Een id dat niet bestaat, geeft een 404.

```bash
git add .
git commit -m "K1: toon overzicht en detailpagina van sneakers"
git push
```

---

## Deel C — Aftekenen

### Stap 13: Controleer jezelf
Loop de **aftekencriteria** hieronder na. Werkt alles? Kijk op GitHub of je laatste commit erop staat (en of de commitcheck groen is).

### Stap 14: Zet een tag
Een tag is een label op je laatste commit. Zo is precies te zien welke versie de docent heeft afgetekend.

```bash
git tag kaart-1
git push origin kaart-1
```

Controleer op GitHub: klik op **Tags** (naast de branchnaam). Daar staat `kaart-1`.

> ❗ Heb je na het taggen nog iets aangepast voordat de docent heeft afgetekend? Verplaats de tag dan naar je nieuwste commit:
> ```bash
> git tag -f kaart-1
> git push -f origin kaart-1
> ```

### Stap 15: Laat aftekenen
Steek je hand op. Je laat in de browser zien dat alles werkt, en je beantwoordt een uitlegvraag.

---

## Aftekencriteria

- [ ] `php artisan migrate:fresh --seed` werkt zonder fouten
- [ ] `/`, `/over` en `/contact` werken
- [ ] `/brands`, `/brands/{id}`, `/sneakers` en `/sneakers/{id}` werken; een onbekend id geeft een 404
- [ ] `sneakers.brand_id` is een foreign key naar `brands`
- [ ] Repository staat op GitHub op de branch `main`, de commitcheck is groen
- [ ] Minimaal **6 commits** met `K1:` ervoor, één per stap
- [ ] Tag `kaart-1` is gepusht

## Uitlegvraag (de docent kiest er één)

- Wat gebeurt er van URL tot scherm als je `/sneakers/3` opent? Noem route, controller, model en view.
- Wat is het verschil tussen een migration en een seeder?
- Waarom gebruik je `findOrFail()` en niet `find()`?
- Waarom moet de seeder van merken vóór die van sneakers?
- Wat is het verschil tussen `git commit` en `git push`?

---

| Afgetekend | Datum | Commit (tag `kaart-1`) | Paraaf docent |
|------------|-------|------------------------|---------------|
| ☐ | | | |
