## Hoofdstuk 3: Objecten en Data Laden met fetch

**Taakklasse 2 van 3** - De Smaakmakers
**PRIMM-fasen dit hoofdstuk:** Predict → Run → Investigate → Modify

### Leerdoelen
Na dit hoofdstuk kan je:
- Een object maken en de eigenschappen ervan gebruiken (`workshop.titel`)
- Een array van objecten doorlopen en per object een card maken
- Data inladen uit een JSON-bestand met `fetch`
- Uitleggen wat er gebeurt bij een `fetch` (request en response) en het terugzien in het Network-tabblad

### AI-gebruik dit hoofdstuk
Predict / Run / Investigate: **geen AI**. Modify: AI mag, met verantwoording.

### Het probleem
De gegevens van één workshop staan nu op **drie** plekken: in de card (HTML), in je `kiesWorkshop`-aanroep (JS) en in de `<select>` (JS). Komt er een workshop bij, of verandert een prijs, dan moet je op drie plekken iets aanpassen. En je moet er niet één vergeten.

Oplossing: de gegevens staan op **één** plek, als data. JavaScript bouwt daar de pagina mee.

### Nieuw: objecten
Een array is een lijst. Een **object** is één "ding" met eigenschappen:
```js
const workshop = {
    id: 3,
    titel: "Brood bakken",
    categorie: "Bakken",
    datum: "zaterdag 19 december",
    prijs: 39.5,
    plekken: 4
};
```

### Predict
Wat komt er in de console? Schrijf het eerst op.
```js
console.log(workshop.titel);
console.log(workshop.prijs * 2);
console.log(`${workshop.titel} kost ${formatPrijs(workshop.prijs)}`);
workshop.plekken = workshop.plekken - 1;
console.log(workshop.plekken);
console.log(workshop.kok);
```

### Run
Klopte het? Wat geeft `workshop.kok` en waarom?

### Investigate: een array van objecten
```js
const workshops = [
    { id: 1, titel: "Verse pasta maken", prijs: 45 },
    { id: 2, titel: "Sushi voor beginners", prijs: 55 },
    { id: 3, titel: "Brood bakken", prijs: 39.5 }
];

workshops.forEach(function (workshop) {
    console.log(`${workshop.titel}: ${formatPrijs(workshop.prijs)}`);
});
```
- Hoe vaak wordt de functie in `forEach` uitgevoerd?
- Wat is `workshop` in de eerste ronde? En in de tweede?
- Hoe krijg je de titel van de **tweede** workshop zonder loop? (Tip: `workshops[...]...`)

### Modify 1: één card als functie
Vroeger had je voor een card een functie met vijf parameters nodig. Met een object is het er één:
```js
function maakCard(workshop) {
    let plekkenTekst = `Nog ${workshop.plekken} plekken`;
    if (workshop.plekken === 0) {
        plekkenTekst = "Vol!";
    }

    return `
        <article class="card">
            <h3>${workshop.titel}</h3>
            <p class="categorie">${workshop.categorie}</p>
            <p>${workshop.datum}</p>
            <p class="prijs">${formatPrijs(workshop.prijs)}</p>
            <p>${plekkenTekst}</p>
            <a href="#inschrijven" class="knop">Schrijf je in</a>
        </article>
    `;
}
```
- Test in de console: `maakCard(workshops[0])`. Wat krijg je terug?
- Waar zie je de `if` uit Blok 3 terug?

### Modify 2: alle cards uit data
1. Haal in `index.html` alle zes `<article class="card">`-blokken weg. Laat `<div class="cards"></div>` leeg staan.
2. Haal in `script.js` de zes `addEventListener`'s van Hoofdstuk 1 weg.
3. Pas `kiesWorkshop` aan zodat hij **één object** krijgt:
```js
function kiesWorkshop(workshop) {
    document.querySelector("#workshop").value = workshop.id;
    document.querySelector("#gekozen").textContent = `Je hebt gekozen: ${workshop.titel} op ${workshop.datum} (${formatPrijs(workshop.prijs)} p.p.).`;
}
```
4. Voeg deze functie toe:
```js
function toonWorkshops(lijst) {
    const container = document.querySelector(".cards");
    container.innerHTML = "";

    lijst.forEach(function (workshop) {
        container.innerHTML += maakCard(workshop);
    });

    // Pas NA het maken van alle cards de knoppen koppelen
    container.querySelectorAll(".card a").forEach(function (knop, index) {
        knop.addEventListener("click", function () {
            kiesWorkshop(lijst[index]);
        });
    });
}
```
- Waarom moeten de knoppen pas **na** de loop gekoppeld worden? (Zie de docent-uitleg in de les.)
- Hoe weet de knop welke workshop bij hem hoort?

### Nieuw: data uit een bestand met fetch
De data hoort eigenlijk niet in `script.js`. Open `data/workshops.json`: daar staan alle zes de workshops al, in **JSON**-formaat. Dat lijkt op een JavaScript-array met objecten, maar dan als los bestand.

Met `fetch` vraagt JavaScript dat bestand op bij de server:
```js
let workshops = [];

async function laadWorkshops() {
    const response = await fetch("data/workshops.json");
    workshops = await response.json();
    toonWorkshops(workshops);
}

laadWorkshops();
```
Haal je eigen `const workshops = [...]` uit `script.js` weg; die is nu overbodig.

> **Wat gebeurt hier?** Het is dezelfde request-response cycle als bij PHP (BEO Blok 3). De browser vraagt `data/workshops.json` op (request), de server stuurt het bestand terug (response). `await` betekent: "wacht tot het antwoord binnen is, ga dan pas verder". `response.json()` zet de tekst om naar een echte JavaScript-array.

### Investigate: het Network-tabblad
1. Open DevTools → **Network** en ververs de pagina
2. Zoek `workshops.json` in de lijst. Klik erop en bekijk **Headers** en **Response**
3. Wat is de **Status**? Wat betekent die?
4. Verander in je code de bestandsnaam in `data/workshop.json` (zonder s). Wat zie je nu in Network en in de console?
5. Open je `index.html` eens door erop te **dubbelklikken** (het adres begint dan met `file://`). Werkt de pagina nog? Lees de foutmelding in de console.

### Modify 3: alles uit dezelfde data
- Pas je code van Hoofdstuk 2 aan: vul de `<select>` nu ook vanuit `workshops`, met `option.value = workshop.id;` en `option.textContent = workshop.titel;`. Maak hier een functie `vulSelect(lijst)` van en roep hem aan in `laadWorkshops`.
- Voeg in `workshops.json` een zevende workshop toe. Komt hij op de pagina én in de `<select>`?
- Zet bij één workshop `"plekken": 0`. Staat er "Vol!" op de card?

### Huiswerk
1. Er staan geen workshop-cards en geen `<option>`'s meer in je HTML: alles komt uit `workshops.json`
2. Een nieuwe workshop toevoegen kost alleen een aanpassing in het JSON-bestand
3. Leg in je eigen woorden uit wat `fetch` doet. Gebruik de woorden **request**, **response** en **server**.

---
