## Hoofdstuk 1: Herhaling - Van Inline naar Externe CSS

*Docentenhandleiding: `Docent/Hoofdstuk 1 - Docentenhandleiding.md`*

**Taakklasse 1 van 3** - RetroPixel (gameshop, `starter-website/index.html`)
**PRIMM-fasen dit hoofdstuk:** Predict → Run → Investigate → eerste Modify

### Leerdoelen
Na dit hoofdstuk kan je:
- Uitleggen wat het verschil is tussen inline CSS en een externe stylesheet
- Een externe CSS stylesheet aanmaken en linken in de `<head>`
- Benoemen welke problemen duplicatie van inline styles veroorzaakt
- Herhaalde inline styles omzetten naar één herbruikbare class

### AI-gebruik dit hoofdstuk
Bij Predict, Run en Investigate: **geen AI**. Bij de Modify-oefening aan het eind mag je een AI-suggestie bekijken, maar alleen als je kan uitleggen waaróm die klopt.

### Predict
Bekijk `starter-website/index.html` - **nog niet draaien**. Schrijf op (in tweetallen): *"Wat voor website denk je dat dit wordt? En: wat valt je op aan hoe de CSS hier staat?"*

### Run
Open de pagina in de browser. Klopt je voorspelling?

### Investigate
Open de code in VS Code en beantwoord:
- Wat valt op aan hoe de styling in deze code staat?
- Als de klant de kleur `#6c5ce7` wil veranderen, op hoeveel plekken moet dat dan? Tel het na.
- Wat zou een **externe stylesheet** hieraan oplossen?

### Modify
**Stap 1 - stylesheet aanmaken:**
```html
<link rel="stylesheet" href="css/style.css">
```
Maak `css/style.css` aan en link 'm in de `<head>`.

**Stap 2 - eerste regel verplaatsen (samen met de docent):**

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
Ververs de browser - de website blijft er hetzelfde uitzien. Dat is precies de bedoeling: de code wordt beter, niet het resultaat.

**Stap 3 - zelf verder (in tweetallen):** verplaats de inline styles van de header en de hero-sectie naar de stylesheet, met logische class-namen:
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

**Tot slot:** bekijk de drie product-kaarten verderop in de pagina. Wat valt op aan hun inline styles? Wat zou er gebeuren als je hier één class van maakt? (Dit werk je volgend hoofdstuk verder uit.)

### Huiswerk
Zet zo veel mogelijk secties van `starter-website/index.html` om naar de externe stylesheet:
1. Header en hero-sectie volledig extern
2. Geen `style=` meer op deze twee onderdelen
3. Website ziet er visueel exact hetzelfde uit
4. Controleer met DevTools of er geen `style=` attributen zijn overgebleven op de omgezette onderdelen

---
