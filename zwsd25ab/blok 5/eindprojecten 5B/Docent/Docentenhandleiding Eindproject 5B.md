## Eindproject Blok 5B - Docentenhandleiding

*Bij: `../README.md`, `../Eindproject Blok 5B.md` en de zes themabestanden (studentversie)*

**Klas:** zwsd25ab
**Duur:** 4,5 dag. Maandagochtend zijn de toetsen rekenen en AKT; het project start maandagmiddag.
**Aftekenen:** vrijdag aan het einde van de dag. **Mondeling:** de week erna.
**Stof:** Backend H1 t/m H7 (PDO, veilige data, update, soft delete + AJAX, security, filters, error pages) + de SQL-lessen 1-6. **H8 (Mollie) hoort er niet bij.**

### Wat is dit project?
Studenten bouwen in hun eentje een complete webapplicatie voor een fictieve opdrachtgever. Er zijn zes thema's: Dierenasiel, Fietsverhuur, Escape Room, Camping, Kringloop en Autogarage. Geen van die thema's kwam in 5A voor. De technische eisen zijn voor elk thema gelijk, alleen het verhaal en de userstories verschillen.

Het verschil met 5A: de student krijgt **geen databaseontwerp**. In het verhaal van de opdrachtgever staan geen tabellen of kolommen. De student moet zelf een **ERD** maken, en dat teken jij maandagmiddag af voordat er gebouwd wordt.

### De vier ontwerpregels
Dit zijn de afspraken waar je maandag het meest op moet letten. Ze staan ook in de opdracht.

1. **Alleen één-op-veel relaties.** Geen veel-op-veel relaties en dus geen koppeltabellen. Een tabel als `reserveringen` met een `user_id` en een `fiets_id` is wél goed: dat zijn twee één-op-veel relaties, en de reservering heeft eigen gegevens (datums, prijs).
2. **Rollen in een aparte tabel.** Er is een tabel `roles` (klant, medewerker, admin) en één tabel `users` met `role_id` als foreign key. **Geen** aparte tabel `admins` of `medewerkers`, en **geen** rol als tekstkolom.
3. **Alleen `LEFT JOIN`.** `INNER JOIN` en `RIGHT JOIN` komen niet voor, niet in de applicatie en niet in het SQL-dossier.
4. **Bewuste `NULL`-kolommen.** In elk verhaal zit minimaal één gegeven dat niet altijd bekend is. De student moet bij elke `NULL`-kolom kunnen uitleggen waarom die leeg mag zijn.

> ⚠️ **De `roles`-tabel is nieuw voor de klas.** In H5 hebben ze de rol als tekstkolom `role` in `users` gezet en gecontroleerd met `$_SESSION['role'] !== 'administrator'`. In 5B staat de rol in een eigen tabel en halen ze de naam bij het inloggen op met een `LEFT JOIN`. De uitleg en voorbeeldcode staan in `Eindproject Blok 5B.md` onder *Gebruikers en rollen*. Benoem dit maandag expliciet in de inleiding.

### Voorbereiding (vóór maandag)
- Vul in `../Studentverdeling.md` de echte namen in.
- Lees het thema-overzicht onderaan deze handleiding door, zodat je bij het aftekenen weet wat je ongeveer mag verwachten.
- Zorg dat je de docker-template zelf een keer hebt opgestart (zie *Project setup* in `Eindproject Blok 5B.md`), zodat je studenten maandag snel kunt helpen.
- Bedenk vooraf een voorbeeldthema dat **niet** in de lijst staat om het ERD mee voor te doen, bijvoorbeeld een kapsalon (zie hieronder).

### Maandagmiddag

**Inleiding (± 25 min)**

