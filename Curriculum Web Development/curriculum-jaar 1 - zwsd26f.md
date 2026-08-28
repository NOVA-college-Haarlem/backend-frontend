# Curriculum Web Development - Jaar 1 (zwsd26f)

**Opleiding:** MBO niveau 4, Software Development
**Klas:** zwsd26f
**Scope:** Blok 1 t/m Blok 4 (jaar 1)
**Bron:** `zwsd26f`

> Dit document staat **los van het curriculum van de overige klassen** (zie `curriculum-jaar 1.md` voor zwsd26ab). zwsd26f volgt een eigen tempo en eigen programma, met een eigen didactisch ontwerp voor Blok 3. Waar zwsd26f qua niveau aansluit bij zwsd26ab is dat een constatering, geen gedeelde planning.

---

## 1. Blokoverzicht

| Blok | Status | Frontend (1,5u/week) | JavaScript (1,5u/week) | Backend |
|---|---|---|---|---|
| **1** | *nog niet uitgewerkt voor deze klas* | - | - | - |
| **2** | *nog niet uitgewerkt voor deze klas* | - | - | - |
| **3** | **Uitgewerkt** | Herhalings-/inhaalblok, 4C/ID + PRIMM (Hoofdstuk 1-8) | Introductie JavaScript, zelfde ontwerp (Hoofdstuk 1-8) | - |
| **4** | *nog niet uitgewerkt* | - | - | - |

Alleen Blok 3 heeft op dit moment lesmateriaal voor 26F. Blok 1, 2 en 4 zijn nog open - zie Openstaande punten.

**Twee parallelle vakken in Blok 3:** studenten krijgen 1,5 uur/week Frontend Development (FEO) én 1,5 uur/week JavaScript (JSO). Beide vakken delen hetzelfde didactische ontwerp (4C/ID + PRIMM, zie hieronder) en werken op **dezelfde sites**: wat een student in FEO aan het personaliseren is, krijgt in JS een interactieve laag. Zie `zwsd26f/Blok 3/JavaScript (JSO)/blok3-samenvatting.md` voor de volledige onderbouwing van die keuze.

---

## 2. Blok 3 - Frontend Development (Herhalings- en inhaalblok)

**Doelgroep:** zwsd26f, na Blok 1-2 bleek de basis (externe CSS, box model, semantische HTML) nog niet stevig genoeg voor cards/flexbox.
**Duur:** 8 hoofdstukken, verdeeld over 3 taakklassen. 1,5 uur per week.
**Didactisch ontwerp:** **4C/ID** (Van Merriënboer) - hele, authentieke taken in oplopend complexe taakklassen, in plaats van losse deelvaardigheden per week - gecombineerd met **PRIMM** (Predict-Run-Investigate-Modify-Make): studenten krijgen altijd werkende, bewust onvolmaakte startcode, nooit een leeg canvas.

**Waarom "Hoofdstuk" i.p.v. "Week":** de labeling markeert bewust het verschil met de reguliere weekplanning van andere klassen - dit is een taakklasse-opbouw, geen kalenderweek-opbouw.

### Taakklassen en startsites

| Taakklasse | Hoofdstuk | Startcode | Kern |
|---|---|---|---|
| **1** | 1-3 | `starter-website/` - RetroPixel (gameshop, inline CSS) | Van inline naar externe CSS, box model, semantische HTML |
| **2** | 4-6 | `starter-website-2/` - Boulder Base (boulderhal, al externe CSS maar met gebreken) | Selectoren, buttons, kleuren/typografie met CSS-variabelen, navigatie |
| **3** | 7-8 | Boulder Base (afronden) + eigen project | Site-opmaak (containers/secties) en een volledig eigen eindproject |

Beide startsites zijn **bewust onvolmaakt** (herhaalde inline styles, hardgecodeerde kleuren, inconsistente knoppen, geen containers) - de gebreken zijn de lesstof. Elke taakklasse eindigt met een **Make-fase**: de student maakt van de aangeleverde site een eigen, getransformeerde variant - dat is waar eigenaarschap vandaan komt, ook al is de startcode aangeleverd.

### AI-gebruiksbeleid

Consistent per PRIMM-fase, dezelfde aanpak als het backend PRIMM-blok van zwsd26ab (zie `curriculum-jaar 1.md` §4b):

| Fase | AI | Waarom |
|---|---|---|
| Predict / Run / Investigate | Uit | Dwingt lezen en begrip af, geen generatie |
| Modify | Mag, mits uit te leggen | Begeleide toepassing |
| Make | Mag, mits elke regel te verantwoorden | Eigenaarschap zit in begrip, niet in wie typte |

