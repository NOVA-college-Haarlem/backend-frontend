# Frontend Ontwikkeling - Blok 2

## Week 1: Herhaling & CSS Selectoren Uitbreiden

### Algemene Informatie
- **Doelgroep:** MBO-4-studenten die Blok 1 hebben afgerond
- **Lesduur:** 90 minuten
- **Voorkennis:** HTML basis, CSS basis, box model, classes & IDs
- **Tools:** VSCodium, Browser DevTools

---

### Leerdoelen
Na deze les kan de student:
- De belangrijkste concepten van Blok 1 toepassen (box model, classes, IDs)
- Descendant selectors gebruiken (`div p`, `.card h2`)
- Child selectors toepassen (`div > p`)
- Adjacent sibling selectors gebruiken (`h2 + p`)
- Multiple selectors combineren (`h1, h2, h3`)
- Pseudo-classes `:hover` en `:focus` toepassen voor interactiviteit

---

### Lesopbouw (90 minuten)

**1. Introductie: Selectors in het Wild (10 min)**

**Live Demo:**
- Open https://github.com
- Inspect Element (F12 → rechtsklik → Inspect)
- Toon de DOM
- Vraag: "Zie je classes, IDs, en nesten?"

**Observaties:**
```html
<!-- GitHub pagina -->
<header class="Header">
    <nav class="Header-nav">
        <a class="Header-link" href="/">Home</a>
        <a class="Header-link Header-link--active">About</a>
    </nav>
</header>
```

- Elk element heeft classes
- Sommige elementen NESTEN (nav in header)
- Active link heeft extra class

**Vraag:** "Hoe selecteren zij deze elementen met CSS?"

---

**2. Descendant Selectors - Hoe zouden zij dit doen? (15 min)**

**Observatie van pagina:**
- Navigatie linken hebben een bepaalde stijl
- Maar alleen linken die IN de nav staan

**Hypothese:** "Wat zou de CSS selector zijn?"

*Laat studenten gokken*

**De waarheid - Descendant Selector:**
```css
/* ALLEEN links die in nav staan */
nav a {
    color: #333;
    text-decoration: none;
}

/* ALLE andere links zijn anders */
a {
    color: blue;
}
```

**Praktisch voorbeeld:**
```html
<nav class="navigation">
    <a href="/">Home</a>
    <a href="/about">About</a>
</nav>

<footer>
    <a href="/privacy">Privacy</a>
</footer>
```

```css
/* Alleen nav links worden wit */
nav a {
    color: white;
    padding: 10px;
}

/* Footer link is blauw */
footer a {
    color: #3498db;
}
```

**Oefening 1:** Maak een artikel met nested paragraphen. Style alleen de paragrafen IN het artikel.

---

**3. Child Selectors - "Alleen directe kinderen" (15 min)**

**Observatie:**
- Sommige selectors selecteren álle kinderen
- Sommige selecteren ALLEEN directe kinderen

**Voorbeeld uit echte website:**
```html
<div class="card">
    <h2>Titel</h2>           <!-- Directe kind! -->
    <div class="description">
        <p>Beschrijving</p>  <!-- NIET directe kind! -->
    </div>
</div>
```

**Descendant vs. Child:**
```css
/* Dit selecteert ALLES wat een <p> is, diep genest */
.card p {
    color: red;
}

/* Dit selecteert ALLEEN <p> direct in .card */
.card > p {
    color: blue;
}
```

**Praktijk:**
```css
/* Alleen h2 direct in .card */
.card > h2 {
    font-size: 24px;
}

/* Alle p tags, zelfs diep genest */
.card p {
    line-height: 1.6;
}
```

**Oefening 2:** Maak een website met nested divs. Gebruik `>` om alleen directe children te selecteren.

---

**4. Sibling Selectors - "Die Naast Elkaar" (15 min)**

**Real-world:**
```html
<div class="post">
    <h2>Titel</h2>
    <p>Eerste paragraaf</p>  <!-- Direct na h2! -->
    <p>Tweede paragraaf</p>  <!-- Niet direct na h2 -->
</div>
```

**Adjacent Sibling (`+`):**
```css
/* ALLEEN de paragraaf DIRECT na h2 */
h2 + p {
    font-weight: bold;
    margin-top: 10px;
}
```

**Praktijk:**
```html
<h3>Antwoord</h3>
<p>Dit is het antwoord</p>  <!-- Bold! -->
<p>Meer details.</p>        <!-- Normaal */
```

```css
h3 + p {
    font-weight: bold;
}
```

**Oefening 3:** Maak een FAQ met h3 (vraag) en p (antwoord). Maak de paragraaf direct na h3 bold.

---

**5. Multiple Selectors - "Alle Tegelijk" (10 min)**

