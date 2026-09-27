## Hoofdstuk 4: CSS Introductie

### Leerdoelen

Na deze les kan de student:

- Een externe CSS stylesheet aanmaken en linken
- Basis CSS properties toepassen (kleuren, lettertypen)
- Meerdere elementen tegelijk stylen met een gegroepeerde selector
- Links stylen en de `text-decoration` property gebruiken
- Commentaar toevoegen aan CSS-code

### Lesopbouw

**1. Wat is CSS?**

- **Uitleg:**
  - HTML = structuur/inhoud
  - CSS = styling/uiterlijk
  - CSS staat voor Cascading Style Sheets

- **Demo:** Toon twee versies van een pagina:
  - Eén met alleen HTML (saai, zwart-wit) - Gebruik bijv. Firefox (View > Page Style > No Style) om CSS uit te schakelen
  - Eén met CSS (kleurrijk, mooi)

**2. Externe Stylesheet Aanmaken**

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

  **Opdracht 1: voorspel en probeer**

  - Wat denk je dat `background-color: lightblue;` verandert?
  - Pas de achtergrondkleur aan en ververs de pagina.
  - Verander de kleur nog een keer. Welke waarde vind jij het prettigst?

**3. Basis CSS Properties**

**Kleuren:**

```css
body {
  background-color: lightgray;
  color: black;
}

h1 {
  color: darkblue;
}
```

Je kunt beginnen met kleurnamen, zoals `red`, `blue` en `lightgreen`. Soms zie je ook hex-kleurwaarden, zoals `#ff0000`. Die beginnen met `#`. Voor deze les zijn kleurnamen voldoende.

**Opdracht 2: kleur en contrast**

- Kies een achtergrondkleur voor je pagina.
- Kies een tekstkleur die goed leesbaar is op die achtergrond.
- Laat je buur controleren of de tekst goed te lezen is.

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

**Opdracht 3: geef je titel aandacht**

- Verander het lettertype van de pagina.
- Maak de hoofdtitel groter en centreer hem.
- Kijk naar de pagina: is de titel nu makkelijker te vinden?

**4. Meerdere Elementen Tegelijk Stylen**

- Je kunt meerdere selectors combineren met een komma, zodat je niet alles dubbel hoeft te schrijven

```css
h1,
h2,
h3 {
  color: darkblue;
  font-family: Arial, sans-serif;
}
```

- **Uitleg:** Alle drie de elementen krijgen nu dezelfde stijl in één keer

**Opdracht 4: minder dubbel werk**

- Voeg een gegroepeerde selector toe voor `h1`, `h2` en `h3`.
- Geef de headings dezelfde kleur en bekijk welke elementen veranderen.

**5. Tekst Extra Opmaken**

```css
h1 {
  font-weight: bold;
  text-transform: uppercase;
}

p {
  line-height: 1.5;
  font-style: italic;
}
```

- `font-weight`: dikte van de tekst (`normal`, `bold`)
- `text-transform`: `uppercase`, `lowercase`, `capitalize`
- `line-height`: ruimte tussen regels, maakt tekst leesbaarder
- `font-style`: `normal` of `italic`

**Opdracht 5: maak tekst prettig leesbaar**

- Geef je paragrafen een `line-height` van `1.5`.
- Maak één paragraaf cursief.
- Zet `font-style` daarna terug op `normal`. Wat verandert er?

**6. Links Stylen**

- **Probleem schetsen:** Links zijn standaard blauw en onderstreept. Dat past niet altijd bij je pagina

```css
a {
  color: green;
  text-decoration: none;
}
```

- `text-decoration: none;` haalt de standaard onderstreping weg
- `text-decoration: underline;` zet de onderstreping juist aan

**Opdracht 6: herken je links**

- Geef je links een kleur die past bij je pagina.
- Haal de onderstreping weg.
- Controleer of je nog steeds duidelijk kunt zien welke tekst een link is.

**7. Commentaar in CSS**

- Net als in HTML kun je aantekeningen maken die de browser negeert

```css
/* Dit is de hoofdtitel van de pagina */
h1 {
  color: darkblue;
}
```

- Handig om te onthouden waarom je iets hebt gestyled

**Opdracht 7: leg je CSS uit**

- Zet boven een CSS-regel een commentaar dat uitlegt wat de regel doet.
- Verwijder het commentaar tijdelijk en controleer of het uiterlijk van je pagina verandert.

### Opdracht 8: Maak je pagina mooi met CSS

Maak je pagina mooi met CSS:

- Kies een mooie achtergrondkleur
- Verander de tekstkleur zodat het goed leesbaar is
- Experimenteer met lettertypen
- Maak je h1 gecentreerd
- Style je links zodat ze geen onderstreping meer hebben
- Voeg minstens één CSS-commentaar toe

**Verdiepingsopdracht bij opdracht 8:**

- Groepeer al je headings (`h1`, `h2`, `h3`) in één selector met een komma
- Zoek zelf op wat `letter-spacing` doet en pas het toe op je hoofdtitel
- Maak een `:hover`-effect op je links, zodat de kleur verandert als je er met de muis overheen gaat:

  ```css
  a:hover {
    color: orange;
  }
  ```

- Leg aan je buurman/buurvrouw uit wat `:hover` doet

### Controlelijst voor docent

- [ ] Studenten hebben een externe stylesheet aangemaakt en gelinkt
- [ ] Studenten begrijpen de opbouw selector - property - value
- [ ] Studenten kunnen kleurnamen gebruiken en hex-kleurwaarden herkennen
- [ ] Studenten kunnen lettertype en tekstuitlijning aanpassen
- [ ] Studenten kunnen meerdere selectors groeperen met een komma
- [ ] Studenten kunnen links stylen met `text-decoration`
- [ ] Studenten hebben minstens één verdiepingsopdracht geprobeerd

### Tips voor docent

- Laat studenten bij elke nieuwe property eerst zelf raden wat hij doet, voordat je het uitlegt
- Loop rond en check of iedereen de stylesheet correct heeft gelinkt (veel voorkomende fout: verkeerd pad)
- De `:hover`-opdracht is een mooie eyeopener voor snelle studenten, maar niet verplicht voor de hele klas
- Bewaar tijd aan het einde om een paar pagina's van studenten te laten zien

---
