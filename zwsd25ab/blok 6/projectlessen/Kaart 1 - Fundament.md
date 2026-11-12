# Kaart 1 — Fundament

| Week | Theorie | Tijd |
|------|---------|------|
| 1 | H1 – H3 | 2 × 1,5 uur |

**Doel:** SoleStore draait, staat op GitHub en laat merken en sneakers uit de database zien.

> 💡 Op deze kaart staat bij elke stap precies wat je in de terminal typt. Vanaf kaart 2 doe je het commit-deel zelf: na elke stap die werkt, commit en push je.

> 🔄 **Heb je in les 1 al een eigen repository `solestore` gemaakt?** Volg dan eerst [Overstap naar GitHub-kaarten](Overstap%20naar%20GitHub-kaarten.md) en ga daarna verder bij Deel B.

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

### Stap 4: Maak je repository op GitHub

Je repository maak je in de organisatie van school, vanuit een **template**. Daarin zitten de kaarten en de commitcheck al.

1. Open https://github.com/Nova-College-Haarlem-Students/ZWSD25AB---Projectlessen-Blok-6
2. Klik op de groene knop **Use this template** en kies **Create a new repository**.
3. Kies bij **Owner** de organisatie `Nova-College-Haarlem-Students` (**niet** je eigen account). Anders ziet je docent je kaarten niet.
4. Repository name: `solestore-` met daarachter je GitHub-naam, bijvoorbeeld `solestore-pietjansen`.
5. Klik op **Create repository**.
6. Ga naar het tabblad **Actions**. Zie je een groene knop om workflows aan te zetten? Klik erop.
7. Klik op de groene knop **Code** en kopieer de URL.

### Stap 5: Koppel je project aan GitHub en push

Kijk eerst of je project al aan een repository gekoppeld is:

```bash
git remote -v
```

**Zie je niets?** Koppel je project dan (plak jouw URL uit stap 4):

```bash
git remote add origin https://github.com/Nova-College-Haarlem-Students/solestore-jouwnaam.git
```

**Zie je al regels met `origin`?** Dan is er al een koppeling. Vervang die door jouw nieuwe URL:

```bash
git remote set-url origin https://github.com/Nova-College-Haarlem-Students/solestore-jouwnaam.git
```

Controleer het met `git remote -v`. Je ziet twee regels met `origin` en jouw **nieuwe** URL.

Haal nu de kaarten op en push je project:

```bash
git pull origin main --allow-unrelated-histories --no-rebase --no-edit
git push -u origin main
```

> 💡 `--allow-unrelated-histories` is nodig omdat je project en de repository op GitHub nog niets van elkaar weten. Git voegt ze nu samen.

> ❗ Zie je `error: src refspec main does not match any`? Dan heet je branch nog `master`. Ga terug naar stap 3.

### Stap 6: Controleer je repository

Ververs je repository op GitHub en controleer:

- [ ] Je ziet je Laravel-bestanden (`app`, `routes`, `resources`, ...)
- [ ] Bij **Issues** staat **Kaart 1 — Fundament**. Duurt het langer dan een minuut? Ga naar **Actions → Kaarten → Run workflow**.

> 💡 Vanaf nu controleert GitHub bij elke push of je commitberichten met `K1:`, `K2:`, ... beginnen (tabblad **Actions**, *Commitcheck*). Een rood kruis betekent dat er een commit zonder kaartnummer tussen zat. Daar krijg je geen straf voor, maar zorg dat de volgende wel goed is.

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

### Stap 7: Statische pagina's
Maak de routes en views `/`, `/over` en `/contact` met tekst over SoleStore (zie H1 opdracht 3).

```bash
git add .
git commit -m "K1: voeg home, over en contact pagina toe"
git push
```

### Stap 8: Merken in de database
Maak een model, migration en seeder voor **Brand** met de kolommen `name`, `country` en `description` (mag leeg zijn: `nullable()`). Seed minimaal **5 merken**. Controleer met `php artisan migrate:fresh --seed`.

```bash
git add .
git commit -m "K1: voeg Brand model, migration en seeder toe"
git push
```

### Stap 9: Merken tonen
Maak een `BrandController` met `index` en `show`. `/brands` toont alle merken, `/brands/{id}` toont één merk. Een id dat niet bestaat, geeft een 404 (`findOrFail`).

```bash
git add .
git commit -m "K1: toon overzicht en detailpagina van merken"
git push
```

### Stap 10: Sneakers in de database
Maak een model, migration en seeder voor **Sneaker** met de kolommen `name`, `colorway`, `release_year`, `description` en `brand_id`. Maak `brand_id` een foreign key: `$table->foreignId('brand_id')->constrained();`. Seed minimaal **10 sneakers**, verdeeld over de merken.

> Let op: de seeder van merken moet in `DatabaseSeeder` **vóór** de seeder van sneakers staan. Waarom?

```bash
git add .
git commit -m "K1: voeg Sneaker model, migration en seeder toe"
git push
```

### Stap 11: Sneakers tonen
Maak een `SneakerController` met `index` en `show`. `/sneakers` toont alle sneakers, `/sneakers/{id}` toont één sneaker. Een id dat niet bestaat, geeft een 404.

```bash
git add .
git commit -m "K1: toon overzicht en detailpagina van sneakers"
git push
```

---

## Deel C — Aftekenen

### Stap 12: Controleer jezelf
Loop de **aftekencriteria** hieronder na. Werkt alles? Kijk op GitHub of je laatste commit erop staat en of de commitcheck groen is.

### Stap 13: Zet je kaart klaar
1. Ga op GitHub naar **Issues** en open **Kaart 1 — Fundament**.
2. Typ onderaan als reactie: `/klaar` en klik op **Comment**.
3. Na een halve minuut krijgt de kaart het label **aftekenen** en verschijnt er een overzicht van je commits. Je staat nu in de wachtrij van je docent.

> ❗ Sluit de kaart **niet** zelf. Alleen je docent kan aftekenen.

### Stap 14: Laat aftekenen
Je docent komt langs. Je laat in de browser zien dat alles werkt, en je beantwoordt een uitlegvraag.

- **Goed?** Je docent sluit de kaart. **Kaart 2** verschijnt bij Issues.
- **Nog niet goed?** Je krijgt feedback op de kaart. Pas aan, commit, push en typ opnieuw `/klaar`.

---

## Aftekencriteria

- [ ] `php artisan migrate:fresh --seed` werkt zonder fouten
- [ ] `/`, `/over` en `/contact` werken
- [ ] `/brands`, `/brands/{id}`, `/sneakers` en `/sneakers/{id}` werken; een onbekend id geeft een 404
- [ ] `sneakers.brand_id` is een foreign key naar `brands`
- [ ] Repository staat in `Nova-College-Haarlem-Students` op de branch `main`, de commitcheck is groen
- [ ] Minimaal **5 commits** met `K1:` ervoor, één per stap

## Uitlegvraag (de docent kiest er één)

- Wat gebeurt er van URL tot scherm als je `/sneakers/3` opent? Noem route, controller, model en view.
- Wat is het verschil tussen een migration en een seeder?
- Waarom gebruik je `findOrFail()` en niet `find()`?
- Waarom moet de seeder van merken vóór die van sneakers?
- Wat is het verschil tussen `git commit` en `git push`?

