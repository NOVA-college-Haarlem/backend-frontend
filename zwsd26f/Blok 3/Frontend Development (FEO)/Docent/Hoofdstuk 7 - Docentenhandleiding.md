## Hoofdstuk 7: Complete Website-opmaak - Docentenhandleiding

*Bij: `../Hoofdstuk 7 - Website Opmaak.md` (studentversie)*

**Taakklasse 3 van 3** - eigen variant (van RetroPixel of Boulder Base) wordt afgerond
**PRIMM-fasen dit hoofdstuk:** Predict → Investigate → Modify

### Leerdoelen
Na deze les kan de student:
- Een complete one-page website structureren met header, hero, meerdere secties en footer
- Secties visueel van elkaar onderscheiden met achtergrondkleuren
- Content centreren en begrenzen met een `.container` class en `max-width`
- Consistente spacing toepassen over de hele pagina

### AI-gebruik dit hoofdstuk
Predict/Investigate **AI uit**. Modify **AI mag**, mits verantwoord.

### Lesopbouw (90 minuten)

**Predict (10 min)**
Laat studenten hun eigen variant (uit Hoofdstuk 3 of 6) op een breed scherm bekijken en voorspellen: *"Wat gebeurt er met de tekst als ik het browservenster heel breed maak?"*

**Investigate (20 min)**
Maak het venster breed. De tekst loopt waarschijnlijk van rand tot rand - slecht leesbaar. Vraag: "Is duidelijk waar de ene sectie ophoudt en de andere begint?"

**De `.container` class:**
```css
.container {
    max-width: 1100px;
    margin: 0 auto;
    padding: 0 20px;
}
```
Leg uit: dit voorkomt dat tekst op een breed scherm helemaal van links naar rechts loopt, en centreert de content.

**Modify (55 min) - AI mag, met verantwoording**

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

**Afronding (5 min)**
Vragen? Volgend hoofdstuk: eindproject - alles combineren.

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

### Tips voor docent
- Laat studenten elkaars website resizen (browservenster smaller maken) en bespreken wat er breekt - bereidt voor op latere responsive-lessen
- Laat zien hoe professionele websites `.container`-achtige classes gebruiken (DevTools op een bekende site)

### Veelgemaakte fouten
1. `.container` vergeten op een sectie, waardoor die uit de pas loopt
2. Alle secties dezelfde achtergrondkleur, waardoor structuur niet zichtbaar is
3. `margin: 0 auto` zonder `max-width` (heeft dan geen effect)
4. Footer zonder duidelijke scheiding met de sectie erboven

---
