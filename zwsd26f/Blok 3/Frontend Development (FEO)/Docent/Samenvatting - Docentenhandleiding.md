## Samenvatting HTML & CSS: Repareer Café De Kade (les 1 van 2) - Docentenhandleiding

*Opdracht en startbestanden: eigen repo [NOVA-college-Haarlem/De-Kade](https://github.com/NOVA-college-Haarlem/De-Kade) (README = studentversie)*
*Les 2 (JavaScript, zelfde site): `../JavaScript (JSO)/Docent/Samenvatting - Docentenhandleiding.md`*
*Modeluitwerking: `dekade-uitwerking/` (eindstand na les 2. Het dagmenu wordt daar door JS gevuld, na les 1 staan de `<li>`'s nog in de HTML)*
*Quiz: `Samenvatting - Quiz HTML&CSS (Menti).md`*

**Type:** samenvattingsles, 90 minuten. Quiz + bouwen in drie niveaus. Eén opdracht verdeeld over twee lessen: les 1 HTML/CSS, les 2 JS op dezelfde site.
**Les 2 bouwt hierop voort:** de knoppen "Dark mode", "Leegmaken" en "Alleen vega" en de `body.dark`-variabelen staan al in de startcode, maar doen in les 1 niks. Het script staat uitgecommentarieerd in de `<head>`, zodat de Console in les 1 alleen de CSS-fout toont. Dark mode werkt in les 2 pas goed als zilver stap 2 (variabelen) gedaan is. Dat is bewust: zo zien studenten waarom variabelen nuttig zijn.
**Technieken:** H1-H10. Brons gebruikt alleen H1-H7, zilver voegt Flexbox en media queries toe (H9-H10).

### Lesopbouw (90 min)

| Tijd | Onderdeel |
|---|---|
| 0-25 | Menti-quiz (peer instruction, zie quizbestand) |
| 25-30 | Opdracht introduceren: toon de kapotte site op het bord |
| 30-80 | Bouwen: brons → zilver → goud, in eigen tempo |
| 80-90 | Tweetallen: regel aanwijzen en uitleggen |

**Tip:** noteer tijdens de quiz de 2-3 vragen met de laagste score. Loop daar tijdens het bouwen gericht op langs.

### Brons: de 7 fouten

| # | Klacht | Oorzaak | Oplossing | Herhaling van |
|---|---|---|---|---|
| 1 | Geen opmaak | `href="style.css"`, het bestand staat in `css/` | `href="css/style.css"` | H1, quizvraag 16 |
| 2 | Header en footer niet donkerblauw | HTML gebruikt `<div class="header">`, `<div class="nav">`, `<div class="footer">`, de CSS stijlt de elementen `header`, `nav`, `footer` | Semantische elementen gebruiken | H3 |
| 3 | Na de hero geen opmaak meer | `}` ontbreekt na `.hero p`. Moderne browsers lezen alles daarna als *geneste* CSS binnen `.hero p` | `}` toevoegen | H1/H2 (syntax) |
| 4 | Middelste kaart anders | `class="Kaart"`, CSS is hoofdlettergevoelig | `class="kaart"` | H2, H4 |
| 5 | Prijzen niet oranje | `color: --accent;` | `color: var(--accent);` | H5, quizvraag 10 |
| 6 | Derde kaart staat eronder | `box-sizing: border-box` ontbreekt in de reset. Kaart is dan 290 + 2×20 padding + 2px rand breed, drie passen niet in 960px | `box-sizing: border-box;` in `*`. Kleinere breedte mag ook, mits de student kan uitrekenen waarom | H2 (box model), quizvraag 4 |
| 7 | "Menukaart"-link doet niets | `href="#menu"`, de sectie heeft `id="menukaart"` | `href="#menukaart"` | H6 |

**Volgorde:** fout 1 verbergt alle andere. Fout 3 verbergt 4-6. Studenten die "niks zien gebeuren" na een fix: laat ze opnieuw naar de lijst kijken.

**DevTools-moment:** wie vastloopt bij fout 2 of 4: laat in *Elements* zien dat de regel `header { ... }` niet in het Styles-paneel verschijnt bij de `<div>`. Bij fout 5 toont DevTools de regel doorgestreept met een waarschuwingsicoon.

### Zilver: waar op letten

- **Knop-class:** de `<button>` van het formulier heeft ook `border: none` nodig, of `.knop` krijgt een rand in dezelfde kleur (zo doet de uitwerking het). `:focus` vergeten is de meest gemaakte fout
- **Variabelen-test:** laat studenten `--accent` echt veranderen. Overgebleven oranje = gemiste hex-code
- **Flexbox header:** `.container` binnen `header` krijgt `display: flex; justify-content: space-between; align-items: center;`. `float: right` op `nav` moet weg
- **Formulier:** `width: 450px` → `max-width: 450px`, anders loopt het op mobiel buiten het scherm
- Vergelijk met `dekade-uitwerking/css/style.css`

### Goud
Open opdrachten, geen vaste uitwerking. Bij **uitgelichte kaart** checken: staat `.kaart-uitgelicht` *naast* `.kaart` in de HTML, en bevat de nieuwe class alleen de verschillen?

### Snelle studenten
Klaar met goud: laat ze alvast `js/script.js` lezen en voorspellen wat er misgaat (Predict, nog niets aanpassen). Of: zelf een fout in hun eigen versie verstoppen en een klasgenoot laten zoeken.
