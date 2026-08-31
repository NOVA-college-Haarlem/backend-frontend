## Hoofdstuk 1: Wat is JavaScript? Variabelen & de Console - Docentenhandleiding

*Bij: `../Hoofdstuk 1 - Wat is JavaScript, Variabelen en de Console.md` (studentversie)*

**Taakklasse 1 van 3** - RetroPixel (gedeeld met FEO, `starter-website/`)
**PRIMM-fasen dit hoofdstuk:** Predict → Run → Investigate → eerste Modify

### Waarom deze opzet
Dit is het eerste JavaScript-hoofdstuk, parallel aan FEO Hoofdstuk 1. Beide vakken beginnen bij "Predict/Run/Investigate op aangeleverde code" - bewust dezelfde structuur, zodat studenten het PRIMM-ritme maar één keer per week hoeven te leren kennen, niet twee keer voor twee verschillende vakken. Gebruik dezelfde RetroPixel-site als FEO; er is nu een `js/script.js` aan gekoppeld.

### Lesopbouw (90 minuten)

**Predict (10 min)**
Deel `starter-website/js/script.js` uit - **nog niet draaien**. Laat studenten opschrijven wat ze verwachten te zien.

**Run (10 min)**
Open `index.html` in de browser, open de console (F12). Laat zien: de tekst verschijnt **niet op de pagina**, maar in de console - dit verrast bijna altijd. Dit is een goed moment om te benoemen: "JavaScript draait wel, maar je moet zelf bepalen wát er op de pagina verandert - dat komt volgend hoofdstuk."

**Investigate (30 min) - live coding, AI uit**
- "Wat is `winkelnaam`?" → introduceer **variabele**: een naam die naar een waarde verwijst. `let` = "ik mag deze waarde later veranderen".
- "Waarom staat er `"RetroPixel"` tussen aanhalingstekens maar `2018` niet?" → string vs. getal (type).
- "Wat doet `console.log()`?" → een hulpmiddel om te zien wat er in je code gebeurt, niet zichtbaar voor de bezoeker van de site.
- Laat zien hoe `<script src="js/script.js" defer></script>` in `index.html` staat. Bespreek kort `defer` (laadt het script pas als de HTML klaar is - nog niet de diepte in, komt terug als het relevant wordt).
- Veelgemaakte fout demonstreren: een variabele gebruiken vóór hij is aangemaakt, of een typefout in de variabelenaam → laat de foutmelding zien en leer hem lezen.

**Modify (30 min) - AI mag, met verantwoording**
Studenten voegen eigen variabelen toe en combineren ze in `console.log()`. Loop rond en laat steekproefsgewijs uitleggen wat een regel doet.

**Afronding (10 min)**
Vragen? Volgend hoofdstuk: de DOM selecteren en écht iets op de pagina laten veranderen.

### Tips voor docent
- Verwacht verwarring dat er "niets gebeurt" op de pagina - dat is precies de leerstof van dit hoofdstuk: JS draait, maar toont niets vanzelf
- Laat de console van meet af aan een vast onderdeel worden van de werkwijze - F12 openhouden tijdens het programmeren
- Vergelijk kort met CSS: "in CSS zag je een verandering, in JS zie je nu een bericht in de console - straks gaan we ook de pagina zelf aanpassen"

### Veelgemaakte fouten
1. Vergeten de console te openen en denken dat er "niets gebeurt"
2. Variabele met een typefout aanroepen (`console.log(Winkelnaam)` i.p.v. `winkelnaam` - JS is hoofdlettergevoelig)
3. Aanhalingstekens vergeten om tekst (string), of juist om een getal zetten
4. `;` vergeten aan het eind van een regel (werkt meestal wel, maar leer het als gewoonte)

---
