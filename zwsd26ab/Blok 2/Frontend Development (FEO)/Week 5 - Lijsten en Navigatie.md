# Frontend Ontwikkeling - Blok 2

## Week 5: Navigatie & HTML Structuur

### Algemene Informatie
- **Doelgroep:** MBO-4 studenten (SE & SD)
- **Lesduur:** 90 minuten
- **Voorkennis:** HTML lists, CSS selectoren, hover effecten
- **Tools:** VS Code, Browser

---

### Leerdoelen
Na deze les kan de student:
- HTML lists stylen (`<ul>`, `<ol>`, `<li>`)
- Horizontale navigatie maken
- Verticale navigatie stylen
- Active/current state toevoegen aan links
- Semantische HTML elementen begrijpen (`<nav>`, `<header>`, `<main>`, `<footer>`)
- Weten waarom semantische HTML belangrijk is

---

### Lesopbouw (90 minuten)

**1. Introductie: Navigatie overal (5 min)**

**Live Demo:**
- Open Amazon, Twitter/X, GitHub
- Vraag: "Waar zien jullie navigatie?"
- Toon: top-nav, sidebar nav, footer links

**Observaties:**
- Sommige nav is horizontaal (top)
- Sommige is verticaal (sidebar)
- Alle hebben "active" state (je weet waar je bent)

---

**2. HTML Lists Recap (5 min)**

Navigatie is altijd een `<ul>` / `<li>` + links:

```html
<nav>
    <ul>
        <li><a href="/">Home</a></li>
        <li><a href="/about">About</a></li>
        <li><a href="/contact">Contact</a></li>
    </ul>
</nav>
```

---

**3. Horizontale Navigatie - Hoe zouden zij dit doen? (25 min)**

**Observatie van website:**
- GitHub top nav: items naast elkaar
- Items hebben hover effect
- Active state is duidelijk (andere kleur)

**HTML:**
```html
<nav class="main-nav">
    <ul>
        <li><a href="/" class="active">Home</a></li>
        <li><a href="/about">Over</a></li>
        <li><a href="/services">Services</a></li>
    </ul>
</nav>
```

**Hypothese:** "Hoe krijgen zij items naast elkaar?"

*Laat studenten gokken (talsen hints: display, float, flexbox?)*

**De waarheid - display: inline-block:**
```css
.main-nav ul {
    list-style: none;
    padding: 0;
}

.main-nav li {
    display: inline-block;  /* ITEMS NAAST ELKAAR */
}

.main-nav a {
    display: block;
    padding: 15px 20px;
    color: white;
    text-decoration: none;
    background-color: #333;
}

.main-nav a:hover {
    background-color: #555;
}

/* Active state */
.main-nav a.active {
    background-color: #007bff;  /* Blauw = je bent hier! */
}
```

**Test live:**
- Hover over links → kleur verandert
- Active link is anders gekleurd
- Spacing is consistent

**Oefening 1 (15 min):**
Maak jouw eigen horizontale nav met:
- Minimaal 4 links
- Hover effect
- Active state op 1 link

---

**4. Verticale Navigatie - Sidebar (20 min)**

**Observatie van website:**
- Reddit sidebar: items onder elkaar
- Veel padding rond items
- Hover effect op hele item (niet alleen tekst)

**HTML:**
```html
<nav class="sidebar-nav">
    <ul>
        <li><a href="/">Home</a></li>
        <li><a href="/posts">Posts</a></li>
        <li><a href="/profile">Profile</a></li>
    </ul>
</nav>
```

**CSS - Verticaal:**
```css
.sidebar-nav ul {
    list-style: none;
    padding: 0;
}

.sidebar-nav a {
    display: block;           /* Maakt hele rule clickable */
    padding: 15px 20px;
    color: #333;
    text-decoration: none;
    border-left: 4px solid transparent;
    transition: all 0.3s;
}

.sidebar-nav a:hover {
    background-color: #f0f0f0;
    border-left-color: #007bff;  /* Kleur left border */
}

.sidebar-nav a.active {
    background-color: #e8f4ff;
    border-left-color: #007bff;
    font-weight: bold;
}
```

**Oefening 2 (15 min):**
Maak een sidebar nav met:
- Items onder elkaar
- Hover effect
- Active state met border-left highlight

---

**5. Semantic HTML - Waarom matters (20 min)**

**Observatie:**
- Je gebruikt `<nav>` maar je KAN overal een `<div>` gebruiken
- Waarom kiezen zij `<nav>`?

**De waarheid:**

```html
<!-- ❌ Onsemantics - browser weet niet wat dit is -->
<div class="navigation">
    <ul>...</ul>
</div>

<!-- ✅ Semantic - browser EN screenreaders weten dit is navigatie -->
<nav>
    <ul>...</ul>
</nav>
```

**Andere semantische elementen:**
```html
<header>              <!-- Website header -->
<nav>                 <!-- Navigatie -->
<main>                <!-- Hoofdinhoud -->
<article>             <!-- Blog post, artikel -->
<section>             <!-- Thematische sectie -->
<footer>              <!-- Website footer -->
```

**Waarom is dit belangrijk?**

1. **SEO:** Google begrijpt je pagina beter
2. **Accessibility:** Screenreaders weten wat belangrijk is
3. **Maintainability:** Code is duidelijker

**Voorbeeld - Semantic Website:**
```html
<!DOCTYPE html>
<html>
<head>
    <title>Mijn Website</title>
</head>
<body>
    <header>
        <h1>Mijn Website</h1>
    </header>
    
    <nav>
        <ul>
            <li><a href="/">Home</a></li>
            <li><a href="/about">About</a></li>
        </ul>
    </nav>
    
    <main>
        <article>
            <h2>Blog Post</h2>
            <p>Inhoud...</p>
        </article>
    </main>
    
    <footer>
        <p>&copy; 2024</p>
    </footer>
</body>
</html>
```

