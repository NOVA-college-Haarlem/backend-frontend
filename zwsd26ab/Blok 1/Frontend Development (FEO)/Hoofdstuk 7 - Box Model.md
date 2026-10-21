## Hoofdstuk 7: Het Box Model

### Leerdoelen

Na deze les kan de student:

- Het CSS box model uitleggen (content, padding, border, margin)
- Padding en margin toepassen
- Borders toevoegen en stylen
- DevTools gebruiken om het box model te inspecteren

### Lesopbouw

**1. Introductie Box Model**

**Wat is het Box Model?**

- Elk HTML element is eigenlijk een "doos"
- Die doos bestaat uit lagen:
  1. **Content** - De inhoud (tekst, afbeelding)
  2. **Padding** - Ruimte rondom de inhoud, binnen de rand
  3. **Border** - De rand zelf
  4. **Margin** - Ruimte buiten de rand, tussen elementen

**Visualisatie:**
Teken op het bord of laat diagram zien:

```
┌─────────────────────────┐
│       MARGIN            │
│  ┌──────────────────┐   │
│  │    BORDER        │   │
│  │  ┌───────────┐   │   │
│  │  │  PADDING  │   │   │
│  │  │ ┌───────┐ │   │   │
│  │  │ │CONTENT│ │   │   │
│  │  │ └───────┘ │   │   │
│  │  └───────────┘   │   │
│  └──────────────────┘   │
└─────────────────────────┘
```

**2. Padding**

**Wat is padding?**

- Ruimte BINNEN het element
- Maakt de "doos" groter
- Achtergrondkleur strekt uit tot aan de padding

**Voorbeelden:**

```css
.card {
  background-color: lightblue;
  padding: 20px;
}
```

Laat zien hoe je padding live aanpast in DevTools.

**3. Border**

**Wat is border?**

- De rand van het element
- Kan verschillende stijlen, diktes en kleuren hebben

**Voorbeelden:**

```css
/* Border toevoegen aan een element: */
.card {
  border: 2px solid #333;
}

/* Afbeeldingen een subtiele rand geven: */
img {
  border: 3px solid lightgray;
}
```

**Veel gebruikte border-styles:**

- `solid` - Doorlopende lijn
- `dashed` - Streepjes
- `dotted` - Stippen
- `none` - Geen rand

**4. Margin**

**Wat is margin?**

- Ruimte BUITEN het element
- Duwt andere elementen weg
- Is NIET deel van de achtergrondkleur

**Centreren met margin:**

```css
.centered {
  width: 50%;
  margin-left: auto;
  margin-right: auto;
}

/* Of korter: */
.centered {
  width: 50%;
  margin: 0 auto;
}
```

**5. DevTools voor Box Model**

**Demonstratie:**

1. Open DevTools (F12) op een willekeurige site
2. Selecteer een element
3. Kijk onderaan naar de "box model visualisatie"
4. Zie de kleuren:
   - Groen = margin
   - Oranje/beige = padding
   - Blauw = content

**Klassikaal voordoen (docent):**

- Open een willekeurige website (bijv. nos.nl of de eigen school-site)
- Inspecteer een knop, een afbeelding en een tekstblok
- Laat de box model visualisatie zien
- Verander live padding, margin en border in DevTools
- Laat zien dat een wijziging in DevTools niet blijvend is (refresh = weg)

**6. Voorbeeld: kaartje**

```html
<div class="card">
  <h3>Kaart Titel</h3>
  <p>Wat informatie op de kaart.</p>
</div>
```

```css
.card {
  background-color: white;
  border: 1px solid #ddd;
  padding: 20px;
  margin-bottom: 20px;
}
```

### Opdrachten

**Opdracht 1: DevTools onderzoeken**

Kies een website naar keuze (geen eigen pagina) en open DevTools (F12).

1. Inspecteer een knop. Noteer: hoeveel padding heeft hij? Welke border?
2. Inspecteer een afbeelding. Hoe groot is de margin?
3. Inspecteer een tekstblok. Wat is de content-breedte en -hoogte?
4. Verander live de padding van de knop en de margin van een kopje. Wat gebeurt er?

**Opdracht 2: Hobby-pagina uitbreiden**

Pas het box model toe op je hobby-pagina:

- Geef alle paragrafen `padding: 15px`
- Voeg een `border` toe aan afbeeldingen
- Gebruik `margin-bottom` om ruimte tussen secties te maken
- Maak een `card` class die je kunt hergebruiken
- Controleer het resultaat met DevTools en pas waarden aan tot het goed oogt

**Extra uitdaging:**

- Maak een `container` class: een "doos" om je hele pagina-inhoud heen met een vaste breedte, die je centreert. Zo wordt je pagina niet te breed op een groot scherm.

  ```html
  <body>
    <div class="container">
      <!-- hier komt al je content -->
    </div>
  </body>
  ```

  ```css
  .container {
    width: 800px;
    margin: 0 auto;
  }
  ```
- Experimenteer met verschillende border-styles (solid, dashed, dotted)
- Maak een kaart met schaduw (research: `box-shadow`)
- Gebruik `border-radius` voor afgeronde hoeken

### Controlelijst voor docent

- [ ] Studenten begrijpen het box model (content, padding, border, margin)
- [ ] Studenten kunnen padding toevoegen aan elementen
- [ ] Studenten kunnen borders toevoegen met verschillende stijlen
- [ ] Studenten kunnen margin gebruiken voor ruimte tussen elementen
- [ ] Studenten kunnen DevTools gebruiken om het box model te inspecteren
- [ ] Studenten begrijpen het verschil tussen padding (binnen) en margin (buiten)
- [ ] Studenten kunnen elementen centreren met `margin: 0 auto`

### Tips voor docent

- Het box model is abstract - gebruik veel visuele voorbeelden
- Laat studenten **live** in DevTools aanpassingen maken - ze zien direct het effect
- Gebruik de box model visualisatie in DevTools uitgebreid
- Maak het verschil tussen padding en margin duidelijk met achtergrondkleuren
- Geef praktische voorbeelden: "Een kaartje heeft altijd padding en margin"
- Laat studenten professionele websites inspecteren - wat zien ze?

### Veelgemaakte Fouten

1. **Vergeten width te zetten** bij centreren met `margin: 0 auto`
2. **Padding en margin door elkaar halen** - blijf het verschil benadrukken
3. **Border vergeten** - border heeft 3 waardes nodig (width, style, color)
4. **Te veel padding/margin** - houd het simpel in het begin (10px, 15px, 20px)

---
