## Hoofdstuk 2: Classes, IDs en het Box Model

*Docentenhandleiding: `Docent/Hoofdstuk 2 - Docentenhandleiding.md`*

**Taakklasse 1 van 3** - RetroPixel (vervolg)
**PRIMM-fasen dit hoofdstuk:** korte Investigate-herhaling → Modify

### Leerdoelen
Na dit hoofdstuk kan je:
- Het verschil uitleggen tussen classes en IDs, en wanneer je welke gebruikt
- Het CSS box model uitleggen (content, padding, border, margin)
- Padding, border en margin gericht toepassen om spacing-problemen op te lossen
- DevTools gebruiken om het box model van een element te inspecteren

### AI-gebruik dit hoofdstuk
Bij de theorie (classes vs. IDs, box model): **geen AI** - dit moet je zelf kunnen navertellen. Bij de Modify-oefening (spacing verbeteren) mag AI, mits je bij een steekproef kan uitleggen wat een regel doet.

### Investigate: classes vs. IDs
Bekijk de RetroPixel-CSS:
```css
.header {
    background-color: #222222;
}
#contact {
    background-color: #222222;
}
```
- `.header` is een **class** - kan op meerdere elementen
- `id="contact"` op de footer is een **ID** - komt maar één keer voor

**Vuistregel:** class = herbruikbaar, gebruik je vaak. ID = uniek, gebruik je zelden.

Wijs in de RetroPixel-CSS aan welke selectors classes zijn en welke IDs, en waarom dat logisch is.

### Investigate: het box model
Content → padding → border → margin. De knoppen (`.knop`) hadden origineel:
```css
padding: 12px 12px;
padding-left: 25px;
padding-right: 25px;
```
Dit is dubbelop. Los het op met de shorthand:
```css
.knop {
    padding: 12px 25px;
}
```

### Modify: spacing verbeteren
Zelfstandig of in tweetallen:
- `margin-bottom` toevoegen tussen secties (`.hero`, `#over`, `#games`, `#contact`)
- Consistente `padding` toepassen op elke sectie (bijv. `padding: 40px 20px` overal)
- Een `border-radius` toevoegen aan de `.product` kaarten en de `.knop`

**DevTools:** open DevTools, selecteer een `.product` element, bekijk de box model-visualisatie (oranje = padding, groen = margin). Verander de padding-waarde live in DevTools vóórdat je het in de CSS aanpast.

### Huiswerk
Werk verder aan `starter-website`:
1. Alle secties hebben consistente `padding`
2. Duidelijke `margin` tussen de secties (geen elementen die tegen elkaar aan plakken)
3. De `.product` kaarten hebben een `border-radius`
4. Gebruik minstens 1 nieuwe class die je zelf bedenkt (bijv. `.sectie-titel` voor alle `<h2>`'s)

**Extra uitdaging:**
- Voeg `box-shadow` toe aan de `.product` kaarten
- Maak een `.container` class die de hero-tekst een `max-width` geeft en centreert met `margin: 0 auto`

---
