# Eindproject Blok 5B (Hoofdstuk 1 t/m 7 + SQL)

## Wat is dit?

Dit is het eindproject voor de tweede helft van Blok 5. Je bouwt een complete webapplicatie voor een **nieuwe opdrachtgever**, met een thema dat je nog niet eerder hebt gebouwd. Je laat zien dat je alles uit **Hoofdstuk 1 t/m 7** beheerst én de **SQL-stof** van dit blok kunt toepassen: kolomfuncties, `GROUP BY`/`HAVING`, `DISTINCT`, `ORDER BY` en `LEFT JOIN`.

Je begint met een nieuwe repository, maar je mag je **eigen code** uit Eindproject 5A en de projectlessen als voorbeeld gebruiken (bijv. je `database.php`, je login of je header/footer). Je bouwt voor een ander thema, dus kopiëren zonder aanpassen werkt niet.

## Thema's

Je krijgt één van de zes thema's toegewezen - zie **[Studentverdeling.md](Studentverdeling.md)**. De technische eisen zijn voor alle thema's **exact gelijk**.

1. [Dierenasiel](Dierenasiel.md) - dierenasiel Pootjes & Co
2. [Fietsverhuur](Fietsverhuur.md) - fietsverhuur Trapkracht
3. [Escape Room](EscapeRoom.md) - escape room Locked Inn
4. [Camping](Camping.md) - camping De Duinpan
5. [Kringloop](Kringloop.md) - kringloopwinkel Tweede Ronde
6. [Autogarage](Autogarage.md) - garage Sleutelwerk

## Project setup

