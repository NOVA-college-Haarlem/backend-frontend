# Blok 4 (26F) - Backend Samenvatting

**Doelgroep:** MBO studenten klas 26F
**Duur:** 9 hoofdstukken (9 lesweken), parallel aan Frontend Development (FEO) en JavaScript (JSO)
**Focus:** POST en CREATE, server-side validatie, registreren en inloggen, JOINS, zoeken en een dashboard - op **dezelfde site** als FEO en JS: De Smaakmakers

> **Status:** Hoofdstuk 1-9 en docentenhandleiding klaar. Een volledige, geteste uitwerking (site na FEO, JS én BEO) staat in `Docent/uitwerking/` in de docentenrepo (`__docent lesprogramma`). Nog niet in de praktijk gegeven.

**Inhoudelijk gelijk aan zwsd25ab Blok 4** (Create en Validatie, Registreren, Inloggen, Samenvatting, JOINS, Zoeken, Dashboard), met drie verschillen:
1. **Hetzelfde project als FEO en JS.** Geen tools4ever of Formula 1, maar de backend van De Smaakmakers. Studenten bouwen in drie vakken aan één site.
2. **Veilig vanaf het begin.** Queries met gebruikersinvoer gaan altijd via `?`-parameters (`mysqli_execute_query`), wachtwoorden altijd via `password_hash`/`password_verify`. In zwsd25ab Blok 4 staan wachtwoorden leesbaar in de database en worden variabelen direct in SQL geplakt; dat leren studenten daar later af. Hier leren ze het meteen goed. Waarom het nodig is, zien ze in H3 (hash) en H8 (SQL-injectie).
3. **Eén extra hoofdstuk (H7)** dat de site echt aan de database koppelt: de workshops komen via `fetch` uit de database, en het inschrijfformulier uit FEO/JS slaat inschrijvingen op.

---

## Het project

`../Frontend Development (FEO)/starter-website-3/` - dezelfde map als in FEO en JS. Voor BEO zit erin:

