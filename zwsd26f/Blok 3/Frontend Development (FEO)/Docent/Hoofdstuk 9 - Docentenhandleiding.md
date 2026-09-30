## Hoofdstuk 9: Flexbox - Layout met Cards en Navigatie - Docentenhandleiding

*Bij: `../HTML&CSS/Hoofdstuk 9 - Flexbox - Layout met Cards en Navigatie.md` (studentversie)*

**Taakklasse 4 (verdieping)** - Layout: Flexbox & Responsive. Startcode: de eigen Boulder Base van de student (Hoofdstuk 4-7), daarna het eindproject (Hoofdstuk 8)
**PRIMM-fasen dit hoofdstuk:** Predict → Run → Investigate → begeleide Modify → korte Make

### Waarom een verdiepingstaakklasse?
Na het eindproject beheerst de klas de basis (externe CSS, box model, semantiek, variabelen). De layout leunt nog op `inline-block` en `float` - dat werkt op één schermbreedte, maar is broos. Taakklasse 4 (H9-H10) sluit de brug naar Blok 4 (cards/flexbox/layout): studenten verbeteren een **bekende** site (Boulder Base) en passen het daarna toe op hun **eigen** eindproject. Zelfde soort hele taak, nieuwe complexiteitslaag: niet meer "hoe ziet een element eruit", maar "hoe verhouden elementen zich tot elkaar".

Boulder Base heeft precies de goede gebreken: `nav { float: right }`, cards/plans met `display: inline-block` en vaste `width: 280px`, en `margin: 10px` als tussenruimte. Studenten kennen de code al, dus alle aandacht gaat naar het nieuwe concept.

### Leerdoelen
Na deze les kan de student:
- Uitleggen wat een flex container en een flex item is, en op welk element `display: flex` hoort
- Hoofdas en dwarsas benoemen en `flex-direction` gebruiken
- Uitlijnen met `justify-content`, `align-items` en `gap`
- Met `flex-wrap` en `flex: 1 1 250px` een card-overzicht laten doorlopen
- Een header zonder `float` op één lijn zetten
- Een flex-layout inspecteren met DevTools

### AI-gebruik dit hoofdstuk
Predict/Run/Investigate **AI uit** - het mentale model van de twee assen moet in hun eigen hoofd zitten, anders kunnen ze AI-output (die vaak `display: flex` op het verkeerde element zet) niet beoordelen. Modify: **AI mag**, mits verantwoord. Make: **AI mag**, verantwoording verplicht.

### Voorbereiding
- Zorg voor een eigen "schone" Boulder Base-versie (na H7) om live mee te coderen
- Testbestand `flex-test.html` met de Predict-code klaarzetten om te delen
- Optioneel: Flexbox Froggy (Nederlandse versie) openen voor de laatste minuten of als huiswerk

### Lesopbouw (2 lessen van 90 minuten)

#### Les 1: begrip opbouwen

**Predict (10 min) - AI uit**
Toon de Predict-code op het bord. Laat tweetallen opschrijven: onder of naast elkaar, en wat `display: flex` op `.rij` verandert. Verwachte antwoorden:
- Zonder flex: onder elkaar, want `<div>` is een blok-element (herhaling uit Blok 1)
- Veel studenten denken dat je `display: flex` op `.blok` moet zetten - laat dat misverstand bewust even staan, Run lost het op
- Breedte na flex: zo breed als de inhoud (+ padding), niet meer 100%

**Run (15 min)**
Studenten plakken de code in `flex-test.html`. Daarna Boulder Base openen en venster smaller maken. Laat ze drie problemen benoemen:
1. Cards springen onvoorspelbaar naar een nieuwe regel en laten een gat achter
2. Cards met meer tekst zijn hoger; knoppen staan niet op één lijn
3. Navigatie valt bij een smal scherm onder het logo, of overlapt de dark-mode-knop

Schrijf de drie problemen op het bord: "dit lossen we vandaag op".

**Investigate (45 min) - live coding, AI uit**
Werk het in deze volgorde af in `flex-test.html`, telkens eerst voorspellen, dan pas de regel toevoegen:
1. **Container vs. items** - teken de ouder als doos met drie kinderen. Kernzin: *"Flex zet je op de ouder."* Laat zien dat een `<p>` binnen een `.blok` níet meedoet (alleen directe kinderen)
2. **De twee assen** - teken de pijlen op het bord. Laat `justify-content` doorlopen (`flex-start`, `center`, `space-between`), daarna `align-items` met een vaste `height` op de container
3. **Kantelen** - zet `flex-direction: column`. Vraag: "Wat doet `justify-content` nu?" Dit is het moment waarop de assen landen. Neem hier de tijd voor
4. **`gap`** vs. `margin` - `gap` geeft alleen ruimte *tussen* items, niet aan de buitenkant. Geen dubbele margins meer
5. **`flex-wrap` + `flex: 1 1 250px`** - zonder `wrap` persen items zich in één rij. Maak het venster smaller en laat het verschil zien. Leg `flex` uit als "groeien - krimpen - startbreedte"
6. **DevTools** - laat het `flex`-label en de flexbox-editor in het Styles-paneel zien

