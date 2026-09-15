## Hoofdstuk 4: Condities Toepassen - Actieplekken bij Boulder Base - Docentenhandleiding

*Bij: `../Hoofdstuk 4 - Condities - if-else in de DOM.md` (studentversie)*

**Taakklasse 2 van 3** - Boulder Base (gedeeld met FEO, `starter-website-2/`)
**PRIMM-fasen dit hoofdstuk:** Predict → Run → Investigate → Modify

### Waarom deze opzet
Studenten hebben `if`/`else` en vergelijkingsoperators al eerder gehad (buiten dit vak) - dit hoofdstuk legt het concept dus niet opnieuw uit, maar tilt het naar een hoger niveau: conditielogica **binnen** een event-handler, gecombineerd met `.style`-aanpassingen, `event.target` en een eigen `else if`-tak. Dit hoofdstuk loopt gelijk met FEO Hoofdstuk 4 (CSS-selectoren/buttons).

**Belangrijk:** de Investigate-fase blijft gericht op de drie gedupliceerde click-handlers van de lessenkaarten (`.card a`) - dat verhaal blijft ongewijzigd en onopgelost tot Hoofdstuk 6. De nieuwe conditielogica van dit hoofdstuk komt op een ánder onderdeel van de pagina terecht: de abonnement-knoppen (`.plan a`), die tot nu toe geen JS hadden. Zo blijft de duplicatie-opzet van Hoofdstuk 6 intact, en krijgen studenten toch een rijkere if/else-oefening dan een losse variabele die niets doet.

### Lesopbouw (90 minuten)

**Predict (5 min)**
Deel `starter-website-2/js/script.js` uit - nog niet draaien. Laat studenten het duplicatiepatroon van de lessenkaart-knoppen signaleren.

**Run (5 min)**
Test de drie "Boek deze les"-knoppen. Werkt zoals verwacht (alleen een `alert()`).

**Investigate (15 min) - live coding, AI uit**
- Laat de duplicatie van `.card a`-handlers benoemen, trek de parallel met de CSS-button-duplicatie uit FEO Hoofdstuk 4. Beloof dat Hoofdstuk 6 dit oplost - vandaag ligt de focus ergens anders.
- Korte, actieve recap (geen nieuwe uitleg): laat een student in één zin `if`/`else` uitleggen, en vraag wie kan inschatten wat `else if` zou kunnen betekenen vóórdat je het zelf invult.
- Wijs op `#abonnementen` - drie knoppen zonder JS. Dat wordt vandaag het speelveld.

**Modify (55 min) - AI mag, met verantwoording**
Live coding: samen het `actieplekken`-voorbeeld opbouwen op de middelste abonnement-knop (index `1`).
- Introduceer `event.target` expliciet: "waarom hebben we nu geen apart `document.querySelector` nodig om de knop te pakken?"
- Bouw de conditie eerst als eenvoudige `if`/`else` (herkenning), breid daarna uit met `else if` voor de tussenliggende "laatste plek"-situatie.
- Laat concreet zien wat er misgaat als je de volgorde van de checks verandert (bijv. `actieplekken >= 1` gebruiken in plaats van `> 1`, waardoor de `=== 1`-tak nooit meer bereikt wordt) - dit is dé denkfout bij meerdere condities.
- Laat zien hoe `.style.backgroundColor` en `.textContent` samen duidelijke feedback per situatie geven (bijv. groen/oranje/grijs).
- Studenten kopiëren en passen het patroon zelfstandig toe op de overige twee abonnement-knoppen, met eigen waarden, kleuren en teksten.

**Afronding (10 min)**
Vragen? Volgend hoofdstuk: classList en een dark-mode toggle.

### Tips voor docent
- Peil vooraf kort of iedereen `if`/`else` nog paraat heeft ("geef me een voorbeeld") - dit hoofdstuk bouwt erop voort zonder het te herhalen
- `event.target` is nieuw en behoorlijk krachtig - laat expliciet zien dat dit hetzelfde element is als waarvoor je eerder los een `const knop = document.querySelector(...)` schreef
- Laat de volgorde van `if` / `else if` / `else` bewust fout gaan door de checks om te draaien of te overlappen - studenten onthouden dit beter door het te zien mislukken dan door een regel te horen
- Benoem expliciet dat dit **niet** de lessenkaart-duplicatie oplost - dat komt bewust pas in Hoofdstuk 6
- Vermijd `==` volledig in de voorbeelden dit hoofdstuk; gebruik consequent `===`

### Veelgemaakte fouten
1. Condities in de verkeerde volgorde of met overlappende grenzen (bijv. `=== 1` pas na een `>= 1`-check), waardoor een tak nooit wordt bereikt
2. `event.target` verwarren met de knop uit `document.querySelectorAll(".plan a")[1]` - dat laatste is de knop waar de listener op staat, `event.target` is het element dat daadwerkelijk is aangeklikt (bij deze opdracht is dat hetzelfde element, maar het onderscheid is belangrijk om te snappen)
3. De teller (`actieplekken`) pas ná het aanpassen van tekst/stijl bijwerken, waardoor de boodschap een klik achterloopt
4. `=` gebruiken in plaats van `===` in een conditie
5. Een `else if`- of `else`-tak vergeten, waardoor niet alle situaties worden afgevangen
6. Accolades vergeten bij een van de drie blokken

---
