## Hoofdstuk 8b: Namaakopdracht Fietsfix - Docentenhandleiding

*Bij: `../HTML&CSS/Hoofdstuk 8b - Namaakopdracht Fietsfix.md` (studentversie)*
*Modeluitwerking: `fietsfix-uitwerking/` (open `index.html` in de browser)*

**Type:** extra Make-opdracht bij/na het eindproject (H8). Bruikbaar als opvulling voor studenten die klaar zijn, of als klassikale les van 2 × 90 min vóór H9.
**Technieken:** uitsluitend H1-H8. Geen Flexbox: de layout gebruikt `float` (nav) en `display: inline-block` (cards, tarieven, footerkolommen), net als Boulder Base.

### Waarom deze opdracht?
In het eindproject ontwerpen studenten zelf. Dat maakt beoordelen lastig: een slordige site kan "een keuze" zijn. Bij een namaakopdracht is er een objectieve maatstaf: lijkt het op het ontwerp of niet? Studenten moeten nu precies kijken, waarden overnemen en zelf de vertaalslag van beeld naar CSS maken. Dat is ook precies hoe het in een stagebedrijf gaat (designer → developer).

De mockup is een **afbeelding**, geen HTML. Studenten kunnen dus niet de broncode bekijken.

### Leerdoelen
Na deze opdracht kan de student:
- Een mockup opdelen in secties en herhaalde componenten
- Een stijlgids vertalen naar CSS-variabelen
- Varianten oplossen met een basis-class + modifier-class (knoppen, uitgelicht tarief)
- Het eigen resultaat systematisch vergelijken met een ontwerp

### Voorbereiding
- Mockup (`HTML&CSS/assets/fietsfix-mockup.png`) op het bord kunnen tonen
- Modeluitwerking openen in de browser, zodat je hover-states kunt demonstreren (die zie je niet op een screenshot)
- Mockup nodig in een andere maat? Open `fietsfix-uitwerking/index.html` via een lokale server en maak een nieuwe full-page screenshot

### Lesopbouw (2 lessen van 90 minuten)

#### Les 1: analyseren en structuur

**Introductie (10 min)**
Toon de mockup. "Een klant heeft dit ontwerp laten maken. Jullie zijn het webbureau." Demonstreer in de modeluitwerking de hover-states van navigatie en knoppen. Laat géén code zien.

**Stap 1 - Analyse (20 min) - AI uit**
Individueel, daarna in tweetallen vergelijken. Antwoorden:
1. Secties: `<header>` (logo + `<nav>`) → `<main>` met `<section class="hero">`, `<section id="diensten">`, `<section id="tarieven">`, `<section class="cta">` → `<footer>`
2. Herhaald: 3 cards (`.card`), 3 tarieven (`.plan`), 3 footerkolommen, 3 sectietitels + intro-regel, nummerbolletjes
3. Twee knop-varianten. Gedeeld: padding, radius, rand van 2px, font-weight. Verschil: gevuld (primair) vs. alleen rand (secundair). → `.knop` + `.knop-primair` / `.knop-secundair` (herhaling H4)
4. Extra class `.plan-uitgelicht` naast `.plan`, die alleen achtergrond en tekstkleur overschrijft
5. Hero, tarieven, CTA, header en footer. Techniek: de sectie krijgt de achtergrondkleur, een `.container` erbinnen begrenst de inhoud (H7)

Teken stap 1 af voordat studenten gaan bouwen. Wie hier "alles `<div>`" opschrijft, gaat het later ook zo bouwen.

**Stap 2 - HTML (25 min) - AI uit**
Loop rond. Controleer vooral:
- Staat `.container` *binnen* de `<section>`? (Niet andersom, anders loopt de achtergrond niet door.)
- Gebruiken ze `<article>` voor de cards/tarieven? Niet verplicht voor een voldoende, wel een goed gespreksonderwerp
- Hebben de secties een `id` die past bij de nav-links (`#diensten`, `#tarieven`, `#over`, `#contact`)?