| Bestand | Wat |
|---|---|
| `docker-compose.yml` + `Dockerfile` | PHP met `mysqli`, MariaDB en phpMyAdmin (http://localhost:8000), zoals in Blok 3 |
| `sql/workshops.sql` | Tabel `workshops`: dezelfde 6 workshops als `data/workshops.json` (H1) |
| `sql/gebruikers.sql` | Tabel `gebruikers` met 1 admin en 1 klant, wachtwoorden als hash (H3) |
| `sql/inschrijvingen.sql` | Tabel `inschrijvingen` met een foreign key naar `workshops` (H6) |

Database-gegevens zoals in Blok 3: host `mariadb`, gebruiker `root`, wachtwoord `password`, database `smaakmakers`.

```
workshops                 inschrijvingen                gebruikers
+-----------+             +--------------+              +-------------+
| id (PK)   |◄────────────| workshop_id  |              | id (PK)     |
| titel     |             | id (PK)      |              | voornaam    |
| categorie |             | naam         |              | achternaam  |
| datum     |             | email        |              | email       |
| prijs     |             | telefoon     |              | wachtwoord  |
| plekken   |             | aantal       |              | rol         |
+-----------+             | dieet        |              +-------------+
                          | opmerking    |
                          +--------------+
```

Alle lesoefeningen gebeuren in `starter-website-3` (De Smaakmakers), net als bij FEO en JS.

---

## Planning naast FEO en JS

| Week | Backend (dit vak) | HTML & CSS | JavaScript |
|---|---|---|---|
| 1 | H1 POST en CREATE | H1 Formulier basis | H1 Functies |
| 2 | H2 Server-side validatie | H2 Keuzevelden | H2 Elementen maken |
| 3 | H3 Registreren | H3 HTML-validatie | H3 Objecten + fetch |
| 4 | H4 Inloggen en sessions | H4 Formulieren stylen | H4 Filteren |
| 5 | H5 Herhaling H1-H4 | H5 Responsive en toegankelijk | H5 Client- vs. server-side |
| 6 | H6 JOINS | H5 (les 2) | H5 (les 2) |
| 7 | H7 Van formulier tot database | H6 Eindproject | H6 Eindproject |
| 8 | H8 Zoeken | H6 | H6 |
| 9 | H9 Dashboard | H6 (gesprekken) | H6 (gesprekken) |

**Afhankelijkheden:**
- BEO H1-H2 behandelen `$_POST` en server-side validatie. In JS H5 (week 5) kennen studenten dat dus al, en ligt de nadruk op het verschil tussen client en server.
- BEO H7 (week 7) bouwt op JS H3 (`fetch`) en JS H5 (`verwerk.php`). Die zijn dan af.

---

## Hoofdstukken

| # | Hoofdstuk | Leerdoelen | Bestanden |
|---|---|---|---|
| 1 | **POST en CREATE** | Database koppelen (herhaling Blok 3); formulier met `method="post"`; `$_POST` uitlezen; `INSERT` met `?`-parameters; doorsturen met `header('Location: ...')` | `database.php`, `header.php`, `footer.php`, `workshops_overzicht.php`, `workshop_create.php`, `workshop_create_process.php` |
| 2 | **Server-side validatie** | Formulier en verwerking in één bestand; `$fouten`-array per veld; ingevulde waarden terugzetten; regels: lengte, keuzelijst (`in_array`), datum, getal, uniek (`SELECT` vóór `INSERT`) | `workshop_create.php` |
| 3 | **Registreren** | Tabel `gebruikers`; registratieformulier met validatie; e-mailadres uniek; `password_hash`; uitleggen waarom wachtwoorden nooit leesbaar worden opgeslagen | `registreren.php` |
| 4 | **Inloggen en sessions** | `password_verify`; `session_start` en `$_SESSION`; `session_check.php` en `admin_check.php` (rollen); uitloggen; één foutmelding voor e-mail en wachtwoord | `login.php`, `session_check.php`, `admin_check.php`, `account.php`, `logout.php` |
| 5 | **Herhaling H1-H4** | Samenvatting; oefenopdrachten; "Debug deze code" met vijf (beveiligings)fouten | - |
| 6 | **JOINS gebruiken** | Foreign key; `JOIN ... ON`; `JOIN` + `WHERE`; verschil `JOIN` en `LEFT JOIN` | `inschrijvingen.php`, `workshop_inschrijvingen.php`, (extra) `mijn_inschrijvingen.php` |
| 7 | **Van formulier tot database** | PHP die JSON teruggeeft voor `fetch`; `verwerk.php` laat de workshop opzoeken in de database; inschrijving opslaan (`INSERT`) en plekken bijwerken (`UPDATE`); Post/Redirect/Get | `workshops.php`, `verwerk.php`, `bedankt.php` |
| 8 | **Zoeken** | Zoekformulier met `GET`; `LIKE` met `%`; zoeken in meerdere kolommen; SQL-injectie zien en begrijpen; zoeken op de server vs. filteren in de browser (JS H4) | `inschrijvingen.php` |
| 9 | **Dashboard bouwen** | `COUNT`, `SUM`, `MIN`/`MAX`; berekenen over een `JOIN`; `GROUP BY`; `ORDER BY ... LIMIT 1`; resultaten in kaarten | `dashboard.php` |

---

## Wat heb je aan het einde van dit vak geleerd?

✅ Gegevens uit een formulier ontvangen met `$_POST` en opslaan met `INSERT`
✅ Invoer controleren op de server, met foutmeldingen per veld en behoud van wat de gebruiker had ingevuld
✅ Veilige queries schrijven met `?`-parameters, en uitleggen wat SQL-injectie is
✅ Gebruikers laten registreren en inloggen, met gehashte wachtwoorden en sessions
✅ Pagina's afschermen voor niet-ingelogde gebruikers en voor gebruikers zonder de juiste rol
✅ Gegevens uit meerdere tabellen combineren met `JOIN` en `LEFT JOIN`
✅ Zoeken in de database met `LIKE`
✅ Kerncijfers berekenen met `COUNT`, `SUM` en `GROUP BY`
✅ Uitleggen hoe één formulier door HTML, CSS, JavaScript, PHP en de database gaat

---

## Openstaande punten

- **Eindproject BEO:** dit blok heeft geen apart BEO-eindproject; de FEO/JS-eindprojecten lopen in week 7-9. Logische vervolgstap (projectweek of Blok 5): `mijn-variant` krijgt dezelfde backend.
- **Blok 5:** `UPDATE` en `DELETE` als volledige CRUD (hier alleen het bijwerken van plekken), PDO, transacties (zie de bekende beperking bij het boeken van de laatste plek in de docentenhandleiding).
- **GitHub-repo:** `starter-website-3` eventueel als eigen repo onder NOVA-college-Haarlem.
