# Blok 4 (26F) - JavaScript Samenvatting

**Doelgroep:** MBO studenten klas 26F
**Duur:** 6 hoofdstukken, verdeeld over 3 taakklassen - 1,5 uur per week, parallel aan Frontend Development (FEO)
**Focus:** Van losse interacties naar **data-gedreven pagina's**, en het verschil tussen **client-side en server-side validatie** - opgebouwd volgens hetzelfde 4C/ID + PRIMM-ontwerp als Blok 3

> **Status:** blokontwerp, startcode en Hoofdstuk 1-6 (student- en docentversie) klaar. Een geteste uitwerking (stand na H5) staat in `Docent/uitwerking/` in de docentenrepo (`__docent lesprogramma`). Nog niet in de praktijk gegeven.
>
> **Let op:** Hoofdstuk 5 duurt twee lessen en Hoofdstuk 6 drie (bouwen, peer review, gesprekken - zoals in Blok 3). Totaal: 9 lesweken.

---

## Waar Blok 4 op voortbouwt

Na Blok 3 kan een student de DOM selecteren en aanpassen, reageren op events, condities en `classList` gebruiken, met arrays en `forEach` duplicatie voorkomen en formulier-input uitlezen (zie `../../../Blok 3/Frontend Development (FEO)/JavaScript (JSO)/blok3-samenvatting.md`). Uit FEO Blok 3 kennen ze CSS-variabelen, flexbox-cards en media queries; uit BEO Blok 3 kennen ze `docker compose up -d`, de request-response cycle en de basis van PHP.

In Blok 3 stond de inhoud **in de HTML** en voegde JS er gedrag aan toe. In Blok 4 draait dat om: de inhoud staat **als data** in JS (en later in een JSON-bestand) en JS bouwt de HTML. Het didactische probleem is hetzelfde als in Blok 3 (duplicatie), alleen groter: zes hardgecodeerde cards, zes bijna-identieke click-handlers, en dezelfde prijs op drie plekken (HTML, JS, formulier).

**Didactiek:** 4C/ID + PRIMM, AI-beleid per PRIMM-fase, Make-fase als bron van eigenaarschap - één-op-één zoals in Blok 3. Elke taakklasse eindigt met een **Make** en een **"Debug deze AI-output"**-oefening.

**Parallel met FEO:** FEO Blok 4 gaat over formulieren (inputs, types, labels, `required`, styling). Beide vakken werken op **dezelfde startsite**: wat FEO aan het formulier bouwt, valideert JS in Hoofdstuk 5.

**Bestandsstructuur:** zoals in Blok 3 - per hoofdstuk `Hoofdstuk N - ....md` (studentversie) en `Docent/Hoofdstuk N - Docentenhandleiding.md` in de docentenrepo (`__docent lesprogramma`).

---

## Startcode: De Smaakmakers (`../starter-website-3/`)

Een kookstudio met zes workshops en een inschrijfformulier. Draait met `docker compose up -d` op http://localhost (nodig voor `fetch` en `verwerk.php`).

**Twee mappen:** alle lesoefeningen gebeuren in `starter-website-3` (De Smaakmakers). De Make-opdrachten (H2, H4) en het eindproject (H6) gebeuren in `mijn-variant`, de kopie met eigen onderwerp die studenten maken in FEO H2 (poort 8080). Zie de tabel "Werkwijze" in `../blok4-samenvatting.md`.

| Bestand | Bewuste gebreken (= lesstof) | Opgelost in |
|---|---|---|
| `index.html` | Zes hardgecodeerde cards; prijzen inconsistent genoteerd (`€ 45`, `€55,-`, `65 euro`, `€ 42,5`) | JS H1-3 |
| `js/script.js` | Zes vrijwel identieke click-handlers via index; strings met `+` aan elkaar geplakt; prijzen in een `if/else`-ketting | JS H1-3 |
| Formulier | Geen labels, verkeerde input-types (`text` voor e-mail en aantal), geen `required`; een **verborgen prijsveld** | FEO Blok 4 + JS H5 |
| `verwerk.php` | Controleert niets en **gelooft de prijs uit het formulier** | JS H5 |
| `data/workshops.json` | - (dezelfde data, klaar voor `fetch` in H3 en voor PHP in H5) | - |

De workshop "Sushi voor beginners" is **vol** (`plekken: 0`), maar staat gewoon in de `<select>`. Dat is bewust: het is het voorbeeld van iets dat alleen de server kan controleren (H5).

---

## Taakklassen

| Taakklasse | Hoofdstuk | Kern |
|---|---|---|
| **1** | 1-2 | Functies met `return`, template literals, HTML genereren vanuit JS |
| **2** | 3-4 | Objecten, data laden met `fetch`, filteren en zoeken |
| **3** | 5-6 | Client-side vs. server-side validatie, eindproject + verantwoording |

---

## Taakklasse 1: Code ordenen en HTML genereren (Hoofdstuk 1-2)

