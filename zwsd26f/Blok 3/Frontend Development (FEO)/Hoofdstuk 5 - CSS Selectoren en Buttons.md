## Week 5: CSS Selectoren Uitbreiden en Buttons Maken

### Leerdoelen
Na deze les kan de student:
- Descendant selectors gebruiken (`nav a`, `.product h3`)
- Pseudo-classes `:hover` en `:focus` toepassen
- Verschillende button-stijlen maken (primary, secondary, outline)
- `cursor: pointer` en `transition` toepassen voor betere UX

### Lesopbouw (90 minuten)

**1. Terugblik projectweek (10 min)**
- Korte showcase: 2-3 studenten laten hun herbouwde website zien

**2. Selectoren uitbreiden (25 min)**

Tot nu toe: element-, class- en ID-selectors. Vandaag erbij:

**Descendant selector** - "alle `<a>`'s binnen `<nav>`":
```css
nav a {
    color: white;
    text-decoration: none;
}
```

**Selector binnen een class** - "alle `<h3>`'s binnen `.product`":
```css
.product h3 {
    color: #2d3436;
    margin-bottom: 5px;
}
```

**Waarom is dit handig?** Je hoeft niet elk element een eigen class te geven - je kunt de bestaande structuur gebruiken.

**Samen doen:** pas dit toe in de eigen website of de RetroPixel-versie - vervang losse classes zoals `.jaar` en `.prijs` (deels) door descendant selectors waar dat logischer is.

**3. Pseudo-classes: hover en focus (15 min)**
```css
.knop:hover {
    background-color: #5849c4;
}

.knop:focus {
    outline: 2px solid #ffeaa7;
}
```
Leg uit: `:hover` = tijdens muis erover, `:focus` = wanneer je met Tab erop navigeert (belangrijk voor toegankelijkheid).

**4. Buttons maken: verschillende varianten (30 min)**

**Primary button:**
```css
.btn-primary {
    background-color: #6c5ce7;
    color: white;
    padding: 12px 25px;
    border: none;
    border-radius: 5px;
    text-decoration: none;
    display: inline-block;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.btn-primary:hover {
    background-color: #5849c4;
}
```

**Outline button:**
```css
.btn-outline {
    background-color: transparent;
    color: #6c5ce7;
    padding: 12px 25px;
    border: 2px solid #6c5ce7;
    border-radius: 5px;
    text-decoration: none;
    display: inline-block;
    cursor: pointer;
    transition: all 0.3s ease;
}

.btn-outline:hover {
    background-color: #6c5ce7;
    color: white;
}
```

**Oefening:** maak minimaal 2 button-varianten voor je eigen website (bijv. `.btn-primary` en `.btn-outline`).

**5. Afronding (10 min)**
- Vragen?
- Volgende week: kleuren, typografie en navigatie

### Huiswerk
1. Voeg descendant selectors toe waar dat de CSS overzichtelijker maakt
2. Maak minimaal 2 button-varianten met `:hover` state en `transition`
3. Voeg `cursor: pointer` toe aan alle klikbare elementen
4. Test met Tab-toets of `:focus` zichtbaar is op je links/knoppen

**Extra uitdaging:**
- Maak een `.btn-danger` variant (rood, voor bijv. "verwijderen")
- Maak drie button-groottes: `.btn-sm`, `.btn`, `.btn-lg`

### Tips voor docent
- Laat zien dat `:hover` niet werkt zonder `transition` net zo soepel aanvoelt - het verschil is voelbaar
- Benoem `:focus` expliciet als toegankelijkheidsonderwerp, niet alleen "extra styling"
- Sommige studenten zullen te veel button-varianten willen maken - stuur op kwaliteit boven kwantiteit

### Veelgemaakte fouten
1. `:hover` op de verkeerde selector (bijv. op `.product` in plaats van `.knop`)
2. `cursor: pointer` vergeten, waardoor knoppen niet als klikbaar aanvoelen
3. Geen `transition`, waardoor hover-effecten abrupt aanvoelen
4. `text-decoration: none` vergeten bij links die als knop moeten ogen

---
