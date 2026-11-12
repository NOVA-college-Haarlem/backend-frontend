# Eindproject Blok 6A (Hoofdstuk 1 t/m 7)

## 📋 Wat ga je doen?

Deze projectweek bouw je **zelfstandig** een Laravel-applicatie voor een nieuwe opdrachtgever. Je laat zien dat je alles uit **Hoofdstuk 1 t/m 7** beheerst. Dat is dezelfde stof als kaart 1 t/m 3 van SoleStore, maar nu zonder begeleiding en met een ander thema.

Aan het eind van de week heb je een **mondeling assessment**. Je legt dan je eigen code uit.

## Thema's

De docent wijst je één thema toe. De technische eisen zijn voor alle thema's **exact gelijk**.

1. [Theater](Theater.md): theater De Coulisse
2. [Tuincentrum](Tuincentrum.md): tuincentrum Groei & Bloei
3. [Recepten](Recepten.md): receptensite Smaakmakers
4. [Bijbanen](Bijbanen.md): vacaturesite Bijbaan Haarlem

> Inloggen (H8) heb je nog niet gehad. In dit project is het beheergedeelte daarom nog **voor iedereen open**. Dat is goed zo.

## 🗓️ Planning van de week

| Dag | Wat |
|-----|-----|
| **Maandag** | Project + repository opzetten, ERD maken (`docs/erd.png`) en **laten aftekenen**. Daarna de migrations en seeders |
| **Dinsdag** | Layout, overzicht- en detailpagina's, relaties in de views, eager loading |
| **Woensdag** | Toevoegen, aanpassen en verwijderen met validatie en flash messages |
| **Donderdag** | Zoeken, laatste userstories, controleren met de checklist. **Aan het eind van de dag laat je alles aftekenen** |
| **Vrijdag** | Mondeling assessment |

> ⚠️ Zonder aftekening op donderdag kun je vrijdag niet mondeling beoordeeld worden. Laat je werk gedurende de week tussentijds checken.

## Project setup

1. Maak in Laravel Herd een nieuwe site met de naam van je thema (No Starter Kit, met git repo).
2. Maak een lege GitHub-repository met dezelfde naam en push je project.
3. Kopieer [commitcheck.yml](../projectlessen/commitcheck.yml) naar `.github/workflows/commitcheck.yml`.
4. Zet de link naar je repository in de Moodle-opdracht.

## Let op: geen kant-en-klaar databaseontwerp

In het verhaal van de opdrachtgever staan **geen tabellen of kolommen**. Het ontwerp hoort bij de opdracht. Werkwijze:

1. Onderstreep de zelfstandige naamwoorden. Dat zijn mogelijke tabellen of kolommen.
2. Zoek zinnen als *"een ... heeft meerdere ..."* en *"elke ... hoort bij één ..."*. Daar zitten je één-op-veel relaties. De foreign key staat altijd aan de **veel**-kant.
3. Zoek de gegevens die **niet altijd bekend** zijn. Die kolommen mogen `NULL` zijn.
4. Controleer of je met je ERD **elke userstory** kunt bouwen.

> ✅ **Laat je ERD op maandag aftekenen voordat je de migrations maakt.**

## Technische eisen

### Database (H1, H2, H6)
- Minimaal **3 tabellen** en minimaal **2 één-op-veel relaties**
- Foreign keys in je migrations (`foreignId()->constrained()`)
- Bewuste keuze voor `nullable()`: je kunt bij elke `NULL`-kolom uitleggen waarom die leeg mag zijn
- Geld in **centen** (integer)
- Seeders met minimaal **10 rijen** in je hoofdtabel; `php artisan migrate:fresh --seed` werkt zonder fouten

### Models en views (H1 – H5)
- Elk model heeft `$fillable` en zijn relaties (`belongsTo()` en `hasMany()`)
- Eén layout-component met een prop `title`, gebruikt door **alle** views
- Overzicht- en detailpagina voor je hoofdtabel en voor je categorietabel
- Relaties zichtbaar in beide richtingen (bijv. categorie bij het item, en items bij de categorie)
- Route model binding; een onbekend id geeft een 404
- **Eager loading** op elk overzicht dat gegevens uit een andere tabel toont

### Beheer (H7)
- Resource route + resource controller voor je hoofdtabel: toevoegen, aanpassen, verwijderen
- Validatie op alle velden, inclusief `exists:` voor foreign keys
- Foutmelding per veld met `@error`, ingevulde waarden blijven staan met `old()`
- Flash messages na elke actie, en een bevestiging vóór het verwijderen
- Zoeken op naam of titel; de zoekterm blijft in het zoekveld staan

### Git
- Elke commit begint met de userstory: `US4: valideer datum bij toevoegen voorstelling`
- Minimaal elke projectdag commits; geen grote commits met alles in één keer

## ✅ Checklist (aftekenen op donderdag)

**Database**
- [ ] ERD afgetekend op maandag en opgeleverd als `docs/erd.png`
- [ ] ERD klopt met je migrations
- [ ] Minimaal 3 tabellen, 2 één-op-veel relaties, bewuste `NULL`-keuzes
- [ ] `migrate:fresh --seed` werkt, met minimaal 10 rijen in je hoofdtabel

**Functionaliteit**
- [ ] Alle userstories van je thema werken
- [ ] Layout met prop `title` op alle pagina's
- [ ] Relaties in beide richtingen zichtbaar, eager loading op overzichten
- [ ] Toevoegen, aanpassen en verwijderen met validatie, `old()`, `@error` en flash messages
- [ ] Zoeken werkt
- [ ] Onbekend id geeft een 404

**Code en Git**
- [ ] Logische namen voor routes, controllers, models en views
- [ ] Geen dubbele code
- [ ] Commits met `US<n>:` ervoor, verspreid over de week
- [ ] Commitcheck op GitHub is groen

| Onderdeel | Datum | Paraaf docent |
|-----------|-------|---------------|
| ERD (maandag) | | |
| Eindoplevering (donderdag) | | |

## 🗣️ Voorbereiding op het mondeling

Zorg dat je kunt uitleggen:
- Je ERD: waar de foreign keys zitten, waarom aan die kant, en waarom een kolom `NULL` mag zijn
- Hoe een request door je applicatie gaat: route → controller → model → view
- Het verschil tussen een migration, een seeder en een model
- Wat `belongsTo()` en `hasMany()` doen, en waar je ze gebruikt
- Wat eager loading is en waarom je het nodig hebt
- Hoe je validatie werkt, en wat `old()`, `@error` en `@csrf` doen
- Een willekeurige regel uit je eigen code: wat doet die, en waarom staat die er?
