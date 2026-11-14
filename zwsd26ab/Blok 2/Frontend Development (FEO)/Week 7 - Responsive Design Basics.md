# Week 7: Responsive Design Basics

## Algemene Informatie
- **Doelgroep:** MBO-4 studenten (SE & SD)
- **Lesduur:** 90 minuten
- **Voorkennis:** HTML semantiek, CSS selectoren, flexbox NIET nodig (we introduceren het)
- **Tools:** VS Code, Browser (test op mobiel / browser DevTools)

---

## Leerdoelen
Na deze les kan de student:
- Begrijpen waarom websites op verschillende schermgroottes goed moeten werken
- Viewport meta tag toevoegen aan HTML
- Flexbox gebruiken voor één praktisch geval (horizontale centering)
- Een media query schrijven om layout aan te passen op kleine schermen
- Website testen op mobiel (DevTools)
- Design keuzes maken voor mobiel vs. desktop

---

## Lesopbouw (90 minuten)

### 1. Waarom Responsive? (10 min)

**Live Demo:**
- Open je Week 6 website op telefoon (via WiFi delen met https://localhost:port)
- Laat zien dat het eruit ziet als... chaos 😅
- Toon dezelfde site op desktop → verschil!
- Toon professionele websites op mobiel: hoe zien die er uit?

**Uitleg:**
> Responsive design betekent: je website ziet er goed uit op **elk scherm** (mobiel, tablet, desktop).

**Waarom is dit belangrijk?**
- 50%+ van web traffic is mobiel
- Google rankt responsieve websites hoger
- Professioneel = werkt overal

**Voor SD:** Blok 3 gaat ervanuit dat je dit begrijpt
**Voor SE:** Dit is standaard nu

---

### 2. Stap 1: Viewport Meta Tag (10 min)

**Wat is de viewport tag?**
Zegt aan browser: "Schaal pagina correct op mobiel"

**Voeg dit toe in `<head>`:**
```html
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mijn Website</title>
    <link rel="stylesheet" href="style.css">
</head>
```

**Waarom deze regel?**
- `width=device-width`: Gebruik breedte van scherm
- `initial-scale=1.0`: Geen zoom-in/uit automatically

**Test:**
- Pas `width=device-width` EVEN uit
- Reload op telefoon → ziet er vreemd uit!
- Zet terug → much beter

**Onthoud:** Elke website MOET deze tag hebben!

---

### 3. Stap 2: Flexbox voor Horizontaal Centreren (20 min)

**Problem:** We willen nav items horizontaal, en goed uitgedeeld.

**Flexbox Intro (super kort):**
Flexbox = "makkelijk items naast elkaar zetten"

**Basis werkingsprincipe:**
```css
.container {
    display: flex;
}
```

Dit zet alle child elementen **naast elkaar** ipv onder elkaar.

**Praktische use case - Horizontale Navigatie:**

HTML:
```html
<nav class="main-nav">
    <ul>
        <li><a href="/">Home</a></li>
        <li><a href="/about">Over</a></li>
        <li><a href="/contact">Contact</a></li>
    </ul>
</nav>
```

CSS:
```css
.main-nav ul {
    display: flex;           /* Items naast elkaar */
    gap: 30px;               /* Ruimte tussen items */
    list-style: none;        /* Geen bullets */
}

.main-nav a {
    text-decoration: none;
    color: #333;
    padding: 10px 15px;
    display: block;
}

.main-nav a:hover {
    background-color: #f0f0f0;
    border-radius: 4px;
}
```

**Test Live:**
- `gap: 30px` → Items verder uit elkaar
- `gap: 10px` → Items dicht bij elkaar
- Studenten aanpassen en experimenten

**Oefening:**
Voeg flexbox toe aan jouw website nav:
```css
nav ul {
    display: flex;
    gap: 20px;
}
```

Klaar? Test in browser.

---

### 4. Stap 3: Media Queries (30 min)

**Wat is een media query?**
CSS regel dat zegt: "Voer deze CSS ALLEEN uit op kleine schermen"

**Syntax:**
```css
@media (max-width: 768px) {
    /* CSS hieronder alleen op schermen ≤ 768px (tablets/mobiel) */
}
```

**Uitleg van `max-width: 768px`:**
- 768px = "klein scherm" (tablet / telefoon)
- `max-width` = "TOT diese breedte"
- Dus: "Op schermen van 768px of kleiner, pas dit toe"

**Praktische voorbeeld - Responsive Navigation:**

Desktop (norm CSS):
```css
nav ul {
    display: flex;
    gap: 30px;
}
```

Mobiel (media query):
```css
@media (max-width: 768px) {
    nav ul {
        display: flex;
        flex-direction: column;  /* Items onder elkaar ipv naast */
        gap: 15px;
    }
    
    nav a {
        padding: 15px;           /* Groter clickable area op mobiel */
    }
}
```

**Live Demo:**
- Browser DevTools openen (F12)
- Klik device toggle (telefoon icoon)
- Resize window → bekijk hoe layout verandert
- Toon: op desktop horizontal nav, op mobiel vertical nav

**Oefening:**
Voeg media query toe aan jouw website:

```css
/* Desktop - default */
nav ul {
    display: flex;
    gap: 30px;
}

/* Mobiel - kleiner scherm */
@media (max-width: 768px) {
    nav ul {
        flex-direction: column;
        gap: 15px;
    }
}
```

Test:
- [ ] Open DevTools (F12)
- [ ] Klik phone icon
- [ ] Resize → layout verandert?

**Aanpassingen voor tablet/mobiel:**
Geef typische aanpassingen:
```css
@media (max-width: 768px) {
    h1 {
        font-size: 24px;  /* Kleiner op mobiel */
    }
    
    .container {
        padding: 20px 10px;  /* Minder padding */
    }
    
    .main-nav {
        margin: 10px 0;  /* Kleiner margin */
    }
}
```

---

### 5. Mobile-First Thinking (10 min)

**Wat is "mobile-first"?**
> Ontwerp EERST voor mobiel. Voeg daarna details toe voor desktop.

**Waarom?**
- Mobiel is minimaal → je concentreert je op essentials
- Desktop is groter → voeg extra's toe

**Praktijk:**
```css
/* START MOBIEL */
body {
    font-size: 16px;
    padding: 10px;
}

nav ul {
    flex-direction: column;
}

/* OP GROTER SCHERM: desktop layout */
@media (min-width: 769px) {
    body {
        font-size: 18px;
        padding: 20px;
    }
    
    nav ul {
        flex-direction: row;
    }
}
```

**Contrast:**
- Wat studenten normaal doen: "Desktop CSS, dan media query mobiel"
- Mobile-first: "Mobiel CSS, dan media query desktop"
- VOORDEEL: Minder code, sneller, beter prestaties

**Voor deze les:** We leren beide, je mag kiezen

---

### 6. Test op Echte Telefoon (15 min)

**Hoe test je op je telefoon?**

**Optie A: Via browser DevTools (simpel)**
- F12 openen
- Klik device toggle (telefoon icon)
- Selecteer "iPhone 12" of "Pixel 5"
- Resize → zie je responsive changes?

**Optie B: Op echte telefoon (beter)**
- Start simple HTTP server: 
  ```bash
  python -m http.server 8000
  ```
  (in folder met index.html/style.css)
- Vind laptop IP: `ipconfig getifaddr en0` (Mac)
- Open op telefoon: `http://[laptop-ip]:8000`
- Toon: website werkt op telefoon!

**Controlelijst:**
- [ ] Website laadt op mobiel
- [ ] Text is leesbaar (niet te klein)
- [ ] Buttons zijn clickable (niet te klein)
- [ ] Nav ziet er goed uit
- [ ] Geen horizontal scrolling

---

### 7. Reflectie & Afsluiting (5 min)

**Wat hebben we geleerd?**
- Viewport meta tag = basis voor responsive
- Flexbox = items naast elkaar plaatsen
- Media queries = CSS aanpassen per schermgrootte
- Mobile-first thinking = efficiënter

**Voor Eindproject (Week 8):**
- [ ] Viewport tag toevoegen
- [ ] Media query voor mobiel
- [ ] Nav responsive maken
- [ ] Test op telefoon

**Vragen?**
- Is flexbox nu duidelijk?
- Media queries nog onduidelijk?

---

## Oefeningen

### Oefening 1: Viewport Tag (5 min)
Open je Week 6 website. Check: is deze tag aanwezig?
```html
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```

Voeg toe als niet aanwezig.

### Oefening 2: Flexbox Navigatie (15 min)
Maak je nav responsive met flexbox:

```html
<nav>
    <ul>
        <li><a href="/">Home</a></li>
        <li><a href="/about">Over</a></li>
        <li><a href="/contact">Contact</a></li>
    </ul>
</nav>
```

CSS:
```css
nav ul {
    display: flex;
    gap: 25px;
    list-style: none;
}

nav a {
    text-decoration: none;
    color: #333;
    padding: 8px 12px;
}

nav a:hover {
    background-color: #f0f0f0;
    border-radius: 4px;
}

/* Mobiel: vertical nav */
@media (max-width: 768px) {
    nav ul {
        flex-direction: column;
        gap: 10px;
    }
    
    nav a {
        padding: 12px;
        display: block;
    }
}
```

Test: DevTools → Phone → Resize

### Oefening 3: Media Query Header (15 min)
Pas je header aan voor mobiel:

```css
/* Desktop */
header {
    padding: 40px 20px;
    background-color: #2c3e50;
}

header h1 {
    font-size: 48px;
    color: white;
}

/* Mobiel */
@media (max-width: 768px) {
    header {
        padding: 20px 10px;
    }
    
    header h1 {
        font-size: 28px;
    }
}
```

Test op DevTools → Phone

### Oefening 4: Echte Telefoon Test (20 min)
1. Start local server: `python -m http.server 8000`
2. Vind je IP: `ifconfig` (Mac/Linux)
3. Open op telefoon: `http://192.168.x.x:8000`
4. Test:
   - [ ] Website laadt
   - [ ] Text leesbaar
   - [ ] Buttons clickable
   - [ ] Geen horizontal scroll
   - [ ] Nav werkt op mobiel

---

## Uitdagingen (Voor wie klaar is)

### Challenge 1: Tablet Layout
Voeg media query voor tablets toe:
```css
@media (max-width: 1024px) and (min-width: 769px) {
    /* Speciaal voor tablets */
}
```

### Challenge 2: Footer Responsive
Maak je footer responsive:
- Desktop: items naast elkaar
- Mobiel: items onder elkaar

```html
<footer>
    <div class="footer-links">
        <a href="#">Link 1</a>
        <a href="#">Link 2</a>
        <a href="#">Link 3</a>
    </div>
</footer>
```

### Challenge 3: Multiple Breakpoints
Voeg meerdere breakpoints toe:
- `max-width: 480px` (kleine telefoon)
- `max-width: 768px` (grote telefoon / tablet)
- `max-width: 1024px` (klein desktop)

---

## Tips voor Docent

- **Voorbereiding:** Test zelf op echte telefoon voordat je les geeft
- **Live demo:** Laat browser DevTools device toggle zien
- **Flexbox:** Dit is EERSTE keer flexbox - houd het simpel!
  - "Items naast elkaar" vs "items onder elkaar"
  - Niet ingaan op align-items, justify-content, etc. (Blok 3)
- **Media queries:** Toon visual feedback (layout verandert live!)
  - Resize browser window langsaam → studenten zien de "breakpoint"
- **Testing:** Echte telefoon test = WOW moment
  - Studenten voelen zich expert ("ik heb responsive design")
- **Timing:** 
  - Flexbox → media queries → testing
  - Dit tempo werkt goed
- **Veelgemaakte fout:** `max-width: 768px` ipv `min-width: 768px`
  - Leg uit: `max-width` = "tot deze breedte", dus mobiel eerste
- **Voor SD:** "Flexbox is basis - in Blok 3 doen we veel meer"
- **Voor SE:** "Je hebt nu professionele responsive websites"

---

## Verbinding met vorige lessen

- **Week 1-3:** Basic CSS (selectoren, kleuren, fonts)
- **Week 5:** Semantic HTML (`<nav>`, `<header>`, etc.) - nu gebruiken we dat!
- **Week 6:** Website deployen - nu testen we op echte telefoon
- **Week 8 (Eindproject):** Alles met responsive design

---

## Verbinding met volgende (Blok 3)

- **PHP / Formulieren:** Dezelfde HTML/CSS responsive
- **Flexbox / Grid:** Nu je basis kent, gaan we deeper
- **Mobile-first framework:** Bootstrap, Tailwind (later)

---

## Checklist Lesvoorbereiding

- [ ] Je eigen website responsive testen (desktop + mobiel)
- [ ] DevTools device toggle testen
- [ ] Local server command klaar (`python -m http.server`)
- [ ] Jupyter notebook / slides met breakpoint visueel
- [ ] Live coding: viewport tag → flexbox → media query
- [ ] Telefoon (eigen) gereed voor demo
