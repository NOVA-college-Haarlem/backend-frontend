## Hoofdstuk 1: Wat is JavaScript? Variabelen & de Console

*Docentenhandleiding: `Docent/Hoofdstuk 1 - Docentenhandleiding.md`*

**Taakklasse 1 van 3** - RetroPixel (gedeeld met FEO, `starter-website/`)
**PRIMM-fasen dit hoofdstuk:** Predict → Run → Investigate → eerste Modify

### Leerdoelen
Na dit hoofdstuk kan je:
- Uitleggen wat JavaScript is en waar het voor gebruikt wordt
- Een JavaScript-bestand koppelen aan een HTML-pagina
- Variabelen maken en vullen met `let`
- `console.log()` gebruiken om waarden te bekijken
- Teksten combineren met `+` (string-concatenatie)

### AI-gebruik dit hoofdstuk
Bij Predict, Run en Investigate: **geen AI** - dit hoofdstuk draait om code leren lezen. Bij de Modify-oefening mag je AI gebruiken, mits je kan uitleggen wat elke regel doet.

### Kick-off: JavaScript met een knal
Voordat je zelf gaat programmeren, laat de docent live zien wat JavaScript kan: met een paar regels code verandert een hele webpagina. Je hoeft dit nog niet te snappen of te kunnen - het is een voorproefje van waar dit vak naartoe gaat. Vandaag beginnen we bij de basis.

### Predict
Bekijk `starter-website/js/script.js` - **nog niet draaien**. Schrijf op: *wat denk je dat er gebeurt als deze pagina wordt geopend?*
```js
console.log("RetroPixel is geladen!");

let winkelnaam = "RetroPixel";
let jaarOpgericht = 2018;

console.log(winkelnaam + " bestaat sinds " + jaarOpgericht);
```

### Run
Open `starter-website/index.html` in de browser. Open daarna de **console** (F12 → tabblad "Console"). Klopt je voorspelling? Waar verschijnt de tekst - op de pagina, of ergens anders?

### Investigate
Beantwoord:
- Wat is een **variabele**? Wat staat er in `winkelnaam` en wat in `jaarOpgericht`?
- Wat doet `console.log()`? Waarom zie je niets op de pagina zelf?
- Wat doet de `+` tussen `winkelnaam` en `" bestaat sinds "`?
- Hoe wordt dit script gekoppeld aan de HTML-pagina? Zoek de regel in `index.html` die dit doet.

### Modify
Voeg aan `script.js` toe:
1. Twee eigen variabelen (bijvoorbeeld `aantalWinkels` en `stad`)
2. Een `console.log()` die deze twee combineert in één zin

Controleer je resultaat in de console (F12).

### Huiswerk
1. Voeg minstens 3 eigen variabelen toe aan `script.js`
2. Combineer ze in minimaal 2 verschillende `console.log()`-regels
3. Zorg dat er geen foutmeldingen in de console verschijnen

---
