## Hoofdstuk 8: Eindproject - Complete Persoonlijke of Thema-website

### Projectomschrijving
Afsluitend hoofdstuk van het herhalingsblok. Studenten leveren een complete, opgeschoonde one-page website op waarin alle onderdelen van Blok 3 samenkomen: externe CSS, classes/IDs, box model, semantische HTML, selectoren, buttons, kleurenschema met variabelen, typografie, navigatie en sectie-opmaak.

### Leerdoelen
Na dit hoofdstuk kan de student:
- Zelfstandig een complete, nette one-page website opleveren
- Design-keuzes (kleur, typografie, spacing) beargumenteren
- Eigen werk presenteren en toelichten
- Code reviewen op basis van een vaste checklist

### Projecteisen (Voldoende)

**Techniek:**
- [ ] Geen inline `style="..."` in de HTML
- [ ] Eén externe stylesheet met CSS-variabelen voor kleuren
- [ ] Semantische structuur: `<header>`, `<nav>`, `<main>` met `<section>`'s, `<footer>`
- [ ] Consistente padding/margin, geen elementen die tegen elkaar aan plakken
- [ ] Minimaal 2 button-varianten met hover-state
- [ ] Content gecentreerd/begrensd met `.container`

**Inhoud:**
- [ ] Header met navigatie (minimaal 3 links)
- [ ] Hero-sectie met duidelijke boodschap
- [ ] Minimaal 3 content-secties
- [ ] Footer met contactinfo

**Design:**
- [ ] Consistent kleurenschema (3-4 kleuren via variabelen)
- [ ] Kloppende typografische hiërarchie
- [ ] Secties visueel van elkaar te onderscheiden

### Bonus (Goed/Uitstekend)
- [ ] `box-shadow` en `border-radius` bewust ingezet
- [ ] `:focus` states voor toegankelijkheid
- [ ] Call-to-action sectie
- [ ] Eigen Google Font gebruikt

### Hoofdstukplanning

**Les 1 (90 min): Bouwen**
- 10 min: eisen doornemen, vragen beantwoorden
- 70 min: zelfstandig bouwen/afmaken
- 10 min: korte tussenstand-check per student

**Les 2 (90 min): Peer review + polijsten**
- 20 min: peer review in tweetallen met checklist (zie hieronder)
- 60 min: verbeteringen doorvoeren op basis van feedback
- 10 min: laatste check met DevTools (geen inline styles, geen console-errors)

**Les 3: Presentaties**
Elke student presenteert (3-4 min):
1. Demo van de website
2. Uitleg van het kleurenschema en waarom deze kleuren
3. Eén ding waar ze trots op zijn, één ding dat lastig was

### Peer Review Checklist
- [ ] Geen `style=` attributen meer in de HTML (check in DevTools)
- [ ] Logische semantische structuur (header/main/section/footer)
- [ ] CSS-variabelen gebruikt voor kleuren
- [ ] Navigatie werkt en heeft een hover-effect
- [ ] Spacing voelt consistent aan, niets plakt tegen elkaar

### Beoordelingscriteria

| Criterium | Onvoldoende | Voldoende | Goed |
|---|---|---|---|
| **CSS-structuur** | Nog inline styles aanwezig | Volledig extern, classes gebruikt | Extern + CSS-variabelen consequent toegepast |
| **Semantiek** | Alles nog `<div>` | Header/main/section/footer aanwezig | Semantiek + logische comments/structuur |
| **Spacing (box model)** | Inconsistent, elementen plakken | Consistente padding/margin | Doordacht gebruik van `.container` en spacing-ritme |
| **Design** | Geen samenhang | Consistent kleurenschema en hiërarchie | Professioneel ogend, prettige leesbaarheid |
| **Presentatie** | Kan keuzes niet toelichten | Kan demo geven en basis toelichten | Kan design-keuzes goed beargumenteren |

### Tips voor docent
- Vergelijk aan het eind van de presentatie kort de originele `starter-website/index.html` met een goed eindresultaat - maakt de vooruitgang van het hele blok zichtbaar
- Gebruik dit moment om te bepalen wie er klaar is voor Blok 4 (formulieren, responsive) en wie meer herhaling nodig heeft
- Houd het vieren van vooruitgang centraal - dit was een inhaalblok, dus groei is belangrijker dan perfectie

---
