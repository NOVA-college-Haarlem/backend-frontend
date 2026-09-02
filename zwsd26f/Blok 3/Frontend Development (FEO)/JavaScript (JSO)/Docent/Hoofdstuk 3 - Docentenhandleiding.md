## Hoofdstuk 3: Klikken Laten Reageren + Eigen Variant - Docentenhandleiding

*Bij: `../Hoofdstuk 3 - Klikken Laten Reageren en Eigen Variant.md` (studentversie)*

**Taakklasse 1 van 3** - RetroPixel (afronding)
**PRIMM-fasen dit hoofdstuk:** Investigate → Modify → **Make** (eigen variant)

### Waarom deze opzet
Dit hoofdstuk loopt gelijk op met FEO Hoofdstuk 3 (waar de student zijn eigen RetroPixel-variant maakt). Door de JS Make-fase op datzelfde eigen werk te laten landen, versterkt dit het eigenaarschap uit beide vakken tegelijk: het is niet "een CSS-huiswerk" en "een los JS-huiswerk", maar één eigen site die stap voor stap interactiever wordt.

### Lesopbouw (90 minuten)

**Terugblik (5 min)**
Check: is de titel/knop-oefening van vorig hoofdstuk gelukt?

**Investigate (20 min) - live coding, AI uit**
```js
const knop = document.querySelector("#hero-knop");
knop.addEventListener("click", function () {
    alert("Bedankt voor je interesse in RetroPixel!");
});
```
- "Wat is een event?" → iets dat gebeurt in de browser (klik, scroll, toetsaanslag). Vraag om voorbeelden.
- "Wat doet `addEventListener`?" → "luister naar dit type event op dit element, en voer deze functie uit als het gebeurt."
- Loop de volgorde van uitvoering na: de functie wordt **niet** meteen uitgevoerd bij het laden van de pagina, alleen bij een klik. Dit verwart vaak - laat het zien door de functie-inhoud een `console.log` te geven en te demonstreren dat die pas verschijnt ná een klik.
- Noem kort: dit is dezelfde soort functie als bij `document.querySelector`, maar nu schrijf je 'm zelf.

**Modify (25 min) - AI mag, met verantwoording**
Samen de `alert()` vervangen door een DOM-aanpassing (tekst/stijl). Studenten kiezen zelf een tweede interactie.

**Make: eigen variant (30 min) - AI mag, verantwoording verplicht**
Studenten werken aan hun **eigen** RetroPixel-variant (dezelfde bestanden als hun FEO Hoofdstuk 3-werk). Loop rond en stel bij een paar studenten de verantwoordingsvraag alvast informeel: "wat doet deze regel?"

**Debug deze AI-output (10 min, of als start van huiswerk)**
Geef een stukje AI-JS met een bewuste fout, bijvoorbeeld:
```js
knop.addEventListner("click", function() {
    alert("Hallo!");
});
```
(typefout in `addEventListener`) - laat studenten de foutmelding in de console lezen en de oorzaak vinden.

### Tips voor docent
- Dit is de eerste Make-fase van het JS-vak - vergelijk kort met de FEO Make-fase van dezelfde week: "jullie site wordt nu niet alleen mooier, maar ook interactiever"
- Verwacht dat sommige studenten meteen complexere interacties willen proberen (bijv. animaties) - moedig aan, maar bewaak dat de basis (één werkende, uitlegbare interactie) eerst staat
- Bewaar ruimte voor minstens een paar korte verantwoordingsvragen - dit is waar de "geen kant-en-klare AI-code zonder begrip"-norm voor het eerst in dit vak wordt getoetst

### Veelgemaakte fouten
1. Typefout in `addEventListener` (bijv. `addEventListner`) - browser geeft geen duidelijke waarschuwing, de klik doet dan gewoon niets
2. De functie direct aanroepen i.p.v. doorgeven (`knop.addEventListener("click", functie())` in plaats van `functie`) - functie wordt dan meteen uitgevoerd bij het laden
3. Selector die niet (meer) bestaat na eigen aanpassingen aan de HTML in FEO
4. Vergeten dat `.style` camelCase gebruikt (herhaling van Hoofdstuk 2)

---
