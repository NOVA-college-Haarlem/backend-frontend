## Hoofdstuk 5: Classes Toggelen - Dark Mode & Interactieve States - Docentenhandleiding

*Bij: `../Hoofdstuk 5 - Classes Toggelen - Dark Mode.md` (studentversie)*

**Taakklasse 2 van 3** - Boulder Base (vervolg)
**PRIMM-fasen dit hoofdstuk:** Investigate → Modify

### Waarom deze opzet
Dit hoofdstuk loopt gelijk met FEO Hoofdstuk 5 (CSS-variabelen, het "verander één variabele, alles verandert mee"-moment). Door hier een JS-toggle overheen te zetten, wordt dat FEO-aha-moment nu **interactief**: niet de docent past de variabele aan, maar de bezoeker met een klik. Dit is het sterkste cross-vak-moment van het blok - benoem het expliciet.

### Lesopbouw (90 minuten)

**Terugblik (5 min)**
Check: staat de `if`/`else`-oefening van vorig hoofdstuk?

**Investigate (25 min) - live coding, AI uit**
```js
const toggleKnop = document.querySelector("#dark-mode-toggle");
toggleKnop.addEventListener("click", function () {
    document.body.classList.toggle("dark");
});
```
- "Wat doet `classList`?" → de lijst van classes op een element; `.add()`, `.remove()`, `.toggle()` (aan/uit schakelen).
- Voeg dit alvast toe en klik: er verandert niets zichtbaars. Vraag waarom - laat studenten redeneren dat er nog geen CSS-regel is die op `body.dark` reageert. Dit is een goede check op begrip van hoe HTML/CSS/JS samenwerken.

**Modify (45 min) - AI mag, met verantwoording**
Samen de `body.dark`-CSS-regel toevoegen (hergebruik van de `:root`-variabelen-kennis uit FEO Hoofdstuk 5). Test de toggle. Laat het "aha"-moment landen: één class-toggle verandert de hele site, omdat de rest van de CSS al met `var(--primary)` werkt.

Zelfstandig: een tweede `classList`-interactie toevoegen (bijv. `.actief` op de navigatie).

**Afronding (10 min)**
Vragen? Volgend hoofdstuk: arrays & loops - en eindelijk de duplicatie uit Hoofdstuk 4 oplossen.

### Tips voor docent
- Laat het "niets gebeurt totdat de CSS er ook is" moment niet overslaan - dit is precies waar studenten leren dat JS en CSS twee aparte lagen zijn die je bewust aan elkaar koppelt
- Vergelijk expliciet met FEO Hoofdstuk 5: "toen paste jij de variabele handmatig aan, nu doet de bezoeker dat zelf met een klik"
- Studenten die hier vastlopen, missen vaak de link tussen de class-naam in JS (`"dark"`) en de selector in CSS (`body.dark`) - laat ze de twee naast elkaar leggen

### Veelgemaakte fouten
1. De class-naam in JS en CSS laten verschillen (bijv. `"donker"` in JS maar `.dark` in CSS)
2. `classList.toggle` verwarren met `classList.add` (toggle schakelt, add voegt alleen maar toe)
3. De CSS-regel vergeten en denken dat de JS niet werkt
4. `document.body` vergeten en per ongeluk een ander element toggelen

---
