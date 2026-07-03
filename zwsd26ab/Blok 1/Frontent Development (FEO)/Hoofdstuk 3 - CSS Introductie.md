## Hoofdstuk 3: CSS Introductie & Copilot

### Leerdoelen

Na deze les kan de student:

- Een externe CSS stylesheet aanmaken en linken
- Basis CSS properties toepassen (kleuren, lettertypen)
- Uitleggen wat Copilot is en hoe het te gebruiken
- Verantwoord gebruik maken van Copilot

### Lesopbouw

**1. Terugblik**

- Opdracht vorige week bespreken
- Welke websites hebben jullie geïnspecteerd? Heeft iemand iets interessants gevonden in de broncode?

**2. Wat is CSS?**

- **Uitleg:**
  - HTML = structuur/inhoud
  - CSS = styling/uiterlijk
  - CSS staat voor Cascading Style Sheets

- **Demo:** Toon twee versies van een pagina:
  - Eén met alleen HTML (saai, zwart-wit) - Gebruik bijv. Firefox (View > Page Style > No Style) om CSS uit te schakelen
  - Eén met CSS (kleurrijk, mooi)

**3. Externe Stylesheet Aanmaken**

- **Waarom extern?**
  - Alle styling op één plek
  - Herbruikbaar voor meerdere pagina's
  - Professionele manier van werken

- **Samen doen:**
  1. Maak nieuw bestand in de "css" map: `style.css`
  2. Link stylesheet in HTML `<head>`:

  ```html
  <link rel="stylesheet" href="css/style.css" />
  ```

- **Eerste CSS schrijven:**

  ```css
  body {
    background-color: lightblue;
  }
  ```

- **Uitleg syntax:**
  - Selector (`body`) - WAT wil je stylen?
  - Property (`background-color`) - WELKE eigenschap?
  - Value (`lightblue`) - WELKE waarde?
  - Altijd afsluiten met `;`
  - Altijd tussen `{ }`

**4. Basis CSS Properties**

**Kleuren:**

```css
body {
  background-color: #f0f0f0;
  color: #333333;
}

h1 {
  color: darkblue;
}
```

**Uitleg kleurnotaties:**

- Naam: `red`, `blue`, `lightgreen`
- Hex: `#ff0000`, `#0000ff`
- RGB: `rgb(255, 0, 0)` (niet verplicht nu)

**Lettertypen:**

```css
body {
  font-family: Arial, sans-serif;
  font-size: 16px;
}

h1 {
  font-size: 32px;
}
```

**Tekst uitlijning:**

```css
h1 {
  text-align: center;
}

p {
  text-align: left;
}
```

**Oefening:**
Laat studenten experimenteren:

- Verander achtergrondkleur
- Kies een andere kleur voor alle headings
- Verander het lettertype
- Maak de h1 gecentreerd

**5. Copilot Introductie**

**Wat is Copilot?**

- AI-assistent voor programmeren
- Suggereert code terwijl je typt
- Kan helpen, maar je moet het begrijpen!

**Installatie:**

- GitHub Copilot extensie in VS Code installeren
- Inloggen met school-account

**Demonstratie:**

- Type een comment: `/* Maak de achtergrond groen */`
- Laat zien hoe Copilot suggereert
- Druk Tab om te accepteren

**Belangrijke regels voor Copilot:**

1. **Begrijp wat je accepteert** - Als je niet snapt wat Copilot voorstelt, gebruik het niet!
2. **Test altijd** - Kijk in de browser of het werkt
3. **Copilot is een hulpmiddel** - Jij blijft de programmeur
4. **Leer eerst zelf** - Gebruik Copilot pas als je de basis begrijpt

**Oefening met Copilot:**

- Laat studenten comments typen:
  - `/* Maak alle paragrafen grijs */`
  - `/* Centreer de h2 koppen */`
  - `/* Verander het lettertype naar Verdana */`
- Bespreek: begrijpen jullie wat Copilot voorstelt?

**6. Afronding**

- Volgende week: Project week!
- Vragen?

### Huiswerk

1. Maak je pagina mooi met CSS:
   - Kies een mooie achtergrondkleur
   - Verander de tekstkleur zodat het goed leesbaar is
   - Experimenteer met lettertypen
   - Maak je h1 gecentreerd
2. Probeer Copilot te gebruiken, maar controleer of je begrijpt wat het doet

---
