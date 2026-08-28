## Hoofdstuk 4: Condities - if/else in de DOM

*Docentenhandleiding: `Docent/Hoofdstuk 4 - Docentenhandleiding.md`*

**Taakklasse 2 van 3** - Boulder Base (gedeeld met FEO, `starter-website-2/`)
**PRIMM-fasen dit hoofdstuk:** Predict → Run → Investigate → Modify

### Nieuwe taakklasse, nieuwe site
Boulder Base heeft - net als bij FEO - al een gekoppeld `js/script.js`, met daarin drie bijna-identieke click-handlers voor de lessenkaarten. Dat is bewust: die duplicatie ga je pas in Hoofdstuk 6 oplossen. Dit hoofdstuk gaat over iets anders: condities.

### Leerdoelen
Na dit hoofdstuk kan je:
- `if`/`else` toepassen in JavaScript
- Vergelijkingsoperators gebruiken (`>`, `<`, `===`)
- De inhoud van een DOM-element laten afhangen van een conditie

### AI-gebruik dit hoofdstuk
Predict/Run/Investigate: **geen AI**. Modify: AI mag, mits je bij een steekproef kan uitleggen wat een regel doet.

### Predict
Bekijk `starter-website-2/js/script.js` - **nog niet draaien**. Er staan drie vergelijkbare stukjes code onder elkaar. Wat doen ze, denk je? Wat valt op aan hoe ze zijn opgeschreven?

### Run
Open `index.html`, klik op de drie "Boek deze les"-knoppen. Klopt je voorspelling?

### Investigate
- Wat doen de drie click-handlers precies?
- Herken je dit patroon (bijna-identieke code, drie keer) van eerdere hoofdstukken? Waar zag je dit al eens eerder (denk aan FEO)?
- We gaan dit **nog niet** oplossen - dat komt in Hoofdstuk 6. Vandaag richten we ons op iets nieuws: condities.

**Nieuw: if/else**
```js
let plekkenVrij = 3;

if (plekkenVrij > 0) {
    console.log("Er zijn nog " + plekkenVrij + " plekken vrij.");
} else {
    console.log("Deze les zit vol.");
}
```
- Wat gebeurt er als je `plekkenVrij` op `0` zet? Voorspel het, en test het daarna.
- Wat doet `>`? Welke andere vergelijkingsoperators ken je (`<`, `===`, `!==`)?

### Modify
Koppel de conditie aan de pagina zelf. Voeg dit toe aan `script.js`:
```js
let plekkenVrij = 0;
const status = document.querySelector("#lessen h2");

if (plekkenVrij > 0) {
    status.textContent = status.textContent + " (nog plekken vrij)";
} else {
    status.textContent = status.textContent + " (VOL)";
}
```
Test met verschillende waarden voor `plekkenVrij`. Pas de tekst/selector aan zodat het bij jouw pagina past.

### Huiswerk
1. Voeg een eigen `if`/`else` toe die de inhoud van een element op de pagina laat afhangen van een variabele
2. Test je code met minstens 2 verschillende waarden voor die variabele
3. Zorg dat beide paden (`if` én `else`) daadwerkelijk een zichtbaar of console-verschil geven

---