Elke taakklasse bevat één **"Debug deze AI-output"**-oefening (Hoofdstuk 3, 6 en 8): bewust foute AI-gegenereerde code die studenten moeten vinden en verbeteren.

### Hoofdstuk-overzicht met leeruitkomsten

| # | Hoofdstuk | Taakklasse | Leeruitkomsten |
|---|---|---|---|
| 1 | Herhaling - Van Inline naar Externe CSS | 1 | Verschil inline/externe CSS uitleggen; externe stylesheet aanmaken en linken; duplicatieprobleem van inline styles herkennen |
| 2 | Classes, IDs en Box Model | 1 | Classes vs. IDs; box model (padding/border/margin) herhalen en toepassen; DevTools voor inspectie |
| 3 | Semantische HTML en Nette Structuur | 1 | Waarom semantische HTML; `<div>` vervangen door `<header>/<main>/<section>/<footer>`; **Make:** eigen thema-variant van RetroPixel; AI-output debuggen |
| 4 | CSS Selectoren en Buttons | 2 | Descendant selectors; pseudo-classes `:hover`/`:focus`; button-duplicatie herkennen en consolideren |
| 5 | Kleuren, Typografie en CSS-variabelen | 2 | CSS-variabelen (`:root`) invoeren; hardgecodeerde kleuren vervangen; typografische hiërarchie aanbrengen |
| 6 | Navigatie en Eigen Variant | 2 | Navigatie stylen met hover/actief-state; **Make:** eigen thema-variant van Boulder Base; AI-output debuggen |
| 7 | Website Opmaak | 3 | `.container` en `max-width`; secties visueel onderscheiden; footer met kolommen |
| 8 | Eindproject | 3 | Alle technieken zelfstandig combineren; **Make:** volledig eigen website; verantwoordingsgesprek i.p.v. alleen productbeoordeling; AI-output debuggen |

**Eindresultaat Blok 3:** externe CSS-structuur, box model, semantische HTML, CSS-selectoren en pseudo-classes, buttons met states, CSS-variabelen en typografische hiërarchie, navigatie met states, complete site-opmaak (containers/secties), en het kunnen lezen/verantwoorden van (AI-gegenereerde) code.

**Toetsing Hoofdstuk 8:** naast de gebruikelijke productrubric weegt een kort **verantwoordingsgesprek** (5 min/student) mee als apart criterium - de docent wijst een willekeurige regel aan, de student legt uit wat die doet en waarom. Dit voorkomt dat een werkende site zonder begrip als voldoende telt.

Volledige lesuitwerking: `zwsd26f/Blok 3/Frontend Development (FEO)/` (`blok3-samenvatting.md` + Hoofdstuk 1-8, elk met een studentversie in de hoofdmap en een docentenhandleiding in `Docent/`).

---

## 3. Blok 3 - JavaScript (Introductie)

**Doelgroep:** zwsd26f, parallel aan Frontend Development.
**Duur:** 8 hoofdstukken, verdeeld over 3 taakklassen. 1,5 uur per week.
**Didactisch ontwerp:** zelfde 4C/ID + PRIMM-aanpak als Frontend Development (zie §2) - niet apart herhaald, wel consistent toegepast.

**Kernkeuze:** JavaScript bouwt voort op **dezelfde sites** als het FEO-vak (RetroPixel en Boulder Base), in plaats van eigen, losstaande oefenpagina's te gebruiken. Wat in FEO een CSS-duplicatieprobleem is, komt in JS terug als een JS-duplicatieprobleem (drie bijna-identieke click-handlers, opgelost met een array + loop in Hoofdstuk 6) - zelfde onderliggende principe (DRY), nieuwe techniek. De belangrijkste JS-selectors zijn bewust structureel gekozen (`.card a`, tag-namen, vaste `id`'s) zodat de lessen niet afhankelijk zijn van hoever een student in FEO staat met de CSS-refactor van die week.

### Taakklassen en startcode

| Taakklasse | Hoofdstuk | Site (gedeeld met FEO) | Kern |
|---|---|---|---|
| **1** | 1-3 | RetroPixel (`starter-website/`) | Wat is JS, de DOM selecteren en aanpassen, klik-interactie |
| **2** | 4-6 | Boulder Base (`starter-website-2/`) | Condities, classList (dark mode), arrays & loops |
| **3** | 7-8 | Eigen FEO-eindproject | Formulier-input lezen, JS-laag op het eindproject + verantwoording |

### Hoofdstuk-overzicht met leeruitkomsten

