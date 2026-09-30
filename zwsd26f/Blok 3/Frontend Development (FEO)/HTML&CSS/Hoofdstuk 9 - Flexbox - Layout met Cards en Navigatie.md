## Hoofdstuk 9: Flexbox - Layout met Cards en Navigatie

*Docentenhandleiding: `Docent/Hoofdstuk 9 - Docentenhandleiding.md`*

**Taakklasse 4 (verdieping)** - Layout: Flexbox & Responsive. Startcode: **jouw eigen Boulder Base** (uit Hoofdstuk 4-7), daarna je eindproject uit Hoofdstuk 8
**PRIMM-fasen dit hoofdstuk:** Predict → Run → Investigate → Modify → korte Make

### Waarom dit hoofdstuk?
Je eindproject staat. Het ziet er netjes uit op jouw scherm - maar de cards staan naast elkaar met `display: inline-block` en de navigatie hangt aan een `float: right`. Dat werkt "toevallig", maar zodra het scherm smaller wordt, een tekst langer is of je een element toevoegt, gaat het schuiven. In dit hoofdstuk leer je **Flexbox**: de standaardmanier om elementen netjes naast (of onder) elkaar te zetten. Dit is ook precies waar Blok 4 mee verdergaat.

### Leerdoelen
Na dit hoofdstuk kan je:
- Uitleggen wat een **flex container** en een **flex item** zijn, en op welk element je `display: flex` zet
- De hoofdas (main axis) en de dwarsas (cross axis) benoemen en `flex-direction` gebruiken
- Elementen uitlijnen met `justify-content`, `align-items` en ruimte maken met `gap`
- Met `flex-wrap` en `flex: 1 1 250px` cards laten doorlopen naar een nieuwe rij
- Een header met logo, navigatie en knop netjes op één lijn zetten zonder `float`
- Met DevTools een flex-layout inspecteren

### AI-gebruik dit hoofdstuk
Predict, Run en Investigate: **geen AI** - je moet zelf kunnen voorspellen wat `justify-content` of `align-items` doet. Modify: AI mag, mits je bij een steekproef kan uitleggen wat een regel doet. Make (eigen eindproject): AI mag, verantwoording verplicht.

---

### Predict
Bekijk dit stukje code - **nog niet draaien**. Schrijf in tweetallen op wat je denkt te zien.

```html
<div class="rij">
    <div class="blok">1</div>
    <div class="blok">2</div>
    <div class="blok">3</div>
</div>
```
```css
.blok {
    background-color: orange;
    padding: 20px;
    margin: 5px;
}
```
1. Staan de blokken naast elkaar of onder elkaar? Waarom?
2. Nu voegen we één regel toe: `.rij { display: flex; }`. Wat verandert er? Op welk element staat die regel - op de blokken of op de rij?
3. Hoe breed wordt elk blok na die regel?

### Run
Plak de code in een los testbestand (bijv. `flex-test.html`) en open het in de browser. Voeg daarna `display: flex` toe aan `.rij`.
- Klopte je voorspelling?
- Wat gebeurde er met de breedte van de blokken?

Open nu **jouw Boulder Base** en maak het browservenster langzaam smaller. Let op:
- Wat gebeurt er met de drie cards als er niet genoeg ruimte is?
- Hebben de cards dezelfde hoogte? Staan de knoppen op dezelfde hoogte?
- Wat gebeurt er met de navigatie rechtsboven?

---

### Investigate

#### 1. Container en items
Flexbox werkt altijd met twee "rollen":

| Rol | Wat is het? | In het voorbeeld |
|---|---|---|
| **Flex container** | Het element waar je `display: flex` op zet | `.rij` |
| **Flex items** | De *directe kinderen* van de container | de drie `.blok`'s |

**Belangrijk:** je zet `display: flex` op de **ouder**, niet op de elementen die je wil verplaatsen. Dit is de meestgemaakte fout met Flexbox.

Alleen **directe kinderen** worden flex items. Een `<p>` die ín een `.blok` staat, doet niet mee.

#### 2. Twee assen
```
flex-direction: row  (standaard)

  hoofdas (main axis) ──────────────────────▶
 ┌─────────────────────────────────────────┐   │
 │  [ item 1 ]  [ item 2 ]  [ item 3 ]      │   │ dwarsas
 └─────────────────────────────────────────┘   ▼ (cross axis)
```
- **Hoofdas:** de richting waarin de items achter elkaar staan. Bij `flex-direction: row` is dat horizontaal, bij `flex-direction: column` verticaal.
- **Dwarsas:** staat haaks op de hoofdas.

