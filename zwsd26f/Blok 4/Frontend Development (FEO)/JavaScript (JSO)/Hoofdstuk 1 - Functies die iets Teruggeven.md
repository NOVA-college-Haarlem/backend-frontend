## Hoofdstuk 1: Functies die iets Teruggeven

**Taakklasse 1 van 3** - De Smaakmakers (`starter-website-3/`)
**PRIMM-fasen dit hoofdstuk:** Predict → Run → Investigate → Modify

### Leerdoelen
Na dit hoofdstuk kan je:
- Een functie schrijven met **parameters** en een **`return`**-waarde
- Uitleggen wat het verschil is tussen een functie die iets *doet* en een functie die iets *teruggeeft*
- Template literals gebruiken (`` `Hallo ${naam}` ``) in plaats van strings met `+`
- Herhaalde code vervangen door één functie die je meerdere keren aanroept

### AI-gebruik dit hoofdstuk
Predict / Run / Investigate: **geen AI**. Modify: AI mag, maar je moet elke regel kunnen uitleggen.

### Opstarten: De Smaakmakers
Dit blok werk je aan een nieuwe site: **De Smaakmakers**, een kookstudio met workshops en een inschrijfformulier. Dezelfde site gebruik je ook bij Frontend Development.

1. Open de map `starter-website-3` in VS Code
2. Open een terminal en typ: `docker compose up -d` (net als bij je PHP-projecten)
3. Ga in je browser naar http://localhost
4. Open de console (F12): geen rode foutmeldingen? Dan ben je klaar.

### Instap: weet je het nog?
Zonder AI, zonder terugkijken. Schrijf in de console of in `script.js`:
1. Selecteer de `<h1>` en verander de tekst in "Koken is leuk"
2. Laat een `alert` zien als je op de eerste "Schrijf je in"-knop klikt
3. Maak een array met drie gerechten en log ze met `forEach` één voor één in de console

Lukte één van de drie niet? Kijk dan terug in Blok 3, Hoofdstuk 2, 3 of 6.

### Predict: wat geeft deze functie terug?
Lees deze code. Schrijf eerst op wat er in de console komt, **voordat** je het uitvoert.
```js
function verdubbel(getal) {
    return getal * 2;
}

let uitkomst = verdubbel(4);
console.log(uitkomst);
console.log(verdubbel(10) + 1);
```

### Run
Plak de code in je console. Klopte je voorspelling?

### Investigate: doen of teruggeven?
Vergelijk deze twee functies:
```js
function toonMelding(tekst) {
    document.querySelector("#gekozen").textContent = tekst;
}

function maakMelding(titel) {
    return "Je hebt gekozen: " + titel;
}
```
- Welke functie **verandert** iets op de pagina?
- Welke functie geeft een **waarde terug**, zonder iets op de pagina te veranderen?
- Wat komt er in `let x = toonMelding("hoi");` te staan? Probeer het: `console.log(x)`.
- Hoe zou je de twee samen gebruiken? Schrijf het in één regel.

> **`return`** geeft een waarde terug aan de plek waar je de functie aanroept. Een functie zonder `return` geeft `undefined` terug.

### Nieuw: template literals
Strings met `+` aan elkaar plakken wordt snel onleesbaar. Met **backticks** (`` ` ``, de toets links van de 1) kun je variabelen direct in de tekst zetten:
```js
let titel = "Brood bakken";
let datum = "zaterdag 19 december";

// Oud:
let tekst1 = "Je hebt gekozen: " + titel + " op " + datum + ".";

// Nieuw:
let tekst2 = `Je hebt gekozen: ${titel} op ${datum}.`;
```
- Log `tekst1` en `tekst2`. Is er verschil?
- Wat gebeurt er als je per ongeluk gewone aanhalingstekens gebruikt: `"Je koos ${titel}"`?

### Modify 1: één prijsnotatie
Kijk naar de prijzen op de cards: `€ 45`, `€55,-`, `65 euro`, `€ 42,5`... Allemaal anders. Schrijf een functie die een getal netjes als prijs teruggeeft:
```js
function formatPrijs(prijs) {
    return `€ ${prijs.toFixed(2).replace(".", ",")}`;
}

console.log(formatPrijs(45));    // € 45,00
console.log(formatPrijs(39.5));  // € 39,50
```
- Zoek uit wat `toFixed(2)` doet. Probeer `(42.5).toFixed(2)` in de console.
- Waarom is `replace(".", ",")` nodig?

### Modify 2: zes keer dezelfde code
Open `js/script.js`. Je ziet zes bijna identieke blokken: één per workshop.
- Wat is het enige dat per blok verschilt?
- Hoeveel regels moet je aanpassen als de zin "Je hebt gekozen" moet veranderen in "Jouw keuze"?

Vervang de inhoud van de zes blokken door één functie:
```js
function kiesWorkshop(id, titel, datum, prijs) {
    document.querySelector("#workshop").value = id;
    document.querySelector("#gekozen").textContent = `Je hebt gekozen: ${titel} op ${datum} (${formatPrijs(prijs)} p.p.).`;
}

const knoppen = document.querySelectorAll(".card a");

knoppen[0].addEventListener("click", function () {
    kiesWorkshop("1", "Verse pasta maken", "zaterdag 5 december", 45);
});
```
Maak de andere vijf zelf af. Test elke knop.

> Er staan nog steeds zes `addEventListener`-regels. Dat komt doordat de gegevens van de workshops nog in de HTML staan. In Hoofdstuk 3 lossen we dat helemaal op.

### Huiswerk
1. `formatPrijs` en `kiesWorkshop` werken, alle zes de knoppen tonen de juiste tekst
2. Geen `+` meer om strings aan elkaar te plakken in je `script.js`
3. Schrijf zelf een functie `berekenTotaal(prijs, aantal)` die de totaalprijs **teruggeeft**, en test hem in de console: `formatPrijs(berekenTotaal(39.5, 3))` moet `€ 118,50` geven

---
