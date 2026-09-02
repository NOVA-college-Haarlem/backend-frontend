## Hoofdstuk 6: Arrays & Loops - Dynamische Code

*Docentenhandleiding: `Docent/Hoofdstuk 6 - Docentenhandleiding.md`*

**Taakklasse 2 van 3** - Boulder Base (afronding)
**PRIMM-fasen dit hoofdstuk:** Investigate → Modify → **Make** (eigen variant)

### Leerdoelen
Na dit hoofdstuk kan je:
- Een array maken en gebruiken
- `forEach()` gebruiken om door een lijst elementen te lopen
- Duplicatie in JS-code herkennen en oplossen met een array + loop
- Een stuk AI-gegenereerde JS-code controleren op fouten

### AI-gebruik dit hoofdstuk
Investigate: **geen AI**. Modify: AI mag, met verantwoording. **Make: AI mag vrij**, mits je aan het eind willekeurig aangewezen regels kan uitleggen.

### Investigate: terug naar de duplicatie
Bekijk `starter-website-2/js/script.js` opnieuw - dezelfde drie click-handlers uit Hoofdstuk 4:
```js
document.querySelectorAll(".card a")[0].addEventListener("click", function (event) {
    event.preventDefault();
    alert("Je hebt de Beginnerscursus geboekt!");
});

document.querySelectorAll(".card a")[1].addEventListener("click", function (event) {
    event.preventDefault();
    alert("Je hebt de Techniektraining geboekt!");
});

document.querySelectorAll(".card a")[2].addEventListener("click", function (event) {
    event.preventDefault();
    alert("Je hebt de Jeugdklim geboekt!");
});
```
Herken je dit patroon? Wat zou er moeten gebeuren als er een vierde les bijkomt?

### Nieuw: arrays en forEach
```js
const namen = ["Zelda", "Minecraft", "FIFA 26"];

namen.forEach(function (naam) {
    console.log(naam);
});
```
- Wat is een **array**? Hoeveel items staan erin?
- Wat doet `forEach`? Hoe vaak wordt de functie uitgevoerd?

### Modify: de duplicatie oplossen
Vervang de drie losse click-handlers door één array + loop:
```js
const lesnamen = ["Beginnerscursus", "Techniektraining", "Jeugdklim"];
const knoppen = document.querySelectorAll(".card a");

knoppen.forEach(function (knop, index) {
    knop.addEventListener("click", function (event) {
        event.preventDefault();
        alert("Je hebt de " + lesnamen[index] + " geboekt!");
    });
});
```
- Wat doet `index` hier? Hoe weet de code welke naam bij welke knop hoort?
- Test: voeg een vierde les toe aan de HTML én aan `lesnamen`. Werkt het zonder extra JS te schrijven?

### Make: eigen variant
Pas dit patroon (array + `forEach`, geen losse duplicatie) toe op je **eigen Boulder Base-variant** (uit FEO Hoofdstuk 6). Gebruik het voor de knoppen die bij jouw thema horen.

### Debug deze AI-output
Je krijgt een stukje AI-gegenereerde JS met een bewuste fout in een `forEach`-loop (bijvoorbeeld de parameters in de verkeerde volgorde, of een array-index die niet bestaat). Vind de fout en leg uit waarom het misgaat.

### Huiswerk
1. Geen losse, gedupliceerde click-handlers meer in je eigen script - alles via een array + `forEach`
2. Test dat het toevoegen van een nieuw item (in de array + HTML) werkt zonder extra JS-code
3. Wees voorbereid op een verantwoordingsvraag volgende les

---
