## Hoofdstuk 6: Kleuren, Typografie en Navigatie

### Leerdoelen
Na deze les kan de student:
- Een klein, consistent kleurenschema samenstellen en toepassen
- CSS-variabelen gebruiken voor kleuren (`:root`)
- Typografische hiërarchie maken (h1, h2, h3, p)
- Een horizontale navigatiebalk stylen met `display: inline-block`, incl. active/hover state

### Lesopbouw (90 minuten)

**1. Terugblik (5 min)**
- Kort checken: werken de buttons van vorig hoofdstuk met hover?

**2. Kleurenschema en CSS-variabelen (25 min)**

Probleem schetsen: in de starter-website staat `#6c5ce7` op minstens 4 plekken los uitgeschreven. Als de klant een andere kleur wil, moet je overal zoeken.

**Oplossing: CSS-variabelen**
```css
:root {
    --primary: #6c5ce7;
    --dark: #2d3436;
    --light: #f1f2f6;
    --text: #636e72;
}

.header {
    background-color: var(--dark);
}

.btn-primary {
    background-color: var(--primary);
}
```

**Samen doen:** vervang alle hardgecodeerde kleuren in de eigen website/RetroPixel door variabelen. Verander daarna één variabele-waarde en zie de hele site meeveranderen - dit is het "aha-moment" van vandaag.

**3. Typografische hiërarchie (20 min)**
```css
h1 { font-size: 40px; font-weight: bold; }
h2 { font-size: 28px; font-weight: bold; }
h3 { font-size: 20px; font-weight: bold; }
p  { font-size: 16px; line-height: 1.6; }
```
Leg uit: hiërarchie = de bezoeker moet in één oogopslag zien wat belangrijk is. Nooit een `<h3>` groter maken dan een `<h1>`.

**Oefening:** check de eigen website - is de hiërarchie logisch? Past elke heading bij zijn niveau?

**4. Horizontale navigatie stylen (30 min)**

Herhaling + uitbreiding van de `<nav>` uit hoofdstuk 3:
```css
nav {
    display: flex;
    justify-content: flex-end;
    gap: 20px;
}
```
*(Als flexbox nog niet eerder gebruikt is: kort uitleggen dat `display: flex` items automatisch naast elkaar zet - dit komt later in het blok uitgebreider terug.)*

**Active/hover state:**
```css
nav a {
    color: white;
    text-decoration: none;
    padding: 8px 12px;
    border-radius: 4px;
    transition: background-color 0.3s ease;
}

nav a:hover,
nav a.actief {
    background-color: var(--primary);
}
```

**Oefening:** voeg een `.actief` class toe aan de navigatielink van de sectie waar de bezoeker zich "bevindt" (handmatig voor nu, geen JavaScript).

**5. Afronding (10 min)**
- Vragen?
- Volgend hoofdstuk: complete website-opmaak - secties, hero's en footer combineren

### Huiswerk
1. Definieer minimaal 4 CSS-variabelen in `:root` en gebruik ze overal waar die kleur voorkomt
2. Zorg voor een kloppende typografische hiërarchie (h1 > h2 > h3 > p)
3. Style de navigatie met hover-state en `transition`
4. Voeg een `.actief` class toe aan één navigatielink

**Extra uitdaging:**
- Voeg een tweede lettertype toe via Google Fonts voor de headings
- Maak een variabele voor spacing (`--spacing-md: 20px`) en gebruik die in plaats van losse pixelwaarden

### Tips voor docent
- Het "verander één variabele, alles verandert mee" moment is de kern van deze les - zorg dat elke student dit zelf een keer meemaakt
- Typografische hiërarchie is abstract - laat voorbeelden zien van slechte hiërarchie (alles even groot) versus goede
- Flexbox komt hier licht binnen als hulpmiddel voor navigatie - ga er nog niet dieper op in, dat volgt later

### Veelgemaakte fouten
1. `var(--naam)` vergeten - variabele gedefinieerd maar niet gebruikt
2. Typefout in variabele-naam, waardoor de waarde niet toegepast wordt (geen foutmelding in de browser!)
3. Te veel verschillende font-sizes, geen duidelijke hiërarchie
4. `gap` gebruikt zonder `display: flex` erboven, waardoor het geen effect heeft

---
