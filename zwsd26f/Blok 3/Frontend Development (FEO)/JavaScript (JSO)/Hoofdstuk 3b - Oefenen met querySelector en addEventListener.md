## Hoofdstuk 3b: Oefenen - querySelector en addEventListener

**Taakklasse 1 van 3** - RetroPixel (vervolg, eigen repo: [NOVA-college-Haarlem/RetroPixel](https://github.com/NOVA-college-Haarlem/RetroPixel))
**Type:** herhalingsoefening (geen nieuwe PRIMM-cyclus) - tussen Hoofdstuk 3 en Hoofdstuk 4 in

### Waarom deze oefening
Je hebt nu `document.querySelector()` (Hoofdstuk 2) en `addEventListener()` (Hoofdstuk 3) los gezien. Voordat je in Hoofdstuk 4 met een nieuwe site (Boulder Base) en condities aan de slag gaat, oefen je hier vijf keer met de **combinatie** van die twee. Geen nieuwe theorie - gewoon herhalen tot het routine wordt.

### Leerdoelen
Na deze oefeningen kan je:
- Een element selecteren en er een klik-listener aan hangen, zonder erbij na te denken
- Zelf een `id` toevoegen aan HTML als er nog geen bruikbare selector is
- Een element selecteren via `querySelectorAll(...)[index]`
- Ook andere events dan `click` gebruiken (`mouseover`, `mouseout`)

### Voorbereiding
Open `index.html` en `js/script.js` in je gekloonde RetroPixel-map. Alle oefeningen werken in dit bestaande `script.js` (onder de code die er al staat).

---

### Oefening 1 - Warming-up: klik op de hero-knop
Selecteer de knop met `id="hero-knop"` en toon een `alert()` met een zelfbedachte tekst zodra erop geklikt wordt.

<details>
<summary>Hint</summary>

```js
const knop = document.querySelector("#hero-knop");
knop.addEventListener("click", function () {
    alert("...");
});
```
</details>

---

### Oefening 2 - Eén klik, een ander element aanpassen
Zorg dat een klik op `#hero-knop` niet zichzelf aanpast, maar de `<h1>` erboven. Verander bij klik de tekst van de `<h1>` naar iets nieuws.

*Let op: je hebt nu twee `querySelector()`-aanroepen nodig - één voor de knop (om de listener op te zetten) en één voor de `h1` (om aan te passen).*

---

### Oefening 3 - Zelf een selector maken
De navigatielink "Contact" (bovenin, in de header) heeft nog geen `id` of `class` - je kan 'm dus nog niet apart selecteren. Voeg zelf een `id="contact-link"` toe aan die `<a>` in `index.html`, selecteer 'm daarna in JS, en laat bij een klik iets in de console verschijnen (bijvoorbeeld `console.log("Naar contact genavigeerd")`).

*De link blijft gewoon naar `#contact` scrollen - dat hoef je niet tegen te houden.*

---

### Oefening 4 - Selecteren via een index
In de sectie `#games` staan drie "In winkelwagen"-knoppen, zonder eigen `id`. Selecteer de **eerste** met `document.querySelectorAll("#games a")[0]` en voeg een klik-listener toe die:
1. de tekst verandert in `"Toegevoegd!"`
2. de achtergrondkleur (`.style.backgroundColor`) verandert, bijvoorbeeld naar `"limegreen"`

**Zelf verder:** doe hetzelfde voor de knoppen op index `1` en `2` (je mag de code hiervoor gewoon drie keer bijna hetzelfde opschrijven - een nettere oplossing met een loop komt pas in Hoofdstuk 6).

---

### Oefening 5 - Een ander soort event
Tot nu toe gebruikte je steeds `"click"`. `addEventListener()` werkt ook met andere events, zoals `"mouseover"` (muis komt boven het element) en `"mouseout"` (muis gaat weg).

Kies één van de drie game-afbeeldingen (`<img>` in `#games`) en zorg dat:
- bij `"mouseover"` de `opacity` van de afbeelding verandert (bijvoorbeeld `img.style.opacity = "0.6"`)
- bij `"mouseout"` de `opacity` weer terug naar `"1"` gaat

*Dit betekent: twee losse `addEventListener()`-aanroepen op hetzelfde element.*

<details>
<summary>Hint</summary>

```js
const afbeelding = document.querySelector("#games img");

afbeelding.addEventListener("mouseover", function () {
    afbeelding.style.opacity = "0.6";
});

afbeelding.addEventListener("mouseout", function () {
    afbeelding.style.opacity = "1";
});
```
</details>

---

### Checklist
- [ ] Oefening 1 t/m 5 werken allemaal in de browser (test elke oefening apart)
- [ ] Je kan bij een willekeurige regel uitleggen wélk element wordt geselecteerd en waaróm
- [ ] Je hebt zelf minstens 1 keer een `id` toegevoegd aan de HTML om iets selecteerbaar te maken

---