1. **Wat en waarom (3 min).** "Jullie bouwen deze week een hele applicatie voor een opdrachtgever, met alles uit H1-H7 en de SQL-lessen. Er is geen kant-en-klaar database: het ontwerp is deel van de opdracht."
2. **Thema's (2 min).** Laat de studentverdeling zien. Iedereen opent het eigen themabestand.
3. **Rondleiding door de opdracht (5 min).** Laat in één thema zien: het verhaal van de opdrachtgever, de userstories met de labels tussen haakjes (*H4, AJAX*, *LEFT JOIN* enz.), de technische eisen, het SQL-dossier en de checklist.
4. **De vier ontwerpregels (5 min).** Zie hierboven. Besteed extra tijd aan de rollen: een admin is een *gebruiker met een andere rol*, niet een aparte tabel.
5. **ERD voordoen (8 min).** Doe het klassikaal op het bord met een voorbeeldthema dat niet in de lijst staat, bijvoorbeeld:

   > *"Bij kapsalon Knip maken klanten een afspraak voor een behandeling, zoals knippen of verven. Een klant kan vaker een afspraak maken, maar elke afspraak is voor één behandeling. Bij een afspraak wijzen we een kapper toe, maar dat weten we niet altijd meteen. Na afloop kunnen we een opmerking noteren."*

   Laat de studenten de werkwijze uit de opdracht volgen:
   - Zelfstandige naamwoorden onderstrepen → `behandelingen`, `afspraken`, `users`, `roles`
   - "Een klant kan vaker…, maar elke afspraak is voor één…" → één-op-veel; de foreign key komt aan de **veel**-kant (`afspraken.user_id`, `afspraken.behandeling_id`)
   - De kapper is een `user` met de rol medewerker → `afspraken.kapper_id` naar `users`, en die mag `NULL` zijn ("weten we niet altijd meteen")
   - De opmerking is pas na afloop bekend → `NULL`
6. **Planning en deadline (2 min).** Laat de planning in `../README.md` zien. Benadruk: *ERD vandaag afgetekend, anders begin je dinsdag met een achterstand. Vrijdag einde van de dag is de aftekendeadline. Zonder aftekening geen mondeling.*

**Werken aan het ERD (rest van de middag)**
Studenten werken in dbdiagram.io of draw.io en zetten het ERD als `docs/erd.png` in hun repository. Loop rond en teken af zodra een ERD goed is. Wie klaar is, begint aan `sql/database.sql`.

### ERD aftekenen: waar let je op?

Teken af als:
- [ ] Alle tabellen met kolommen, datatypes, PK's en FK's erin staan
- [ ] `roles` en `users` erin staan, met `users.role_id` als FK
- [ ] Alle relaties één-op-veel zijn, met de FK aan de veel-kant
- [ ] De `NULL`-kolommen uit het verhaal gemarkeerd zijn
- [ ] Je met de student één userstory met een `LEFT JOIN` en de statistiekenpagina kunt "naspelen" op het ERD: welke tabellen koppel je?

Veelvoorkomende fouten:

| Fout | Wat je vraagt |
|------|---------------|
| Aparte tabel `admins` of `medewerkers` | "Wat is het verschil tussen een admin en een klant? Moet dat een andere tabel zijn of een ander gegeven?" |
| `role` als tekstkolom in `users` | "Wat gebeurt er als iemand `Admin` typt in plaats van `admin`?" |
| Koppeltabel / veel-op-veel | "Wat is het ene ding waar deze rij bij hoort?" Meestal blijkt het een reservering met eigen gegevens, of een overbodige tabel |
| FK aan de verkeerde kant (`fietsen.reservering_id`) | "Kan een fiets dan maar één keer verhuurd worden?" |
| Prijs alleen bij het product, niet bij de reservering | Lees samen de zin in het verhaal over "de prijs van dat moment" |
| Prijs als `FLOAT` | `DECIMAL(10,2)` is de eis |
| `deleted_at` vergeten | Welke userstory gaat over uitzetten en terugzetten? |
| Geen `NULL`-kolommen | "Wat weet de opdrachtgever nog niet op het moment dat de rij wordt aangemaakt?" |

> Categorie, soort of type als **eigen tabel** (één-op-veel) is ook goed. Let dan op dat de student `DISTINCT` op een andere plek nodig heeft, bijvoorbeeld bij een andere keuzelijst of in het SQL-dossier.