| # | Hoofdstuk | Taakklasse | Leeruitkomsten |
|---|---|---|---|
| 1 | Wat is JavaScript? Variabelen en de Console | 1 | Script koppelen; variabelen (`let`) maken en vullen; `console.log()`; string-concatenatie |
| 2 | De DOM Selecteren en Aanpassen | 1 | `document.querySelector()`; `.textContent` en `.style` aanpassen vanuit JS |
| 3 | Klikken Laten Reageren en Eigen Variant | 1 | `addEventListener("click", ...)`; eigen functie schrijven; **Make:** klik-interactie op eigen RetroPixel-variant; AI-output debuggen |
| 4 | Condities - if/else in de DOM | 2 | `if`/`else`; vergelijkingsoperators; DOM-inhoud laten afhangen van een waarde |
| 5 | Classes Toggelen - Dark Mode | 2 | `classList.add/remove/toggle`; dark-mode toggle gekoppeld aan CSS-variabelen uit FEO Hoofdstuk 5 |
| 6 | Arrays en Loops - Dynamische Code | 2 | Arrays; `forEach()`; JS-duplicatie (uit Hoofdstuk 4) herkennen en oplossen; **Make:** toegepast op eigen Boulder Base-variant; AI-output debuggen |
| 7 | Formulier-input Lezen en Feedback Tonen | 3 | `event.preventDefault()`; `.value` uitlezen; conditie-feedback tonen (zonder te versturen) |
| 8 | Eindproject - JS-laag en Verantwoording | 3 | Alle technieken combineren op het eigen FEO-eindproject; **Make:** volledige JS-laag; verantwoordingsgesprek; AI-output debuggen |

**Eindresultaat Blok 3 (JS):** een script correct koppelen, de DOM selecteren en aanpassen, interactiviteit met events, condities toepassen op DOM-inhoud, `classList` voor states, arrays/`forEach` om duplicatie te voorkomen, formulier-input uitlezen, en (AI-gegenereerde) JS-code kunnen lezen en verantwoorden. Bewust een introductie: geen frameworks, geen `fetch`/API's.

**Toetsing Hoofdstuk 8:** zelfde opzet als FEO - naast een productrubric een kort verantwoordingsgesprek per student. Overweeg de FEO- en JS-gesprekken op dezelfde dag te plannen, zodat het als één eindpresentatie van de eigen site voelt.

Volledige lesuitwerking: `zwsd26f/Blok 3/JavaScript (JSO)/` (`blok3-samenvatting.md` + Hoofdstuk 1-8, elk met een studentversie in de hoofdmap en een docentenhandleiding in `Docent/`).

---

## 4. Eindbeeld na Blok 3

Na Blok 3 kan een 26F-student:

**Frontend**
- CSS extern organiseren met classes/IDs en herbruikbare selectoren
- Het box model gericht toepassen voor consistente spacing
- Semantische, leesbare HTML-structuur opzetten
- Buttons en navigatie stylen met states (hover/focus/actief), zonder duplicatie
- Een kleurenschema en typografische hiërarchie opzetten met CSS-variabelen
- Een complete one-page website structureren (containers, secties, footer)

**JavaScript**
- De DOM selecteren en aanpassen, en reageren op events (klikken, versturen)
- Condities en `classList` gebruiken om de pagina interactief te maken
- Arrays en `forEach` gebruiken om duplicatie in code te voorkomen
- Formulier-input uitlezen en eenvoudige feedback tonen

**Beide vakken**
- Eigen (en AI-gegenereerde) code lezen, controleren op fouten en mondeling verantwoorden

Dit niveau komt qua CSS/HTML-techniek ongeveer overeen met het eind van Blok 2 bij zwsd26ab (zie `curriculum-jaar 1.md`) - cards en Flexbox zijn in Blok 3 van 26F bewust nog niet behandeld. Voor JavaScript is er bij zwsd26ab geen vergelijkbaar introductievak om tegen af te zetten.

---

## 5. Openstaande punten

- **Blok 1, 2 en 4** zijn voor zwsd26f nog niet uitgewerkt. Er is nog geen besluit of/hoe deze blokken worden ingevuld (eigen materiaal, of aansluiten bij het zwsd26ab-programma vanaf een bepaald punt).
- **Aansluiting op een volgend blok:** nog te bepalen of zwsd26f na dit inhaalblok instroomt in het reguliere zwsd26ab-programma (bijv. cards/flexbox) of een eigen vervolg krijgt, en of/hoe JavaScript daarna verdiept wordt. Vereist een niveau-check aan het eind van Blok 3.
- **Lesmateriaal Blok 3** (FEO en JS) is inhoudelijk klaar maar nog niet in de praktijk getoetst - eerste keer lesgeven kan aanleiding geven tot bijstelling van tijdsboxen of aantal startsites.

Zie ook `.claude/todo.md` voor de actuele stand van openstaand werk.
