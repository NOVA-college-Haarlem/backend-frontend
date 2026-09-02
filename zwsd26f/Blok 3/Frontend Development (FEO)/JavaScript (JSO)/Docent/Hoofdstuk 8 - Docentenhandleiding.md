## Hoofdstuk 8: Eindproject - JS-laag + Verantwoording - Docentenhandleiding

*Bij: `../Hoofdstuk 8 - Eindproject - JS-laag en Verantwoording.md` (studentversie)*

**Taakklasse 3 van 3** - volledige **Make**, op het FEO-eindproject
**PRIMM-fase dit hoofdstuk:** Make + verantwoordingsgesprek

### Waarom deze opzet
Dit hoofdstuk loopt gelijk met FEO Hoofdstuk 8. Beide vakken sluiten af op dezelfde site, met eenzelfde soort verantwoordingsgesprek. Overweeg om beide gesprekken (FEO en JS) op dezelfde dag te plannen per student, zodat het als één samenhangende eindpresentatie voelt in plaats van twee losse toetsmomenten.

### Lesopbouw

**Les 1 (90 min): Bouwen**
- 10 min: eisen doornemen
- 70 min: zelfstandig JS toevoegen aan het eigen FEO-eindproject (AI mag, mits verantwoordbaar)
- 10 min: korte tussenstand-check per student

**Les 2 (90 min): Peer review + Debug deze AI-output + polijsten**
- 15 min: peer review in tweetallen
- 15 min: **Debug deze AI-output** - klassikale opdracht, iedereen krijgt dezelfde lap AI-gegenereerde JS met 2-3 ingebouwde fouten (bijv. een `forEach` met verkeerde parametervolgorde, een ontbrekende `event.preventDefault()`, een `classList`-typefout)
- 50 min: verbeteringen doorvoeren
- 10 min: laatste check met de console (geen foutmeldingen)

**Les 3: Verantwoordingsgesprek**
Kort gesprek per student (5 min):
1. Demo (1 min)
2. Toelichting welke technieken gebruikt zijn en waarom (2 min)
3. Verantwoordingsvraag op een willekeurige regel (2 min)

### Tips voor docent
- Vergelijk aan het eind kort de originele `starter-website`/`starter-website-2` met het eindresultaat - de vooruitgang over het hele blok (CSS én JS) wordt dan in één keer zichtbaar
- Gebruik dit moment samen met de FEO-eindbeoordeling om te bepalen wie klaar is voor verdere JS-verdieping en wie meer basis nodig heeft
- Studenten die vooral op AI hebben geleund zonder de tussenliggende hoofdstukken goed te begrijpen, vallen hier het snelst door de mand bij de verantwoordingsvraag - dat is precies de bedoeling, niet iets om te vermijden

### Veelgemaakte fouten
1. JS direct in de HTML plakken (`<script>` inline) in plaats van in het gekoppelde bestand
2. Interacties die technisch werken maar niet functioneel zijn (bijv. een lege `console.log` als enige "interactie")
3. Code die overduidelijk 1-op-1 AI-output is en die de student niet kan navertellen
4. Event-handlers die na een DOM-wijziging niet meer werken omdat het element niet meer bestaat (selector klopt niet meer na eigen HTML-aanpassingen)

---
