## Week 3: Semantische HTML en Nette Structuur

### Leerdoelen
Na deze les kan de student:
- Uitleggen waarom semantische HTML belangrijk is
- `<div>`-elementen in de starter-website vervangen door `<header>`, `<main>`, `<section>`, `<footer>`
- Code netjes inspringen voor leesbaarheid
- HTML-structuur inspecteren met DevTools

### Lesopbouw (90 minuten)

**1. Terugblik (5 min)**
- Kort checken: heeft iedereen consistente spacing in de starter-website?

**2. Het probleem met `<div>` (15 min)**

Open de starter-website en laat zien: bijna alles is een `<div>`. Vraag: "Wat vertelt `<div>` je over wat erin staat?" (antwoord: niets)

```html
<!-- Wat we nu hebben: -->
<div class="header">...</div>
<div id="over">...</div>
<div id="games">...</div>
<div id="contact">...</div>
```

Leg uit: elk van deze `<div>`'s heeft eigenlijk een betekenisvolle naam die HTML al standaard aanbiedt.

**3. De belangrijkste semantische elementen (20 min)**

Kort herhalen (was Blok 1, Hoofdstuk 7):
- `<header>` - de kop van de pagina
- `<nav>` - navigatielinks
- `<main>` - de hoofdinhoud (maar 1x per pagina)
- `<section>` - een logisch onderdeel
- `<footer>` - de voet

**4. Samen omzetten: RetroPixel semantisch maken (35 min)**

Van:
```html
<div style="..." class="header">
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

De hero + over + games + contact secties worden in `<main>` gezet, elk als eigen `<section>`:
```html
<main>
    <section class="hero">
        ...
    </section>

    <section id="over">
        <h2>Over RetroPixel</h2>
        ...
    </section>

    <section id="games">
        <h2>Onze populairste games</h2>
        ...
    </section>
</main>
```

De contact-div wordt `<footer>`:
```html
<footer id="contact">
    <p>RetroPixel B.V. - Spelstraat 12, Arnhem</p>
    ...
</footer>
```

Laat studenten meetypen (niet kopiëren). Loop rond en check of de CSS-selectors nog kloppen (een `.header` class of `#contact` ID verandert niet mee als je alleen het tag-type aanpast).

**5. Netjes inspringen (10 min)**
- Toon een rommelig ingesprongen stuk en laat studenten het herstellen
- Regel: elke keer dat je een element opent, spring je een niveau in

**6. Afronding (5 min)**
- Vragen?
- Volgende week: projectweek - alles wat je tot nu toe hebt geleerd toepassen

### Huiswerk
Maak `starter-website` volledig semantisch:
1. `<header>` met logo en `<nav>`
2. `<main>` met minimaal 3 `<section>`-elementen
3. `<footer>` onderaan
4. Alle code netjes ingesprongen
5. Check in DevTools (Elements-tab) of de boomstructuur logisch is

**Extra uitdaging:**
- Voeg een `<article>` toe voor elk product (in plaats van `<div class="product">`)
- Voeg HTML-comments toe die uitleggen wat elke sectie doet

### Tips voor docent
- Laat de CSS met rust waar mogelijk - het gaat vandaag om HTML-structuur, niet om nieuwe styling
- Waarschuw vooraf: als je een tag-naam verandert (`div` → `section`) maar de class laat staan, blijft de styling gewoon werken - dat stelt gerust
- Gebruik DevTools Elements-tab veel: laat de boomstructuur zien vóór en na de omzetting

### Veelgemaakte fouten
1. Tags niet goed afsluiten na het omzetten (`</div>` laten staan i.p.v. `</section>`)
2. Meerdere `<main>`-elementen op één pagina
3. `<nav>` vergeten om de navigatielinks heen
4. Class/ID kwijtraken tijdens het omzetten, waardoor styling wegvalt

---
