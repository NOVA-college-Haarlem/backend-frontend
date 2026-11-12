# Overstap naar GitHub-kaarten (begin les 2)

Vanaf nu krijg je de kaarten als **Issue** in je repository, net als in Project Blok 5B. Daarvoor verhuis je je project naar een nieuwe repository in de organisatie **Nova-College-Haarlem-Students**. Je code en je commits gaan mee. Daarna verwijder je je oude repository.

> ⏱️ Dit kost ongeveer 15 minuten. Doe de stappen precies op volgorde.

---

## Stap 1: Maak je nieuwe repository

1. Open https://github.com/Nova-College-Haarlem-Students/ZWSD25AB---Projectlessen-Blok-6
2. Klik op de groene knop **Use this template** en kies **Create a new repository**.
3. Kies bij **Owner** de organisatie `Nova-College-Haarlem-Students` (**niet** je eigen account). Anders ziet je docent je kaarten niet.
4. Repository name: `solestore-` met daarachter je GitHub-naam, bijvoorbeeld `solestore-pietjansen`.
5. Klik op **Create repository**.
6. Ga naar het tabblad **Actions**. Zie je een groene knop om workflows aan te zetten? Klik erop.
7. Klik op de groene knop **Code** en kopieer de URL.

## Stap 2: Verwijder je oude commitcheck

In les 1 heb je zelf `.github/workflows/commitcheck.yml` toegevoegd. De nieuwe repository heeft er al een. Verwijder je eigen versie, anders botsen ze:

Open in VS Code de terminal in je map `solestore` en typ:

```bash
git rm .github/workflows/commitcheck.yml
git commit -m "K1: verwijder oude commitcheck"
```

## Stap 3: Koppel je project aan de nieuwe repository

Plak jouw URL uit stap 1:

```bash
git remote set-url origin https://github.com/Nova-College-Haarlem-Students/solestore-jouwnaam.git
```

Controleer het:

```bash
git remote -v
```

Je ziet twee regels met de **nieuwe** URL.

## Stap 4: Haal de kaarten op en push

```bash
git pull origin main --allow-unrelated-histories --no-rebase --no-edit
git push -u origin main
```

> 💡 `--allow-unrelated-histories` is nodig omdat je project en de nieuwe repository nog niets van elkaar weten. Git voegt ze nu samen.

> ❗ Zie je een melding over een **conflict**? Steek je hand op.

## Stap 5: Controleer je nieuwe repository

Ververs je nieuwe repository op GitHub en controleer:

- [ ] Je ziet je Laravel-bestanden (`app`, `routes`, `resources`, ...)
- [ ] Bij **commits** (klokje boven de bestanden) staan je commits van les 1
- [ ] Bij **Issues** staat **Kaart 1 — Fundament**. Duurt het langer dan een minuut? Ga naar **Actions → Kaarten → Run workflow**.

Klopt alles? Pas dan ga je door naar stap 6.

## Stap 6: Verwijder je oude repository

⚠️ **Controleer eerst nog een keer stap 5.** Verwijderen kan niet ongedaan worden gemaakt.

1. Ga naar je **oude** repository: `https://github.com/jouwnaam/solestore`.
2. Klik op **Settings** (tabblad rechts).
3. Scroll helemaal naar beneden naar de rode **Danger Zone**.
4. Klik op **Delete this repository**.
5. Volg de stappen van GitHub. Je moet de naam van je repository overtypen, bijvoorbeeld `jouwnaam/solestore`.
6. Klik op **Delete this repository**.

## Stap 7: Werk verder

- **Kaart 1 al afgetekend op papier?** Je docent sluit kaart 1. Daarna verschijnt **kaart 2** bij Issues.
- **Nog niet afgetekend?** Maak kaart 1 af en typ `/klaar` als reactie op kaart 1.

Vanaf nu werk je zo:

1. Lees de kaart bij **Issues** en werk hem af. Commit na elke stap met het kaartnummer ervoor (`K2: ...`).
2. Klaar? Typ `/klaar` als reactie op de kaart. Je komt in de wachtrij van je docent. Onder je reactie verschijnt een overzicht van je commits voor deze kaart.
3. Je docent komt langs, bekijkt je werk en stelt een uitlegvraag. Goed? Dan sluit je docent de kaart en verschijnt de volgende.
4. Nog niet goed? Dan krijg je feedback op de kaart. Pas aan en typ opnieuw `/klaar`.

Een tag zetten (`git tag kaart-1`) is niet meer nodig.