**Observatie van website:**
- h1, h2, h3 hebben dezelfde font-family
- Maar niet dezelfde kleur

**Efficient stylen:**
```css
/* Zet alle headings hetzelfde font */
h1, h2, h3 {
    font-family: 'Arial', sans-serif;
    color: #2c3e50;
}

/* Maar andere sizes */
h1 {
    font-size: 32px;
}
h2 {
    font-size: 24px;
}
h3 {
    font-size: 18px;
}
```

**Oefening 4:** Maak headings met dezelfde font, maar verschillende sizes.

---

**6. Pseudo-classes: :hover & :focus (15 min)**

**Observatie van echte website:**
- Links veranderen kleur bij hover
- Buttons worden darker bij hover
- Inputs krijgen glow bij focus

**HTML:**
```html
<a href="/">Klik mij</a>
<button>Druk mij</button>
<input type="text" placeholder="Typ hier">
```

**CSS - Hoe zouden zij het doen?**
```css
a {
    color: #3498db;
}
a:hover {
    color: #2980b9;  /* Donkerder */
    text-decoration: underline;
}

button:hover {
    background-color: #34495e;  /* Darker on hover */
}

input:focus {
    outline: 2px solid #3498db;
    background-color: #f0f8ff;
}
```

**Oefening 5:** Voeg hover effects toe aan links, buttons, en focus states aan inputs.

---

**7. Afsluiting & Praktijk (10 min)**

**Challenge:** Open eigen website. Use DevTools (F12) om:
1. Descendant selectors te vinden
2. Child selectors te vinden
3. Pseudo-classes (hover/focus) te testen

**3. Child Selector (>)**

**Wat is het verschil met Descendant?**
- Descendant: selecteert ALLE kinderen (ook dieper genest)
- Child: selecteert alleen DIRECTE kinderen

**Syntax:** `ouder > kind`

**Voorbeeld:**
```html
<div class="container">
    <p>Direct kind van container</p>
    <div class="inner">
        <p>Kleinkind van container (binnen inner)</p>
    </div>
</div>
```

```css
/* Descendant: beide <p> worden rood */
.container p {
    color: red;
}

/* Child: alleen directe kinderen worden blauw */
.container > p {
    color: blue;
}
```

**Resultaat:**
- Eerste `<p>`: blauw (direct kind)
- Tweede `<p>`: rood (kleinkind, geen direct kind)

**Wanneer gebruiken?**
Als je ALLEEN de directe kinderen wilt stylen, niet alles dieper.

**Praktisch voorbeeld:**
```html
<nav class="menu">
    <ul>
        <li>Home</li>
        <li>Over
            <ul>
                <li>Team</li>
                <li>Geschiedenis</li>
            </ul>
        </li>
    </ul>
</nav>
```

```css
/* Alleen de eerste niveau <li> groot maken */
.menu > ul > li {
    font-size: 18px;
    font-weight: bold;
}

/* Sub-menu items blijven normaal */
.menu ul li li {
    font-size: 14px;
    font-weight: normal;
}
```

**Oefening 1 - Descendant selector vs Child selector:**

1. Maak een nieuwe HTML-pagina `mijnblog.html`
2. Typ `!` en dan Enter
3. Plak de volgende code in de `<body>`

```html
<div class="blog">
    <h1>Mijn Blog</h1>
    <article class="post">
        <h2>Post Titel</h2>
        <p>Dit is de intro tekst.</p>
        <p>Dit is de body tekst.</p>
        <section class="content">
            <p>Dit is een geneste paragraaf in een section</p>
        </section>
    </article>
    <aside class="sidebar">
        <h3>Over Mij</h3>
        <p>Tekst in de sidebar.</p>
        <div class="widget">
            <p>Dit is een paragraaf in een widget div</p>
        </div>
    </aside>
</div>
```

**Opdrachten (gebruik Descendant Selector):**

1. Maak alle `<p>` ERGENS binnen `.post` grijs (ook die in `.content`)
2. Maak alle `<p>` ERGENS binnen `.sidebar` klein (font-size: 14px) (ook die in `.widget`)

**Opdrachten (gebruik Child Selector):**

3. Maak de `<h2>` die DIRECT kind is van `.post` blauw
4. Maak alle headings (h1, h2, h3) die DIRECT kinderen zijn van `.blog` een lettertype Arial
5. Maak alle `<p>` die DIRECT kinderen zijn van `.post` **onderlijnd** (niet die in `.content`)

**Verwacht resultaat:**

- Opdracht 1 & 2: Alle paragrafen, ook geneste, krijgen de styling
- Opdracht 3, 4, 5: Alleen DIRECTE kinderen worden gestyld (geneste elementen niet)

---

**Oefening 2 (10 min) - Adjacent Sibling (+) en Multiple Selectors (,):**

