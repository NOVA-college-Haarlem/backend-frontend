## Hoofdstuk 6: CSS Classes en IDs

### Leerdoelen

Na deze les kan de student:

- Het verschil uitleggen tussen classes en IDs
- Classes en IDs correct toepassen in HTML en CSS
- Meerdere classes op één element gebruiken
- Beslissen wanneer je een class of ID gebruikt

### Lesopbouw

**1. Terugblik Project**

- Wat ging goed?
- Wat vonden jullie moeilijk?
- Korte showcase: 2-3 studenten laten hun pagina zien

**2. Wat is een `<div>`?**

- Een `<div>` is een **generieke container** — hij groepeert elementen zonder er betekenis aan toe te voegen
- Gebruik je als er geen passend semantisch element is (zoals `<header>` of `<section>`)
- Op zichzelf doet een `<div>` niets zichtbaars; je stijlt hem met CSS

```html
<div class="card">
  <h2>Titel</h2>
  <p>Wat tekst in een kaartje.</p>
</div>
```

**3. Probleem Schetsen**

- **Scenario:** Je hebt 3 paragrafen. Twee moeten blauw, één moet rood.
- **Probeer samen met huidige kennis:**
  ```css
  p {
    color: blue;
  }
  ```
  Maar dan is die ene paragraaf ook blauw! Hoe lossen we dit op?

**4. Classes Introductie**

**Wat zijn classes?**

- Een manier om specifieke elementen te selecteren
- Herbruikbaar: meerdere elementen kunnen dezelfde class hebben
- Begint met een `.` in CSS

**Voorbeeld:**

```html
<p class="important">Deze tekst is belangrijk.</p>
<p>Deze tekst is normaal.</p>
<p class="important">Deze tekst is ook belangrijk.</p>
```

```css
.important {
  color: red;
  font-weight: bold;
}
```

**Meerdere classes:**

```html
<p class="important large">Deze tekst heeft twee classes.</p>
```

```css
.important {
  color: red;
}

.large {
  font-size: 24px;
}
```

**Oefening:**

- Maak 5 paragrafen
- Geef sommige de class "highlight"
- Style de highlight class met een gele achtergrond en dikke tekst

**5. IDs Introductie**

**Wat zijn IDs?**

- Ook een manier om elementen te selecteren
- UNIEK: slechts één element per pagina mag deze ID hebben
- Begint met een `#` in CSS

**Voorbeeld:**

```html
<h1 id="main-title">Welkom op Mijn Website</h1>
```

```css
#main-title {
  color: darkblue;
  text-align: center;
}
```

**Wanneer gebruik je wat?**

- **Class:** Als meerdere elementen dezelfde styling nodig hebben
- **ID:** Als je één specifiek element wilt stylen (bijvoorbeeld de hoofdtitel)

**Vuistregel:**

- IDs gebruik je weinig (misschien 1-3 per pagina)
- Classes gebruik je vaak

**6. Praktische Voorbeelden**

**Voorbeeld 1: Knoppenstijl**

```html
<a href="#" class="btn">Klik hier</a> <a href="#" class="btn">Meer info</a>
```

```css
.btn {
  background-color: blue;
  color: white;
  padding: 10px;
  text-decoration: none;
}
```

**Voorbeeld 2: Verschillende tekstsoorten**

```html
<p class="intro">Dit is de introductie tekst.</p>
<p>Dit is normale tekst.</p>
<p class="note">Dit is een opmerking.</p>
```

```css
.intro {
  font-size: 20px;
  font-weight: bold;
}

.note {
  font-style: italic;
  color: gray;
}
```

### Controlelijst voor docent

- [ ] Studenten begrijpen verschil tussen classes en IDs
- [ ] Studenten kunnen classes toevoegen in HTML
- [ ] Studenten kunnen classes stylen in CSS met `.`
- [ ] Studenten kunnen IDs stylen in CSS met `#`
- [ ] Studenten begrijpen wanneer je classes gebruikt vs IDs
- [ ] Studenten kunnen meerdere classes op één element gebruiken

### Tips voor docent

- Herhaal het verschil tussen classes (herbruikbaar) en IDs (uniek) meerdere keren
- Laat studenten vaak de browser verversen om hun wijzigingen te zien
- Gebruik kleurrijke voorbeelden - dat maakt het visueler en leuker
- Loop rond terwijl studenten oefenen en help waar nodig
- Laat studenten elkaars werk bekijken voor inspiratie

---

# Oefenpagina

- Maak in je project "mijn-website" een nieuwe HTML-pagina aan: `classes.html`.
- Kopieer de volgende HTML in die pagina:
- Maak het bestand `css/classes.css`.
- Maak in dat CSS-bestanden de opdrachten die uitgedeeld worden.

```html
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Oefenen met Classes en CSS</title>
    <!-- Studenten koppelen hier hun eigen CSS-bestand -->
    <link rel="stylesheet" href="css/classes.css">
</head>
<body>

    <header>
        <h1>Mijn Favoriete Media</h1>
        <p>Een overzicht van toffe films, boeken en reviews.</p>
    </header>

    <main>
        <!-- Sectie 1: Nieuws & Meldingen -->
        <section>
            <h2>Belangrijke Updates</h2>
            <p>Welkom op de pagina! Kijk gerust rond naar alle aanbevelingen.</p>
            <p>Let op: De filmavond van aanstaande vrijdag is verplaatst naar zaterdag!</p>
            <p>Nieuwe reviews worden elke zondagavond geplaatst.</p>
        </section>

        <!-- Sectie 2: Boekenlijst -->
        <section>
            <h2>Leeslijst van deze maand</h2>
            <ul>
                <li>Harry Potter en de Steen der Wijzen</li>
                <li>Dune (Duin)</li>
                <li>De Helaasheid der Dingen</li>
                <li>The Hobbit</li>
            </ul>
        </section>

        <!-- Sectie 3: Filmkaarten -->
        <section>
            <h2>Aanbevolen Films</h2>
            
            <div>
                <h3>Inception</h3>
                <p>Een meeslepende sci-fi thriller over dromen binnen dromen.</p>
                <button>Bekijk Trailer</button>
            </div>

            <div>
                <h3>The Matrix</h3>
                <p>Kies je de rode of de blauwe pil? Een absolute klassieker.</p>
                <button>Bekijk Trailer</button>
            </div>

            <div>
                <h3>Cats (2019)</h3>
                <p>Een muzikale film die helaas door bijna iedereen werd gekraakt.</p>
                <button>Bekijk Trailer</button>
            </div>
        </section>
    </main>

    <footer>
        <p>Gemaakt door [Naam Student] - 2026</p>
    </footer>

</body>
</html>
```