### Hoofdstuk 1: Functies die iets teruggeven
**Leerdoelen:**
- Instap-herhaling Blok 3: `querySelector`, `addEventListener`, `forEach`
- Een functie schrijven met **parameters** en een **`return`**-waarde
- Verschil uitleggen tussen een functie die iets *doet* (DOM aanpassen) en een functie die iets *teruggeeft*
- Template literals gebruiken (`` `Je hebt gekozen: ${titel} op ${datum}.` ``) in plaats van `+`
- De zes click-handlers terugbrengen tot één functie `kiesWorkshop(id, titel, datum)`

**Startcode-haakje:** de inconsistente prijsnotatie → functie `formatPrijs(39.5)` geeft `"€ 39,50"` terug (`toFixed(2)` + `replace(".", ",")`).
**PRIMM-focus:** Predict (wat geeft deze functie terug?) → Run → Investigate → Modify

### Hoofdstuk 2: Elementen maken vanuit JS
**Leerdoelen:**
- `document.createElement()`, `.textContent`, `.classList.add()` en `appendChild()` gebruiken
- `innerHTML` met een template literal gebruiken om een complete card te bouwen, en uitleggen waarom `innerHTML` met gebruikersinput onveilig is
- Een array met workshoptitels met `forEach` omzetten naar `<option>`-elementen in de `<select>` (in plaats van ze in de HTML te typen)
- Een container leegmaken en opnieuw vullen (`container.innerHTML = ""`)

**PRIMM-focus:** Investigate → Modify → **Make**: een lijst of sectie op de eigen variant laten genereren uit een array + "Debug deze AI-output"

---

## Taakklasse 2: Werken met data (Hoofdstuk 3-4)

### Hoofdstuk 3: Objecten, en data laden met fetch
**Leerdoelen:**
- Een object maken en uitlezen (`workshop.titel`, `workshop.prijs`)
- Een array van objecten doorlopen en per object een card renderen met een functie `maakCard(workshop)` (combineert H1 en H2) - de hardgecodeerde cards verdwijnen uit de HTML
- Een card anders tonen als `plekken === 0` (conditie uit Blok 3, nu op data)
- **`fetch`:** de array uit `script.js` verplaatsen naar `data/workshops.json` en inladen met `fetch` + `await response.json()`
- Uitleggen wat `fetch` doet in termen van de **request-response cycle** (bekend uit BEO Blok 3) en het request terugzien in het **Network**-tabblad van DevTools
- Uitleggen waarom `fetch` niet werkt als je `index.html` dubbelklikt (`file://`) en wel via `localhost`

**Afbakening fetch:** alleen een lokaal JSON-bestand, één vast patroon (`async function laadWorkshops()`), geen uitgebreide uitleg van promises, geen externe API's.
**PRIMM-focus:** Predict (wat staat er straks op de pagina?) → Run → Investigate (Network-tab) → Modify (workshop toevoegen in de JSON, nieuwe eigenschap tonen)

### Hoofdstuk 4: Filteren en zoeken
**Leerdoelen:**
- `filter()` gebruiken om een nieuwe array te maken met alleen de workshops die aan een voorwaarde voldoen
- `find()` gebruiken om één workshop op `id` op te zoeken (vervangt de `if/else`-ketting voor de prijs)
- Filterknoppen per categorie maken (`event.target` uit Blok 3)
- Een zoekveld koppelen met het `input`-event en de lijst live opnieuw renderen
- Een melding tonen als er geen resultaten zijn
- (Verdieping) "verberg volle workshops", `sort()` op prijs

**PRIMM-focus:** Investigate → Modify → **Make**: zoeken of filteren op de eigen variant + "Debug deze AI-output"

---

## Taakklasse 3: Valideren en afronden (Hoofdstuk 5-6)

### Hoofdstuk 5: Client-side en server-side validatie

Studenten verwarren deze twee vaak, of denken dat een formulier met `required` "veilig" is. Dit hoofdstuk maakt het verschil **zichtbaar** door het eigen formulier te kraken, in plaats van het alleen uit te leggen.

**Kernboodschap:**

| | Client-side (HTML + JS) | Server-side (PHP) |
|---|---|---|
| Waar | In de browser van de gebruiker | Op jouw server |
| Doel | **Gemak** voor de gebruiker: snelle, duidelijke feedback | **Betrouwbaarheid** van je data en je bedrijf |
| Te omzeilen? | Ja, altijd (DevTools, JS uit, eigen request) | Nee, de gebruiker kan er niet bij |
| Kan het alles controleren? | Nee: weet bijv. niet of een workshop inmiddels vol is | Ja: heeft de echte data |
| Verplicht? | Nee, maar wel netjes | **Altijd** |

Vuistregel voor studenten: *"Client-side is service, server-side is beveiliging. Je doet altijd allebei, en je vertrouwt alleen de server."*

**Analogie:** client-side is het bordje bij de ingang van de club ("18+, neem je ID mee"); server-side is de portier die je ID echt controleert. Het bordje helpt eerlijke bezoekers, maar houdt niemand tegen.

