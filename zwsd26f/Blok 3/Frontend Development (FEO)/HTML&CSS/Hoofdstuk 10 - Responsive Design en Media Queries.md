## Hoofdstuk 10: Responsive Design en Media Queries

*Docentenhandleiding: `Docent/Hoofdstuk 10 - Docentenhandleiding.md`*

**Taakklasse 4 (verdieping)** - Layout: Flexbox & Responsive (vervolg). Startcode: **jouw Boulder Base met Flexbox** (uit Hoofdstuk 9), daarna je eindproject
**PRIMM-fasen dit hoofdstuk:** Predict → Run → Investigate → Modify → **Make**

### Waarom dit hoofdstuk?
Meer dan de helft van alle websitebezoekers zit op een telefoon. Jij bouwt en test je site op een laptop - maar de klant van Boulder Base opent 'm in de bus op een scherm van 390 pixels breed. In dit hoofdstuk leer je hoe je één website maakt die er op een telefoon, tablet én laptop goed uitziet. Dat heet **responsive design**.

### Leerdoelen
Na dit hoofdstuk kan je:
- Uitleggen wat responsive design is en waarom het nodig is
- De **viewport meta-tag** toevoegen en uitleggen wat die doet
- Met de **device toolbar** in DevTools je site testen op verschillende schermbreedtes
- Een **media query** schrijven met `@media (min-width: ...)`
- Uitleggen wat **mobile first** betekent en je CSS in die volgorde opbouwen
- Afbeeldingen en teksten laten meeschalen (`max-width: 100%`, `rem`)

### AI-gebruik dit hoofdstuk
Predict, Run en Investigate: **geen AI**. Modify: AI mag, mits je bij een steekproef kan uitleggen wat een regel doet. Make: AI mag, maar je moet van elke media query kunnen vertellen *vanaf welke breedte* hij werkt en *wat* hij verandert.

---

### Predict
Open je Boulder Base **nog niet** op een smal scherm. Beantwoord eerst in tweetallen:
1. Een telefoon is ongeveer 390px breed. Wat denk je dat er gebeurt met de header (logo + navigatie + knop) op zo'n smal scherm?
2. De cards hebben `flex: 1 1 250px` en `flex-wrap: wrap` (Hoofdstuk 9). Hoeveel cards passen er naast elkaar op een telefoon? En op een tablet van 768px?
3. De `h1` in de hero is `38px`. Is dat op een telefoon te groot, te klein of prima?

### Run
Open Boulder Base in de browser en open DevTools (F12). Klik op het icoontje met de **telefoon en tablet** (Toggle device toolbar, of `Ctrl+Shift+M` / `Cmd+Shift+M` op Mac). Kies bovenin een apparaat, bijvoorbeeld *iPhone 12 Pro*.

- Klopten je voorspellingen?
- Wat gebeurt er met de navigatie?
- Moet je horizontaal scrollen? Waar komt dat door?

Sleep daarna de rechterrand van het scherm langzaam van 320px naar 1200px. Noteer **op welke breedte** iets lelijk wordt of breekt. Die breedtes heb je straks nodig.

---

### Investigate

#### 1. De viewport meta-tag
Kijk in de `<head>` van Boulder Base. Er staat geen regel die de telefoon vertelt hoe breed de pagina is. Zonder die regel doet een telefoon alsof hij ~980px breed is en zoomt hij de hele pagina uit: alles wordt piepklein.

Voeg deze regel toe aan de `<head>`, direct onder `<meta charset="UTF-8">`:
```html
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```
- `width=device-width` → "de pagina is net zo breed als het scherm"
- `initial-scale=1.0` → "niet in- of uitzoomen bij het laden"

Deze regel hoort in **elke** website die je vanaf nu maakt. Zonder deze regel werken je media queries op een echte telefoon niet goed.

#### 2. Wat is een media query?
Een media query is een stukje CSS dat **alleen** geldt als aan een voorwaarde wordt voldaan, bijvoorbeeld: "het scherm is minstens 768px breed".

```css
/* Geldt altijd */
.hero h1 {
    font-size: 28px;
}

/* Geldt alleen als het scherm 768px of breder is */
@media (min-width: 768px) {
    .hero h1 {
        font-size: 38px;
    }
}
```
Lees het hardop: *"Vanaf 768 pixels breed wordt de titel 38 pixels."* Is het scherm smaller, dan wordt het hele blok tussen de `{ }` van `@media` genegeerd.