> Het **logboek** mag een bestand zijn (zoals in H5 met `file_put_contents`) of een tabel. Kiest de student een tabel, dan hoort die in het ERD, met een FK naar `users`.

### Dinsdag t/m vrijdag: begeleiding

| Dag | Wat de studenten doen | Check bij elke student |
|-----|----------------------|------------------------|
| **Dinsdag** | `database.sql`, daarna bezoeker: overzicht, detail, filter, sorteren | Draait `database.sql` foutloos op een lege database? Klopt het nog met het ERD? |
| **Woensdag** | Klant: registreren, inloggen, actie via AJAX, eigen overzicht | Krijgt een nieuwe gebruiker op de server de rol klant? Werkt de AJAX-actie zonder page reload? |
| **Donderdag** | Medewerker en admin: beheer, soft delete, overzichten, statistieken, logboek | Kan een medewerker bij de statistieken of het logboek? (Dat moet een 403 geven.) |
| **Vrijdag** | Error pages, `try`/`catch`, SQL-dossier af, aftekenen | Zie *Aftekenen op vrijdag* |

Wie op woensdag nog geen werkende `database.sql` heeft, loopt achter. Spreek die student dan aan en laat de userstories voor de bezoeker en klant eerst afmaken.

**Waar studenten vaak vastlopen**

| Probleem | Oorzaak / hint |
|----------|---------------|
| `Cannot add or update a child row: a foreign key constraint fails` bij het importeren | Inserts in de verkeerde volgorde. Eerst de tabellen zonder FK (`roles`, de producten), dan `users`, dan de reserveringen |
| `LEFT JOIN`-lijst "zonder reserveringen" toont alles | `WHERE reserveringen.id IS NULL` ontbreekt |
| Overzicht toont dubbele of te weinig rijen | Verkeerde kolommen in de `ON`. Laat de query eerst in phpMyAdmin draaien |
| Fout bij `HAVING` / `WHERE COUNT(...)` | Kolomfuncties mogen niet in `WHERE`; voorwaarde op een groep hoort in `HAVING` |
| `SUM`/`AVG` over een `LEFT JOIN` geeft `NULL` | Klopt: er zijn rijen zonder koppeling. Goede vraag voor het mondeling |
| Rolcheck laat de admin niet in het beheergedeelte | Check op één rol (`!== 'medewerker'`) in plaats van `in_array($_SESSION['role'], ['medewerker', 'admin'])` |
| `$_SESSION['role']` is leeg | De `LEFT JOIN roles` met `roles.name AS role` ontbreekt in de inlogquery |
| AJAX-actie doet niets | Open de Network-tab: welke status geeft het PHP-bestand terug? Vaak een sessiecheck die doorverwijst, of een PHP-fout in het antwoord |

### Aftekenen op vrijdag

Loop de checklist in `Eindproject Blok 5B.md` door. Snelle volgorde (± 10 min per student):

1. **Database:** laat de student `sql/database.sql` importeren in een lege database. Gaat dat foutloos? Vergelijk kort met `docs/erd.png`.
2. **Drie rollen:** log in als klant, medewerker en admin. Open als klant een beheerpagina en als medewerker het logboek: beide moeten een **403** geven.
3. **Foute invoer:** open een detailpagina met `?id=abc` en `?id=99999` (**404**). Vul in een formulier `<script>alert(1)</script>` in en kijk of het als tekst op het scherm komt.
4. **SQL in de app:** statistiekenpagina (alle vijf de kolomfuncties, `GROUP BY` én `HAVING`), filter met `DISTINCT`-keuzelijst, sorteren in twee richtingen, de `LEFT JOIN`-lijst met rijen zonder koppeling.
5. **AJAX:** de actie werkt zonder dat de pagina herlaadt.
6. **SQL-dossier:** `sql/queries.sql` heeft minimaal 12 queries met een comment-vraag, vijf `LEFT JOIN`s (twee met uitleg over de `NULL`-rijen), en een `INSERT`, `UPDATE` en `DELETE`.
7. **Git:** regelmatige commits met duidelijke messages.