Waarom dit belangrijk is: de twee belangrijkste uitlijn-eigenschappen werken elk op één as.

| Eigenschap | Werkt op | Veelgebruikte waarden |
|---|---|---|
| `justify-content` | **hoofdas** | `flex-start`, `center`, `space-between`, `space-around` |
| `align-items` | **dwarsas** | `stretch` (standaard), `center`, `flex-start`, `flex-end` |
| `gap` | ruimte **tussen** items | bijv. `gap: 20px` |

**Ezelsbruggetje:** *justify* = langs de rij, *align* = op en neer (zolang je `row` gebruikt).

Draai je `flex-direction` om naar `column`, dan draaien de assen mee: `justify-content` werkt dan verticaal en `align-items` horizontaal.

#### 3. Probeer het uit in je testbestand
Pas `.rij` aan en bekijk na elke regel wat er gebeurt:
```css
.rij {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 20px;
    height: 200px;
    background-color: #eeeeee;
}
```
- Vervang `space-between` door `center`, daarna door `flex-end`. Wat doet het?
- Vervang `align-items: center` door `stretch` (en haal `height` weg). Waarom worden de blokken nu even hoog?
- Zet `flex-direction: column` erbij. Wat doet `justify-content` nu?

#### 4. Items laten meegroeien en doorlopen
Standaard proberen flex items **allemaal op één rij** te passen, desnoods worden ze samengeperst. Met twee regels los je dat op:

```css
.card-grid {
    display: flex;
    flex-wrap: wrap;   /* te weinig ruimte? dan naar een nieuwe rij */
    gap: 20px;
}

.card {
    flex: 1 1 250px;   /* groeien - krimpen - startbreedte */
}
```
`flex: 1 1 250px` betekent:
- **1** (flex-grow): het item mag groeien als er ruimte over is
- **1** (flex-shrink): het item mag krimpen als het krap wordt
- **250px** (flex-basis): de breedte waarmee het item begint

Samen met `flex-wrap: wrap` krijg je: "maak de cards ongeveer 250px, verdeel de overgebleven ruimte eerlijk, en past het niet meer, begin dan een nieuwe rij". Geen vaste `width: 280px` meer nodig.

#### 5. Flexbox in DevTools
Open DevTools en selecteer het element met `display: flex`. In het Elements-paneel staat een klein label **`flex`** naast het element. Klik erop: je ziet de flex items en de ruimte ertussen gemarkeerd. In het Styles-paneel staat naast `display: flex` een icoontje waarmee je `justify-content` en `align-items` visueel kan uitproberen - handig om te testen vóórdat je het in je CSS zet.

#### Checkvragen (zonder AI, zonder te spieken)
1. Je wil drie knoppen naast elkaar. Zet je `display: flex` op de knoppen of op het element eromheen?
2. Wat is het verschil tussen `justify-content: center` en `align-items: center` bij `flex-direction: row`?
3. Waarom heb je `flex-wrap: wrap` nodig voor een card-overzicht?
4. Wat doet `gap` dat `margin` op elk item ook zou kunnen - en waarom is `gap` handiger?

---

### Modify: Boulder Base omzetten naar Flexbox

#### Stap 1 - header zonder float (samen met de docent)
Nu:
```css
.logo { display: inline-block; }
nav   { display: inline-block; float: right; }
```
Wordt:
```css
header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 20px;
}

nav {
    display: flex;
    gap: 15px;
}
```
Haal `float: right` bij `nav` en `display: inline-block` bij `.logo` weg. De `margin-left` op `nav a` heb je ook niet meer nodig - dat regelt `gap` nu.

Denk na: de `header` heeft drie flex items (logo, nav, dark-mode-knop). Waar komen die terecht bij `space-between`? Wat gebeurt er als je `nav` de regel `margin-left: auto;` geeft?

#### Stap 2 - cards in een grid (in tweetallen)
Zet de drie `.card`'s in een nieuwe wrapper:
```html
<section id="lessen">
    <h2>Onze lessen</h2>

    <div class="card-grid">
        <div class="card">...</div>
        <div class="card">...</div>
        <div class="card">...</div>
    </div>
</section>
```
Waarom een extra `<div>`? Omdat de `<h2>` anders óók een flex item wordt en naast de cards komt te staan.

Pas daarna de CSS aan:
- `.card-grid` krijgt `display: flex`, `flex-wrap: wrap` en `gap`
- `.card` krijgt `flex: 1 1 250px`
- Haal bij `.card` weg: `width: 280px`, `display: inline-block` en `margin: 10px` (dat doet `gap` nu)

