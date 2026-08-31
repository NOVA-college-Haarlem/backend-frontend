# Blok 3 (26F) - JavaScript Samenvatting

**Doelgroep:** MBO studenten klas 26F
**Duur:** 8 hoofdstukken, verdeeld over 3 taakklassen - 1,5 uur per week, parallel aan Frontend Development (FEO)
**Focus:** Introductie JavaScript - opgebouwd volgens hetzelfde 4C/ID + PRIMM-ontwerp als FEO

---

## Waarom dit vak parallel aan FEO loopt

Studenten krijgen dit blok 1,5 uur per week Frontend (CSS/HTML) én 1,5 uur per week JavaScript. Om overlap en verwarring te voorkomen, en om de leerstof te versterken in plaats van te verdubbelen, bouwt JavaScript **voort op dezelfde site** die de student in FEO aan het personaliseren is (de eigen RetroPixel- of Boulder Base-variant). Wat in FEO een CSS-probleem was (duplicatie, geen structuur), komt in JS terug als hetzelfde soort probleem (duplicatie in code, geen herbruikbare functies) - dezelfde didactische kern, nu toegepast op gedrag in plaats van vormgeving.

**Zie voor de onderliggende didactiek** (4C/ID, PRIMM, AI-beleid, Make-fase = eigenaarschap): `../Frontend Development (FEO)/blok3-samenvatting.md`. Dat ontwerp wordt hier één-op-één toegepast op JavaScript, niet opnieuw uitgelegd.

**Bestandsstructuur:** net als bij FEO heeft elk hoofdstuk twee bestanden - `Hoofdstuk N - ....md` (studentversie) en `Docent/Hoofdstuk N - Docentenhandleiding.md` (lesregie, tips, veelgemaakte fouten, AI-toelichting, beoordelingscriteria).

---

## Taakklassen en startcode

| Taakklasse | Hoofdstuk | Site (gedeeld met FEO) | Startcode | Kern |
|---|---|---|---|---|
| **1** | 1-3 | RetroPixel (`../Frontend Development (FEO)/starter-website/`) | `js/script.js` - console.log & variabelen | Wat is JS, de DOM selecteren en aanpassen, klik-interactie |
| **2** | 4-6 | Boulder Base (`../Frontend Development (FEO)/starter-website-2/`) | `js/script.js` - gedupliceerde click-handlers | Condities, classList (dark mode), arrays & loops |
| **3** | 7-8 | Eigen eindproject (uit FEO) | - | Formulier-input lezen, JS-laag op het eindproject + verantwoording |

De startsites zijn dezelfde bestanden als in FEO (`starter-website/index.html` en `starter-website-2/index.html`), nu met een gekoppeld `js/script.js`. Wijzigingen die een student in FEO aan de HTML/CSS doet, blijven gewoon werken voor de JS-lessen - de belangrijkste selectors in de lesstof zijn bewust **structureel** gekozen (bijv. `.card a`, `.plan a`, tag-namen) zodat ze niet afhankelijk zijn van of een student de CSS-refactor van die week al heeft afgerond.

---

## Taakklasse 1: RetroPixel (Hoofdstuk 1-3)

### Hoofdstuk 1: Wat is JavaScript? Variabelen & de Console
**Leerdoelen:** een script-bestand koppelen; variabelen (`let`) maken en vullen; `console.log()` gebruiken; string-concatenatie
**PRIMM-focus:** Predict, Run, Investigate + eerste Modify

### Hoofdstuk 2: De DOM selecteren en aanpassen
**Leerdoelen:** `document.querySelector()`; een element selecteren; `.textContent` en `.style` aanpassen vanuit JS
**PRIMM-focus:** Investigate → Modify

### Hoofdstuk 3: Klikken laten reageren + eigen variant
**Leerdoelen:** `addEventListener("click", ...)`; een functie schrijven; DOM aanpassen als reactie op een klik
**PRIMM-focus:** Investigate → Modify → **Make**: klik-interactie op de eigen RetroPixel-variant + "Debug deze AI-output"

---

## Taakklasse 2: Boulder Base (Hoofdstuk 4-6)

### Hoofdstuk 4: Condities - if/else in de DOM
**Leerdoelen:** `if`/`else`; vergelijkingsoperators; DOM-inhoud laten afhangen van een waarde
**PRIMM-focus:** Predict/Run/Investigate op de gedupliceerde click-handlers in `script.js` (herkennen, nog niet oplossen) + Modify van een conditie-oefening

### Hoofdstuk 5: Classes toggelen - dark mode & interactieve states
**Leerdoelen:** `classList.add()/remove()/toggle()`; een dark-mode toggle koppelen aan de CSS-variabelen uit FEO Hoofdstuk 5
**PRIMM-focus:** Investigate → Modify

### Hoofdstuk 6: Arrays & loops - dynamische code
**Leerdoelen:** arrays; `forEach()`; duplicatie in JS herkennen en oplossen met een loop
**PRIMM-focus:** Investigate (de gedupliceerde click-handlers van Hoofdstuk 4 alsnog oplossen) → Modify → **Make**: toegepast op eigen Boulder Base-variant + "Debug deze AI-output"

---

## Taakklasse 3: Eindproject (Hoofdstuk 7-8)

### Hoofdstuk 7: Formulier-input lezen & feedback tonen
**Leerdoelen:** `event.preventDefault()`; `.value` uitlezen; eenvoudige conditie-feedback tonen (zonder daadwerkelijk te versturen)
**PRIMM-focus:** Predict/Investigate/Modify

### Hoofdstuk 8: Eindproject - JS-laag + verantwoording
**Leerdoelen:** alle technieken zelfstandig combineren en toepassen op het eigen FEO-eindproject; code verantwoorden
**PRIMM-focus:** volledige **Make** + kort verantwoordingsgesprek (net als FEO Hoofdstuk 8) + "Debug deze AI-output"

---

## Wat heb je aan het einde van dit vak geleerd?

✅ Een script-bestand correct koppelen en variabelen gebruiken
✅ De DOM selecteren en aanpassen (`querySelector`, `textContent`, `style`)
✅ Interactiviteit toevoegen met `addEventListener`
✅ Condities toepassen op DOM-inhoud (`if`/`else`)
✅ `classList` gebruiken voor states (bijv. dark mode)
✅ Arrays en `forEach` gebruiken om duplicatie in code te voorkomen
✅ Formulier-input uitlezen en eenvoudige feedback tonen
✅ Eigen (en AI-gegenereerde) JS-code lezen, controleren op fouten en verantwoorden

Dit is bewust een **introductie**: geen frameworks, geen `fetch`/API's, geen complexe state-management. Het doel is dat studenten JavaScript kunnen lezen, kleine interacties kunnen bouwen, en - net als bij FEO - AI-gegenereerde JS kunnen controleren in plaats van blind te vertrouwen.
