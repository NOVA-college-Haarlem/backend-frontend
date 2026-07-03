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

**Oefening:**

```html
<div class="info-box">
  <h2>Informatie</h2>
  <p>Dit is een tekstblok met padding.</p>
</div>
```

```css
.info-box {
  background-color: lightyellow;
  padding: 20px;
}
```

Laat studenten experimenteren met verschillende padding waarden.

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

**Oefening:**
Maak kaartjes met verschillende borders en probeer combinaties met padding.

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

1. Open een pagina met gestylede elementen
2. Open DevTools (F12)
3. Selecteer een element
4. Kijk onderaan naar de "box model visualisatie"
5. Zie de kleuren:
   - Groen = margin
   - Oranje/beige = padding
   - Blauw = content

**Samen doen:**

- Open eigen pagina
- Inspecteer verschillende elementen
- Bekijk hun box model
- Verander live padding/margin in DevTools
- Zie wat gebeurt

**Oefening:**
Inspecteer een professionele website en kijk naar hun box model:

- Hoeveel padding gebruiken ze voor knoppen?
- Hoeveel margin tussen secties?

**6. Praktische Oefening**

Maak "kaartjes":

```html
<div class="card">
  <h3>Kaart Titel</h3>
  <p>Wat informatie op de kaart.</p>
</div>

<div class="card">
  <h3>Nog een Kaart</h3>
  <p>Nog meer informatie.</p>
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

**7. Afronding**

- Vragen?
- Volgende week: Copilot & Herhaling!

### Opdracht

Voeg toe aan je hobby-pagina:

- Geef alle paragrafen `padding: 15px`
- Voeg een `border` toe aan afbeeldingen
- Gebruik `margin-bottom` om ruimte tussen secties te maken
- Maak een "card" class die je kunt hergebruiken
- Gebruik DevTools om je box model te inspecteren

**Extra uitdaging:**

- Maak een "container" class die je content centreert met `margin: 0 auto`
- Experimenteer met verschillende border-styles (solid, dashed, dotted)
- Maak een kaart met schaduw effect (research: `box-shadow`)
- Gebruik `border-radius` om afgeronde hoeken te maken

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