1. Kloon op GitHub het project [Docker Template](https://github.com/NOVA-college-Haarlem/docker-template) (je kunt de default settings aanhouden).
2. Kopieer de URL van de repository (via de groene knop "Code").
3. Open de map waarin je je projecten bewaart met VS Code.
4. Open de terminal en run `git clone <PASTE URL>`
5. Verander in de Windows Verkenner de naam "docker-template" naar de naam van je project, bijvoorbeeld "dierenasiel" of "camping".
6. Open dit project in VS Code.
7. Verander in `.env` de naam `MYSQL_DATABASE` van "testdb" naar de naam van je project.
8. Open de terminal en run `docker compose up -d`.
9. Je website draait nu op http://localhost en PhpMyAdmin op http://localhost:8000/.

## Let op: geen kant-en-klaar databaseontwerp

In het verhaal van de opdrachtgever staan **geen tabellen, kolommen of relaties**. Het ontwerp is onderdeel van de opdracht. Leid uit het verhaal af:

- Welke gegevens moet je opslaan, en in welke tabellen?
- Waar zitten de **één-op-veel relaties**? In dit project gebruik je **alleen één-op-veel relaties** - geen veel-op-veel relaties en dus geen koppeltabellen.
- Welke kolommen **moeten** gevuld zijn (`NOT NULL`) en welke **mogen leeg** blijven (`NULL`)? In elk verhaal zit minimaal één gegeven dat niet altijd bekend is.

### ERD (maandagmiddag)

Voordat je één regel code schrijft, maak je een **ERD** (Entity Relationship Diagram) van je database. Gebruik [dbdiagram.io](https://dbdiagram.io) of [draw.io](https://draw.io) en lever het op als `docs/erd.png` in je repository.

Je ERD bevat:
- Alle **tabellen** (entiteiten) met hun **kolommen** en **datatypes**
- Per tabel de **primary key** (PK) en elke **foreign key** (FK)
- De tabellen `roles` en `users` met de relatie ertussen (zie *Gebruikers en rollen* hieronder)
- De **relaties** tussen de tabellen, met de kardinaliteit erbij (**1** en **N**, bijvoorbeeld in kraaienpootnotatie). Alle relaties zijn **één-op-veel**.
- Bij elke kolom of hij `NULL` mag zijn

Werkwijze:
1. Onderstreep in het verhaal van de opdrachtgever alle **zelfstandige naamwoorden** - dat zijn mogelijke tabellen of kolommen.
2. Zoek de zinnen als *"een klant kan meerdere ..."* en *"elke ... hoort bij één ..."* - daar zitten je één-op-veel relaties. De foreign key komt altijd aan de **veel**-kant.
3. Controleer of je met je ERD **elke userstory** kunt bouwen. Zoek bijvoorbeeld uit welke tabellen je moet koppelen voor de statistiekenpagina en de `LEFT JOIN`-lijst.

> ✅ **Laat je ERD op maandagmiddag aftekenen voordat je gaat bouwen.** Verander je later in de week je database? Pas dan ook je ERD aan - ERD en `sql/database.sql` moeten aan het eind met elkaar kloppen.

## Technische eisen

### Database (SQL les 5 en 6)
- Minimaal **4 tabellen**, waarvan minimaal 2 met een **foreign key**
- Bij elke kolom een bewuste keuze voor `NULL` of `NOT NULL` - je kunt bij elke `NULL`-kolom uitleggen waarom die leeg mag zijn
- Geld als `DECIMAL(10,2)`, nooit als `FLOAT`
- Een bestand `sql/database.sql` dat je hele database vanaf nul opbouwt: eerst alle `CREATE TABLE`'s, dan de testdata - **eerst** de tabellen zonder foreign key, **daarna** de tabellen met foreign key
- Genoeg testdata om je statistieken en filters te kunnen laten zien: minimaal 10 rijen in je hoofdtabel, en een paar rijen waar een `NULL`-kolom echt leeg is

### Gebruikers en rollen

In elk thema zijn er drie soorten gebruikers: een **klant** (of lid, gast, speler), een **medewerker** en een **admin**. Elke soort mag andere dingen:

| Rol | Mag |
|-----|-----|
| klant | de eigen gegevens, reserveringen/boekingen/aanvragen bekijken en aanmaken |
| medewerker | het beheergedeelte: toevoegen, aanpassen, soft delete, de overzichten |
| admin | alles wat een medewerker mag, plus de **statistiekenpagina** en het **logboek** |

Een admin is dus geen aparte soort mens, maar een **gebruiker met een andere rol**. Dat leg je zo vast in je database:
- Een tabel `roles` met de rollen (`id`, `name`). Deze tabel heeft geen foreign key, dus die vul je in `database.sql` als **eerste**.
- Eén tabel `users` voor **alle** gebruikers, met een kolom `role_id` als **foreign key** naar `roles`. Een rol heeft veel gebruikers, een gebruiker heeft één rol: een **één-op-veel** relatie.
- **Geen** aparte tabellen als `admins`, `medewerkers` of `klanten`, en **geen** rol als losse tekst in `users`.
- Wie zich registreert, krijgt op de server automatisch de rol klant - de rol komt **nooit** uit het formulier.
- Medewerkers en de admin zet je in je testdata in `database.sql`.

Bij het inloggen haal je de naam van de rol op met een `LEFT JOIN` en zet je die in de sessie, net als in Hoofdstuk 5:

```php
$stmt = $pdo->prepare('SELECT users.*, roles.name AS role
                       FROM users
                       LEFT JOIN roles ON users.role_id = roles.id
                       WHERE users.email = ?');
$stmt->execute([$email]);
$user = $stmt->fetch();
// na password_verify():
$_SESSION['role'] = $user['role'];
```

Een pagina waar medewerker én admin mogen komen, controleer je met `in_array()`:

```php
if (!in_array($_SESSION['role'], ['medewerker', 'admin'])) {
    header('Location: 403.php');
    exit;
}
```

### PHP (Hoofdstuk 1 t/m 7)
- **H1** - alle queries via PDO met prepared statements, geen variabelen direct in een SQL-string
- **H2** - `htmlspecialchars()` op alle output, formulieren gevalideerd vóór opslag, wachtwoorden met `password_hash()` / `password_verify()`
- **H3** - update-functionaliteit (zie de userstories van je thema)
- **H4** - soft delete met `deleted_at` + herstellen, en minimaal één actie via **AJAX** (`fetch()`, zonder page reload)
- **H5** - sessie- én rolcheck op elke beschermde pagina (klant, medewerker en admin - zie *Gebruikers en rollen*), formulieren alleen via `POST`, id's controleren met `is_numeric()`, een logboek van beheeracties
- **H6** - een filter waarbij **minimaal 2 filters te combineren** zijn, met een `LEFT JOIN`
- **H7** - eigen 403-, 404- en 500-pagina's met `http_response_code()`, databasefouten afgevangen met `try`/`catch`

### SQL-stof in je applicatie
- **Kolomfuncties**: een statistiekenpagina voor medewerkers met `COUNT`, `SUM`, `AVG`, `MIN` en `MAX` - elk minimaal één keer
- **`GROUP BY` en `HAVING`**: minimaal één overzicht per groep (bijv. per categorie), en minimaal één keer `HAVING`
- **`DISTINCT`**: de keuzelijst van je filter komt uit de database, zonder dubbele waardes
- **`ORDER BY`**: bezoekers kunnen het aanbod sorteren (oplopend én aflopend)
- **`LEFT JOIN`**: overzichten met gegevens uit meerdere tabellen, en minimaal één overzicht dat ook rijen **zonder** koppeling toont (zie je thema)

## SQL-dossier: `sql/queries.sql`

Naast je applicatie lever je een bestand `sql/queries.sql` in. Daarin staan **minimaal 12 queries** die werken op jouw eigen database. Boven elke query staat in een comment welke vraag van de opdrachtgever de query beantwoordt:

```sql
-- Vraag: hoeveel fietsen hebben we per type?
SELECT type, COUNT(*) AS aantal FROM fietsen GROUP BY type;
```

Het dossier bevat minimaal:
- [ ] 1 query met `DISTINCT`
- [ ] 1 query met `WHERE` én `ORDER BY`
- [ ] Alle vijf de kolomfuncties: `MIN`, `MAX`, `COUNT`, `SUM`, `AVG`
- [ ] 1 query met `GROUP BY` en 1 met `GROUP BY` + `HAVING`
- [ ] **5 zelfbedachte `LEFT JOIN`-queries**, waarvan minimaal 2 die ook rijen **zonder** koppeling tonen
- [ ] Bij die 2 queries: een comment die uitlegt welke rijen er `NULL`-waardes krijgen, en waarom
- [ ] 1 `INSERT INTO`, 1 `UPDATE` en 1 `DELETE` (op testdata - in je applicatie gebruik je soft delete)

> Je mag de queries uit je applicatie hergebruiken in je dossier. Het dossier laat zien dat je ze ook zónder PHP kunt schrijven en uitleggen.

## Checklist (aftekenen op vrijdag)

**Database en SQL**
- [ ] ERD afgetekend (maandagmiddag) en opgeleverd als `docs/erd.png`
- [ ] ERD bevat PK's, FK's, kardinaliteit (1/N) en `NULL`-kolommen; alleen één-op-veel relaties
- [ ] ERD klopt met `sql/database.sql`
- [ ] `sql/database.sql` bouwt de hele database zonder fouten op
- [ ] Minimaal 4 tabellen, minimaal 2 foreign keys, bewuste `NULL`/`NOT NULL`-keuzes
- [ ] `sql/queries.sql` compleet volgens het SQL-dossier hierboven

**Functionaliteit**
- [ ] Alle userstories van je thema werken
- [ ] Statistiekenpagina met `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`, `GROUP BY` en `HAVING`
- [ ] Filter met minimaal 2 combineerbare filters en een keuzelijst met `DISTINCT`
- [ ] Sorteren oplopend én aflopend
- [ ] Overzicht met `LEFT JOIN` (rijen zonder koppeling)
- [ ] Minimaal één actie via AJAX

**Security**
- [ ] Alle queries via PDO met prepared statements
- [ ] Wachtwoorden gehasht en geverifieerd
- [ ] Alle output ge-escaped met `htmlspecialchars()`
- [ ] Formulieren gevalideerd, alleen via `POST` verwerkt
- [ ] Rollen in een aparte tabel `roles`, `users.role_id` als foreign key
- [ ] Sessie- én rolcheck op alle beschermde pagina's; statistieken en logboek alleen voor de admin
- [ ] Logboek van beheeracties

**Foutafhandeling**
- [ ] Soft delete + herstellen
- [ ] 403-, 404- en 500-pagina's
- [ ] Databasefouten afgevangen met `try`/`catch`

**Code kwaliteit**
- [ ] Logische naamgeving en gescheiden view/process-bestanden
- [ ] Database connectie in een apart bestand, header/footer via `include`
- [ ] Geen dubbele code
- [ ] Regelmatige commits met duidelijke messages

Voor de leerdoelen per week, zie `../Blok5_Leerdoelen_Samenvatting.md`.
