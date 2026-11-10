## Hoofdstuk 2: Elementen Maken vanuit JS

**Taakklasse 1 van 3** - De Smaakmakers (afronding)
**PRIMM-fasen dit hoofdstuk:** Investigate → Modify → **Make** (eigen variant)

### Leerdoelen
Na dit hoofdstuk kan je:
- Een nieuw HTML-element maken met `document.createElement()` en toevoegen met `appendChild()`
- Een lijst op de pagina maken vanuit een array
- Met `innerHTML` en een template literal een stuk HTML in één keer neerzetten
- Uitleggen waarom je `innerHTML` **nooit** gebruikt voor tekst die een gebruiker heeft ingetypt
- Een stuk AI-gegenereerde JS-code controleren op fouten

### AI-gebruik dit hoofdstuk
Investigate: **geen AI**. Modify: AI mag, met verantwoording. **Make: AI mag vrij**, mits je aan het eind willekeurig aangewezen regels kan uitleggen.

### Voorbereiding
Zet in `index.html`, direct ná de hero-sectie, deze nieuwe sectie:
```html
<section class="container">
    <div id="uitgelicht"></div>
    <h2>Binnenkort</h2>
    <ul id="binnenkort"></ul>
</section>
```
De `<ul>` en de `<div>` zijn leeg. JavaScript gaat ze vullen.

### Investigate: één element maken
```js
const li = document.createElement("li");
li.textContent = "Dim sum maken";
document.querySelector("#binnenkort").appendChild(li);
```
- Zet de code in `script.js` en ververs. Wat zie je?
- Haal de laatste regel weg. Bestaat het element nog? Zie je het nog?
- Wat is dus het verschil tussen `createElement` en `appendChild`?
- Open DevTools → **Elements**. Staat de `<li>` in de HTML? En in je `index.html` in VS Code?

> JavaScript verandert de pagina in de **browser**, niet je bestand. Daarom zie je de `<li>` wel in Elements, maar niet in VS Code.

### Modify 1: een lijst vanuit een array
Combineer dit met `forEach` uit Blok 3:
```js
const binnenkort = ["Dim sum maken", "Franse patisserie", "Mexicaanse streetfood"];

binnenkort.forEach(function (titel) {
    const li = document.createElement("li");
    li.textContent = titel;
    document.querySelector("#binnenkort").appendChild(li);
});
```
- Voeg een vierde workshop toe aan de array. Hoeveel regels HTML moest je schrijven?
- Geef elke `<li>` ook een class met `li.classList.add("binnenkort-item")` en controleer het in Elements.

### Modify 2: de `<select>` vullen
In het formulier staan zes `<option>`'s met de hand getypt. Laat JavaScript ze maken.
1. Haal in `index.html` alle `<option>`'s weg, **behalve** `-- Kies een workshop --`
2. Maak in `script.js` een array met de zes titels
3. Maak per titel een `<option>` met `createElement`. Zet `option.value = index + 1;` en `option.textContent = titel;`

Tip: `forEach(function (titel, index) { ... })`. Waarom `index + 1` en niet `index`? Kijk naar de waarden die `kiesWorkshop` uit Hoofdstuk 1 gebruikt.

Test: werken de "Schrijf je in"-knoppen nog?

### Nieuw: innerHTML met een template literal
Voor één element is `createElement` prima. Voor een heel blok HTML is het veel typwerk. Dan kan het ook zo:
```js
function maakUitgelicht(titel, datum, prijs) {
    return `<h2>Uitgelicht: ${titel}</h2><p>${datum} - ${formatPrijs(prijs)}</p>`;
}

document.querySelector("#uitgelicht").innerHTML = maakUitgelicht("Vegetarisch kerstdiner", "zondag 20 december", 65);
```
- Welke functie **geeft** de HTML terug, en welke regel **zet** hem op de pagina?
- Wat zou er gebeuren als je `textContent` gebruikt in plaats van `innerHTML`? Voorspel eerst, probeer dan.

### Investigate: waarom innerHTML gevaarlijk is
Voer dit uit in de console:
```js
const invoer = "<b>Kees</b>";
document.querySelector("#gekozen").textContent = invoer;
```
En daarna:
```js
document.querySelector("#gekozen").innerHTML = invoer;
```
- Wat is het verschil?
- Stel dat `invoer` de naam is die een bezoeker in het formulier typt. Probeer nu deze "naam":
```js
const invoer = `<img src="x" onerror="alert('Gehackt!')">`;
document.querySelector("#gekozen").innerHTML = invoer;
```
- Wat gebeurt er? Waarom is dit gevaarlijk als de tekst van iemand anders komt?

> **Regel:** tekst van een gebruiker zet je altijd met `textContent`. `innerHTML` gebruik je alleen voor HTML die je **zelf** hebt geschreven.

### Make: eigen variant
Bij Frontend Development (Hoofdstuk 2) maak je deze week een eigen variant van De Smaakmakers, in de map `mijn-variant`. Doe deze Make daarin, niet in `starter-website-3`. Laat op jouw variant minstens **één lijst of sectie** door JavaScript maken vanuit een array: bijvoorbeeld de "binnenkort"-lijst, een lijst met chefs, of de footer-links.

### Debug deze AI-output
Een student vroeg AI om "een lijst met gerechten op de pagina te zetten" en kreeg dit:
```js
const gerechten = ["Lasagne", "Pad thai", "Shakshuka"];

gerechten.forEach(function (gerecht) {
    const item = document.createElement("<li>");
    item.innerHTML = gerecht;
});
```
Er zitten **twee** fouten in (en één dingetje dat niet fout is, maar wel slordig). Vind ze, leg uit wat er misgaat en verbeter de code.

### Huiswerk
1. De "binnenkort"-lijst en de `<select>` worden door JavaScript gemaakt
2. De "Uitgelicht"-sectie staat op de pagina via een functie met `return`
3. Leg in één zin uit wanneer je `textContent` gebruikt en wanneer `innerHTML`

---
