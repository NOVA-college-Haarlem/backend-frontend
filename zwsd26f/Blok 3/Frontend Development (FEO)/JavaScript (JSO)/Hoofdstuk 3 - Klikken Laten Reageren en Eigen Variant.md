## Hoofdstuk 3: Klikken Laten Reageren + Eigen Variant

*Docentenhandleiding: `Docent/Hoofdstuk 3 - Docentenhandleiding.md`*

**Taakklasse 1 van 3** - RetroPixel (afronding)
**PRIMM-fasen dit hoofdstuk:** Investigate → Modify → **Make** (eigen variant)

### Leerdoelen
Na dit hoofdstuk kan je:
- Uitleggen wat een event is
- `addEventListener("click", ...)` gebruiken om op een klik te reageren
- Een eigen functie schrijven die als reactie wordt uitgevoerd
- Een JS-interactie toevoegen aan je eigen RetroPixel-variant
- Een stuk AI-gegenereerde JS-code controleren op fouten

### AI-gebruik dit hoofdstuk
Investigate: **geen AI**. Modify: AI mag, met verantwoording. **Make: AI mag vrij**, maar je moet aan het eind een willekeurig aangewezen regel kunnen uitleggen.

### Investigate
```js
const knop = document.querySelector("#hero-knop");

knop.addEventListener("click", function () {
    alert("Bedankt voor je interesse in RetroPixel!");
});
```
- Wat is een **event**? Welke andere events ken je van websites (hoveren, scrollen, typen)?
- Wat gebeurt er precies als je op de knop klikt? In welke volgorde worden de regels uitgevoerd?
- Wat staat er tussen de accolades van `function () { ... }`? Wanneer wordt die code uitgevoerd?

### Modify
1. Verander de tekst van de `alert()` naar iets eigens
2. Vervang de `alert()` door een aanpassing van de pagina zelf, bijvoorbeeld:
```js
knop.addEventListener("click", function () {
    knop.textContent = "Bedankt!";
    knop.style.backgroundColor = "limegreen";
});
```
3. Voeg een tweede klik-interactie toe op een ander element naar keuze

### Make: eigen variant
Voeg minimaal **1 klik-interactie** toe aan je **eigen RetroPixel-variant** (die je in FEO Hoofdstuk 3 hebt gemaakt). Laat het passen bij jouw thema - bijvoorbeeld een knop die een welkomstbericht toont, een prijs benadrukt, of een sectie highlight.

### Debug deze AI-output
Je krijgt een stukje AI-gegenereerde JS met een bewuste fout (bijvoorbeeld een verkeerd geschreven event-naam, of een selector die niet bestaat). Vind de fout, leg uit waarom het misgaat, en verbeter 'm.

### Huiswerk
1. Minstens 1 werkende klik-interactie op je eigen variant
2. De interactie past inhoudelijk bij je thema (geen losse test-`alert()` meer)
3. Wees voorbereid: er kan een willekeurige regel worden aangewezen met de vraag "wat doet dit, en waarom staat het er?"

---
