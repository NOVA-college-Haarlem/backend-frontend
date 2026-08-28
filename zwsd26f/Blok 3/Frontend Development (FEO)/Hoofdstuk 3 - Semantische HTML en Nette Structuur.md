## Hoofdstuk 3: Semantische HTML en Nette Structuur

*Docentenhandleiding: `Docent/Hoofdstuk 3 - Docentenhandleiding.md`*

**Taakklasse 1 van 3** - RetroPixel (afronding)
**PRIMM-fasen dit hoofdstuk:** Investigate → Modify → **Make** (eigen variant)

### Leerdoelen
Na dit hoofdstuk kan je:
- Uitleggen waarom semantische HTML belangrijk is
- `<div>`-elementen in de starter-website vervangen door `<header>`, `<main>`, `<section>`, `<footer>`
- Code netjes inspringen voor leesbaarheid
- Een eigen, getransformeerde variant van RetroPixel maken en de keuzes daarin verantwoorden
- Een stuk AI-gegenereerde code controleren op fouten

### AI-gebruik dit hoofdstuk
Investigate: **geen AI**. Modify: AI mag, mits verantwoord. **Make: AI mag vrij**, maar je moet aan het eind een willekeurig aangewezen regel kunnen uitleggen.

### Investigate: het probleem met `<div>`
Bekijk de starter-website: bijna alles is een `<div>`. Wat vertelt `<div>` je over wat erin staat? De belangrijkste semantische elementen (uit Blok 1): `<header>`, `<nav>`, `<main>`, `<section>`, `<footer>`.

### Modify: RetroPixel semantisch maken
Van:
```html
<div class="header">
    <div class="logo">RetroPixel</div>
    <div class="nav-links">
        <a href="#over">Over ons</a>
        ...
    </div>
</div>
```
Naar:
```html
<header>
    <div class="logo">RetroPixel</div>
    <nav class="nav-links">
        <a href="#over">Over ons</a>
        ...
    </nav>
</header>
```
Zet hero/over/games/contact in `<main>` als losse `<section>`'s, en maak van de contact-div een `<footer>`. Type het over (niet kopiëren), en check daarna of je CSS-selectors nog kloppen.

### Make: eigen variant
Maak een **eigen versie** van RetroPixel: zelfde structuur en technieken, maar een ander thema (andere winkel, ander onderwerp), eigen kleuren, eigen content. Geen kopie - maak bewuste keuzes.

**Opdracht:**
1. Kies een eigen thema (bijv. een sneakershop, een platenzaak, een hobbyclub)
2. Herschrijf de content (titels, teksten, producten) naar dit thema
3. Pas het kleurenschema aan
4. Behoud: externe CSS, classes/IDs correct, semantische structuur, consistente spacing

### Debug deze AI-output
Je krijgt een stukje AI-gegenereerde HTML/CSS met een bewuste fout erin. Vind de fout en leg uit waarom het misgaat.

### Huiswerk
Maak de eigen variant af:
1. Volledig semantisch (`<header>`, `<main>` met secties, `<footer>`)
2. Geen `style=` meer in de HTML
3. Eigen thema volledig doorgevoerd (content + kleuren)
4. Wees voorbereid: er kan volgende les een willekeurige regel worden aangewezen met de vraag "waarom staat dit hier?"

---