**Opbouw (PRIMM):**
1. **Predict/Run - de drie lagen.** Wat gebeurt er als je verstuurt zonder naam? Eerst zonder validatie, dan met HTML-attributen (`required`, `type="email"`, `min`/`max` - uit FEO), dan met JS.
2. **Modify - client-side met JS.** `submit`-event, `event.preventDefault()` alléén als er iets fout is, controles met `.value.trim()`, `.includes("@")`, `Number()`, foutmelding **per veld** in plaats van `alert()`, live feedback met het `input`-event.
3. **Investigate - kraak je eigen formulier.** Vier opdrachten die laten zien dat client-side niets beschermt:
   - `required` weghalen in DevTools (Elements) en versturen
   - JavaScript uitzetten in de browser en versturen
   - Het verborgen prijsveld op `0.01` zetten → `verwerk.php` rekent € 0,01 af
   - Inschrijven voor de volle sushi-workshop → wordt gewoon geaccepteerd
4. **Modify - server-side met PHP.** `verwerk.php` repareren: verplichte velden controleren (`empty()`, `trim()`), e-mail met `filter_var(..., FILTER_VALIDATE_EMAIL)`, aantal als getal tussen 1 en 4, en de **prijs en het aantal plekken zelf opzoeken** in `data/workshops.json` (`json_decode(file_get_contents(...))`) in plaats van het formulier te geloven. Bij fouten: terug naar het formulier met een melding.
5. **Reflectie:** waarom staan dezelfde regels nu op twee plekken, en waarom is dat geen dubbel werk? Wat zou er misgaan als je *alleen* server-side valideert? (Antwoord: veilig, maar irritant voor de gebruiker.)

**Leerdoelen:**
- Het verschil tussen client-side en server-side validatie uitleggen in eigen woorden, met een voorbeeld
- Uitleggen waarom client-side validatie altijd te omzeilen is, en dit demonstreren
- Een formulier client-side valideren met JS en duidelijke foutmeldingen tonen
- Benoemen welke controles alleen de server kan doen (prijs, beschikbaarheid, bestaat deze workshop?)
- Een eenvoudige server-side controle in PHP toevoegen
- Uitleggen dat je nooit gegevens uit het formulier vertrouwt die de server zelf kan opzoeken (prijs)

**AI-debug:** AI-gegenereerde validatiecode die alleen client-side controleert en in de uitleg "veilig" noemt - studenten moeten het gat vinden.

### Hoofdstuk 6: Eindproject - data-gedreven pagina + verantwoording
**Opdracht:** een eigen variant (eigen onderwerp, eigen data) die minimaal bevat:
- Inhoud als array van objecten in een JSON-bestand, geladen met `fetch`
- Renderen met een eigen functie
- Minstens één filter- of zoekfunctie
- Een formulier met client-side **én** server-side validatie

**PRIMM-focus:** volledige **Make** + kort verantwoordingsgesprek (docent wijst een regel aan, student legt uit). In het gesprek komt **altijd** de vraag: *"Ik zet je JavaScript uit - wat gebeurt er nu als ik het formulier leeg verstuur?"*

**Toetsing:** productrubric + verantwoordingsgesprek als apart criterium. Plan het gesprek op dezelfde dag als het FEO-eindgesprek.

---

## Wat heb je aan het einde van dit vak geleerd?

✅ Functies schrijven met parameters en `return`, en template literals gebruiken
✅ HTML-elementen maken en toevoegen vanuit JavaScript
✅ Data opslaan als objecten en een pagina daaruit opbouwen
✅ Data laden uit een JSON-bestand met `fetch`, en uitleggen wat er tussen browser en server gebeurt
✅ Data filteren en doorzoeken met `filter()` en `find()`
✅ Een formulier client-side valideren met duidelijke feedback
✅ Uitleggen én laten zien waarom server-side validatie altijd nodig is
✅ Eigen (en AI-gegenereerde) JS-code lezen, controleren op fouten en verantwoorden

Nog steeds **bewust niet**: frameworks, classes/OOP, modules/build tools, externe API's, formulieren versturen via `fetch` (AJAX), `localStorage`.

---

## Openstaande punten

- **GitHub-repo:** `starter-website-3` eventueel als eigen repo onder NOVA-college-Haarlem zetten (zoals RetroPixel), zodat studenten forken en clonen.
- **Afstemming FEO Blok 4:** uitgewerkt in `../blok4-samenvatting.md` (FEO H1-H3 behandelen labels, input-types en `required` vóór JS H5; zie de weekplanning daar). FEO H6 en JS H6 hebben één gezamenlijk verantwoordingsgesprek.
- **Afstemming BEO:** uitgewerkt in `../../Backend Development (BEO)/blok4-samenvatting.md`. BEO H1-H2 (week 1-2) behandelen `$_POST` en server-side validatie vóór JS H5; BEO H7 (week 7) bouwt verder op JS H3 (`fetch` haalt dan `workshops.php` op) en JS H5 (`verwerk.php` slaat dan op in de database).
- **Herhalingshoofdstuk (zoals 3b):** eventueel een "1b" met oefeningen als de instap na Blok 3 tegenvalt.
