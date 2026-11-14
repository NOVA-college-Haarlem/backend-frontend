# Week 3: Kleuren, Typografie & Afbeeldingen

## Leerdoelen
Na deze les kan de student:
- Kleurenschema's toepassen op een website
- Font families en sizes kiezen voor duidelijke hiërarchie
- Afbeeldingen professioneel stylen met CSS
- Contrast en leesbaarheid waarborgen

## Lesopbouw (90 minuten)

### 1. Kleuren in Webdesign - Real-World Examples (15 min)

**Live Demo:**
- Open Spotify (groen + zwart) vs. Netflix (zwart + rood) vs. Twitter/X (blauw)
- Vraag: "Voelen deze sites anders?"
- Vraag: "Welke kleuren zien jullie teruggaan?"

**Observaties:**
- Spotify = energiek, jong → groen accent
- Netflix = dramatisch → rood accent
- Each brand heeft 2-3 kleuren die overal terugkomen

**Hypothese:** "Hoe zou de CSS kleurkeuze eruit zien?"

*Laat studenten gokken*

**De waarheid - Brand Colors in CSS:**
```css
:root {
    --primary: #1DB954;    /* Spotify groen */
    --background: #191414;  /* Donkergrijs */
    --text: #FFFFFF;        /* Wit */
}

body {
    background-color: var(--background);
    color: var(--text);
}

button {
    background-color: var(--primary);
}
```

**Waarom dit echt is:**
- Professionele websites kiezen kleurenpaletten
- Ze gebruiken dezelfde kleuren overal
- Dit heet een "brand identity"

**Kleurnotaties in CSS:**
```css
/* Hex (meest gebruikt) */
.box { background-color: #1DB954; }

/* RGB */
.box { background-color: rgb(29, 185, 84); }

/* Kleurnamen */
.box { background-color: green; }

/* CSS Variables (modern) */
.box { background-color: var(--primary); }
```

**Oefening 1 (10 min):**
Kies 3 kleuren voor jouw website:
- Primary (accent, buttons)
- Secondary (backgrounds)
- Text (content)

Test contrast: https://webaim.org/resources/contrastchecker/

---

### 2. Typografie - De Kracht van Fonts (25 min)

**Observatie van echte websites:**
- Reddit uses Arial (clean, modern)
- Medium uses custom serif (elegant, readable)
- GitHub uses system fonts (fast, professional)

**Vraag:** "Waarom kiezen zij verschillende fonts?"

**De waarheid:**

| Font Type | Feeling | Gebruik |
|-----------|---------|---------|
| **Serif** (Georgia, Times) | Klassiek, elegant | Artikel, books, luxury |
| **Sans-serif** (Arial, Helvetica) | Modern, clean | Tech, corporate, web |
| **Monospace** (Courier, Courier New) | Technical | Code, documentation |

**Real HTML/CSS:**
```html
<article>
    <h1>Blog Titel</h1>
    <p>Dit is de artikel tekst...</p>
</article>

<code>const x = 5;</code>
```

```css
/* Serif voor artikel - eleganter */
article {
    font-family: 'Georgia', serif;
    font-size: 18px;
}

/* Sans-serif voor headings - modern */
h1 {
    font-family: 'Arial', sans-serif;
    font-size: 32px;
}

/* Monospace voor code - technical */
code {
    font-family: 'Courier New', monospace;
}
```

**Font-size Hiërarchie (waarom groot/klein verschilt):**
```css
h1 { font-size: 32px; }   /* Grootste - MAIN MESSAGE */
h2 { font-size: 24px; }   /* Medium - subsection */
h3 { font-size: 18px; }   /* Klein - sub-subsection */
p  { font-size: 16px; }   /* Body text */
```

**Line-height (leesbaarheid):**
```css
/* Slecht - tekst zit op elkaar */
p { line-height: 1.0; }

/* Goed - ruimte om te ademen */
p { line-height: 1.6; }
```

**Contrast Checken:**
- Donkere tekst op licht → goed
- Lichte tekst op donker → goed
- Grijs op grijs → slecht (vermijden!)

**Oefening 2 (15 min):**
Maak een artikel met:
- H1, H2, H3 met verschillende sizes
- Body text met line-height 1.6
- Test leesbaarheid

---

### 3. Afbeeldingen Stylen (20 min)

**Observatie van websites:**
- Afbeeldingen hebben borders (clean)
- Afbeeldingen hebben shadows (depth)
- Afbeeldingen zijn afgerond (modern)
- Afbeeldingen worden groter bij hover (interaction)

**Real Example:**
```html
<img src="cat.jpg" alt="Cute cat" class="card-image">
```

**Hoe zouden zij het stylen?**

```css
.card-image {
    /* Maximale breedte */
    max-width: 100%;
    
    /* Afgeronde hoeken */
    border-radius: 8px;
    
    /* Shadow voor depth */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    
    /* Transition voor smooth hover */
    transition: transform 0.3s;
}

.card-image:hover {
    /* Zoom effect */
    transform: scale(1.05);
    
    /* Shadow groter */
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}
```

**Waarom dit werkt:**
- `border-radius` → modern look
- `box-shadow` → professioneel
- `transform: scale(1.05)` → interactie (voelt responsief)
- `transition` → smooth, niet abrupt

**Oefening 3 (10 min):**
Voeg afbeeldingen toe aan je website met:
- Border-radius (afgeronde hoeken)
- Box-shadow
- Hover effect (scale)

---

### 4. Afsluiting & Reflectie (5 min)

**Wat hebben we geleerd?**
- Kleurenpaletten zijn intentioneel
- Typografie veel meer dan "groot/klein" - het is hierachie
- Afbeeldingen kunnen interactief en professioneel

**Voor volgende les:**
- Je website krijgt "brand identity"
- Kleuren + Fonts + Afbeeldingen = geheel

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