**Stap 3 - Variabelen en basis (25 min)**
Vergelijk met `css/style.css` van de uitwerking, blok "Variabelen" en "Reset". Let op dat studenten de Google Fonts-link in de `<head>` zetten en de font-family met een fallback schrijven.

**Afronding (10 min)**
Header klassikaal bouwen, zodat iedereen met een werkend begin naar huis gaat. Bespreek `overflow: hidden` op `header`: zonder dat zakt de header in, omdat `nav` gefloat is.

#### Les 2: bouwen en vergelijken

**Bouwen (60 min) - AI mag**
Studenten werken sectie voor sectie. Bekende struikelpunten:

| Probleem | Oorzaak | Oplossing |
|---|---|---|
| Cards staan onder elkaar | `width` te groot: 3 × (320 + 2×10 margin) + spaties tussen inline-blocks past niet | Container moet 1100px zijn met 20px padding; anders cards smaller |
| Cards met minder tekst "zakken" naar beneden | Inline-blocks lijnen uit op de baseline | `vertical-align: top` |
| Tekst in cards gecentreerd | `.sectie` heeft `text-align: center` en dat erft door | `text-align: left` op `.card` |
| Header-achtergrond is maar een paar pixels hoog | Gefloat element telt niet mee in de hoogte | `overflow: hidden` op `header` |
| Knop in de CTA is onzichtbaar | Oranje knop op oranje achtergrond | Override: `.cta .knop-primair` donker maken (zie uitwerking) |
| Hover werkt niet met Tab | Alleen `:hover` geschreven | `:focus` toevoegen (eis uit H4/H8) |

**Stap 5 - Vergelijken (15 min)**
Laat studenten hun screenshot naast de mockup leggen. Typische verschillen die ze zelf moeten kunnen benoemen: font niet geladen (Arial zichtbaar), regelafstand, ontbrekende schaduw, verkeerde card-breedte.

**Verantwoordingsvragen (rondlopen, 15 min)**
- *"Waarom staat `.container` binnen de section en niet erom heen?"*
- *"Wat gebeurt er als je `vertical-align: top` weghaalt?"*
- *"Hoe heb je het middelste tarief anders gemaakt zonder CSS te kopiëren?"*
- *"Waarom is de CTA-knop donker terwijl `.knop-primair` oranje is?"* (specificiteit: `.cta .knop-primair` wint)
- *"Waarom staat er `overflow: hidden` op de header?"*

### Beoordeling (indicatief)

| Criterium | Onvoldoende | Voldoende | Goed |
|---|---|---|---|
| **Gelijkenis** | Secties ontbreken of kloppen niet | Alle secties, kleuren en fonts kloppen | Ook spacing, schaduwen en hover-states kloppen |
| **CSS-structuur** | Losse hex-codes, inline styles | Variabelen, extern, classes | Basis- + variant-classes, geen duplicatie |
| **Semantiek** | Alles `<div>` | header/nav/main/section/footer | Ook `<article>`, logische id's |
| **Verantwoording** | Kan regels niet uitleggen | Kan de meeste code uitleggen | Legt ook float/inline-block-trucs en specificiteit uit |

### Brug naar H9 en H10
De uitwerking leunt bewust op `float` en `inline-block`. Maak het browservenster smaller en laat zien wat er gebeurt: de cards springen onvoorspelbaar en de nav valt onder het logo. Precies de problemen die H9 (Flexbox) en H10 (media queries) oplossen. De bonuseis "ombouwen naar Flexbox" is dus een goede huiswerkopdracht na H9.

### Let op
De modeluitwerking staat in deze (publieke) repo, net als de andere docentenhandleidingen. Studenten die zoeken, kunnen hem vinden. Het verantwoordingsgesprek vangt dat op: wie de code niet kan uitleggen, heeft hem niet zelf gemaakt.
