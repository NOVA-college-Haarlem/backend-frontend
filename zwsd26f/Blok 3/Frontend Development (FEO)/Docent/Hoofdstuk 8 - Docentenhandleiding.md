## Hoofdstuk 8: Eindproject - Complete Website + Verantwoording - Docentenhandleiding

*Bij: `../Hoofdstuk 8 - Eindproject.md` (studentversie)*

**Taakklasse 3 van 3** - volledige **Make**
**PRIMM-fase dit hoofdstuk:** Make + verantwoordingsgesprek (i.p.v. alleen een productbeoordeling)

### Projectomschrijving
Afsluitend hoofdstuk van het herhalingsblok. Studenten leveren een complete, opgeschoonde one-page website op waarin alle onderdelen van Blok 3 samenkomen. Dit mag een verdere uitwerking zijn van de eigen variant uit Hoofdstuk 3/6/7, of een nieuw eigen onderwerp - als de technieken maar allemaal terugkomen.

### Leerdoelen
Na dit hoofdstuk kan de student:
- Zelfstandig een complete, nette one-page website opleveren
- Design-keuzes (kleur, typografie, spacing) beargumenteren
- Een willekeurige regel in de eigen code uitleggen: wat doet die, en waarom staat die er?
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

### Weekplanning

**Les 1 (90 min): Bouwen**
- 10 min: eisen doornemen, vragen beantwoorden
- 70 min: zelfstandig bouwen/afmaken (AI mag, mits verantwoordbaar)
- 10 min: korte tussenstand-check per student

**Les 2 (90 min): Peer review + "Debug deze AI-output" + polijsten**
- 15 min: peer review in tweetallen met checklist (zie hieronder)
- 15 min: **"Debug deze AI-output"** - klassikale opdracht, iedereen krijgt dezelfde lap AI-gegenereerde HTML/CSS met 2-3 ingebouwde fouten (bijv. een class die niet matcht, een `var()` met verkeerde naam, een niet-gesloten tag). Vinden, uitleggen waarom het fout is, verbeteren
- 50 min: verbeteringen doorvoeren op basis van feedback
- 10 min: laatste check met DevTools (geen inline styles, geen console-errors)

**Les 3: Verantwoordingsgesprek + presentatie**
In plaats van alleen een productbeoordeling, sluit dit blok af met een kort **verantwoordingsgesprek** per student (5 min), naar het voorbeeld van het backend-assessment:
1. **Demo (1 min):** website tonen
2. **Toelichting (2 min):** waarom deze kleuren, waarom deze structuur
3. **Verantwoordingsvraag (2 min):** docent wijst een willekeurige regel CSS of HTML aan - "wat doet dit, wat gebeurt er als ik het weghaal?"

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

*De verantwoordingscriterium weegt bewust mee als apart criterium - een werkende site zonder uitleg is niet voldoende, net zomin als in het backend-blok.*

### Tips voor docent
- Vergelijk aan het eind kort de originele starter-site (RetroPixel of Boulder Base) met het eindresultaat - maakt de vooruitgang van het hele blok zichtbaar
- Gebruik dit moment om te bepalen wie er klaar is voor Blok 4 en wie meer herhaling nodig heeft
- Houd het vieren van vooruitgang centraal - dit was een inhaalblok, dus groei is belangrijker dan perfectie
- Het verantwoordingsgesprek hoeft niet formeel/eng te zijn - een informeel gesprek van 5 minuten werkt net zo goed, zolang het maar structureel gebeurt (niet alleen bij twijfelgevallen)

---
