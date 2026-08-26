## Hoofdstuk 2: Classes, IDs en het Box Model

### Leerdoelen
Na deze les kan de student:
- Het verschil uitleggen tussen classes en IDs, en wanneer je welke gebruikt
- Het CSS box model uitleggen (content, padding, border, margin)
- Padding, border en margin gericht toepassen om spacing-problemen op te lossen
- DevTools gebruiken om het box model van een element te inspecteren

### Lesopbouw (90 minuten)

**1. Terugblik (10 min)**
- Laat 2-3 studenten hun omgezette `starter-website` laten zien (met stylesheet)
- Kort gezamenlijk checken: staat er nog ergens een `style=` in de HTML?

**2. Classes vs. IDs (20 min)**

**Herhaling met de RetroPixel-site als voorbeeld:**
- `.product` is een **class** - drie elementen delen 'm
- Het `id="contact"` op de footer-sectie is een **ID** - komt maar één keer voor

```css
.product {
    background-color: white;
}

#contact {
    background-color: #222222;
}
```

**Vuistregel herhalen:**
- Class: meerdere elementen, herbruikbaar → gebruik je vaak
- ID: één uniek element per pagina → gebruik je zelden (denk: hoofdtitel, één specifieke sectie)

**Korte oefening:** Laat studenten in de RetroPixel-CSS aanwijzen welke selectors classes zijn en welke IDs, en waarom dat logisch is.

**3. Het Box Model herhalen (20 min)**

Teken/toon het box model diagram (content → padding → border → margin).

**Live probleem oplossen in de starter-website:**
Bekijk de knoppen (`.knop`). De originele inline versie had:
```css
padding: 12px 12px;
padding-left: 25px;
padding-right: 25px;
```
Dit is dubbelop en verwarrend. Los het samen op met de shorthand:
```css
.knop {
    padding: 12px 25px;
}
```

Leg de shorthand-volgorde nogmaals uit (boven, rechts, onder, links / of boven-onder, links-rechts).

**4. Praktische toepassing: spacing verbeteren (25 min)**

De product-kaarten in de starter-website staan nu dicht op elkaar en de hero-sectie voelt vol. Studenten gaan zelfstandig (of in tweetallen):
- `margin-bottom` toevoegen tussen secties (`.hero`, `#over`, `#games`, `#contact`)
- Consistente `padding` toepassen op elke sectie (bijv. `padding: 40px 20px` overal)
- Een `border-radius` toevoegen aan de `.product` kaarten en de `.knop`

**5. DevTools: box model inspecteren (10 min)**
- Open DevTools, selecteer een `.product` element
- Bekijk de box model visualisatie (oranje = padding, groen = margin)
- Verander live de padding-waarde in DevTools en zie het effect, vóórdat je het in de CSS aanpast

**6. Afronding (5 min)**
- Vragen?
- Volgend hoofdstuk: semantische HTML - waarom `<div>` niet altijd de beste keuze is

### Huiswerk
Werk verder aan `starter-website`:
1. Alle secties hebben consistente `padding`
2. Er zit duidelijke `margin` tussen de secties (geen dingen die tegen elkaar aan plakken)
3. De `.product` kaarten hebben een `border-radius`
4. Gebruik minstens 1 nieuwe class die je zelf bedenkt (bijv. `.sectie-titel` voor alle `<h2>`'s)
5. Inspecteer met DevTools of je box model klopt zoals je verwacht

**Extra uitdaging:**
- Voeg `box-shadow` toe aan de `.product` kaarten
- Maak een `.container` class die de hero-tekst een `max-width` geeft en centreert met `margin: 0 auto`

### Tips voor docent
- Gebruik DevTools veel en laat studenten live padding/margin aanpassen - abstract concept wordt concreet zodra ze het zien veranderen
- Herhaal het verschil padding (binnen de rand) vs. margin (buiten de rand) meerdere keren - dit blijft een blijvend verwarpunt
- Benoem expliciet: dit hebben jullie in Blok 1 al gezien, vandaag maken we het weer scherp

### Veelgemaakte fouten
1. Padding en margin door elkaar halen
2. Vergeten dat shorthand-volgorde met de klok mee gaat (boven-rechts-onder-links)
3. Border vergeten alle drie de waardes te geven (width, style, color)
4. Te grote spacing-waarden waardoor de pagina "leeg" aanvoelt

---
