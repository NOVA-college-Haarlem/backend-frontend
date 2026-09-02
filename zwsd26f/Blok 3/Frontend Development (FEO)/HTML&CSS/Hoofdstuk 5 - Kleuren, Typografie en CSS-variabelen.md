## Hoofdstuk 5: Kleuren, Typografie en CSS-variabelen

*Docentenhandleiding: `Docent/Hoofdstuk 5 - Docentenhandleiding.md`*

**Taakklasse 2 van 3** - Boulder Base (vervolg)
**PRIMM-fasen dit hoofdstuk:** korte Investigate → Modify

### Leerdoelen
Na dit hoofdstuk kan je:
- Uitleggen wat het probleem is van hardgecodeerde kleurwaarden
- CSS-variabelen definiëren en gebruiken (`:root`, `var(--naam)`)
- Een klein, consistent kleurenschema toepassen
- Een typografische hiërarchie aanbrengen (koppen vs. prijzen vs. body-tekst)

### AI-gebruik dit hoofdstuk
Investigate: **geen AI**. Modify: AI mag, mits verantwoord.

### Investigate: het kleurenprobleem
Zoek in `style.css` naar `#ff6b35` en `#1a1a2e`. Tel: elk staat 4+ keer los uitgeschreven. Stel: de klant wil de huisstijlkleur veranderen naar een ander oranje - hoeveel plekken moet je aanpassen? Wat als je er één mist?

**Oplossing - CSS-variabelen:**
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

### Modify: variabelen doorvoeren
Vervang **alle** hardgecodeerde kleuren in Boulder Base door `var(--...)`. Verander daarna de waarde van `--primary` één keer, en bekijk wat er met de hele site gebeurt.

### Investigate + Modify: typografische hiërarchie
Bekijk de prijzen in de `.card` en `.plan` blokken: die staan nu in een gewone `<p>`, precies zoals de omschrijving eronder. Is de prijs het belangrijkste op dit kaartje? Zie je dat terug in de styling?

```css
.card p:last-of-type,
.plan p:last-of-type {
    font-size: 20px;
    font-weight: bold;
    color: var(--primary);
}
```
*(Je mag ook een eigen `.prijs`-class toevoegen in de HTML in plaats van `:last-of-type` - allebei is een geldige oplossing.)*

Breid uit: geef `h1`, `h2`, `h3` en `p` een consistente, logische font-size-hiërarchie door de hele site.

### Huiswerk
1. Minimaal 4 CSS-variabelen gedefinieerd in `:root` en overal gebruikt waar die kleur voorkomt
2. Geen losse hex-kleuren meer in de CSS (behalve in `:root` zelf)
3. Prijzen zijn visueel onderscheidend van omschrijvingen (grotere/vetgedrukte tekst, accentkleur)
4. Kloppende hiërarchie: h1 > h2 > h3 > p

**Extra uitdaging:**
- Voeg een variabele toe voor spacing (`--spacing-md: 20px`) en gebruik die in plaats van losse pixelwaarden
- Voeg een tweede lettertype toe via Google Fonts voor de koppen

---
