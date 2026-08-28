## Hoofdstuk 4: CSS Selectoren en Buttons

*Docentenhandleiding: `Docent/Hoofdstuk 4 - Docentenhandleiding.md`*

**Taakklasse 2 van 3** - Boulder Base (boulderhal, `starter-website-2/index.html`)
**PRIMM-fasen dit hoofdstuk:** Predict → Run → Investigate → Modify

### Leerdoelen
Na dit hoofdstuk kan je:
- Descendant selectors gebruiken (`nav a`, `.card h3`)
- Pseudo-classes `:hover` en `:focus` toepassen
- Duplicatie in button-styling herkennen en consolideren tot herbruikbare classes
- `cursor: pointer` en `transition` toepassen voor betere UX

### AI-gebruik dit hoofdstuk
Predict/Run/Investigate: **geen AI**. Modify: AI mag, mits je bij een steekproef van je code kan uitleggen wat een regel doet.

### Predict
Bekijk `starter-website-2/index.html` en `css/style.css` - **nog niet draaien**. Tel hoe vaak `#ff6b35` en `#1a1a2e` letterlijk terugkomen. Hoeveel verschillende button-classes zie je - lijken ze op elkaar?

### Run
Open de pagina. Klopt je beeld? De site werkt en ziet er redelijk uit - maar hoe zit de code eronder in elkaar?

### Investigate
Bekijk `.knop-card-1`, `.knop-card-2`, `.knop-card-3` naast elkaar: bijna identiek, met kleine verschillen in padding. Is dat expres, of per ongeluk?

**Descendant selector** - in plaats van drie losse classes kun je de bestaande structuur gebruiken:
```css
.card h3 {
    font-size: 18px;
}
```

**Pseudo-classes:**
```css
.knop:hover {
    background-color: #5849c4;
}
.knop:focus {
    outline: 2px solid #ffeaa7;
}
```
`:hover` = tijdens muis erover, `:focus` = wanneer je met Tab navigeert (belangrijk voor toegankelijkheid).

### Modify
1. Vervang `.knop-card-1`, `.knop-card-2`, `.knop-card-3` door één class `.knop-card` en pas die toe op alle drie de knoppen in de HTML
2. Doe hetzelfde voor `.knop-plan-1/2/3` → één class `.knop-plan`
3. Voeg aan beide knop-classes toe: `cursor: pointer`, een `:hover`-state, en een `transition`
4. Voeg een `:focus`-state toe

Test met de Tab-toets of `:focus` zichtbaar is.

### Huiswerk
1. Alle button-duplicatie in Boulder Base is opgelost (één class per knop-type)
2. Elke knop heeft `:hover`, `:focus`, `cursor: pointer` en een `transition`
3. Test met DevTools of er nog steeds (bijna) identieke classes bestaan die je gemist hebt

**Extra uitdaging:**
- Maak een tweede knop-variant (`.knop-outline`) voor minder prominente acties
- Gebruik een descendant selector om alle `<p>`'s binnen `.card` een consistente kleur te geven, zonder een aparte class per paragraaf

---