Doe daarna precies hetzelfde voor de drie `.plan`'s in `#abonnementen`. Kan je `.card-grid` hergebruiken, of heb je een nieuwe class nodig? (Tip: één class, twee keer gebruiken.)

**Let op:** laat de class `card` op de cards staan. Het JavaScript uit JSO (`.card a`) gebruikt die class nog.

#### Stap 3 - knoppen onderaan de card
Heeft één card een langere tekst, dan staat de knop bij die card lager dan bij de andere. Oplossing: maak van de card zélf óók een flex container, maar dan verticaal.
```css
.card {
    flex: 1 1 250px;
    display: flex;
    flex-direction: column;
}

.card .knop-card {
    margin-top: auto;        /* duwt de knop naar de onderkant */
    align-self: flex-start;  /* knop niet over de hele breedte */
}
```
Test: maak de tekst in één card expres twee keer zo lang. Staan de knoppen nog op één lijn?

Een element kan dus **tegelijk** flex item (van `.card-grid`) én flex container (voor zijn eigen inhoud) zijn. Dat heet *nesten* en je gaat het vaak gebruiken.

#### Stap 4 - hero centreren
Centreer de inhoud van de `.hero` met Flexbox in plaats van `text-align`:
```css
.hero {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    min-height: 400px;
    text-align: center;
}
```
Waarom staat hier `align-items: center` voor het horizontaal centreren, en niet `justify-content`? (Kijk naar `flex-direction`.)

---

### Make: je eigen eindproject
Pas wat je net geleerd hebt toe op je eindproject uit Hoofdstuk 8:
1. Header: logo en navigatie met Flexbox op één lijn, geen `float` meer
2. Minimaal één overzicht (producten, diensten, teamleden, ...) in een `.card-grid` met `flex-wrap`
3. Knoppen in cards staan onderaan, ook bij verschillende teksthoogtes
4. De footer gebruikt al Flexbox (Hoofdstuk 7) - controleer of je dezelfde begrippen terugziet

---

### Debug deze AI-output
Een student vroeg een AI: *"Zet mijn drie cards naast elkaar en laat ze doorlopen op kleine schermen."* Dit kwam eruit:
```html
<section id="diensten">
    <h2>Onze diensten</h2>
    <div class="card">...</div>
    <div class="card">...</div>
    <div class="card">...</div>
</section>
```
```css
.card {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    width: 300px;
}
```
De cards staan nog steeds onder elkaar, en de inhoud van elke card ziet er ineens raar uit.
1. Wat is de fout (tip: er zijn er twee)?
2. Leg uit waarom het misgaat.
3. Schrijf de verbeterde HTML en CSS.

---

### Huiswerk
Werk je Boulder Base én je eindproject bij:
1. Geen `float` en geen `display: inline-block` meer voor layout - alles via Flexbox
2. Header: logo, navigatie (en eventueel knop) netjes uitgelijnd met `align-items: center`
3. Cards en plans in een wrapper met `display: flex`, `flex-wrap: wrap` en `gap`
4. Cards hebben geen vaste `width` meer, maar `flex: 1 1 <basis>`
5. Knoppen in cards staan onderaan op één lijn
6. Maak het venster smaller en breder: de cards lopen netjes door naar een nieuwe rij

**Extra uitdaging:**
- Speel de eerste 12 levels van [Flexbox Froggy](https://flexboxfroggy.com/#nl) (er is een Nederlandse versie). Schrijf op welke eigenschap je het vaakst nodig had.
- Geef de middelste abonnement-card (`.plan`) een "populair"-label en laat hem opvallen met `order`, een rand en `transform: scale(1.05)`
- Gebruik `justify-content: space-between` in de footer en leg uit waarom de kolommen nu zo verdeeld worden

### Samenvatting: Flexbox spiekbriefje
| Wil je... | Gebruik (op de container) |
|---|---|
| items naast elkaar | `display: flex;` |
| items onder elkaar | `flex-direction: column;` |
| ruimte tussen items | `gap: 20px;` |
| items over de breedte verdelen | `justify-content: space-between;` |
| items verticaal centreren (bij `row`) | `align-items: center;` |
| items naar een nieuwe rij laten gaan | `flex-wrap: wrap;` |

| Wil je... | Gebruik (op het item) |
|---|---|
| item laten meegroeien vanaf een startbreedte | `flex: 1 1 250px;` |
| item naar het einde duwen | `margin-left: auto;` (row) of `margin-top: auto;` (column) |
| één item anders uitlijnen | `align-self: flex-start;` |

---
