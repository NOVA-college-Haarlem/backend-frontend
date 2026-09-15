## Hoofdstuk 4: Condities Toepassen - Actieplekken bij Boulder Base

*Docentenhandleiding: `Docent/Hoofdstuk 4 - Docentenhandleiding.md`*

**Taakklasse 2 van 3** - Boulder Base (gedeeld met FEO, `starter-website-2/`)
**PRIMM-fasen dit hoofdstuk:** Predict → Run → Investigate → Modify

### Nieuwe taakklasse, nieuwe site
Boulder Base heeft - net als bij FEO - al een gekoppeld `js/script.js`, met daarin drie bijna-identieke click-handlers voor de lessenkaarten. Dat is bewust: die duplicatie ga je pas in Hoofdstuk 6 oplossen. Dit hoofdstuk gaat over iets anders: **`if`/`else` toepassen binnen een event listener**, gecombineerd met styling vanuit je script.

> Je hebt `if`/`else` en vergelijkingsoperators (`>`, `<`, `===`) al eerder gehad. Dit hoofdstuk legt dat dus niet opnieuw uit - het laat je zien hoe je die kennis combineert met een `addEventListener` en met `.style`-aanpassingen, en breidt 'm uit met een `else if`.

### Leerdoelen
Na dit hoofdstuk kan je:
- `if` / `else if` / `else` toepassen **binnen** een `addEventListener`-functie
- `event.target` gebruiken om het aangeklikte element direct te pakken
- De `.style` van een element laten afhangen van een conditie
- Een variabele bijhouden die van waarde verandert bij elke klik ("state"), en daarmee het gedrag van een knop bij een volgende klik laten veranderen

### AI-gebruik dit hoofdstuk
Predict/Run/Investigate: **geen AI**. Modify: AI mag, mits je bij een steekproef kan uitleggen wat een regel doet - inclusief waarom de volgorde van je condities klopt.

### Predict
Bekijk `starter-website-2/js/script.js` - **nog niet draaien**. Er staan drie vergelijkbare stukjes code onder elkaar (de "Boek deze les"-knoppen). Wat doen ze, denk je? Wat valt op aan hoe ze zijn opgeschreven?

### Run
Open `index.html`, klik op de drie "Boek deze les"-knoppen. Klopt je voorspelling?

### Investigate
- Wat doen de drie click-handlers van de lessenkaarten precies?
- Herken je dit duplicatiepatroon van eerdere hoofdstukken (denk aan FEO)? We lossen dit **nog niet** op - dat komt in Hoofdstuk 6. Vandaag richten we ons op iets anders.
- Scroll naar `#abonnementen`. Daar staan drie knoppen ("Kies dit abonnement") die nog helemaal geen JavaScript hebben. Die gaan we vandaag koppelen.

### Modify
Boulder Base heeft een tijdelijke actie: de eerste bezoekers die een abonnement kiezen, krijgen een introductiekorting. Het aantal actieplekken per abonnement is beperkt - en dat gaan we met JS bijhouden.

Voeg dit toe aan `script.js`:
```js
let actieplekken = 2;

document.querySelectorAll(".plan a")[1].addEventListener("click", function (event) {
    event.preventDefault();
    const knop = event.target;

    if (actieplekken > 1) {
        actieplekken = actieplekken - 1;
        knop.textContent = "Aangemeld met korting!";
        knop.style.backgroundColor = "green";
        alert("Je hebt de introductiekorting! Nog " + actieplekken + " actieplekken over.");
    } else if (actieplekken === 1) {
        actieplekken = actieplekken - 1;
        knop.textContent = "Laatste actieplek!";
        knop.style.backgroundColor = "orange";
        alert("Dit was de laatste actieplek met korting!");
    } else {
        knop.textContent = "Actie is op";
        knop.style.backgroundColor = "grey";
        alert("De actie is helaas op. Je kan nog wel het normale abonnement afsluiten.");
    }
});
```
Let op een paar dingen:
- `event.target` pakt automatisch het element waarop geklikt is - je hoeft daarvoor geen apart `const knop = document.querySelector(...)` te schrijven.
- De volgorde van de condities is belangrijk: eerst `actieplekken > 1`, dan `=== 1`, dan pas `else`. Wat gebeurt er als je die volgorde omdraait? Voorspel het, en test het daarna.
- `actieplekken` verandert bij elke klik. Klik een paar keer op de knop en kijk wat er gebeurt bij 2 → 1 → 0.

**Zelf verder:** kopieer dit patroon naar de andere twee abonnement-knoppen (`.plan a` op index `0` en `2`). Gebruik voor elk abonnement een eigen `actieplekken`-variabele, en eigen kleuren of teksten die bij jouw thema passen.

### Huiswerk
1. Alle drie de abonnement-knoppen reageren op een klik met `if`/`else if`/`else`, gekoppeld aan een eigen `actieplekken`-variabele
2. Elk van de drie mogelijke uitkomsten (volop, laatste plek, op) heeft een eigen `.style`-aanpassing én een eigen boodschap
3. Test elke knop met verschillende startwaarden (probeer bijvoorbeeld ook `actieplekken = 1` en `actieplekken = 0`, zodat je zeker weet dat elke tak wordt bereikt)

---
