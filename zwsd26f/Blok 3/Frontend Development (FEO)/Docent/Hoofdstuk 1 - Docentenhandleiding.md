## Hoofdstuk 1: Herhaling - Van Inline naar Externe CSS - Docentenhandleiding

*Bij: `../Hoofdstuk 1 - Herhaling Van Inline naar Externe CSS.md` (studentversie)*

**Taakklasse 1 van 3** - RetroPixel (gameshop, `starter-website/index.html`)
**PRIMM-fasen dit hoofdstuk:** Predict → Run → Investigate → eerste (begeleide) Modify

### Waarom deze opzet
Studenten krijgen een **complete, werkende website** als startpunt - geen leeg canvas. Dat voorkomt het "witte pagina"-probleem en laat de verbeterpunten (duplicatie, geen structuur) meteen zien in plaats van dat studenten daar zelf tegenaan moeten lopen. Dit hoofdstuk is het begin van Taakklasse 1: drie hoofdstukken lang wordt dezelfde RetroPixel-site steeds verder verbeterd, tot en met een eigen variant in Hoofdstuk 3.

### Leerdoelen
Na deze les kan de student:
- Uitleggen wat het verschil is tussen inline CSS en een externe stylesheet
- Een externe CSS stylesheet aanmaken en linken in de `<head>`
- Benoemen welke problemen duplicatie van inline styles veroorzaakt
- Herhaalde inline styles omzetten naar één herbruikbare class

### AI-gebruik dit hoofdstuk
**AI uit** tijdens Predict, Run en Investigate - dit hoofdstuk draait om code léren lezen, niet laten genereren. Bij de begeleide Modify aan het eind mag je een AI-suggestie bekijken, maar alleen als je kan uitleggen waaróm die klopt.

### Lesopbouw (90 minuten)

**Predict (10 min)**
Deel `starter-website/index.html` uit - **nog niet draaien**. Laat studenten in tweetallen de code lezen (niet de browser openen) en opschrijven: *"Wat voor website denk je dat dit wordt? En: wat valt je op aan hoe de CSS hier staat?"*

**Run (10 min)**
Open de pagina in de browser. Klopt de voorspelling? Laat zien: het is een complete, werkende website van "RetroPixel", een retro-gameshop.

**Investigate (25 min) - live coding, AI uit**
Open de code in VS Code en stel vragen:
- "Wat valt op aan deze code?" → sturen richting: alle styling staat tussen de HTML in (`style="..."`), en dezelfde stijl (de drie product-kaarten) staat drie keer voluit uitgeschreven.
- "Als de klant de kleur `#6c5ce7` wil veranderen, op hoeveel plekken moet dat dan?" (laat ze tellen: minstens 5 plekken) → dit is de kernpijn van inline CSS.
- Introduceer: **externe stylesheet** lost dit op - alle styling op één plek, herbruikbaar.

**Modify - begeleid, eerste stap (35 min)**

**I do → We do:**
1. Maak `css/style.css` aan en link 'm in de `<head>`:
```html
<link rel="stylesheet" href="css/style.css">
```
2. Verplaats samen de simpelste regel, de `<body>`:

Inline:
```html
<body style="margin: 0; font-family: Arial;">
```
Wordt:
```html
<body>
```
```css
body {
    margin: 0;
    font-family: Arial;
}
```
Ververs de browser - niets verandert visueel. Benoem expliciet: **de website blijft hetzelfde, de code wordt beter.** Dat is lastig te "zien" voor studenten die gewend zijn dat vooruitgang zichtbaar is.

**You do (in tweetallen):** verplaats de inline styles van header en hero-sectie naar de stylesheet, met logische class-namen:
```html
<div class="header">
    <div class="logo">RetroPixel</div>
    <div class="nav-links">
        <a href="#over">Over ons</a>
        <a href="#games">Games</a>
        <a href="#contact">Contact</a>
    </div>
</div>
```
```css
.header {
    background-color: #222222;
    padding: 20px;
}
.logo {
    color: white;
    font-size: 28px;
    font-weight: bold;
    display: inline-block;
}
```

Loop rond en help. Sluit af met het echte "aha"-moment: laat zien dat de drie product-kaarten bijna identieke inline styles hebben, en vraag: "Wat zou er gebeuren als we hier één class van maken?" (Dit werken ze volgende week verder uit.)

### Huiswerk
Zet zo veel mogelijk secties van `starter-website/index.html` om naar de externe stylesheet:
1. Header en hero-sectie volledig extern
2. Geen `style=` meer op deze twee onderdelen
3. Website ziet er visueel exact hetzelfde uit
4. Controleer met DevTools of er geen `style=` attributen zijn overgebleven op de omgezette onderdelen

### Tips voor docent
- Benadruk steeds: "de website verandert niet, de code wordt beter" - dit concept is lastig voor studenten die gewend zijn dat vooruitgang zichtbaar is
- Laat expliciet zien hoe DevTools kan controleren of er nog inline styles over zijn (Elements-tab, zoek op `style=`)
- Dit is een goede les om in tweetallen te doen: de een typt, de ander leest de originele inline style voor

### Veelgemaakte fouten
1. Classname vergeten toe te voegen in de HTML nadat de CSS-regel al is aangemaakt
2. Spatie vergeten tussen meerdere classes op één element
3. Bestandspad van de stylesheet fout (`css/style.css` vs `style.css`)
4. Selector in CSS zonder punt (`.` vergeten voor een class)

---
