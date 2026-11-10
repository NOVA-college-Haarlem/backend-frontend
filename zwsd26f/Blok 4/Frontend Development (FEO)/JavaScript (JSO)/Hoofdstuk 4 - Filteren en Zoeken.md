## Hoofdstuk 4: Filteren en Zoeken

**Taakklasse 2 van 3** - De Smaakmakers (afronding)
**PRIMM-fasen dit hoofdstuk:** Investigate → Modify → **Make** (eigen variant)

### Leerdoelen
Na dit hoofdstuk kan je:
- Met `filter()` een nieuwe array maken met alleen de items die aan een voorwaarde voldoen
- Met `find()` één item opzoeken in een array
- Filterknoppen en een zoekveld koppelen aan je data
- Een melding tonen als er geen resultaten zijn
- Een stuk AI-gegenereerde JS-code controleren op fouten

### AI-gebruik dit hoofdstuk
Investigate: **geen AI**. Modify: AI mag, met verantwoording. **Make: AI mag vrij**, mits je aan het eind willekeurig aangewezen regels kan uitleggen.

### Investigate: een bug in de prijs
1. Klik op "Schrijf je in" bij Brood bakken
2. Open DevTools → **Elements** en zoek `<input type="hidden" name="prijs">`. Wat is de `value`?
3. Kies nu in de `<select>` een andere workshop en kijk opnieuw
4. Bekijk het `change`-blok onderaan `script.js`. Waarom werkt het via de `<select>` wel, en via de knop niet?
5. Wat gebeurt er met het `change`-blok als er een zevende workshop bijkomt?

Dat lossen we op met `find()`.

### Nieuw: find
`find()` zoekt het **eerste** item in een array dat aan een voorwaarde voldoet:
```js
const gezocht = workshops.find(function (workshop) {
    return workshop.id === 3;
});

console.log(gezocht.titel);
```
- Wat geeft dit in de console?
- Wat geeft `find` als je zoekt naar `id === 99`? Probeer het.
- De functie binnen `find` heeft een `return`. Wat geeft die terug: een workshop, of `true`/`false`?

### Modify 1: de prijs-bug oplossen
1. Zet in `kiesWorkshop` ook de prijs:
```js
document.querySelector("#prijs").value = workshop.prijs;
```
2. Vervang de hele `if/else`-ketting in het `change`-blok door:
```js
document.querySelector("#workshop").addEventListener("change", function () {
    const keuze = Number(document.querySelector("#workshop").value);

    const gekozen = workshops.find(function (workshop) {
        return workshop.id === keuze;
    });

    if (gekozen) {
        kiesWorkshop(gekozen);
    }
});
```
- Waarom is `Number(...)` nodig? (Tip: wat is `"3" === 3`?)
- Wanneer is `gekozen` leeg? Wat zou er zonder de `if` gebeuren?

### Nieuw: filter
`filter()` maakt een **nieuwe** array met alle items die aan een voorwaarde voldoen:
```js
const aziatisch = workshops.filter(function (workshop) {
    return workshop.categorie === "Aziatisch";
});

console.log(aziatisch.length);
toonWorkshops(aziatisch);
```
- Hoeveel workshops staan er nu op de pagina? Is `workshops` zelf ook veranderd?
- Schrijf zelf een `filter` die alleen workshops onder de € 50 overhoudt.

### Modify 2: filterknoppen
Zet in `index.html`, boven `<div class="cards">`:
```html
<div class="filters">
    <button>Alle</button>
    <button>Italiaans</button>
    <button>Aziatisch</button>
    <button>Bakken</button>
    <button>Vegetarisch</button>
</div>
```
En in `script.js`:
```js
document.querySelectorAll(".filters button").forEach(function (knop) {
    knop.addEventListener("click", function (event) {
        const categorie = event.target.textContent;

        if (categorie === "Alle") {
            toonWorkshops(workshops);
        } else {
            const gefilterd = workshops.filter(function (workshop) {
                return workshop.categorie === categorie;
            });
            toonWorkshops(gefilterd);
        }
    });
});
```
- Filter op "Bakken" en klik dan op "Schrijf je in" bij de **eerste** card. Wordt de juiste workshop gekozen? Waarom werkt dat? (Kijk terug naar `lijst[index]` in `toonWorkshops`.)

### Modify 3: zoeken
Voeg in `.filters` een zoekveld toe: `<input type="search" id="zoek" placeholder="Zoek een workshop">`. Schrijf zelf de code, met deze onderdelen:
- Het `input`-event (gaat af bij elke letter die je typt)
- De zoekterm met `.value.toLowerCase()`
- Een `filter` met `workshop.titel.toLowerCase().includes(zoekterm)`
- `toonWorkshops(resultaat)`

Test: "PASTA", "brood", "xyz". Wat zie je bij "xyz"?

### Modify 4: geen resultaten
Zet bovenin `toonWorkshops`, ná `container.innerHTML = "";`:
```js
if (lijst.length === 0) {
    container.innerHTML = "<p>Geen workshops gevonden.</p>";
    return;
}
```
Wat doet `return` hier, in een functie die verder niets teruggeeft?

### Make: eigen variant
Nu krijgt je eigen variant (`mijn-variant`) dezelfde opbouw als De Smaakmakers:
1. Maak een eigen JSON-bestand met de items van jouw onderwerp: minstens 6 items met minstens 4 eigenschappen. Bijvoorbeeld `data/lessen.json`.
2. Haal de cards uit je HTML en laad ze met `fetch` en een eigen `maakCard`, net als in Hoofdstuk 3.
3. Voeg een **filter of zoekfunctie** toe die past bij jouw data. Bijvoorbeeld: een knop "Alleen beschikbaar" (`plekken > 0`), sorteren op prijs (zoek `sort()` op), of filteren op een eigenschap die jij zelf in je JSON hebt gezet.

### Debug deze AI-output
AI kreeg de vraag: "Maak een zoekfunctie voor mijn workshops". Het antwoord:
```js
document.querySelector("#zoek").addEventListener("click", function () {
    const zoekterm = document.querySelector("#zoek").value;

    const resultaat = workshops.filter(function (workshop) {
        workshop.titel.includes(zoekterm);
    });

    toonWorkshops(resultaat);
});
```
Er zitten **drie** fouten in. Eén zorgt dat er nooit iets gevonden wordt, één zorgt dat het niet werkt tijdens het typen, en één zorgt dat "Pasta" niet gevonden wordt als je "pasta" typt. Vind en verbeter ze.

### Huiswerk
1. Filterknoppen, zoekveld en "geen resultaten" werken
2. De prijs in het verborgen veld klopt, ook als je via de "Schrijf je in"-knop kiest
3. Leg uit wat het verschil is tussen `filter` en `find`: wat geven ze allebei terug?

---
