## Hoofdstuk 5: Kleuren, Typografie en CSS-variabelen - Docentenhandleiding

*Bij: `../Hoofdstuk 5 - Kleuren, Typografie en CSS-variabelen.md` (studentversie)*

**Taakklasse 2 van 3** - Boulder Base (vervolg)
**PRIMM-fasen dit hoofdstuk:** korte Investigate → Modify (hoofdmoot)

### Leerdoelen
Na deze les kan de student:
- Uitleggen wat het probleem is van hardgecodeerde kleurwaarden
- CSS-variabelen definiëren en gebruiken (`:root`, `var(--naam)`)
- Een klein, consistent kleurenschema toepassen
- Een typografische hiërarchie aanbrengen (koppen vs. prijzen vs. body-tekst)

### AI-gebruik dit hoofdstuk
Investigate **AI uit**. Modify **AI mag**, mits verantwoord - dit is een goed hoofdstuk om te laten zien dat AI prima CSS-variabelen kan opzetten, máár dat de student moet kunnen navertellen welke variabele waarvoor is.

### Lesopbouw (90 minuten)

**Terugblik (5 min)**
Check: werken de knoppen van vorig hoofdstuk met hover en focus?

**Investigate: het kleurenprobleem (20 min)**
Laat studenten in `style.css` zoeken naar `#ff6b35` en `#1a1a2e`. Tel samen: elk staat 4+ keer los uitgeschreven. Vraag: "De klant wil de huisstijlkleur veranderen naar een ander oranje. Hoeveel plekken moet je aanpassen? Wat als je er één mist?"

**Oplossing: CSS-variabelen**
```css
:root {
    --primary: #ff6b35;
    --dark: #1a1a2e;
    --light: #f4f4f4;
    --text: #444444;
}
```
```css
header {
    background-color: var(--dark);
}
.hero {
    background-color: var(--primary);
}
```

**Modify: variabelen doorvoeren (30 min) - AI mag, met verantwoording**
Studenten vervangen **alle** hardgecodeerde kleuren in Boulder Base door `var(--...)`. Daarna: verander de waarde van `--primary` één keer, en zie de hele site meeveranderen. Dit is het "aha-moment" van dit hoofdstuk - zorg dat elke student dit zelf een keer meemaakt.

**Investigate + Modify: typografische hiërarchie (30 min)**
Bekijk de prijzen in de `.card` en `.plan` blokken: die staan nu in een gewone `<p>`, exact zoals de omschrijving eronder. Vraag: "Is de prijs het belangrijkste op dit kaartje? Zie je dat terug in de styling?"

```css
.card p:last-of-type,
.plan p:last-of-type {
    font-size: 20px;
    font-weight: bold;
    color: var(--primary);
}
```
*(Bespreek `:last-of-type` kort als handige selector, of laat studenten in plaats daarvan een eigen `.prijs`-class toevoegen in de HTML - allebei is een valide oplossing.)*

Breid uit: geef `h1`, `h2`, `h3` en `p` een consistente, logische font-size-hiërarchie door de hele site.

**Afronding (5 min)**
Vragen? Volgend hoofdstuk: navigatie + eigen variant maken van Boulder Base.

### Huiswerk
1. Minimaal 4 CSS-variabelen gedefinieerd in `:root` en overal gebruikt waar die kleur voorkomt
2. Geen losse hex-kleuren meer in de CSS (behalve in `:root` zelf)
3. Prijzen zijn visueel onderscheidend van omschrijvingen (grotere/vetgedrukte tekst, accentkleur)
4. Kloppende hiërarchie: h1 > h2 > h3 > p

**Extra uitdaging:**
- Voeg een variabele toe voor spacing (`--spacing-md: 20px`) en gebruik die in plaats van losse pixelwaarden
- Voeg een tweede lettertype toe via Google Fonts voor de koppen

### Tips voor docent
- Het "verander één variabele, alles verandert mee" moment is de kern van dit hoofdstuk - zorg dat elke student dit zelf ziet gebeuren, niet alleen de docent voordoet
- Typografische hiërarchie is abstract - laat voorbeelden zien van slechte hiërarchie (alles even groot) versus goede
- Bij AI-gebruik hier: laat een student een AI om CSS-variabelen vragen, en bevraag direct daarna wat elke variabele betekent - dat is de verantwoordingseis in actie

### Veelgemaakte fouten
1. `var(--naam)` vergeten - variabele gedefinieerd maar niet gebruikt
2. Typefout in variabele-naam, waardoor de waarde niet toegepast wordt (geen foutmelding in de browser!)
3. Te veel verschillende font-sizes, geen duidelijke hiërarchie
4. Variabelen buiten `:root` definiëren, waardoor ze niet overal beschikbaar zijn

---
