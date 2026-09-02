## Hoofdstuk 8: Eindproject - Complete Website + Verantwoording

*Docentenhandleiding: `Docent/Hoofdstuk 8 - Docentenhandleiding.md`*

**Taakklasse 3 van 3** - volledige **Make**
**PRIMM-fase dit hoofdstuk:** Make + verantwoordingsgesprek

### Projectomschrijving
Afsluitend hoofdstuk van het herhalingsblok. Je levert een complete, opgeschoonde one-page website op waarin alle onderdelen van Blok 3 samenkomen. Dit mag een verdere uitwerking zijn van je eigen variant uit Hoofdstuk 3/6/7, of een nieuw eigen onderwerp - als de technieken maar allemaal terugkomen.

### Leerdoelen
Na dit hoofdstuk kan je:
- Zelfstandig een complete, nette one-page website opleveren
- Design-keuzes (kleur, typografie, spacing) beargumenteren
- Een willekeurige regel in je eigen code uitleggen: wat doet die, en waarom staat die er?
- Een stuk (AI-)code controleren op fouten en verbeteren

### Projecteisen (Voldoende)

**Techniek:**
- [ ] Geen inline `style="..."` in de HTML
- [ ] Eén externe stylesheet met CSS-variabelen voor kleuren
- [ ] Semantische structuur: `<header>`, `<nav>`, `<main>` met `<section>`'s, `<footer>`
- [ ] Consistente padding/margin, geen elementen die tegen elkaar aan plakken
- [ ] Minimaal 2 button-varianten met hover- én focus-state, zonder duplicatie
- [ ] Content gecentreerd/begrensd met `.container`

**Inhoud:**
- [ ] Header met navigatie (minimaal 3 links, met hover-state)
- [ ] Hero-sectie met duidelijke boodschap
- [ ] Minimaal 3 content-secties
- [ ] Footer met contactinfo

**Design:**
- [ ] Consistent kleurenschema (3-4 kleuren via variabelen)
- [ ] Kloppende typografische hiërarchie
- [ ] Secties visueel van elkaar te onderscheiden

### Bonus (Goed/Uitstekend)
- [ ] `box-shadow` en `border-radius` bewust ingezet
- [ ] Call-to-action sectie
- [ ] Eigen Google Font gebruikt

### Programma

**Les 1: Bouwen** - zelfstandig bouwen/afmaken (AI mag, mits verantwoordbaar)

**Les 2: Peer review + Debug deze AI-output + polijsten**
- Peer review in tweetallen met de checklist hieronder
- **Debug deze AI-output:** je krijgt een lap AI-gegenereerde HTML/CSS met 2-3 ingebouwde fouten. Vind ze, leg uit waarom het fout is, en verbeter ze
- Verbeteringen doorvoeren op basis van feedback
- Laatste check met DevTools (geen inline styles, geen console-errors)

**Les 3: Verantwoordingsgesprek + presentatie**
Kort gesprek per student (5 min):
1. **Demo:** website tonen
2. **Toelichting:** waarom deze kleuren, waarom deze structuur
3. **Verantwoordingsvraag:** een willekeurige regel CSS of HTML wordt aangewezen - "wat doet dit, wat gebeurt er als je het weghaalt?"

### Peer Review Checklist
- [ ] Geen `style=` attributen meer in de HTML (check in DevTools)
- [ ] Logische semantische structuur (header/main/section/footer)
- [ ] CSS-variabelen gebruikt voor kleuren
- [ ] Navigatie werkt en heeft een hover-effect
- [ ] Spacing voelt consistent aan, niets plakt tegen elkaar
- [ ] Kun je, als peer, een willekeurige regel CSS laten uitleggen door je klasgenoot?

### Beoordelingscriteria

| Criterium | Onvoldoende | Voldoende | Goed |
|---|---|---|---|
| **CSS-structuur** | Nog inline styles aanwezig | Volledig extern, classes gebruikt | Extern + CSS-variabelen consequent toegepast |
| **Semantiek** | Alles nog `<div>` | Header/main/section/footer aanwezig | Semantiek + logische comments/structuur |
| **Spacing (box model)** | Inconsistent, elementen plakken | Consistente padding/margin | Doordacht gebruik van `.container` en spacing-ritme |
| **Design** | Geen samenhang | Consistent kleurenschema en hiërarchie | Professioneel ogend, prettige leesbaarheid |
| **Verantwoording** | Kan aangewezen regel niet uitleggen | Kan de meeste code uitleggen | Legt keuzes en code overtuigend en zelfstandig uit, ook AI-gegenereerde delen |

---
