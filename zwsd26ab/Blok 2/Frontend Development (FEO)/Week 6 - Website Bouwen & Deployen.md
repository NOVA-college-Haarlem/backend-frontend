# Week 6: Website Bouwen & Online Zetten (Capstone)

## Leerdoelen
Na deze les kan de student:
- Een complete website structureren met HTML semantiek
- Website styling toepassen met CSS
- Website publiceren op GitHub Pages
- Begrijpen hoe websites op het internet "leven"

## Algemene Informatie
- **Doelgroep:** MBO-4 studenten (SE & SD)
- **Lesduur:** 90 minuten
- **Voorkennis:** Alle vorige lessen van Blok 2
- **Tools:** VS Code, GitHub, Browser

---

## Lesopbouw (90 minuten)

### 1. Website Template (10 min)

**HTML Structuur:**
```html
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Mijn Website</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
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
        <section class="hero">
            <h2>Welkom!</h2>
            <p>Dit is mijn eerste website.</p>
        </section>

        <section class="content">
            <h3>Over Dit Project</h3>
            <p>Inhoud hier...</p>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 Mijn Website. Alle rechten voorbehouden.</p>
    </footer>
</body>
</html>
```

**CSS Reset & Basis:**
```css
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
    color: #333;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}
```

---

### 2. Samen Bouwen: Landing Page (40 min)

**Live code met studenten mee:**

```html
<header class="header">
    <div class="container">
        <h1>Hello World</h1>
        <nav>
            <ul>
                <li><a href="#home" class="active">Home</a></li>
                <li><a href="#features">Features</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
        </nav>
    </div>
</header>

<main>
    <section class="hero">
        <div class="container">
            <h2>Mijn Eerste Website</h2>
            <p>Gemaakt in Blok 2 van NOVA College</p>
            <button class="btn btn-primary">Lees Meer</button>
        </div>
    </section>

    <section class="features">
        <div class="container">
            <h3>Wat ik Geleerd Heb</h3>
            <p>HTML, CSS, Navigatie, en meer!</p>
        </div>
    </section>

    <section class="contact">
        <div class="container">
            <h3>Contact</h3>
            <p>Email: student@nova.nl</p>
        </div>
    </section>
</main>

<footer>
    <div class="container">
        <p>&copy; 2024. Alle rechten voorbehouden.</p>
    </div>
</footer>
```

**CSS Styling:**
```css
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
    color: #333;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}

/* Header */
.header {
    background-color: #2c3e50;
    color: white;
    padding: 20px 0;
}

.header h1 {
    margin-bottom: 10px;
}

.header nav ul {
    list-style: none;
    padding: 0;
}

.header nav li {
    display: inline-block;
}

.header nav a {
    display: block;
    padding: 10px 15px;
    color: white;
    text-decoration: none;
}

.header nav a:hover {
    background-color: #34495e;
}

.header nav a.active {
    background-color: #3498db;
}

/* Hero Section */
.hero {
    background-color: #3498db;
    color: white;
    padding: 60px 0;
    text-align: center;
}

.hero h2 {
    font-size: 48px;
    margin-bottom: 20px;
}

.hero p {
    font-size: 20px;
    margin-bottom: 30px;
}

.btn {
    padding: 12px 30px;
    background-color: white;
    color: #3498db;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
}

.btn:hover {
    background-color: #f0f0f0;
}

/* Features */
.features {
    padding: 60px 0;
    background-color: #f9f9f9;
}

.features h3 {
    font-size: 32px;
    margin-bottom: 20px;
}

/* Contact */
.contact {
    padding: 60px 0;
    background-color: white;
}

.contact h3 {
    font-size: 32px;
    margin-bottom: 20px;
}

/* Footer */
footer {
    background-color: #2c3e50;
    color: white;
    padding: 30px 0;
    text-align: center;
}
```

**Oefening:**
Studenten bouwen mee, passen kleuren/tekst aan.

---

### 3. Deploy naar GitHub Pages (30 min)

**Wat is GitHub Pages?**
Gratis hosting voor statische websites (HTML, CSS, JavaScript).

**Stap 1: GitHub Account (5 min)**
- Ga naar https://github.com
- Maak account (of login)
- Verify email

**Stap 2: Repository Aanmaken (5 min)**
- Klik "New" (create new repository)
- Naam: `username.github.io` (bijv. `jvandijk.github.io`)
- Description: "Mijn eerste website"
- Public
- Initialiseer met README.md
- Create repository

**Stap 3: Files Uploaden (10 min)**

Optie A: Via GitHub Web UI
- Klik "Add file" → "Upload files"
- Sleep `index.html` en `style.css` erin
- Commit message: "Add initial website"

Optie B: Via Git (voor gevorderden)
```bash
cd je-website-folder
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/username/username.github.io.git
git push -u origin main
```

**Stap 4: Website is LIVE! (10 min)**
- Ga naar `https://username.github.io`
- Je website staat online!
- Test in browser
- Share de link

**Controleer:**
- [ ] Navigatie werkt
- [ ] Styles laden
- [ ] Pagina ziet er goed uit

---

### 4. Reflectie & Afsluiting (10 min)

**Wat hebben we geleerd?**
- HTML semantische structuur
- CSS styling
- Navigatie maken
- Website publiceren

**Voor SE'ers:**
- ✅ Je kan een website bouwen en online zetten
- ✅ Dit is voorbij web development basiskennis!
- ✅ Goed gedaan!

**Voor SD'ers:**
- ✅ Dit is het foundation voor Blok 3
- ✅ Volgende: PHP, databases, dynamische content
- ✅ Deployment concept snap je nu al

**Vragen?**
- Hoe gaat het verder? (Blok 3 voor SD)
- Was dit lastig? Wat vond je leuk?

---

## Uitdagingen (Extra voor wie klaar is)

**1. Voeg een Foto toe**
```html
<img src="mijn-foto.jpg" alt="Beschrijving foto">
```

**2. Voeg meerdere secties toe**
- More content, portfolio, gallery

**3. Kleurenschema aanpassen**
- Pas background colors aan naar je smaak

**4. Hover effecten**
- Voeg transitions toe aan links
- Scale effects op buttons

---

## Controlelijst voor Docent
- [ ] Studenten begrijpen website structuur
- [ ] Studenten kunnen basale CSS toepassen
- [ ] Studenten kunnen GitHub account maken
- [ ] Studenten kunnen website deployen
- [ ] Studenten weten waar hun website staat

## Tips voor Docent
- **Voorbereiding:** Test deployment zelf vooraf!
- **GitHub:** Veel studenten hebben dit niet eerder gedaan - wees geduldig
- **Live demo:** Laat je eigen website zien, online
- **Celebrate:** Dit moment is special - ze publiceren echt iets!
- **Veelgemaakte fout:** Repository naam moet `username.github.io` zijn
- **Veelgemaakte fout:** Vergeten HTML/CSS te committen
- **Timing:** Deployment kan langer duren - start vroeg

## Resources
- [GitHub Pages Guide](https://pages.github.com/)
- [HTML Semantic Elements](https://www.w3schools.com/html/html5_semantic_elements.asp)
- [CSS Box Model](https://www.w3schools.com/css/css_boxmodel.asp)

---