Niet alles af? Teken af wat er is en noteer wat ontbreekt; dat is input voor het mondeling.

### Mondeling (week erna)
De voorbereidingsvragen voor de student staan in `../README.md`. Laat de student altijd vanuit de **eigen** code en het **eigen** ERD uitleggen. Bruikbare vragen:
- "Wijs in je ERD een één-op-veel relatie aan. Waarom staat de foreign key aan deze kant?"
- "Waarom mag deze kolom `NULL` zijn?"
- "Waarom staan de rollen in een aparte tabel? Wat gebeurt er als een medewerker deze URL opent?"
- "Leg deze `LEFT JOIN` uit. Welke rijen krijgen `NULL`-waardes?"
- "Waarom staat deze voorwaarde in `HAVING` en niet in `WHERE`?"
- Wijs een willekeurige regel aan: "Wat doet deze regel, en wat gebeurt er als je hem weghaalt?"

### Thema-overzicht (om af te tekenen)
Dit is één mogelijk ontwerp per thema; andere oplossingen zijn ook goed zolang ze aan de vier ontwerpregels voldoen. Elk thema heeft daarnaast `roles` en `users` (met `role_id`). Kolommen tussen haakjes met `NULL` mogen leeg zijn.

| Thema | Tabellen (naast `roles` en `users`) | Natuurlijke `NULL`-kolommen | `LEFT JOIN` "zonder" | `HAVING` |
|-------|-------------------------------------|-----------------------------|----------------------|----------|
| **Dierenasiel** | `animals`, `adoption_requests` (`user_id`, `animal_id`, datum, motivatie, status) | `animals.birthdate`, `animals.chip_number` | dieren zonder aanvragen | soorten met meer dan 3 aanvragen |
| **Fietsverhuur** | `bikes`, `reservations` (`user_id`, `bike_id`, ophaal- en terugbrengdatum, totaalprijs) | `reservations.returned_at`, `reservations.note` | fietsen die nooit verhuurd zijn | types die meer dan 5 keer verhuurd zijn |
| **Escape Room** | `rooms`, `bookings` (`user_id`, `room_id`, datum, tijd, aantal spelers, prijs) | `bookings.escape_time`, `bookings.hints` | rooms die nooit geboekt zijn | rooms met een gemiddelde ontsnaptijd > 50 min |
| **Camping** | `spots`, `reservations` (`user_id`, `spot_id`, aankomst, vertrek, personen, totaalprijs) | `reservations.note`, `reservations.license_plate` | plekken zonder reserveringen | soorten met meer dan 10 reserveringen |
| **Kringloop** | `donors`, `articles` (`donor_id`), `reservations` (`user_id`, `article_id`) | `articles.donor_id` (anoniem), `articles.sold_at` | alle donateurs, ook met 0 artikelen | categorieën met een gemiddelde prijs > € 20 |
| **Autogarage** | `services`, `cars` (`user_id`), `appointments` (`car_id`, `service_id`, `mechanic_id`, datum, tijd, prijs) | `appointments.mechanic_id`, `appointments.mileage`, `appointments.remark` | auto's zonder afspraak | merken met meer dan 2 auto's |

Aandachtspunten per thema:
- **Kringloop:** een donateur is **geen** gebruiker (heeft geen account), dus een eigen tabel `donors`. `articles.donor_id` is een foreign key die `NULL` mag zijn.
- **Autogarage:** de monteur is een `user` met de rol medewerker. `appointments` verwijst dus twee keer indirect naar `users`: via `cars.user_id` (de klant) en via `mechanic_id` (de monteur). De afspraak hangt aan de **auto**, niet direct aan de klant.
- **Escape Room / Camping:** de beschikbaarheidscheck via AJAX is een `SELECT` op de boekingen van die room/plek op een datum. Daar is geen extra tabel voor nodig.
- **Alle thema's:** de prijs wordt **bij de reservering** opgeslagen (op de server berekend), omdat de opdrachtgever prijzen later verhoogt.
