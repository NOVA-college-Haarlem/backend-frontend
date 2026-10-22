# Samenvattingsquiz Backend PHP (Mentimeter)

**Klas:** zwsd26f · **Stof:** BEO Hoofdstuk 1-7 (incl. sorteren, H5 Les 4) · **Duur:** ca. 20-25 min · **Type Menti-slide:** Quiz → *Select answer*

**Werkvorm (peer instruction):** laat eerst iedereen alleen stemmen. Heeft minder dan ~70% het goed? Dan 1 minuut overleggen met je buur en de vraag opnieuw stellen (slide dupliceren). Het juiste antwoord staat aangegeven met ✅.

> Menti toont geen code-opmaak. Code in een vraag staat daarom kort op één regel. Wil je het mooier, zet de code dan in een screenshot als afbeelding bij de vraag.

---

### 1. Waar draait PHP? (20 s)
Waar wordt PHP-code uitgevoerd?
- In de browser van de bezoeker
- ✅ Op de webserver, de browser krijgt alleen HTML
- In de database
- In VS Code

### 2. DRY (20 s)
Waarom zet je het menu in een apart bestand `menu.php`?
- PHP werkt alleen met losse bestanden
- Het menu laadt dan sneller
- ✅ Je past het menu op één plek aan en het verandert op elke pagina
- Anders mag je geen `foreach` gebruiken

### 3. Foreach met key (30 s)
`$menu = ['Home' => 'index.php'];` In `foreach ($menu as $key => $value)` - wat is `$value`?
- `Home`
- ✅ `index.php`
- `0`
- `['Home' => 'index.php']`

### 4. Alle rijen ophalen (20 s)
Je wilt **alle** drivers uit de database in een array. Welke functie gebruik je?
- ✅ `mysqli_fetch_all($result, MYSQLI_ASSOC)`
- `mysqli_fetch_assoc($result)`
- `mysqli_connect($result)`
- `mysqli_query($result)`

### 5. Database connectie (20 s)
Wat staat er in `database.php`?
- Alle HTML van de website
- De queries van elke pagina
- De CSS van de tabel
- ✅ De verbinding met de database (`mysqli_connect`)

### 6. GET-parameter (20 s)
De URL is `driver-profile.php?id=7`. Wat geeft `$_GET['id']`?
- `id`
- `driver-profile.php`
- ✅ `7`
- `null`

### 7. Detailpagina (30 s)
Welke query hoort bij een detailpagina?
- `SELECT * FROM drivers`
- ✅ `SELECT * FROM drivers WHERE driverId = $driverId`
- `SELECT driverId FROM drivers`
- `DELETE FROM drivers WHERE driverId = $driverId`

### 8. Eén rij (20 s)
Waarom gebruik je op een detailpagina `mysqli_fetch_assoc` en niet `mysqli_fetch_all`?
- `fetch_all` werkt niet met `WHERE`
- `fetch_assoc` is nieuwer
- Er is geen verschil
- ✅ Je krijgt één rij terug, dus je hoeft niet te loopen

### 9. isset (20 s)
Wat doet `isset($_GET['filter'])`?
- ✅ Controleert of `filter` in de URL staat
- Zet `filter` in de URL
- Haalt het filter uit de database
- Wist het filter

### 10. Filter-link (30 s)
Welke link filtert op Nederlandse drivers, met de filtercode uit H5?
- `drivers-table.php?Dutch`
- `drivers-table.php?filter=Dutch`
- ✅ `drivers-table.php?filter=nationality&value=Dutch`
- `drivers-table.php&filter=nationality?value=Dutch`

### 11. ORDER BY (20 s)
Wat doet `SELECT * FROM drivers ORDER BY surname ASC`?
- Toont alleen drivers met een achternaam
- ✅ Toont alle drivers, gesorteerd op achternaam van A naar Z
- Toont alle drivers, gesorteerd van Z naar A
- Toont de eerste driver

### 12. ASC of DESC (20 s)
Je wilt de duurste les bovenaan. Welke query klopt?
- `ORDER BY prijs ASC`
- `ORDER BY prijs UP`
- `WHERE prijs DESC`
- ✅ `ORDER BY prijs DESC`

### 13. Volgorde in de query (30 s)
Waar staat `ORDER BY` als je ook een `WHERE` gebruikt?
- ✅ Achter de `WHERE`
- Vóór de `WHERE`
- Vóór `SELECT`
- Je kunt ze niet combineren

### 14. Waarom een if per sortering? (30 s)
Waarom schrijven we `if ($_GET['sort'] == 'naam')` in plaats van `ORDER BY $sort`?
- `ORDER BY` werkt niet met variabelen
- Een `if` is sneller
- ✅ Zo komt alleen een query die jij geschreven hebt in de database, niet wat iemand in de URL typt
- Zonder `if` sorteert hij altijd `DESC`

### 15. Lees de foutmelding (30 s)
`Warning: Undefined array key "id"` - wat is de meest waarschijnlijke oorzaak?
- De database staat uit
- ✅ Er staat geen `?id=...` in de URL
- Je `foreach` mist een `endforeach`
- Je CSS-bestand is niet gekoppeld

### 16. Niet-bestaand id (30 s)
`driver-profile.php?id=9999` bestaat niet. Wat geeft `mysqli_fetch_assoc` terug?
- Een lege string `""`
- Een foutmelding van MySQL
- `0`
- ✅ `null`

*Uitleg: daarom vang je dit af met `if ($driver === null)` (H7, Opdracht 5).*

---

## Antwoordoverzicht

| # | Onderwerp | Juist |
|---|---|---|
| 1 | PHP op de server | B |
| 2 | DRY / include | C |
| 3 | foreach key => value | B |
| 4 | mysqli_fetch_all | A |
| 5 | database.php | D |
| 6 | $_GET | C |
| 7 | SELECT WHERE | B |
| 8 | mysqli_fetch_assoc | D |
| 9 | isset | A |
| 10 | Filter-link | C |
| 11 | ORDER BY ASC | B |
| 12 | ORDER BY DESC | D |
| 13 | WHERE vóór ORDER BY | A |
| 14 | if per sortering | C |
| 15 | Undefined array key | B |
| 16 | null bij niet-bestaand id | D |
