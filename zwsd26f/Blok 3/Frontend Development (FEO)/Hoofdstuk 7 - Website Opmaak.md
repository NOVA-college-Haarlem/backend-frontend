## Hoofdstuk 7: Complete Website-opmaak

### Leerdoelen
Na deze les kan de student:
- Een complete one-page website structureren met header, hero, meerdere secties en footer
- Secties visueel van elkaar onderscheiden met achtergrondkleuren
- Content centreren en begrenzen met een `.container` class en `max-width`
- Consistente spacing toepassen over de hele pagina

### Lesopbouw (90 minuten)

**1. Terugblik (10 min)**
- Laat 2-3 studenten hun genavigeerde/gekleurde website zien

**2. De pagina als geheel bekijken (15 min)**

Tot nu toe is er per onderdeel (buttons, kleuren, navigatie) gewerkt. Vandaag: kijk naar het grote geheel.

**Vraag aan de klas, kijkend naar hun eigen website:**
- Is duidelijk waar de ene sectie ophoudt en de andere begint?
- Is de content prettig leesbaar op een breed scherm, of loopt tekst van rand tot rand?

**3. De `.container` class (20 min)**
```css
.container {
    max-width: 1100px;
    margin: 0 auto;
    padding: 0 20px;
}
```
Leg uit: dit voorkomt dat tekst op een breed scherm helemaal van links naar rechts loopt (slecht leesbaar), en centreert de content.

**Samen doen:** wrap de content van elke sectie in een `<div class="container">` en zie het verschil op een breed scherm.

**4. Secties visueel onderscheiden (25 min)**
```css
.hero {
    background-color: var(--primary);
    padding: 80px 20px;
    text-align: center;
}

.sectie-licht {
    background-color: var(--light);
    padding: 60px 20px;
}

.sectie-wit {
    background-color: white;
    padding: 60px 20px;
}
```
**Oefening:** geef elke sectie in de eigen website een van deze achtergrond-classes, zodat je met je ogen dicht kan "voelen" waar de ene sectie ophoudt.

**5. Footer met meerdere kolommen (10 min)**
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

**6. Afronding (10 min)**
- Vragen?
- Volgend hoofdstuk: eindproject - alles combineren

### Huiswerk
Werk de eigen website af tot een complete one-page site:
1. Header met navigatie
2. Hero-sectie met duidelijke boodschap en een button
3. Minimaal 3 content-secties met afwisselende achtergrondkleuren
4. Alle content binnen een `.container` (max-width + gecentreerd)
5. Footer met minimaal 2 kolommen info
6. Consistente padding tussen alle secties

**Extra uitdaging:**
- Voeg een call-to-action sectie toe (bijv. "Schrijf je in voor de nieuwsbrief")
- Experimenteer met een subtiele achtergrondafbeelding of gradient in de hero

### Tips voor docent
- Dit is een goed hoofdstuk om studenten elkaars website te laten resizen (browservenster smaller maken) en te bespreken wat er breekt - bereidt voor op latere responsive-lessen
- Laat zien hoe professionele websites `.container`-achtige classes gebruiken (DevTools op een bekende site)

### Veelgemaakte fouten
1. `.container` vergeten op een sectie, waardoor die uit de pas loopt
2. Alle secties dezelfde achtergrondkleur, waardoor structuur niet zichtbaar is
3. `margin: 0 auto` zonder `max-width` (heeft dan geen effect)
4. Footer zonder duidelijke scheiding met de sectie erboven

---