**Checkvragen (10 min)**
Laat de vier checkvragen individueel beantwoorden (papier of wisbordjes), daarna klassikaal bespreken. Antwoorden:
1. Op het element eromheen (de ouder)
2. `justify-content` centreert horizontaal (hoofdas), `align-items` verticaal (dwarsas)
3. Zonder `wrap` blijven alle cards op één rij en worden ze te smal
4. `gap` geeft geen ruimte aan de buitenranden en je hoeft niet op elk item een margin te zetten; geen dubbele marges tussen items

**Afronding (10 min)**
Start met Modify stap 1 (header) klassikaal, zodat iedereen met een werkend eerste stuk naar huis gaat.

#### Les 2: toepassen

**Terugblik (5 min)**
"Flex zet je op de...?" - "ouder." Wie kan de twee assen tekenen?

**Modify (50 min) - AI mag, met verantwoording**
- Stap 1 (header) als nog niet af - bespreek de vraag over drie items bij `space-between`: logo links, nav in het midden, knop rechts. Met `margin-left: auto` op `nav` schuift de nav naar rechts, tegen de knop aan
- Stap 2 (card-grid) in tweetallen. Loop rond: controleer of de `<h2>` búiten de `.card-grid` staat. De wrapper-class hergebruiken voor `.plan`'s is het gewenste antwoord (DRY - herhaling van H4)
- Stap 3 (knoppen onderaan) - benoem het begrip **nesten**: `.card` is item én container
- Stap 4 (hero) - de vraag waarom `align-items` hier horizontaal centreert, is een goede verantwoordingsvraag: bij `column` is de dwarsas horizontaal

**Make (25 min)**
Studenten passen het toe op hun eigen eindproject. Loop rond en stel verantwoordingsvragen: *"Waarom staat `display: flex` op déze div?"*, *"Wat gebeurt er als je `flex-wrap` weghaalt?"*

**Debug deze AI-output (10 min)**
Zie antwoord hieronder. Laat eerst individueel zoeken, dan klassikaal.

### Antwoord "Debug deze AI-output"
Fouten:
1. **`display: flex` staat op `.card` in plaats van op de ouder.** Daardoor worden de `<h3>`, `<p>`'s en knop *binnen* elke card naast elkaar gezet (vandaar "de inhoud ziet er raar uit"), terwijl de cards zelf gewone blok-elementen blijven en onder elkaar staan
2. **Er is geen wrapper.** Zet je `display: flex` op `<section>`, dan wordt de `<h2>` óók een flex item en komt die naast de cards te staan
3. (Kleiner punt) **`width: 300px`** is een vaste breedte: cards groeien niet mee. Beter: `flex: 1 1 300px`

Verbeterde versie:
```html
<section id="diensten">
    <h2>Onze diensten</h2>
    <div class="card-grid">
        <div class="card">...</div>
        <div class="card">...</div>
        <div class="card">...</div>
    </div>
</section>
```
```css
.card-grid {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
}

.card {
    flex: 1 1 300px;
}
```
Benadruk: dit is precies de fout die AI vaak maakt. Wie het concept "flex op de ouder" snapt, ziet het direct.

### Huiswerk
1. Geen `float` of `inline-block` meer voor layout in Boulder Base en eindproject
2. Header met `align-items: center`
3. Cards/plans in een wrapper met `display: flex`, `flex-wrap: wrap`, `gap`
4. Cards met `flex: 1 1 <basis>` in plaats van vaste `width`
5. Knoppen onderaan de card
6. Getest door het venster smaller en breder te maken

**Extra uitdaging:** Flexbox Froggy (level 1-12), "populair"-plan met `order` en `transform: scale()`, footer met `space-between`.

### Tips voor docent
- De assen zijn het lastigste concept. Gebruik steeds dezelfde woorden (*hoofdas*, *dwarsas*) en teken steeds dezelfde pijlen. Een A4 met de tekening aan de muur helpt
- Laat studenten bij elke nieuwe regel éérst voorspellen - ook in Investigate. Flexbox leer je door te voorspellen en te zien dat je fout zat
- Flexbox Froggy is goed als extra, maar geen vervanging: daar oefen je losse eigenschappen, hier leer je ze toepassen op een echte site
- Het JavaScript van JSO gebruikt `.card a`. Een extra wrapper breekt dat niet, maar een student die de class `card` hernoemt wel. Laat het testen: werkt de "Boek deze les"-knop nog?
- **CSS Grid** komt niet aan bod. Vraagt een snelle student ernaar: noem het als tweede layout-systeem voor tweedimensionale layouts, en verwijs naar Blok 4

### Veelgemaakte fouten
1. `display: flex` op de items zetten in plaats van op de ouder
2. De `<h2>` in de flex container laten staan, waardoor die naast de cards komt
3. Oude `width: 280px`, `display: inline-block` en `margin` laten staan naast de nieuwe flex-regels - de layout gedraagt zich dan onvoorspelbaar
4. `justify-content` en `align-items` verwisselen, vooral na `flex-direction: column`
5. `flex-wrap: wrap` vergeten, waardoor de cards op een smal scherm heel smal worden
6. `float: right` op `nav` laten staan - in een flex container wordt `float` genegeerd, maar het verwart bij het lezen van de code

---
