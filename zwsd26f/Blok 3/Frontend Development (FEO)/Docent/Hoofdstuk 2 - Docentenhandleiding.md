## Hoofdstuk 2: Classes, IDs en het Box Model - Docentenhandleiding

*Bij: `../Hoofdstuk 2 - Classes, IDs en Box Model.md` (studentversie)*

**Taakklasse 1 van 3** - RetroPixel (vervolg)
**PRIMM-fasen dit hoofdstuk:** korte Investigate-herhaling → Modify (hoofdmoot)

### Leerdoelen
Na deze les kan de student:
- Het verschil uitleggen tussen classes en IDs, en wanneer je welke gebruikt
- Het CSS box model uitleggen (content, padding, border, margin)
- Padding, border en margin gericht toepassen om spacing-problemen op te lossen
- DevTools gebruiken om het box model van een element te inspecteren

### AI-gebruik dit hoofdstuk
Investigate-onderdelen (classes vs. IDs, box model) **AI uit** - dit is theorie die je moet kunnen navertellen. Bij de Modify-oefeningen (spacing verbeteren) **mag AI**, mits je bij een steekproef kan uitleggen wat een regel doet.

### Lesopbouw (90 minuten)

**Terugblik / korte Run-Investigate (10 min)**
Laat 2-3 studenten hun omgezette `starter-website` zien (met stylesheet). Check gezamenlijk: staat er nog ergens een `style=` in de HTML?

**Investigate: Classes vs. IDs (20 min)**
Aan de hand van de RetroPixel-CSS:
- `.header` is een **class** - kan op meerdere elementen
- Het `id="contact"` op de footer is een **ID** - komt maar één keer voor

```css
.header {
    background-color: #222222;
}
#contact {
    background-color: #222222;
}
```

**Vuistregel:** class = herbruikbaar, gebruik je vaak. ID = uniek, gebruik je zelden.

**Korte oefening:** laat studenten in de RetroPixel-CSS aanwijzen welke selectors classes zijn en welke IDs, en waarom dat logisch is.

**Investigate: Box Model (20 min)**
Teken/toon het box model diagram (content → padding → border → margin).

**Live probleem oplossen in de starter-website:**
De knoppen (`.knop`) hadden origineel:
```css
padding: 12px 12px;
padding-left: 25px;
padding-right: 25px;
```
Dit is dubbelop. Los het samen op met de shorthand:
```css
.knop {
    padding: 12px 25px;
}
```

**Modify: spacing verbeteren (30 min) - AI mag, met verantwoording**
Zelfstandig of in tweetallen:
- `margin-bottom` toevoegen tussen secties (`.hero`, `#over`, `#games`, `#contact`)
- Consistente `padding` toepassen op elke sectie (bijv. `padding: 40px 20px` overal)
- Een `border-radius` toevoegen aan de `.product` kaarten en de `.knop`

**DevTools: box model inspecteren (10 min)**
Open DevTools, selecteer een `.product` element, bekijk de box model visualisatie (oranje = padding, groen = margin). Verander live de padding-waarde in DevTools vóórdat je het in de CSS aanpast.

### Huiswerk
Werk verder aan `starter-website`:
1. Alle secties hebben consistente `padding`
2. Duidelijke `margin` tussen de secties (geen elementen die tegen elkaar aan plakken)
3. De `.product` kaarten hebben een `border-radius`
4. Gebruik minstens 1 nieuwe class die je zelf bedenkt (bijv. `.sectie-titel` voor alle `<h2>`'s)

**Extra uitdaging:**
- Voeg `box-shadow` toe aan de `.product` kaarten
- Maak een `.container` class die de hero-tekst een `max-width` geeft en centreert met `margin: 0 auto`

### Tips voor docent
- Gebruik DevTools veel en laat studenten live padding/margin aanpassen - abstract concept wordt concreet zodra ze het zien veranderen
- Herhaal het verschil padding (binnen de rand) vs. margin (buiten de rand) meerdere keren
- Benoem expliciet: dit hebben jullie in Blok 1 al gezien, vandaag maken we het weer scherp

### Veelgemaakte fouten
1. Padding en margin door elkaar halen
2. Vergeten dat shorthand-volgorde met de klok mee gaat (boven-rechts-onder-links)
3. Border vergeten alle drie de waardes te geven (width, style, color)
4. Te grote spacing-waarden waardoor de pagina "leeg" aanvoelt

---
