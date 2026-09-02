## Hoofdstuk 7: Complete Website-opmaak

*Docentenhandleiding: `Docent/Hoofdstuk 7 - Docentenhandleiding.md`*

**Taakklasse 3 van 3** - eigen variant (van RetroPixel of Boulder Base) wordt afgerond
**PRIMM-fasen dit hoofdstuk:** Predict → Investigate → Modify

### Leerdoelen
Na dit hoofdstuk kan je:
- Een complete one-page website structureren met header, hero, meerdere secties en footer
- Secties visueel van elkaar onderscheiden met achtergrondkleuren
- Content centreren en begrenzen met een `.container` class en `max-width`
- Consistente spacing toepassen over de hele pagina

### AI-gebruik dit hoofdstuk
Predict/Investigate: **geen AI**. Modify: AI mag, mits verantwoord.

### Predict
Bekijk je eigen variant (uit Hoofdstuk 3 of 6) op een breed scherm. Voorspel: wat gebeurt er met de tekst als je het browservenster heel breed maakt?

### Investigate
Maak het venster breed. Loopt de tekst van rand tot rand? Is duidelijk waar de ene sectie ophoudt en de andere begint?

**De `.container` class:**
```css
.container {
    max-width: 1100px;
    margin: 0 auto;
    padding: 0 20px;
}
```
Dit voorkomt dat tekst op een breed scherm van links naar rechts loopt, en centreert de content.

### Modify
1. Wrap de content van elke sectie in een `<div class="container">` en bekijk het verschil op een breed scherm
2. Geef elke sectie een van deze achtergrond-classes zodat je met je ogen dicht kan "voelen" waar de ene sectie ophoudt:
```css
.sectie-licht { background-color: var(--light); padding: 60px 20px; }
.sectie-wit   { background-color: white; padding: 60px 20px; }
```
3. Geef de footer meerdere kolommen:
```css
footer {
    background-color: var(--dark);
    padding: 40px 20px;
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    gap: 20px;
}
```

### Huiswerk
Werk de eigen variant af tot een complete one-page site:
1. Header met navigatie
2. Hero-sectie met duidelijke boodschap en een button
3. Minimaal 3 content-secties met afwisselende achtergrondkleuren
4. Alle content binnen een `.container` (max-width + gecentreerd)
5. Footer met minimaal 2 kolommen info
6. Consistente padding tussen alle secties

**Extra uitdaging:**
- Voeg een call-to-action sectie toe
- Experimenteer met een subtiele achtergrondafbeelding of gradient in de hero

---
