## Hoofdstuk 1: Herhaling - Van Inline naar Externe CSS

### Context voor de docent
Dit is het eerste hoofdstuk van Blok 3 en bewust een **herhalingshoofdstuk**. Uit Blok 1 en 2 hebben studenten kennis van: inline CSS, een wireframe maken, naar een bestaande website kijken (inspecteren), en een kleine website bouwen. Externe CSS, classes/IDs en het box model zijn nog niet stevig eigen gemaakt.

In plaats van zelf vanaf nul te laten bouwen, krijgen studenten een **kant-en-klare, werkende website** (`starter-website/index.html`) die volledig met **inline CSS** is gemaakt. Samen gaan jullie deze verbeteren. Dit werkt pedagogisch beter dan "bouw zelf iets" omdat:
- Studenten meteen een compleet, werkend resultaat zien (geen white-page-syndroom)
- De fouten/verbeterpunten al ingebouwd zitten - je hoeft niet te wachten tot iemand vastloopt
- Iedereen hetzelfde startpunt heeft, dus voorbeelden op het scherm gelden voor iedereen

### Leerdoelen
Na deze les kan de student:
- Uitleggen wat het verschil is tussen inline CSS en een externe stylesheet
- Een externe CSS stylesheet aanmaken en linken in de `<head>`
- Herhaalde inline styles omzetten naar één herbruikbare class
- Uitleggen waarom herhaling van code (duplicatie) een probleem is

### Benodigdheden
- `starter-website/index.html` voor iedere student (uitdelen via de leeromgeving of gedeelde map)
- Beamer/scherm om live mee te coderen

### Lesopbouw (90 minuten)

**1. Activerende start (10 min)**

Open `starter-website/index.html` in de browser en laat 'm zien. "Dit is de website van RetroPixel, een fictieve retro-gameshop. Hij werkt prima. Toch gaan we hem vandaag helemaal aanpassen. Wie ziet er al waarom, als we naar de code kijken?"

Open de code in VS Code. Laat de klas de `style="..."` attributen zien.
- Vraag: "Wat valt op aan deze code?"
- Sturen richting: alle styling staat tussen de HTML in, en dezelfde stijl (bijv. de drie product-kaarten) staat drie keer voluit uitgeschreven.

**2. Terugblik: wat is inline CSS ook alweer? (10 min)**
- Inline CSS = styling direct in het `style="..."` attribuut van een element
- Kort herhalen: waarom hebben we dit in Blok 1/2 gebruikt? (snel, direct zichtbaar, makkelijk om te beginnen)
- Nadeel bespreken aan de hand van de starter-website: "Als je de kleur `#6c5ce7` wilt veranderen, op hoeveel plekken moet je dat dan doen?" (laat ze tellen: minstens 5 plekken)

**3. Externe stylesheet aanmaken (20 min)**

**Samen doen (I do → We do):**
1. Maak in de projectmap een bestand `css/style.css`
2. Link 'm in de `<head>`:
```html
<link rel="stylesheet" href="css/style.css">
```
3. Pak het makkelijkste voorbeeld eerst: de `<body>` tag.

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

Laat de browser verversen - niets verandert visueel, en dat is precies het punt: "de website ziet er hetzelfde uit, maar de code is nu beter."

**4. Zelf verder verplaatsen: header en hero (25 min)**

Studenten verplaatsen zelf (in tweetallen) de inline styles van de header (`<div style="background-color: #222222...">`) en de hero-sectie naar de stylesheet, met logische class-namen:

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

**Loop rond en help.** Veelgestelde vraag: "Moet ik echt alles overtypen?" - Ja, typen (niet kopiëren) helpt de syntax te onthouden.

**5. Het echte "aha"-moment: de product-kaarten (15 min)**

Laat zien dat de drie product-divs bijna identieke inline styles hebben. Vraag: "Wat zou er gebeuren als we hier één class van maken?"

```html
<div class="product">
    <img src="https://picsum.photos/seed/mario/250/150">
    <h3>Super Mario Bros</h3>
    <p class="jaar">Nintendo - 1985</p>
    <p class="prijs">€ 34,99</p>
    <a href="#" class="knop">In winkelwagen</a>
</div>
```

```css
.product {
    background-color: white;
    width: 250px;
    display: inline-block;
    margin: 10px;
    padding: 15px;
    border: 1px solid #dfe4ea;
}
```

Eén class, drie keer hergebruikt. Benoem expliciet: **dit is het hele punt van externe CSS met classes** - één keer stylen, overal toepassen.

**6. Afronding (10 min)**
- Vragen?
- Reflectie: "Wat is het verschil tussen hoe de website eruitziet en hoe de code eruitziet, na vandaag?" (antwoord: visueel niets, code veel beter)
- Volgend hoofdstuk: classes, IDs en het box model verder oppakken

### Huiswerk
Maak de omzetting van `starter-website/index.html` helemaal af:
1. Alle `style="..."` attributen zijn verwijderd uit de HTML
2. Alle styling staat in `css/style.css`
3. Gebruik classes voor elementen die vaker voorkomen (zoals de knoppen `.knop`)
4. De website ziet er visueel exact hetzelfde uit als de originele versie
5. Controleer met DevTools of er geen `style=` attributen zijn overgebleven

**Extra uitdaging:**
- Geef alle knoppen (`.knop`) dezelfde class en zorg dat je maar één keer de knop-styling hoeft te schrijven
- Voeg een `:hover` effect toe aan de knoppen (mag nieuw zijn, mag met hulp van de docent/Copilot)

### Tips voor docent
- Benadruk steeds: "de website verandert niet, de code wordt beter" - dit is een lastig concept voor studenten die gewend zijn dat vooruitgang zichtbaar is
- Laat expliciet zien hoe DevTools kan controleren of er nog inline styles over zijn (Elements-tab, zoek op `style=`)
- Sommige studenten willen meteen dingen "verbeteren" qua design - stuur dat door naar de extra uitdaging of volgende weken, vandaag gaat het om de omzetting
- Dit is een goede les om in tweetallen te doen: de een typt, de ander leest de originele inline style voor

### Veelgemaakte fouten
1. Classname vergeten toe te voegen in de HTML nadat de CSS-regel al is aangemaakt
2. Spatie vergeten tussen meerdere classes op één element
3. Bestandspad van de stylesheet fout (`css/style.css` vs `style.css` - check de mapstructuur)
4. Selector in CSS zonder punt (`.` vergeten voor een class)

---
