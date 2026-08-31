## Hoofdstuk 7: Formulier-input Lezen & Feedback Tonen

*Docentenhandleiding: `Docent/Hoofdstuk 7 - Docentenhandleiding.md`*

**Taakklasse 3 van 3** - Boulder Base contactformulier / eigen variant
**PRIMM-fasen dit hoofdstuk:** Predict → Investigate → Modify

### Leerdoelen
Na dit hoofdstuk kan je:
- Uitleggen wat `event.preventDefault()` doet en waarom je het nodig hebt
- De waarde van een formulierveld uitlezen met `.value`
- Eenvoudige feedback tonen op basis van een conditie (zonder daadwerkelijk te versturen)

### AI-gebruik dit hoofdstuk
Predict/Investigate: **geen AI**. Modify: AI mag, mits verantwoord.

### Predict
Bekijk het contactformulier in `starter-website-2/index.html` (`<form class="contact-form">`). Wat denk je dat er gebeurt als je op "Versturen" klikt, zónder dat er JavaScript aan gekoppeld is?

### Investigate
Test het: klik op "Versturen" met een leeg formulier. Wat gebeurt er met de pagina?

**Nieuw:**
```js
const formulier = document.querySelector(".contact-form");

formulier.addEventListener("submit", function (event) {
    event.preventDefault();
    console.log("Formulier verstuurd (nog geen echte verzending)");
});
```
- Wat doet `event.preventDefault()`? Test het verschil: met en zonder deze regel.
- Waarom is dit nodig, terwijl er nog geen server is die de data kan verwerken? (vooruitblik: dat komt bij backend-development)

### Modify
Lees de waarde van het naam-veld uit en toon feedback:
```js
formulier.addEventListener("submit", function (event) {
    event.preventDefault();

    const naam = document.querySelector("#naam").value;

    if (naam === "") {
        alert("Vul je naam in!");
    } else {
        alert("Bedankt, " + naam + "! (Dit is nog een demo, er wordt niets verzonden.)");
    }
});
```
Breid uit: voeg een tweede controle toe, bijvoorbeeld op het berichtveld, of een minimale lengte-eis voor de naam.

### Huiswerk
1. Je formulier voorkomt een paginaherlaad bij versturen
2. Minimaal 2 velden worden gecontroleerd vóór de "bedankt"-feedback verschijnt
3. Lege of te korte invoer geeft een duidelijke foutmelding

---