Let op de dubbele accolades: de `@media` heeft zijn eigen `{ }`, en daarbinnen staan gewone CSS-regels met óók `{ }`.

#### 3. Mobile first
Je kan op twee manieren denken:

| Aanpak | Basis-CSS is voor... | Media query gebruikt | Denkrichting |
|---|---|---|---|
| **Mobile first** | telefoon | `min-width` | "vanaf deze breedte wordt het uitgebreider" |
| Desktop first | laptop | `max-width` | "onder deze breedte moet het kleiner" |

In deze lessen gebruiken we **mobile first**. Waarom?
- Op een telefoon is alles simpel: meestal gewoon alles onder elkaar. Dat is makkelijke basis-CSS.
- Op een groter scherm voeg je dingen toe (naast elkaar, grotere tekst). Dat is logischer dan dingen weer weghalen.
- Een telefoon hoeft zo minder CSS te "overschrijven".

#### 4. Breakpoints
De breedte waarop je layout verandert heet een **breakpoint**. Veelgebruikte breakpoints:

| Breakpoint | Ongeveer |
|---|---|
| geen media query | telefoon (vanaf 320px) |
| `min-width: 768px` | tablet |
| `min-width: 1024px` | laptop / desktop |

Dit zijn richtlijnen, geen wetten. Het beste breakpoint is de breedte waarop **jouw** site lelijk wordt - die heb je bij Run opgeschreven.

#### 5. De volgorde in je CSS telt
CSS leest van boven naar beneden: bij twee regels met dezelfde selector wint de **onderste**. Daarom staan media queries **onderaan** je stylesheet (of direct onder de regel die ze aanpassen). Staat een gewone regel ná je media query, dan overschrijft die de media query - ook op een groot scherm.

#### 6. Meeschalen: afbeeldingen en tekst
```css
img {
    max-width: 100%;
    height: auto;
}
```
Een afbeelding wordt nu nooit breder dan het element waar hij in staat. Zet deze regel standaard bovenaan je CSS.

Voor tekst kan je `rem` gebruiken in plaats van `px`. `1rem` is de standaard-lettergrootte van de browser (meestal 16px). Stelt een gebruiker zijn browser in op grotere letters, dan groeit tekst in `rem` netjes mee - tekst in `px` niet. Dat is beter voor toegankelijkheid.
```css
p  { font-size: 1rem; }     /* 16px */
h2 { font-size: 1.5rem; }   /* 24px */
```

#### Checkvragen (zonder AI, zonder te spieken)
1. Wat gebeurt er op een echte telefoon als je de viewport meta-tag vergeet?
2. `@media (min-width: 1024px) { ... }` - op welke schermen geldt dit? Een telefoon, een tablet, een laptop?
3. Waarom schrijf je bij mobile first de "telefoon-CSS" buiten de media query?
4. Je media query werkt niet. Je ziet dat er onder de media query nog een regel `.hero h1 { font-size: 28px; }` staat. Wat is het probleem?

---

### Modify: Boulder Base responsive maken

#### Stap 1 - viewport en afbeeldingen (samen met de docent)
1. Voeg de viewport meta-tag toe aan de `<head>`
2. Zet `img { max-width: 100%; height: auto; }` bovenaan je CSS (onder de `*`-regel)
3. Test in de device toolbar: moet je nog horizontaal scrollen?

#### Stap 2 - header: op telefoon onder elkaar, vanaf tablet naast elkaar
In Hoofdstuk 9 heb je de header met Flexbox op één rij gezet. Op een telefoon past dat niet. Mobile first betekent: eerst onder elkaar, daarna pas naast elkaar.
```css
/* Telefoon (basis) */
header {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 10px;
}

nav {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 10px;
}

/* Vanaf tablet */
@media (min-width: 768px) {
    header {
        flex-direction: row;
        justify-content: space-between;
    }
}
```
Waarom hoef je binnen de media query `display: flex` niet nóg een keer te schrijven?

#### Stap 3 - typografie (in tweetallen)
Maak de titels op een telefoon kleiner en laat ze vanaf 768px groeien:
- `.hero h1`: telefoon `1.75rem`, vanaf tablet `2.5rem`
- `h2`: telefoon `1.4rem`, vanaf tablet `1.75rem`
- `.hero` padding: telefoon `40px 20px`, vanaf tablet `80px 20px`

