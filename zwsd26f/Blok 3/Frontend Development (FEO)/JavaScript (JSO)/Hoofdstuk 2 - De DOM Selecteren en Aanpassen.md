## Hoofdstuk 2: De DOM Selecteren en Aanpassen

*Docentenhandleiding: `Docent/Hoofdstuk 2 - Docentenhandleiding.md`*

**Taakklasse 1 van 3** - RetroPixel (vervolg)
**PRIMM-fasen dit hoofdstuk:** Investigate → Modify

### Leerdoelen
Na dit hoofdstuk kan je:
- Uitleggen wat de DOM is
- Een element selecteren met `document.querySelector()`
- Tekst van een element aanpassen met `.textContent`
- De stijl van een element aanpassen vanuit JS met `.style`

### AI-gebruik dit hoofdstuk
Investigate: **geen AI**. Modify: AI mag, mits je bij een steekproef kan uitleggen wat een regel doet.

### Investigate
```js
const titel = document.querySelector("h1");
console.log(titel);
```
- Wat print dit in de console? Vergelijk met wat je in `index.html` ziet staan.
- `document` is de hele pagina; `querySelector("h1")` zoekt het **eerste** element dat bij die selector past. Welke selectors ken je al uit CSS? Werken die hier ook?

### Modify
1. Selecteer de `<h1>` en verander de tekst met `.textContent`:
```js
const titel = document.querySelector("h1");
titel.textContent = "RetroPixel - nu met JavaScript!";
```
2. Selecteer de knop met `id="hero-knop"` (dezelfde `id` die je in de HTML terugvindt) en verander zijn achtergrondkleur:
```js
const knop = document.querySelector("#hero-knop");
knop.style.backgroundColor = "limegreen";
```
3. Probeer zelf: selecteer nog een ander element (bijv. een `<p>`) en verander de tekst óf de stijl.

**Let op:** `.style.backgroundColor` (camelCase) i.p.v. `.style.background-color` - JavaScript gebruikt geen streepjes in eigenschapsnamen.

### Huiswerk
1. Pas met JS minstens 2 teksten op de pagina aan (`.textContent`)
2. Pas met JS minstens 1 stijl aan (`.style`)
3. Voeg een `console.log()` toe die het geselecteerde element toont, zodat je kan checken of je selector klopt

---