```html
<div class="artikel">
    <h2>Interessante Titel</h2>
    <p>Dit is de intro paragraaf direct na de titel.</p>
    <p>Dit is een normale paragraaf.</p>
    <p>Nog een paragraaf.</p>
    
    <h2>Tweede Titel</h2>
    <p>Dit is weer de intro paragraaf na een titel.</p>
    <p>Nog een normale paragraaf.</p>
    
    <h3>Kleine Titel</h3>
    <span>Dit is een span, niet een p</span>
    <p>Deze p komt niet direct na h3</p>
</div>
```

**Opdrachten:**

1. **Adjacent Sibling:** Maak ALLEEN de EERSTE `<p>` na elke `<h2>` vetgedrukt (font-weight: bold) en groen (color: green)
2. **Multiple Selectors:** Maak alle `<h2>` EN `<h3>` grijs (color: gray) met lettertype Arial
3. **Combinatie:** Maak de EERSTE `<p>` na `<h2>` EN `<h3>` een groter lettertype (font-size: 18px)

**Tip:** Voor opdracht 3 kun je twee adjacent sibling selectors combineren met komma!

**Verwacht resultaat:**
- Opdracht 1: Alleen de intro paragrafen na h2 zijn groen en vet
- Opdracht 2: h2 en h3 zijn grijs met Arial
- Opdracht 3: Intro paragrafen (na h2 EN h3) zijn groter (note: na h3 geen p direct, dus dit werkt alleen voor h2)

---

**4. Adjacent Sibling Selector (+)**

**Wat doet het?**
Selecteert een element dat DIRECT NA een ander element komt.

**Syntax:** `element1 + element2`

**Voorbeeld:**
```html
<h2>Hoofdtitel</h2>
<p>Deze paragraaf komt direct na h2</p>
<p>Deze paragraaf niet</p>

<h2>Nog een titel</h2>
<p>Deze komt ook direct na h2</p>
```

```css
/* Alleen de EERSTE <p> na elke <h2> wordt rood */
h2 + p {
    color: red;
    font-size: 18px;
}
```

**Resultaat:**
- Eerste en derde `<p>` worden rood (komen direct na `<h2>`)
- Tweede `<p>` blijft normaal

**Praktisch gebruik:**
Vaak voor styling van intro paragraaf na een heading.

```css
h1 + p {
    font-size: 20px;
    color: gray;
    font-style: italic;
}
```

---

**5. Multiple Selectors (,)**

**Wat is het?**
Meerdere elementen dezelfde styling geven.

**Syntax:** `selector1, selector2, selector3`

**Voorbeeld:**
```css
/* FOUT: herhalen */
h1 {
    color: darkblue;
    font-family: Arial, sans-serif;
}
h2 {
    color: darkblue;
    font-family: Arial, sans-serif;
}
h3 {
    color: darkblue;
    font-family: Arial, sans-serif;
}

/* GOED: combineren */
h1, h2, h3 {
    color: darkblue;
    font-family: Arial, sans-serif;
}
```

**Je kunt ook classes en elements combineren:**
```css
.belangrijke-tekst, .highlight, strong, .nadruk {
    font-weight: bold;
    color: red;
}
```

**Let op de komma!**
```css
/* GOED: komma = aparte selectors */
h1, p {
    margin-bottom: 20px;
}

/* FOUT: geen komma = descendant selector */
h1 p {
    /* Dit selecteert <p> BINNEN <h1> - bestaat meestal niet! */
}
```



---

**6. Pseudo-classes: :hover en :focus**

**Wat zijn pseudo-classes?**
Speciale selectors voor specifieke states van elementen.

**:hover - Als je er met muis overheen gaat**

```css
a {
    color: blue;
    text-decoration: none;
}

a:hover {
    color: red;
    text-decoration: underline;
}
```

**Praktisch voorbeeld: Button met hover**
```html
<button class="mijn-button">Klik Hier</button>
```

```css
.mijn-button {
    background-color: blue;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.mijn-button:hover {
    background-color: darkblue;
}
```

**:focus - Als element focus heeft (bijv. input field)**

```css
input {
    border: 2px solid gray;
    padding: 10px;
}

input:focus {
    border-color: blue;
    outline: none;
    box-shadow: 0 0 5px lightblue;
}
```

**Combineren van selectors met pseudo-classes:**
```css
/* Alle links binnen .menu */
.menu a:hover {
    background-color: lightgray;
}

/* Alle inputs binnen een form */
form input:focus {
    border-color: green;
}
```

**Oefening 2:**
Maak deze HTML na en style het:
```html
<div class="card">
    <h2>Product Naam</h2>
    <p>Omschrijving van het product.</p>
    <a href="#" class="meer-info">Meer Info</a>
</div>
```

