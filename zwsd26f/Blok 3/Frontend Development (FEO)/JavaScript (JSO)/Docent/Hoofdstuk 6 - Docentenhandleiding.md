## Hoofdstuk 6: Arrays & Loops - Dynamische Code - Docentenhandleiding

*Bij: `../Hoofdstuk 6 - Arrays en Loops - Dynamische Code.md` (studentversie)*

**Taakklasse 2 van 3** - Boulder Base (afronding)
**PRIMM-fasen dit hoofdstuk:** Investigate → Modify → **Make** (eigen variant)

### Waarom deze opzet
Dit is de pay-off van de duplicatie die sinds Hoofdstuk 4 bewust is blijven staan. Vergelijk expliciet met FEO: daar losten studenten CSS-button-duplicatie op met één herbruikbare class; hier lossen ze JS-duplicatie op met een array + loop. Zelfde onderliggend principe (DRY), andere techniek. Dit verband hardop benoemen is belangrijk voor transfer.

### Lesopbouw (90 minuten)

**Terugblik (5 min)**
Check: staat de dark-mode toggle van vorig hoofdstuk?

**Investigate (20 min) - live coding, AI uit**
Laat de drie click-handlers uit `script.js` nogmaals zien. Vraag: "Wat zou je moeten doen als er een vierde les bijkomt?" (een vierde blok code kopiëren - laat voelen hoe onhandig dat is).

Introduceer array + `forEach`:
```js
const namen = ["Zelda", "Minecraft", "FIFA 26"];
namen.forEach(function (naam) {
    console.log(naam);
});
```
- "Wat is een array?" → een lijst van waarden in één variabele.
- "Wat doet `forEach`?" → voert de functie één keer uit per item in de array.

**Modify (35 min) - AI mag, met verantwoording**
Samen de drie losse click-handlers vervangen door de array + loop-oplossing. Leg `index` goed uit: dit is de positie in de array/NodeList, en koppelt de juiste naam aan de juiste knop. Laat testen: voeg een vierde les toe (HTML + array) en verifieer dat er geen extra JS nodig is.

**Make: eigen variant (25 min) - AI mag, verantwoording verplicht**
Studenten passen dit patroon toe op hun eigen Boulder Base-variant.

**Debug deze AI-output (10 min, of als start van huiswerk)**
Voorbeeld met een bewuste fout:
```js
knoppen.forEach(function (index, knop) {
    // parameters staan verkeerd om
});
```
Laat studenten de documentatie-conventie (`forEach(item, index)`) herkennen en de fout vinden.

### Tips voor docent
- Dit hoofdstuk is het natuurlijke sluitstuk van taakklasse 2 - benadruk de reis: "in Hoofdstuk 4 zagen jullie dit probleem, nu lossen jullie het zelf op"
- `index` is een lastig concept - laat het letterlijk meetellen met de vinger langs de array, of `console.log(index)` binnen de loop laten zien
- Sommige studenten willen meteen `for`-loops i.p.v. `forEach` gebruiken (bijv. via AI) - dat mag, zolang ze het kunnen uitleggen; forceer niet één syntax

### Veelgemaakte fouten
1. `index` en het array-item door elkaar halen, of de parameters van `forEach` in de verkeerde volgorde zetten
2. Array en NodeList (van `querySelectorAll`) door elkaar halen - beide hebben een `forEach`, maar zijn niet identiek
3. Vergeten `event.preventDefault()` toe te voegen, waardoor de link alsnog naar `#` navigeert
4. Array-lengte en aantal knoppen niet gelijk houden (index buiten bereik → `undefined` in de tekst)

---
