## Hoofdstuk 5: Classes Toggelen - Dark Mode & Interactieve States

*Docentenhandleiding: `Docent/Hoofdstuk 5 - Docentenhandleiding.md`*

**Taakklasse 2 van 3** - Boulder Base (vervolg)
**PRIMM-fasen dit hoofdstuk:** Investigate → Modify

### Leerdoelen
Na dit hoofdstuk kan je:
- `classList.add()`, `.remove()` en `.toggle()` gebruiken
- Een class-toggle koppelen aan CSS-variabelen voor een dark-mode effect
- Uitleggen hoe één class-toggle meerdere stijlen tegelijk kan aanpassen

### AI-gebruik dit hoofdstuk
Investigate: **geen AI**. Modify: AI mag, mits verantwoord.

### Investigate
In `starter-website-2/index.html` staat een knop met `id="dark-mode-toggle"`. Bekijk:
```js
const toggleKnop = document.querySelector("#dark-mode-toggle");

toggleKnop.addEventListener("click", function () {
    document.body.classList.toggle("dark");
});
```
- Wat doet `classList.toggle("dark")`? Wat gebeurt er als je meerdere keren klikt?
- Waarom verandert er (nog) niets zichtbaars als je dit alleen in JS toevoegt?

### Modify
Voeg de CSS toe die bij de `dark`-class hoort (in `css/style.css` - dit is dezelfde `:root`-aanpak die je in FEO Hoofdstuk 5 hebt geleerd):
```css
body.dark {
    --primary: #ff8c5a;
    --dark: #0d0d16;
    --light: #1f1f2e;
    --text: #eaeaea;
}
```
Voeg vervolgens het JS-fragment hierboven toe aan `script.js`, en test de toggle-knop. Omdat de rest van je CSS al met `var(--primary)` etc. werkt, verandert de **hele site** mee zodra je de class toggelt - zonder dat je die CSS opnieuw hoeft te schrijven.

**Zelf verder:** voeg een tweede interactieve state toe, bijvoorbeeld een `.actief`-class die met JS aan de navigatielink wordt toegevoegd waar de bezoeker net op heeft geklikt.

### Huiswerk
1. Dark-mode toggle werkt: klikken verandert het kleurenschema van de hele pagina
2. De dark-mode kleuren zijn eigen kleuren (niet letterlijk de voorbeeldwaarden), passend bij je thema
3. Voeg minimaal 1 extra `classList`-interactie toe naar keuze

---
