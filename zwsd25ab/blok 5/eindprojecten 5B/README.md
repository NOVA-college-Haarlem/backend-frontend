# Eindproject Blok 5B

## 📋 Wat ga je doen?

Je bouwt deze week een complete webapplicatie voor een **nieuwe opdrachtgever**, met alle technieken uit Hoofdstuk 1 t/m 7 én de SQL-stof van dit blok. Het thema is nieuw: geen van de thema's uit 5A komt terug.

Elke student is aan één van de zes thema's toegewezen - zie **[Studentverdeling.md](Studentverdeling.md)**. Lees daarna:
1. Het verhaal en de userstories van **jouw thema**
2. De technische eisen, het SQL-dossier en de checklist in **[Eindproject Blok 5B.md](Eindproject%20Blok%205B.md)**

- [Dierenasiel](Dierenasiel.md)
- [Fietsverhuur](Fietsverhuur.md)
- [Escape Room](EscapeRoom.md)
- [Camping](Camping.md)
- [Kringloop](Kringloop.md)
- [Autogarage](Autogarage.md)

## 🚀 Planning van de week

| Dag | Wat |
|-----|-----|
| **Maandag** | ERD maken (`docs/erd.png`) en **laten aftekenen**, daarna `sql/database.sql` schrijven (tabellen + testdata) |
| **Dinsdag** | Bezoeker en lid: overzicht, detail, registreren, inloggen, filter, sorteren, kernactie via AJAX |
| **Woensdag** | Medewerker: toevoegen, aanpassen, soft delete, overzichten met JOINs, statistiekenpagina, logboek |
| **Donderdag** | Error pages, `try`/`catch`, SQL-dossier afmaken - **aan het einde van de dag laat je alles aftekenen** |
| **Vrijdag** | Mondeling assessment |

> ⚠️ **Donderdag is de deadline om af te tekenen.** Zonder aftekening op donderdag kun je vrijdag niet mondeling beoordeeld worden. Laat je werk gedurende de week al tussentijds checken.

> 💡 Schrijf je SQL-dossier niet pas op donderdag. Elke query die je in je applicatie bouwt, kun je meteen in `sql/queries.sql` zetten.

## ✅ Voorbereiding op het mondeling (vrijdag)

Zorg dat je kan uitleggen:
- Je ERD: welke tabellen je hebt, waar de foreign keys zitten, waarom een relatie 1-op-veel of veel-op-veel is (en dus een koppeltabel nodig heeft), en waarom een kolom `NULL` mag zijn
- Hoe je van het verhaal van de opdrachtgever bent gekomen tot je ERD
- Hoe je je code hebt beveiligd (prepared statements, hashing, `htmlspecialchars()`, sessie- en rolcheck)
- Een willekeurige regel uit je eigen code - wat doet die, en waarom staat die er?

En de SQL-begrippen, toegepast op je eigen database:
- Wat komt er achter `SELECT`, `FROM` en `WHERE`?
- Wat is het verschil tussen `SELECT` en `SELECT DISTINCT`?
- Wat zijn kolomfuncties, en welke heb je gebruikt?
- Wanneer gebruik je `GROUP BY`, en wanneer `HAVING` in plaats van `WHERE`?
- Wat doet `ORDER BY`?
- Wat kun je met `INSERT INTO`?
- Wanneer gebruik je een `INNER JOIN`, een `LEFT JOIN` en een `RIGHT JOIN`?
