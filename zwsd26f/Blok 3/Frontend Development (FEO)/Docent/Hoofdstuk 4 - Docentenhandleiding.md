## Hoofdstuk 4: CSS Selectoren en Buttons - Docentenhandleiding

*Bij: `../Hoofdstuk 4 - CSS Selectoren en Buttons.md` (studentversie)*

**Taakklasse 2 van 3** - Boulder Base (boulderhal, `starter-website-2/index.html`)
**PRIMM-fasen dit hoofdstuk:** Predict → Run → Investigate → begeleide Modify

### Nieuwe taakklasse, hogere complexiteit
Boulder Base is - anders dan RetroPixel bij de start - **al opgezet met een externe stylesheet**. De site heeft wél nieuwe gebreken: veel herhaalde, bijna-identieke button-classes, kleuren die op zes plekken los zijn uitgeschreven, geen hover/focus states, en tekst die niet visueel is uitgelijnd naar belang. Dat is precies waarom dit een volgende taakklasse is: dezelfde soort taak (een site verbeteren), maar complexer.

### Leerdoelen
Na deze les kan de student:
- Descendant selectors gebruiken (`nav a`, `.card h3`)
- Pseudo-classes `:hover` en `:focus` toepassen
- Duplicatie in button-styling herkennen en consolideren tot herbruikbare classes
- `cursor: pointer` en `transition` toepassen voor betere UX

### AI-gebruik dit hoofdstuk
Predict/Run/Investigate: **AI uit**. Modify: **AI mag**, mits je bij een steekproef van je code kan uitleggen wat een regel doet.

### Lesopbouw (90 minuten)

**Predict (10 min)**
Deel `starter-website-2/index.html` en `css/style.css` uit - **nog niet draaien**. Laat studenten de CSS scannen: *"Tel hoe vaak je `#ff6b35` en `#1a1a2e` letterlijk terugziet. En: hoeveel verschillende button-classes zie je - lijken ze op elkaar?"*

**Run (10 min)**
Open de pagina. Klopt het beeld? Laat zien: het werkt, ziet er zelfs redelijk uit - maar de code eronder is rommelig.

**Investigate (30 min) - live coding, AI uit**
- Bekijk `.knop-card-1`, `.knop-card-2`, `.knop-card-3` naast elkaar: bijna identiek, met kleine, onbedoelde verschillen in padding. Vraag: "Is dit expres, of per ongeluk?" (per ongeluk - typisch gevolg van copy-paste)
- Introduceer de **descendant selector**: in plaats van drie losse classes, kun je de bestaande structuur gebruiken:
```css
.card h3 {
    font-size: 18px;
}
```
- Introduceer **pseudo-classes**:
```css
.knop:hover {
    background-color: #5849c4;
}
.knop:focus {
    outline: 2px solid #ffeaa7;
}
```
Leg uit: `:hover` = tijdens muis erover, `:focus` = wanneer je met Tab navigeert (belangrijk voor toegankelijkheid).

**Modify (40 min) - AI mag, met verantwoording**

**Opdracht:**
1. Vervang `.knop-card-1`, `.knop-card-2`, `.knop-card-3` door één class `.knop-card` en pas die toe op alle drie de knoppen in de HTML
2. Doe hetzelfde voor `.knop-plan-1/2/3` → één class `.knop-plan`
3. Voeg aan beide knop-classes toe: `cursor: pointer`, een `:hover`-state, en een `transition`
4. Voeg een `:focus`-state toe

Loop rond en help. Laat studenten met de Tab-toets testen of `:focus` zichtbaar is.

### Huiswerk
1. Alle button-duplicatie in Boulder Base is opgelost (één class per knop-type)
2. Elke knop heeft `:hover`, `:focus`, `cursor: pointer` en een `transition`
3. Test met DevTools of er nog steeds drie (bijna) identieke classes bestaan die je gemist hebt

**Extra uitdaging:**
- Maak een tweede knop-variant (`.knop-outline`) voor minder prominente acties
- Gebruik een descendant selector om alle `<p>`'s binnen `.card` een consistente kleur te geven, zonder een aparte class per paragraaf

### Tips voor docent
- Laat expliciet zien dat `:hover` zonder `transition` abrupt aanvoelt - het verschil is voelbaar
- Benoem `:focus` expliciet als toegankelijkheidsonderwerp, niet alleen "extra styling"
- Dit hoofdstuk is bewust het begin van een nieuwe taakklasse - benoem dat voor de klas: "we beginnen weer bij Predict, maar nu met een lastigere site"

### Veelgemaakte fouten
1. `:hover` op de verkeerde selector toepassen
2. `cursor: pointer` vergeten, waardoor knoppen niet als klikbaar aanvoelen
3. Bij het samenvoegen van classes de HTML niet overal bijwerken (oude classnamen laten staan)
4. Geen `transition`, waardoor hover-effecten abrupt aanvoelen

---