**Opdrachten:**
1. Geef `.card` een border, padding en border-radius
2. Maak de `<h2>` binnen `.card` blauw
3. Maak de link (`.meer-info`) blauw zonder underline
4. Bij hover: link wordt rood en krijgt underline
5. Bij hover op de hele card: geef de card een shadow (`box-shadow: 0 4px 8px rgba(0,0,0,0.2)`)

---

**7. Grote Oefening: Combineer Alles**

**Opdracht:**
Gegeven deze HTML, schrijf de CSS:

```html
<div class="website">
    <header>
        <h1>Mijn Website</h1>
        <nav>
            <a href="#home">Home</a>
            <a href="#over">Over</a>
            <a href="#contact">Contact</a>
        </nav>
    </header>

    <main>
        <article class="nieuws">
            <h2>Nieuws Artikel</h2>
            <p>Dit is de intro van het artikel.</p>
            <p>Dit is de rest van het artikel.</p>
            <a href="#">Lees Meer</a>
        </article>

        <aside>
            <h3>Advertentie</h3>
            <p>Koop nu!</p>
        </aside>
    </main>

    <footer>
        <p>Copyright 2024</p>
    </footer>
</div>
```

**Style de volgende dingen:**
1. Alle `<h1>`, `<h2>`, `<h3>` moeten `font-family: Arial, sans-serif` hebben
2. Alle `<p>` binnen `<main>` moeten `line-height: 1.6` hebben
3. De eerste `<p>` na elke `<h2>` moet groter zijn (font-size: 18px)
4. Alle links binnen `<nav>` moeten:
   - Geen underline hebben
   - Wit zijn (kleur)
   - Padding hebben (10px)
   - Bij hover: achtergrondkleur krijgen (bijv. donkerblauw)
5. Links binnen `.nieuws` moeten blauw zijn en bij hover onderstreept

---

### Extra uitdaging

**Opdracht 1: Selector Oefeningen (15 variaties)**

Maak een HTML pagina en style de volgende situaties:

1. Alle `<p>` binnen een `<article>` tag grijs maken
2. Alleen directe kinderen `<li>` van een `<ul>` groot maken
3. De eerste `<p>` na elke `<h2>` cursief maken
4. Alle `<h1>`, `<h2>`, `<h3>`, `<h4>` dezelfde font-family geven
5. Alle links binnen een `.sidebar` class kleiner maken
6. Alle inputs een border geven, en bij focus een andere kleur
7. Alle buttons een hover effect geven (kleur veranderen)
8. Alleen de directe `<p>` kinderen van `.content` padding geven
9. De eerste link in een `<nav>` een andere kleur geven
10. Alle images binnen een `.gallery` een border-radius geven
11. Bij hover op een `.card`: shadow toevoegen
12. Alle `<span>` binnen een `<p>` binnen een `.highlight` class bold maken
13. Links in de footer grijs maken, bij hover zwart
14. Alle `<li>` items binnen `.menu > ul` horizontaal maken (later leren we betere manieren!)
15. Een form met inputs die bij focus een glow effect krijgen (box-shadow)

**Opdracht 2: Maak een Mini Blog Post**

Maak een HTML pagina met:
- Een header met je naam
- Een blog post (article) met:
  - Titel (h2)
  - Intro paragraaf
  - 2-3 normale paragrafen
  - Een "Lees Meer" link
- Een sidebar met:
  - "Over Mij" sectie
  - Een paar links

**Style het met:**
- Descendant selectors voor tekst binnen article
- Child selectors waar nodig
- Adjacent sibling voor intro styling
- Multiple selectors voor alle headings
- Hover effects op alle links
- Een hover effect op de hele article (shadow)

**Bonus:**
Experimenteer met `:active` (als je klikt) en `:visited` (al bezochte links)!

---

### Controlelijst voor Docent
- [ ] Studenten begrijpen descendant selectors (spatie)
- [ ] Studenten begrijpen child selectors (>)
- [ ] Studenten begrijpen adjacent sibling (+)
- [ ] Studenten kunnen multiple selectors gebruiken (,)
- [ ] Studenten kunnen :hover toepassen
- [ ] Studenten kunnen :focus toepassen op inputs
- [ ] Studenten kunnen selectors combineren

### Tips voor Docent
- **DevTools gebruiken!** Laat zien hoe je de selector in DevTools ziet
- **Veel voorbeelden:** toon steeds de HTML en CSS naast elkaar
- **Veelgemaakte fout:** spatie vergeten bij descendant selector
- **Veelgemaakte fout:** komma vergeten bij multiple selectors
- **Laat studenten experimenteren** in DevTools met live editing
- **Visual feedback:** hover effecten zijn motiverend omdat je direct ziet wat er gebeurt!

### Resources
- [MDN: CSS Selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Selectors)
- [CSS Diner](https://flukeout.github.io/) - Game om selectors te leren!

---
