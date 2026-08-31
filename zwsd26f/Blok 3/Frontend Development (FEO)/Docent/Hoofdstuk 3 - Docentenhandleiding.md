## Hoofdstuk 3: Semantische HTML en Nette Structuur - Docentenhandleiding

*Bij: `../Hoofdstuk 3 - Semantische HTML en Nette Structuur.md` (studentversie)*

**Taakklasse 1 van 3** - RetroPixel (afronding)
**PRIMM-fasen dit hoofdstuk:** Investigate → Modify → **Make** (eigen variant)

### Leerdoelen
Na deze les kan de student:
- Uitleggen waarom semantische HTML belangrijk is
- `<div>`-elementen in de starter-website vervangen door `<header>`, `<main>`, `<section>`, `<footer>`
- Code netjes inspringen voor leesbaarheid
- Een eigen, getransformeerde variant van RetroPixel maken en de keuzes daarin verantwoorden
- Een stuk AI-gegenereerde code controleren op fouten

### AI-gebruik dit hoofdstuk
Investigate (semantiek uitleggen) **AI uit**. Modify **mag met AI**, mits verantwoord. **Make: AI mag vrij gebruikt worden**, maar elke student moet aan het eind willekeurig aangewezen regels kunnen uitleggen - dat is de verantwoordingseis die competentie-illusie voorkomt.

### Lesopbouw (90 minuten)

**Terugblik (5 min)**
Kort checken: heeft iedereen consistente spacing in de starter-website?

**Investigate: het probleem met `<div>` (15 min)**
Open de starter-website en laat zien: bijna alles is een `<div>`. Vraag: "Wat vertelt `<div>` je over wat erin staat?" (niets). Herhaal kort de belangrijkste semantische elementen (was Blok 1): `<header>`, `<nav>`, `<main>`, `<section>`, `<footer>`.

**Modify: RetroPixel semantisch maken (35 min)**

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

Hero/over/games/contact worden in `<main>` gezet als losse `<section>`'s, en de contact-div wordt `<footer>`. Laat studenten meetypen (niet kopiëren). Loop rond en check of CSS-selectors nog kloppen (een `.header`-class of `#contact`-ID verandert niet mee als je alleen het tag-type aanpast).

**Make: eigen variant (30 min) - AI mag, verantwoording verplicht**

Nu maakt elke student een **eigen versie** van RetroPixel: zelfde structuur en technieken, maar een ander thema (andere winkel, ander onderwerp), eigen kleuren, eigen content. Dit is geen kopie - de student maakt bewuste keuzes.

**Opdracht:**
1. Kies een eigen thema (bijv. een sneakershop, een platenzaak, een hobbyclub)
2. Herschrijf de content (titels, teksten, producten) naar dit thema
3. Pas het kleurenschema aan
4. Behoud: externe CSS, classes/IDs correct, semantische structuur, consistente spacing

**"Debug deze AI-output" (indien tijd, anders als huiswerk-onderdeel):**
Geef een stukje AI-gegenereerde HTML/CSS met een bewuste fout (bijv. een niet-gesloten tag, of een class die niet matcht met de CSS-selector). Wie vindt de fout?

### Huiswerk
Maak de eigen variant af:
1. Volledig semantisch (`<header>`, `<main>` met secties, `<footer>`)
2. Geen `style=` meer in de HTML
3. Eigen thema volledig doorgevoerd (content + kleuren)
4. Wees voorbereid: de docent kan volgende les een willekeurige regel aanwijzen en vragen "waarom staat dit hier?"

### Tips voor docent
- Bewaar bewust ruimte voor de verantwoordingsvraag - dit is geen extra, het ís de toets of de Make-fase gewerkt heeft
- Waarschuw vooraf: als je een tag-naam verandert (`div` → `section`) maar de class laat staan, blijft de styling gewoon werken
- Sommige studenten kiezen een te ambitieus thema - stuur op "zelfde structuur, ander jasje", niet op een compleet nieuw ontwerp

### Veelgemaakte fouten
1. Tags niet goed afsluiten na het omzetten (`</div>` laten staan i.p.v. `</section>`)
2. Meerdere `<main>`-elementen op één pagina
3. Bij de Make-fase: AI-code overnemen zonder te kunnen uitleggen wat een regel doet
4. Class/ID kwijtraken tijdens het omzetten, waardoor styling wegvalt

---
