# Blok 4 (26F) - Frontend Ontwikkeling Samenvatting

**Doelgroep:** MBO studenten klas 26F
**Duur:** 6 hoofdstukken (9 lesweken), verdeeld over 3 taakklassen - 1,5 uur per week, parallel aan JavaScript (JSO)
**Focus:** Formulieren - structuur, validatie, styling, responsive en toegankelijk - opgebouwd volgens hetzelfde 4C/ID + PRIMM-ontwerp als Blok 3

> **Status:** Hoofdstuk 1-6 (student- en docentversie) klaar. Een geteste uitwerking van site + formulier (stand na FEO H5 en JS H5) staat in `JavaScript (JSO)/Docent/uitwerking/` in de docentenrepo (`__docent lesprogramma`). Nog niet in de praktijk gegeven.

**Bestandsstructuur:** zoals in Blok 3 - studentversies in `HTML&CSS/`, docentenhandleidingen in `Docent/` in de docentenrepo (`__docent lesprogramma`). Het JS-vak staat in `JavaScript (JSO)/` met een eigen samenvatting.

---

## Waar Blok 4 op voortbouwt

Na Blok 3 (incl. de verdiepingshoofdstukken H9 Flexbox en H10 Responsive) kan een 26F-student CSS extern organiseren met classes en CSS-variabelen, semantische HTML schrijven, cards met flexbox opmaken en een pagina met media queries responsive maken.

Formulieren zijn nog niet behandeld. Dat is het onderwerp van dit blok, omdat:
- formulieren het punt zijn waar frontend, JavaScript en backend samenkomen (de bezoeker stuurt iets naar de server);
- het JS-vak in Hoofdstuk 5 client-side en server-side validatie behandelt, en daarvoor een goed opgebouwd formulier nodig heeft;
- BEO straks formulieren gaat verwerken (`$_POST`).

**Didactiek:** 4C/ID + PRIMM, AI-beleid per PRIMM-fase, Make-fase als bron van eigenaarschap - één-op-één zoals in Blok 3 (zie `../../Blok 3/Frontend Development (FEO)/blok3-samenvatting.md`). Elke taakklasse eindigt met een **Make** en een **"Debug deze AI-output"**-oefening (H2, H4, H6).

---

## Startcode: De Smaakmakers (`starter-website-3/`)

Dezelfde site als in het JS-vak: een kookstudio met workshops en een inschrijfformulier. Draait met `docker compose up -d` op http://localhost.

Het formulier is **bewust slecht** - de gebreken zijn de lesstof:

| Gebrek in de startcode | Opgelost in |
|---|---|
| Geen `<label>`'s, alleen placeholders of losse tekst | H1 |
| Alles `type="text"`, ook e-mail, telefoon en aantal | H1 |
| Geen groepering, geen keuzevelden behalve één `<select>` | H2 |
| Geen `required`, `min`/`max` of andere validatie-attributen | H3 |
| Bijna geen styling: velden plakken tegen elkaar, standaard browserfont, geen focus-stijl | H4 |
| Kleine klikvakjes, niet getest op mobiel of met toetsenbord | H5 |

### Werkwijze: twee mappen (beide vakken)

| Map | Gebruik | Vanaf |
|---|---|---|
| `starter-website-3/` (De Smaakmakers) | Alle lesoefeningen (Predict t/m Modify) van FEO én JS. Onderwerp blijft ongewijzigd: de JS-lessen leunen op `workshops.json` en de volle sushi-workshop. | Week 1 |
| `mijn-variant/` | Kopie met eigen onderwerp, naam en kleuren, op poort 8080. Alle Make-opdrachten en beide eindprojecten. | FEO H2 (week 2) |

Wat de eigen variant per week krijgt: eigen thema en formulier (FEO H2) → JS-gegenereerde lijst (JS H2) → validatie-attributen (FEO H3) → formulier-styling (FEO H4) → eigen JSON, rendering en filter (JS H4) → responsive en toegankelijk (FEO H5) → client- en server-side validatie (JS H6) → eindgesprek (FEO H6 + JS H6).

---

## Planning naast JavaScript

| Week | HTML & CSS (dit vak) | JavaScript |
|---|---|---|
| 1 | H1 Formulier basis | H1 Functies met return |
| 2 | H2 Keuzevelden + eigen variant | H2 Elementen maken |
| 3 | H3 HTML-validatie en states | H3 Objecten + fetch |
| 4 | H4 Formulieren stylen | H4 Filteren en zoeken |
| 5-6 | H5 Responsive en toegankelijk | H5 Client- vs. server-side validatie |
| 7-9 | H6 Eindproject | H6 Eindproject |

