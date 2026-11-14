# Week 3: Kleuren, Typografie & Afbeeldingen

## Leerdoelen
Na deze les kan de student:
- Kleurenschema's toepassen op een website
- Font families en sizes kiezen voor duidelijke hiërarchie
- Afbeeldingen professioneel stylen met CSS
- Contrast en leesbaarheid waarborgen

## Lesopbouw (90 minuten)

### 1. Kleuren in Webdesign (20 min)

**Waarom zijn kleuren belangrijk?**
- Maken je website aantrekkelijk
- Helpen bezoekers informatie te begrijpen
- Geven je website een "gevoel"

**Kleurnotaties in CSS:**
```css
/* Hex codes (meest gebruikt) */
.box {
    background-color: #3498db;
    color: #2c3e50;
}

/* RGB */
.box {
    background-color: rgb(52, 152, 219);
}

/* Kleurnamen */
.box {
    background-color: lightblue;
}
```

**Kleurenschema:**
```css
body {
    background-color: #f9f9f9;
    color: #333;
}

h1, h2, h3 {
    color: #2c3e50;
}

a {
    color: #3498db;
}
```

**Contrast en Leesbaarheid:**
```css
/* Goed contrast */
.goed {
    background-color: white;
    color: #333;
}

/* Slecht contrast - vermijden! */
.slecht {
    background-color: #f0f0f0;
    color: #ddd;
}
```

**Oefening 1 (10 min):**
Maak een pagina met:
- Lichte achtergrondkleur
- Donkere tekstkleur
- Één accent kleur
- Test je contrast

---

### 2. Typografie (30 min)

**Font Families:**
```css
body {
    font-family: Arial, Helvetica, sans-serif;
}

h1, h2, h3 {
    font-family: Georgia, serif;
}
```

**Font Sizes & Hiërarchie:**
```css
body {
    font-size: 16px;
    line-height: 1.6;
}

h1 { font-size: 36px; }
h2 { font-size: 28px; }
h3 { font-size: 22px; }
p { font-size: 16px; }
```

**Font Weights:**
```css
.normaal {
    font-weight: normal;
}

.vet {
    font-weight: bold;
}
```

**Text Styling:**
```css
.italic {
    font-style: italic;
}

.geen-decoratie {
    text-decoration: none;
}

.uppercase {
    text-transform: uppercase;
}
```

**Text Alignment:**
```css
.links {
    text-align: left;
}

.centraal {
    text-align: center;
}

.rechts {
    text-align: right;
}
```

**Oefening 2 (15 min):**
Maak een artikel layout:
- Kies een font voor body tekst
- Ander font voor headings
- Duidelijke font-size hiërarchie
- Goede line-height

---

### 3. Afbeeldingen Stylen (25 min)

**Basis Image Styling:**
```css
img {
    max-width: 100%;
    height: auto;
}
```

**Borders en Afgeronde Hoeken:**
```css
.foto {
    border: 3px solid #ddd;
    border-radius: 10px;
}

.rond {
    border-radius: 50%;
    width: 200px;
    height: 200px;
}
```

**Shadow Effects:**
```css
.schaduw {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}
```

**Hover Effects op Images:**
```css
.foto:hover {
    transform: scale(1.05);
    transition: transform 0.3s;
}
```

**Oefening 3 (10 min):**
Maak een foto galerij:
- 4 afbeeldingen
- Borders en border-radius
- Box-shadow
- Hover effect

---

### 4. Alles Combineren (15 min)

**Complete Voorbeeld:**
```css
body {
    background-color: #f9f9f9;
    color: #333;
    font-family: Arial, sans-serif;
    font-size: 16px;
    line-height: 1.6;
}

h1 {
    color: #2c3e50;
    font-size: 36px;
    font-weight: 700;
}

.card {
    background: white;
    border: 1px solid #ddd;
    border-radius: 10px;
    padding: 20px;
}

.card img {
    width: 100%;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
```

**Oefening 4 (5 min):**
Maak een "Favoriete Dingen" pagina met:
- Kleurenschema (3 kleuren)
- Typografie (2 fonts)
- 3-4 afbeeldingen met styling

---

### Controlelijst voor Docent
- [ ] Studenten begrijpen contrast en leesbaarheid
- [ ] Studenten kunnen kleurenschema's toepassen
- [ ] Studenten kunnen font families en sizes kiezen
- [ ] Studenten kunnen afbeeldingen stylen
- [ ] Studenten begrijpen line-height

### Tips voor Docent
- Laat veel voorbeelden zien van goede kleurencombinaties
- Benadruk contrast (gebruik tools zoals WebAIM)
- Laat studenten elkaars werk bekijken
- Leer ze DevTools te gebruiken om kleuren te pikken

---
