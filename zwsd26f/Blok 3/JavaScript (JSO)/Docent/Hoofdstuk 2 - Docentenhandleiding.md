## Hoofdstuk 2: De DOM Selecteren en Aanpassen - Docentenhandleiding

*Bij: `../Hoofdstuk 2 - De DOM Selecteren en Aanpassen.md` (studentversie)*

**Taakklasse 1 van 3** - RetroPixel (vervolg)
**PRIMM-fasen dit hoofdstuk:** Investigate → Modify

### Lesopbouw (90 minuten)

**Terugblik (10 min)**
Laat 2-3 studenten hun `console.log()`-oefening van vorig hoofdstuk zien.

**Investigate (25 min) - live coding, AI uit**
```js
const titel = document.querySelector("h1");
console.log(titel);
```
- "Wat print dit?" → laat zien dat de console het hele HTML-element toont, niet alleen tekst.
- Introduceer **de DOM**: de browser bouwt van je HTML een boomstructuur (Document Object Model) die JS kan lezen en aanpassen. Korte analogie: de DOM is de "levende" versie van je HTML in het geheugen van de browser.
- "Welke selectors ken je al uit CSS?" → `querySelector` accepteert dezelfde syntax als CSS-selectors (`"h1"`, `".card"`, `"#hero-knop"`). Dit is een fijne brug vanuit FEO.
- Benoem: `querySelector` pakt altijd het **eerste** match. Voor alle matches: `querySelectorAll` (komt terug in Hoofdstuk 6).

**Modify (45 min) - AI mag, met verantwoording**
1. Samen: titel-tekst aanpassen met `.textContent`.
2. Samen: `#hero-knop` selecteren en stijl aanpassen met `.style.backgroundColor`. Leg camelCase uit (`background-color` → `backgroundColor`) - een veelvoorkomende fout.
3. Zelfstandig: studenten kiezen zelf een ander element en passen tekst of stijl aan.

Loop rond. Veelvoorkomend probleem: `querySelector` retourneert `null` als de selector niet klopt, en dan geeft `.textContent = ...` een foutmelding ("Cannot set properties of null"). Laat zien hoe je die melding leest.

**Afronding (10 min)**
Vragen? Volgend hoofdstuk: klikken laten reageren - en de eerste Make-fase van dit vak.

### Tips voor docent
- De brug met CSS-selectors (`querySelector` gebruikt dezelfde syntax) is de sterkste haak dit hoofdstuk - benoem 'm expliciet meerdere keren
- Laat `console.log(titel)` vóór elke wijziging typen als gewoonte - dat maakt debuggen straks makkelijker
- De foutmelding "Cannot set properties of null" komt terug de hele cursus - leer studenten 'm nu al herkennen als "je selector matcht niks"

### Veelgemaakte fouten
1. CSS-schrijfwijze gebruiken in JS (`style.background-color` i.p.v. `style.backgroundColor`)
2. Selector-typefout waardoor `querySelector` `null` teruggeeft
3. `.innerText` en `.textContent` door elkaar halen (voor nu: gebruik altijd `.textContent`, geen uitleg van het verschil nodig)
4. Vergeten dat `querySelector` alleen het eerste element pakt bij meerdere matches

---