**Afhankelijkheid:** JS H5 (week 5) gebruikt labels, `id`'s, input-types en `required` uit FEO H1-H3. Loopt FEO uit, dan staat het benodigde formulier ook volledig in de studentversie van JS H5.

---

## Taakklasse 1: De structuur van een formulier (Hoofdstuk 1-2)

### Hoofdstuk 1: Formulier Basis - Labels, Names en Input-types
**Leerdoelen:** `<form>` met `action` en `method` uitleggen (GET vs. POST); `<label for>` koppelen aan een `id`; uitleggen wat `name` doet (wat de server ontvangt); het juiste input-type kiezen (`text`, `email`, `tel`, `number`); verschil tussen label en placeholder
**PRIMM-focus:** Predict → Run → Investigate (Network-tab: wat wordt er verstuurd?) → Modify

### Hoofdstuk 2: Keuzevelden en Eigen Variant
**Leerdoelen:** radio buttons, checkboxes, `<select>` en `<textarea>` gebruiken en kiezen welke past; radio's groeperen met dezelfde `name`; `<fieldset>` en `<legend>`
**PRIMM-focus:** Investigate → Modify → **Make**: eigen variant (eigen thema + eigen formuliervelden) + "Debug deze AI-output"

## Taakklasse 2: Controleren en vormgeven (Hoofdstuk 3-4)

### Hoofdstuk 3: HTML-validatie en Feedback-states
**Leerdoelen:** validatie-attributen (`required`, `min`/`max`, `minlength`/`maxlength`, `pattern`); `:focus`, `:invalid` en `:user-invalid`; verplichte en optionele velden zichtbaar maken; benoemen dat browservalidatie te omzeilen is (cliffhanger naar JS H5)
**PRIMM-focus:** Predict → Run → Investigate → Modify

### Hoofdstuk 4: Formulieren Stylen
**Leerdoelen:** attribuut-selectoren (`input[type="email"]`); formulierelementen consistent stylen (`width`, `font: inherit`, padding, border); focus zichtbaar houden (`:focus-visible`, nooit alleen `outline: none`); button-states; velden naast elkaar met flexbox
**PRIMM-focus:** Investigate → Modify → **Make**: het formulier van de eigen variant + "Debug deze AI-output"

## Taakklasse 3: Voor iedereen bruikbaar (Hoofdstuk 5-6)

### Hoofdstuk 5: Responsive en Toegankelijke Formulieren (2 lessen)
**Leerdoelen:** mobile-first formulier (één kolom, naast elkaar vanaf een breakpoint); tikvlakken van minimaal 44px; `font-size: 16px` tegen inzoomen op iPhone; `autocomplete`; formulier bedienen met alleen het toetsenbord; hints koppelen met `aria-describedby`; fouten niet alleen met kleur tonen; Lighthouse-toegankelijkheidscheck
**PRIMM-focus:** Investigate (testen met device-mode en toetsenbord) → Modify

### Hoofdstuk 6: Eindproject - Formulier en Verantwoording (3 lessen)
**Leerdoelen:** alle technieken combineren in het formulier van de eigen variant (dezelfde site als het JS-eindproject); code verantwoorden
**PRIMM-focus:** volledige **Make** + verantwoordingsgesprek, samen met het JS-gesprek + "Debug deze AI-output"

---

## Wat heb je aan het einde van dit vak geleerd?

✅ Een formulier correct opbouwen met labels, names en de juiste input-types
✅ Uitleggen wat een formulier naar de server stuurt, en het verschil tussen GET en POST
✅ Kiezen tussen tekstveld, select, radio, checkbox en textarea
✅ Validatie-attributen gebruiken en de feedback-states stylen
✅ Een formulier consistent en duidelijk vormgeven, met zichtbare focus
✅ Een formulier mobile-first responsive maken
✅ Een formulier bruikbaar maken met alleen het toetsenbord, en controleren op toegankelijkheid
✅ Eigen (en AI-gegenereerde) HTML/CSS lezen, controleren op fouten en verantwoorden

---

## Openstaande punten

- **GitHub-repo:** `starter-website-3` eventueel als eigen repo onder NOVA-college-Haarlem zetten, zodat studenten forken en clonen.
- **BEO Blok 4:** uitgewerkt in `../Backend Development (BEO)/blok4-samenvatting.md`, op dezelfde site. `$_POST` en het opnieuw vullen van een formulier na een server-fout zitten in BEO H1-H2; FEO H1 laat alleen zien *wat* er verstuurd wordt.