Zet alle aanpassingen voor 768px in **één** media query, niet in drie losse. Dat is overzichtelijker.

#### Stap 4 - de cards controleren
Door `flex: 1 1 250px` en `flex-wrap: wrap` uit Hoofdstuk 9 zijn je cards al (grotendeels) responsive, zonder media query! Controleer in de device toolbar:
- Telefoon (390px): 1 card per rij?
- Tablet (768px): 2 cards per rij? Staat de derde card dan alleen, en uitgerekt over de hele breedte?
- Laptop (1200px): 3 cards naast elkaar?

Vind je die ene uitgerekte card op tablet lelijk? Bedenk zelf een oplossing. Denk aan `max-width` op `.card`, of een andere `flex-basis` vanaf 1024px.

#### Stap 5 - footer
De footer (Hoofdstuk 7) heeft `display: flex` en `flex-wrap: wrap`. Controleer: staan de kolommen op een telefoon onder elkaar en goed leesbaar? Het contactformulier: zijn de invoervelden niet breder dan het scherm? (Tip: `width: 100%` op `input` en `textarea`.)

---

### Make: je eindproject responsive
Maak je eindproject uit Hoofdstuk 8 responsive:
1. Viewport meta-tag in de `<head>`
2. Basis-CSS werkt op 390px: niets steekt uit, geen horizontale scrollbalk
3. Minimaal **twee** breakpoints (bijv. 768px en 1024px), mobile first met `min-width`
4. Header/navigatie verandert van onder elkaar (telefoon) naar naast elkaar (groter scherm)
5. Cards: 1 per rij op telefoon, meer naast elkaar op groter scherm
6. Tekstgroottes in `rem`, afbeeldingen met `max-width: 100%`

Maak schermafbeeldingen van je site op 390px, 768px en 1200px (DevTools: drie puntjes in de device toolbar → *Capture screenshot*). Die gebruik je bij je verantwoording.

---

### Debug deze AI-output
Een student vroeg een AI: *"Maak mijn navigatie responsive, op mobiel onder elkaar."* De student zegt: "Op mijn laptop staat alles nu óók onder elkaar, en op mijn telefoon is alles piepklein." Dit is de code:
```html
<head>
    <meta charset="UTF-8">
    <title>Mijn site</title>
    <link rel="stylesheet" href="css/style.css">
</head>
```
```css
@media (min-width: 768) {
    nav {
        flex-direction: row;
    }
}

nav {
    display: flex;
    flex-direction: column;
}
```
1. Vind de **drie** fouten.
2. Leg bij elke fout uit waarom het misgaat.
3. Schrijf de verbeterde versie.

---

### Huiswerk
1. Boulder Base is volledig responsive (telefoon, tablet, laptop) - controleer met de device toolbar
2. Je eindproject voldoet aan alle punten van de **Make**-opdracht hierboven
3. Geen horizontale scrollbalk op 320px breed (het smalste scherm dat je nog tegenkomt)
4. Neem de drie schermafbeeldingen mee naar de volgende les

**Extra uitdaging:**
- Maak op telefoon een "hamburger"-menu: de navigatie is verborgen en verschijnt als je op een knop (☰) klikt. Gebruik de kennis uit JSO Hoofdstuk 5 (`classList.toggle`) en een media query die de knop vanaf 768px verbergt
- Gebruik `clamp()` voor een titel die vloeiend meegroeit: `font-size: clamp(1.75rem, 5vw, 3rem);`. Zoek uit wat de drie waarden betekenen
- Test je site op je eigen telefoon via de *Live Server*-extensie in VS Code (zelfde wifi-netwerk, open het IP-adres van je laptop)

### Samenvatting: responsive spiekbriefje
```html
<!-- Altijd in de <head> -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```
```css
/* 1. Basis = telefoon (buiten media query) */
img { max-width: 100%; height: auto; }
nav { display: flex; flex-direction: column; }

/* 2. Vanaf tablet */
@media (min-width: 768px) {
    nav { flex-direction: row; }
}

/* 3. Vanaf laptop */
@media (min-width: 1024px) {
    .container { max-width: 1100px; }
}
```
- Mobile first → `min-width` → media queries van klein naar groot, **onderaan** je CSS
- Test altijd met de device toolbar op minimaal 390px, 768px en 1200px

---
