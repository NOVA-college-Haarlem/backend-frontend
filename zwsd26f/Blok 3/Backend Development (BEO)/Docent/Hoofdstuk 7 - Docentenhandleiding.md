## Hoofdstuk 7: Extra - Code lezen en debuggen - Docentenhandleiding

*Bij: `../Hoofdstuk 7 - Extra - Code lezen en debuggen.md` (studentversie)*

**Type:** herhaling / opvulling als de klas klaar is met H1-H6. Geen nieuwe stof.
**Startcode:** het Tools4Ever-project van de student (H6). Schema: `tool_id`, `tool_name`, `tool_category`, `tool_price` (**in centen**), `tool_brand`, `tool_image`; users: `id`, `firstname`, `lastname`, `email`, `is_active`, `role`.
**PRIMM-fasen:** Predict (opdr. 1) → Investigate (opdr. 2-4) → Modify (opdr. 5) → Make (opdr. 6-7)

### Waarom deze les?
Studenten kunnen na H6 code *produceren* door patronen te kopiëren, maar lopen vast zodra iets niet werkt. Ze lezen foutmeldingen niet en plakken ze in AI. Deze les traint precies de vaardigheden die in het eindproject 3B en het assessment worden gevraagd: code lezen, uitleggen en zelf repareren. Omdat alles bekende stof is, gaat alle aandacht naar het *denken*, niet naar nieuwe syntax.

### Leerdoelen
Na deze les kan de student:
- De output van een stukje PHP met arrays, `foreach` en `$_GET` voorspellen
- Een PHP-foutmelding lezen en de regel met de fout vinden
- Het verschil uitleggen tussen `mysqli_fetch_all` (lijst van rijen) en `mysqli_fetch_assoc` (één rij)
- Met `var_dump` onderzoeken wat er in een variabele zit
- Een detailpagina beveiligen tegen een niet-bestaand id
- Zelfstandig (zonder voorbeeldcode) een overzichtspagina met `WHERE` bouwen

### AI-gebruik
Opdracht 1-3: **AI uit.** Een bug hunt waarbij AI de bugs vindt, levert niets op. Opdracht 4-7: **AI mag**, maar de student moet elke regel kunnen uitleggen (verantwoordingsvragen hieronder).

### Voorbereiding
- Eigen Tools4Ever-project draaiend om live te demonstreren
- Opdracht 1 en 3 eventueel uitprinten: op papier voorspellen werkt beter dan in VS Code
- Controleer dat `display_errors` aan staat in de Docker-container (anders zien studenten bij opdracht 2/3 een witte pagina). Snelle check: zet een fout in een bestand en kijk of de melding verschijnt

### Lesopbouw (2 lessen van 90 minuten)

#### Les 1: lezen en debuggen

**Start (5 min)**
"Wie heeft deze week een foutmelding in ChatGPT geplakt zonder hem te lezen?" Kernzin op het bord: *"De foutmelding is geen straf, het is een hint."*

**Opdracht 1 - Predict (20 min) - AI uit**
Individueel op papier, dan in tweetallen vergelijken, dan pas testen. Antwoorden:
- **1a** `Makita` - arrays tellen vanaf 0. Klassieke fout: "Bosch"
- **1b** `Bosch - Boormachine` - let op spaties in de string `' - '`
- **1c** `40` - laat de waarde van `$totaal` per ronde opschrijven (tracetabel: 0 → 10 → 35 → 40)
- **1d** `rood3` - geen spatie of enter, want er staat geen `<br>`. Veel studenten verwachten `3 rood` (volgorde van de URL)
- **1e** `Hamer` en `Zaag` onder elkaar; `Tang` (8) niet. Laat per ronde de `if` hardop evalueren

**Opdracht 2 - Foutmeldingen (10 min)**
Antwoorden: **A-2, B-1, C-4, D-3.**
Leg bij A het "regel erboven"-principe uit: PHP merkt de ontbrekende `;` pas als het volgende statement begint. Laat het live zien.

**Opdracht 3 - Bug hunt (40 min) - AI uit**
In tweetallen. Loop rond en geef geen antwoorden, maar vraag: *"Wat zegt de foutmelding? Welke regel?"* Antwoorden:

| Bug | Fout | Foutmelding / symptoom | Oplossing |
|---|---|---|---|
| 1 | `;` ontbreekt na de query-string | `Parse error ... unexpected variable "$result"` op regel 4 | `;` op regel 3 |
| 2 | `$tools` i.p.v. `$tool` in de loop | `Undefined array key "tool_name"` | `$tool['tool_name']` |
| 3 | `mysqli_fetch_all` voor één rij | `Undefined array key "tool_name"` (want `$tool[0]['tool_name']` bestaat wel) | `mysqli_fetch_assoc` |
| 4 | Link stuurt `tool_id`, pagina leest `id` | `Undefined array key "id"` | Namen gelijk maken (`?id=`) |
| 5 | Dubbele `endforeach` | `Parse error ... unexpected token "endforeach"` | Eén weghalen |
| 6 | Quotes om een tekstwaarde in SQL vergeten | Fatal error / SQL-syntax, `Bosch` wordt als kolomnaam gezien | `WHERE tool_brand = '$value'` |

Bespreek **bug 3** klassikaal met een `var_dump` van beide varianten naast elkaar. Dit is de belangrijkste: dezelfde verwarring zit in bijna elke detailpagina die misgaat.
Bespreek bij **bug 6** kort dat code die `$_GET` direct in een query plakt onveilig is (SQL-injectie). Niet uitdiepen, prepared statements komen in Blok 4 - wel benoemen, zodat het in het assessment herkend wordt.

**Opdracht 4 - var_dump (15 min)**
Verwachte antwoorden:
- Keys: `tool_id`, `tool_name`, `tool_category`, `tool_price`, `tool_brand`, `tool_image`
- Bij `fetch_assoc`: één array met keys. (Heeft de student nog `fetch_all` staan? Dan zie je `array(1) { [0]=> array(6) ...` - mooi bruggetje naar bug 3)
- `?id=9999` geeft `NULL` en daarna warnings. Dat is de aanleiding voor les 2

#### Les 2: zelf maken

**Terugblik (5 min)**
Toon één bug uit les 1 opnieuw. Wie vindt hem binnen 30 seconden?

**Opdracht 5 - Modify (20 min)**
`mysqli_fetch_assoc` geeft `null` als er geen rij is, dus `$tool === null` werkt. Sterke studenten: laat ze ook `?id=` (leeg) en geen `id` testen. Dat laatste geeft nog steeds `Undefined array key "id"`; oplossing met `isset($_GET['id'])` - herhaling van het filter uit H5.

**Opdracht 6 - Make (40 min) - AI mag**
Verwachte query:
```php
$query = "SELECT * FROM tools WHERE tool_price < 2000";
```
De valkuil is bewust: `tool_price` staat in **centen**. Wie `< 20` schrijft, krijgt een lege tabel. Laat studenten dat zelf ontdekken via phpMyAdmin of `var_dump` - dat is precies de onderzoekshouding die je wilt. Bij weergave: `$tool['tool_price'] / 100` of `number_format($tool['tool_price'] / 100, 2, ',', '.')`.
Resultaat met de standaarddata: Hammer, Schroevendraaierset, Combinatietang, Waterpas, Rolmaat, Voegenkrabber, Kitpistool, Lijmpistool, Verfroller, Plamuurmes (10 tools).

**Opdracht 7 - Extra (20 min)**
- `count($tools)` - PHP-functie, geen SQL nodig
- `?max=50` → `$max = $_GET['max'] * 100;` met `isset`-check en een standaardwaarde
- Actieve users: `WHERE is_active = 1`

**Verantwoordingsvragen (rondlopen)**
- *"Waarom gebruik je hier `fetch_all` en op de detailpagina `fetch_assoc`?"*
- *"Wat gebeurt er als iemand `?max=abc` in de URL zet?"*
- *"Waar komt `$conn` vandaan?"*
- *"Waarom rekenen we in centen en niet in euro's?"* (afrondingsfouten bij kommagetallen)

### Differentiatie
- **Snelle studenten:** laten zelf een bug bedenken in hun eigen code en die door een klasgenoot laten zoeken
- **Langzame studenten:** opdracht 1, 3 en 5 zijn de kern; 6 en 7 mogen blijven liggen

### Koppeling met het assessment
De verantwoordingsvragen hierboven sluiten aan op de mondelinge vragen bij het eindproject 3B. Een student die bug 3 en bug 4 kan uitleggen, kan ook de vraag "leg uit hoe je detailpagina werkt" beantwoorden.
