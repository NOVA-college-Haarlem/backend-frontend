## Hoofdstuk 5: CSS Classes en IDs

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

**2. Probleem Schetsen**

- **Scenario:** Je hebt 3 paragrafen. Twee moeten blauw, één moet rood.
- **Probeer samen met huidige kennis:**
  ```css
  p {
    color: blue;
  }
  ```
  Maar dan is die ene paragraaf ook blauw! Hoe lossen we dit op?

**3. Classes Introductie**

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

**4. IDs Introductie**

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

**5. Praktische Voorbeelden**

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

**Gezamenlijke oefening:**

- Maak een pagina met verschillende tekstsoorten
- Gebruik classes voor: intro-text, important-info, footer-text
- Gebruik één ID voor de hoofdtitel

**6. Afronding**

- Vragen?
- Volgende week: Box model!

### Huiswerk

Herschrijf je hobby-pagina van week 4:

- Voeg minstens 3 verschillende classes toe
- Gebruik 1 ID voor je hoofdtitel
- Experimenteer met verschillende styles per class
- Maak een class "highlight" voor tekst die extra moet opvallen

**Extra uitdaging:**

- Maak een class "button" voor je links die er als knoppen uitzien
- Combineer classes (bijv. class="text large important")
- Gebruik een ID voor je footer

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