**Oefening 3 (10 min):**
Restructureer je website met semantische HTML:
- Gebruik `<header>`, `<nav>`, `<main>`, `<footer>`
- Test in browser (werkt hetzelfde!)
- Voordeel: code is veel duidelijker

---

**6. Afsluiting (5 min)**

**Checklist:**
- [ ] Horizontale nav gemaakt?
- [ ] Verticale nav gemaakt?
- [ ] Active state zichtbaar?
- [ ] Semantische HTML gebruikt?

.horizontal-nav a:hover {
    background-color: #555;
}
```

**Oefening 1 (10 min):**
Maak een horizontale navigatie met 5 links.

---

**3. Active State (10 min)**

**Wat is een active state?**
Laat zien op welke pagina je bent.

**HTML:**
```html
<nav>
    <ul>
        <li><a href="#home" class="active">Home</a></li>
        <li><a href="#about">Over</a></li>
        <li><a href="#contact">Contact</a></li>
    </ul>
</nav>
```

**CSS:**
```css
.horizontal-nav a {
    color: white;
    /* basis styling */
}

.horizontal-nav a.active {
    background-color: #007bff;
    font-weight: bold;
}
```

**Oefening 2 (5 min):**
Voeg active state toe aan je navigatie.

---

**4. Verticale/Sidebar Navigatie (20 min)**

**HTML:**
```html
<nav class="sidebar-nav">
    <ul>
        <li><a href="#dashboard">Dashboard</a></li>
        <li><a href="#profile">Profile</a></li>
        <li><a href="#settings">Settings</a></li>
        <li><a href="#logout">Logout</a></li>
    </ul>
</nav>
```

**CSS:**
```css
.sidebar-nav {
    width: 250px;
    background-color: #2c3e50;
}

.sidebar-nav ul {
    list-style: none;
    padding: 0;
    margin: 0;
}

.sidebar-nav a {
    display: block;
    padding: 15px 20px;
    color: white;
    text-decoration: none;
    border-left: 3px solid transparent;
    transition: all 0.3s;
}

.sidebar-nav a:hover {
    background-color: #34495e;
    border-left-color: #3498db;
}

.sidebar-nav a.active {
    background-color: #34495e;
    border-left-color: #3498db;
}
```

**Oefening 3 (10 min):**
Maak een verticale sidebar navigatie met hover effects.

---

**5. Semantische HTML (20 min)**

**Wat zijn semantische elementen?**
HTML elementen die betekenis dragen, niet alleen `<div>`.

**Basis structuur:**
```html
<header>
    <h1>Mijn Website</h1>
    <nav>...</nav>
</header>

<main>
    <article>
        <h2>Blog Post</h2>
        <p>Inhoud</p>
    </article>
</main>

<footer>
    <p>Copyright</p>
</footer>
```

**Waarom semantische HTML?**
- ✅ Search engines begrijpen de pagina beter
- ✅ Accessibility: screenreaders werken beter
- ✅ Code is duidelijker voor andere developers
- ✅ Betere SEO (Search Engine Optimization)

**Belangrijkste elementen:**
- `<header>` - Bovenaan pagina (logo, navigatie)
- `<nav>` - Navigatie links
- `<main>` - Hoofd content
- `<article>` - Zelfstandig artikel/blog post
- `<section>` - Thema section
- `<aside>` - Zijbalk
- `<footer>` - Onderaan pagina

**NIET doen:**
```html
<!-- ❌ FOUT: alles in <div> -->
<div class="nav">...</div>
<div class="content">...</div>
<div class="footer">...</div>

<!-- ✅ GOED: semantische elementen -->
<nav>...</nav>
<main>...</main>
<footer>...</footer>
```

**Oefening 4 (5 min):**
Neem een oude pagina en herstructureer met semantische elementen.

---

**6. Grote Oefening: Complete Navigation System (10 min)**

**Opdracht:**
Maak een pagina met:
1. Header met logo
2. Horizontale navigatie (met active state)
3. Main content
4. Footer

```html
<header>
    <h1>Mijn Website</h1>
    <nav>
        <ul>
            <li><a href="#home" class="active">Home</a></li>
            <li><a href="#about">Over</a></li>
            <li><a href="#contact">Contact</a></li>
        </ul>
    </nav>
</header>

<main>
    <article>
        <h2>Welkom!</h2>
        <p>Dit is mijn website.</p>
    </article>
</main>

<footer>
    <p>Copyright 2024</p>
</footer>
```

Style met CSS. Maak de navegatie mooi en responsive.

---

### Controlelijst voor Docent
- [ ] Studenten kunnen list-style properties gebruiken
- [ ] Studenten kunnen horizontale navigatie maken
- [ ] Studenten kunnen verticale navigatie stylen
- [ ] Studenten kunnen active states toevoegen
- [ ] Studenten begrijpen semantische HTML
- [ ] Studenten weten waarom semantiek belangrijk is

### Tips voor Docent
- **Laat echte websites zien:** Navigatie is overal!
- **DevTools:** Inspecteer navigatie van bekende sites
- **Semantieke HTML:** Benadruk het belang voor SEO en accessibility
- **Veelgemaakte fout:** list-style vergeten te verwijderen
- **Veelgemaakte fout:** display: inline-block spacing issues
- **Live coding:** Bouw samen een navigatie naar structuur op

### Resources
- [MDN: Semantic HTML](https://developer.mozilla.org/en-US/docs/Glossary/Semantic_HTML)
- [W3C: Navigation](https://www.w3.org/WAI/tutorials/page-structure/navigation/)

---
