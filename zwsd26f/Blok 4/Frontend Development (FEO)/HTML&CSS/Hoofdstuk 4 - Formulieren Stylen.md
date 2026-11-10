## Hoofdstuk 4: Formulieren Stylen

**Taakklasse 2 van 3** - De Smaakmakers (`starter-website-3`), Make op je eigen variant (`mijn-variant`) (afronding)
**PRIMM-fasen dit hoofdstuk:** Investigate → Modify → **Make** (eigen variant)

### Leerdoelen
Na dit hoofdstuk kan je:
- Velden selecteren met een attribuut-selector (`input[type="email"]`)
- Formulierelementen consistent stylen: breedte, padding, border, lettertype
- De focus zichtbaar houden met `:focus-visible`
- Een verstuurknop met states stylen
- Twee velden naast elkaar zetten met flexbox
- Een stuk AI-gegenereerde CSS controleren op fouten

### AI-gebruik dit hoofdstuk
Investigate: **geen AI**. Modify: AI mag, met verantwoording. **Make: AI mag vrij**, mits je aan het eind willekeurig aangewezen regels kan uitleggen.

### Voorbereiding
Haal in `css/style.css` deze regel weg (die vervang je vandaag door iets beters):
```css
form input,
form select,
form textarea {
    display: block;
    margin-bottom: 10px;
    padding: 8px;
}
```

---

### Investigate

#### 1. Formulierelementen zijn eigenwijs
Bekijk je formulier en beantwoord:
- Hebben de invoervelden hetzelfde lettertype als de rest van je pagina? Kijk goed, of check het in DevTools → Computed → `font-family`.
- Zijn alle velden even breed?
- Zie je verschil in hoe de `<select>` eruitziet in Chrome en Firefox?

> Formulierelementen **erven** het lettertype niet van de pagina. Daarom zet je er bijna altijd `font-family: inherit;` op.

#### 2. Attribuut-selectoren
Je wil tekstvelden stylen, maar **niet** de checkboxes en radio's. `input { width: 100%; }` raakt ze allemaal. Probeer het: wat gebeurt er met je checkboxes?

Met een attribuut-selector kies je precies welke:
```css
input[type="text"],
input[type="email"],
input[type="tel"],
input[type="number"],
select,
textarea {
    width: 100%;
    padding: 10px 12px;
    font-family: inherit;
    font-size: 16px;
    border: 2px solid #bbbbbb;
    border-radius: 6px;
}
```
- Wat betekent `input[type="email"]` in gewone woorden?
- Waarom geeft `width: 100%` met `padding` geen overloop? (Kijk bovenin je CSS: `box-sizing`.)

#### 3. Focus: nooit zomaar weghalen
Klik in een veld. Zie je een rand of gloed? Druk nu een paar keer op **Tab**: zie je waar je bent?

Voeg dit toe en probeer opnieuw met Tab:
```css
input:focus {
    outline: none;
}
```
- Waar ben je nu? Hoe zou iemand die geen muis gebruikt dit formulier invullen?

Haal het weer weg. Zo doe je het wel:
```css
input:focus-visible,
select:focus-visible,
textarea:focus-visible,
button:focus-visible {
    outline: 3px solid var(--kleur-donker);
    outline-offset: 2px;
}
```

> Haal de focus-rand **nooit** weg zonder er iets duidelijks voor terug te zetten. `:focus-visible` toont hem altijd bij het toetsenbord, en meestal niet bij een muisklik.

---

### Modify

#### 1. Labels en velden
- Labels boven het veld: `label { display: block; }`, vetgedrukt en met wat ruimte eronder
- Elk veld in een `<div class="veld">` met `margin-bottom`, zodat de velden niet tegen elkaar plakken
- `.optioneel` (uit Hoofdstuk 3) in normaal gewicht en grijs
- `<textarea>`: `resize: vertical;`. Wat doet dat? Probeer het met `none`.

#### 2. Fieldsets
Geef je `<fieldset>`'s een witte achtergrond, een lichte rand, `border-radius` en padding. Maak de `<legend>` vetgedrukt en iets groter.

#### 3. Radio's en checkboxes
Zet het vakje en de tekst netjes naast elkaar:
```css
.keuze {
    display: flex;
    align-items: center;
    gap: 10px;
    font-weight: normal;
}
```
Geef de labels van je radio's en checkboxes `class="keuze"`. Probeer ook `accent-color: var(--kleur-primair);` op de inputs: wat doet het?

#### 4. De verstuurknop
Style de knop zoals je in Blok 3 buttons stylede: kleur uit je CSS-variabelen, padding, `border-radius`, geen standaard-border, `cursor: pointer`, en een `:hover`-state.

#### 5. Velden naast elkaar
E-mail en telefoon passen goed naast elkaar. Zet ze in een gezamenlijke `<div class="rij">`:
```css
.rij {
    display: flex;
    gap: var(--ruimte);
}

.rij .veld {
    flex: 1;
}
```
- Op welk element staat `display: flex`? (Weet je nog, Blok 3 H9?)
- Maak je scherm smal. Wat gebeurt er? (Dat lossen we op in Hoofdstuk 5.)

#### 6. Een maximale breedte
Een formulier over de volle breedte van een groot scherm leest lastig. Geef het `<form>` een `max-width` van ongeveer 700px.

---

### Make: eigen variant
Style het formulier van je eigen variant met alles van vandaag. Het moet passen bij de kleuren en stijl van jouw site. Gebruik je CSS-variabelen, geen losse kleurcodes.

### Debug deze AI-output
Een student vroeg AI: "maak mijn formulier mooi". Het antwoord:
```css
input {
    width: 500px;
    padding: 10px;
    border: 1px solid #eeeeee;
}

*:focus {
    outline: 0;
}

input::placeholder {
    color: #dddddd;
}

.veld {
    display: flex;
}

button {
    background: #ff6b35;
}
```
Er zitten minstens **vijf** problemen in. Kijk naar: mobiel, toetsenbord, leesbaarheid, checkboxes, en je eigen CSS-variabelen. Leg per probleem uit voor wie het een probleem is, en verbeter de code.

### Huiswerk
1. Je formulier is consistent gestyled: zelfde lettertype, breedte en ruimte overal
2. Met alleen de Tab-toets zie je altijd waar je bent
3. De knop heeft een duidelijke `:hover`- en `:focus-visible`-state

---
