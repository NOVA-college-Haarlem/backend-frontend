## Hoofdstuk 4: Condities - if/else in de DOM - Docentenhandleiding

*Bij: `../Hoofdstuk 4 - Condities - if-else in de DOM.md` (studentversie)*

**Taakklasse 2 van 3** - Boulder Base (gedeeld met FEO, `starter-website-2/`)
**PRIMM-fasen dit hoofdstuk:** Predict → Run → Investigate → Modify

### Waarom deze opzet
Dit hoofdstuk loopt gelijk met FEO Hoofdstuk 4 (start taakklasse 2 bij Boulder Base, CSS-selectoren/buttons). `starter-website-2/js/script.js` bevat vanaf het begin drie bijna-identieke click-handlers voor de lessenkaarten - een JS-equivalent van de gedupliceerde button-CSS die studenten in FEO tegenkomen. **Dit hoofdstuk lost die duplicatie nog niet op** - dat gebeurt bewust pas in Hoofdstuk 6 (arrays & loops), zodra studenten de juiste tool (loops) hebben. Vandaag ligt de focus op condities.

### Lesopbouw (90 minuten)

**Predict (10 min)**
Deel `starter-website-2/js/script.js` uit - nog niet draaien. Laat studenten het duplicatiepatroon signaleren.

**Run (10 min)**
Test de drie knoppen. Werkt zoals verwacht.

**Investigate (20 min) - live coding, AI uit**
- Laat de duplicatie benoemen, en trek expliciet de parallel met de CSS-button-duplicatie uit FEO Hoofdstuk 4: "hetzelfde probleem, nu in JS." Beloof dat dit in Hoofdstuk 6 wordt opgelost - vandaag eerst iets nieuws.
- Introduceer `if`/`else` met het `plekkenVrij`-voorbeeld. Laat live zien wat er verandert als je de waarde wijzigt.
- Bespreek vergelijkingsoperators: `>`, `<`, `===` (leg uit waarom `===` en niet `==` - "drie is-gelijktekens" als vuistregel, geen diepe uitleg van type-coercion nodig op dit niveau).

**Modify (40 min) - AI mag, met verantwoording**
Samen het `plekkenVrij`-voorbeeld koppelen aan een DOM-element (`#lessen h2` aanpassen). Studenten testen met verschillende waarden, en passen zelfstandig de tekst/selector aan naar hun eigen smaak.

**Afronding (10 min)**
Vragen? Volgend hoofdstuk: classList en een dark-mode toggle.

### Tips voor docent
- Het "dit lossen we nog niet op" moment is didactisch belangrijk - benoem het expliciet, zodat studenten niet denken dat de duplicatie een fout van de les is
- `if`/`else` is voor veel studenten de eerste "echte" programmeerlogica in dit vak - geef ruim de tijd, en laat ze zelf voorspellen vóór je het live test
- Vermijd `==` volledig in de voorbeelden dit hoofdstuk; gebruik consequent `===`

### Veelgemaakte fouten
1. `=` gebruiken in een conditie in plaats van `===` (toekenning i.p.v. vergelijking)
2. `else` vergeten en denken dat er "niks gebeurt" als de conditie false is
3. Accolades vergeten bij `if`/`else`-blokken
4. Conditie op een string vergelijken zonder aanhalingstekens (bijv. `if (status === vol)` i.p.v. `"vol"`)

---
