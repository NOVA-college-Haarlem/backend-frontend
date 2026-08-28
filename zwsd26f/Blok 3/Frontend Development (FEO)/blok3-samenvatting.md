# Blok 3 (26F) - Frontend Ontwikkeling Samenvatting

**Doelgroep:** MBO studenten klas 26F
**Duur:** 8 hoofdstukken, verdeeld over 3 taakklassen
**Focus:** Herhaling & Inhaalslag - opgebouwd volgens 4C/ID (hele taken, oplopend in complexiteit) en PRIMM (Predict-Run-Investigate-Modify-Make)

**Bestandsstructuur:** elk hoofdstuk heeft twee bestanden - `Hoofdstuk N - ....md` is de schone, studentgerichte versie (leerdoelen, opdrachten, huiswerk); `Docent/Hoofdstuk N - Docentenhandleiding.md` bevat de volledige lesregie, tips, veelgemaakte fouten en (bij Hoofdstuk 8) de beoordelingscriteria.

---

## Didactisch ontwerp: waarom deze opzet

Klas 26F bleek na Blok 1-2 de basis (externe CSS, box model, semantische HTML) nog niet stevig genoeg te beheersen om verder te gaan met cards/flexbox. In plaats van dit als losse weekonderwerpen te herhalen, is dit blok opnieuw ontworpen rond twee didactische modellen:

**4C/ID (Van Merriënboer):** studenten oefenen met **hele, authentieke taken** (een complete website verbeteren) in oplopend complexere **taakklassen**, in plaats van geïsoleerde deelvaardigheden. Elke taakklasse is een complete, herkenbare website - geen losse oefenblokjes.

**PRIMM:** elke taakklasse doorloopt **Predict → Run → Investigate → Modify → Make**. Studenten krijgen altijd **werkende startcode**, nooit een leeg canvas. Ze voorspellen wat code doet, draaien het, onderzoeken het samen met de docent (bottom-up theorie op het moment dat die nodig is), passen het begeleid aan, en maken het pas daarna zelfstandig eigen.

### De twee taakklassen (3 hoofdstukken elk) + verdiepingstaakklasse

| Taakklasse | Hoofdstukken | Startcode | Kern |
|---|---|---|---|
| **1** | Hoofdstuk 1-3 | `starter-website/` - RetroPixel (gameshop, inline CSS) | Van inline naar externe CSS, box model, semantische HTML |
| **2** | Hoofdstuk 4-6 | `starter-website-2/` - Boulder Base (boulderhal, al externe CSS maar met gebreken) | Selectoren, buttons, kleuren/typografie met CSS-variabelen, navigatie |
| **3** | Hoofdstuk 7-8 | Boulder Base (afronden) + eigen project | Site-opmaak (containers/secties) en een volledig eigen eindproject |

Beide startsites zijn **bewust onvolmaakt** (herhaalde inline styles, hardgecodeerde kleuren, inconsistente knoppen, geen containers) - de gebreken zíjn de lesstof. Studenten investigaten waarom iets niet klopt, en modificeren het gericht.

### Eigenaarschap: de Make-fase

Elke taakklasse eindigt met een **Make-fase**: de student maakt van de aangeleverde site een **eigen variant** (ander thema, eigen kleuren, eigen content) - nooit een kale kopie. Dit is waar het "ik heb dit gemaakt"-gevoel vandaan komt, ook al is de startcode aangeleverd. Zie ["Waarom top-down didactisch te verdedigen is"](#) (interne notitie) voor de onderbouwing: eigenaarschap ontstaat door betekenisvolle transformatie, niet door vanaf nul typen.

### AI-gebruiksbeleid dit blok

Consistent toegepast in elk hoofdstuk (zelfde principe als het backend PRIMM-blok):

| Fase | AI | Waarom |
|---|---|---|
| **Predict** | Uit | Dwingt *lezen* van code af, niet laten genereren |
| **Run** | Uit | Puur uitvoeren en observeren |
| **Investigate** | Uit | Begrip op conceptniveau - hier zit de theorie |
| **Modify** | Mag, mits je het uit kan leggen | Begeleide toepassing; AI als hulpmiddel, niet als vervanging |
| **Make** | Mag, mits je elke regel kan verantwoorden | Eigenaarschap zit in begrip, niet in wie de toetsaanslagen deed |

- **Verantwoordingseis:** bij elke Make-fase kan de docent vragen "waarom staat dit hier?" of "wat gebeurt er als ik deze regel weghaal?" - dit prikt competentie-illusie door vóórdat het een probleem wordt.
- **"Debug deze AI-output":** in Hoofdstuk 3, 6 en 8 krijgen studenten bewust foute AI-gegenereerde code om te vinden en te verbeteren.
- **Grens dit blok:** HTML, CSS-basis en de structuur van een pagina blijven in eigen hand (Predict/Investigate altijd AI-vrij) - dat is het gereedschap om AI-code straks te kúnnen lezen. Naarmate een student een site kan uitleggen én aanpassen, krijgt AI meer ruimte (zichtbaar in de progressie: taakklasse 1 = AI vooral uit, taakklasse 3 = AI mag breder, mits verantwoord).

---

## Taakklasse 1: RetroPixel (Hoofdstuk 1-3)

### Hoofdstuk 1: Herhaling - Van Inline naar Externe CSS
**Leerdoelen:** verschil inline/externe CSS uitleggen; externe stylesheet aanmaken en linken; herhaalde inline styles herkennen als probleem
**PRIMM-focus:** Predict, Run, Investigate (klassikaal) + eerste begeleide Modify

### Hoofdstuk 2: Classes, IDs en Box Model
**Leerdoelen:** classes vs. IDs; box model (padding/border/margin) herhalen en toepassen; DevTools voor inspectie
**PRIMM-focus:** Modify - consistente spacing en herbruikbare classes aanbrengen

### Hoofdstuk 3: Semantische HTML en Nette Structuur
**Leerdoelen:** waarom semantische HTML; `<div>` vervangen door `<header>/<main>/<section>/<footer>`; eigen variant maken
**PRIMM-focus:** Modify (semantiek) → **Make**: eigen thema-variant van RetroPixel + "Debug deze AI-output"

---

## Taakklasse 2: Boulder Base (Hoofdstuk 4-6)

### Hoofdstuk 4: CSS Selectoren en Buttons
**Leerdoelen:** descendant selectors; pseudo-classes (`:hover`/`:focus`); button-duplicatie herkennen en consolideren
**PRIMM-focus:** Predict/Run/Investigate op Boulder Base + begeleide Modify van de knoppen

### Hoofdstuk 5: Kleuren, Typografie en CSS-variabelen
**Leerdoelen:** CSS-variabelen (`:root`) invoeren; hardgecodeerde kleuren vervangen; typografische hiërarchie aanbrengen
**PRIMM-focus:** Modify - grootste "aha"-moment van dit blok (één variabele aanpassen, hele site verandert mee)

### Hoofdstuk 6: Navigatie en Eigen Variant
**Leerdoelen:** navigatie stylen met hover/actief-state; eigen variant maken
**PRIMM-focus:** Modify (navigatie) → **Make**: eigen thema-variant van Boulder Base + "Debug deze AI-output"

---

## Taakklasse 3: Site-opmaak & Eindproject (Hoofdstuk 7-8)

### Hoofdstuk 7: Website Opmaak
**Leerdoelen:** `.container` en `max-width`; secties visueel onderscheiden; footer met kolommen
**PRIMM-focus:** Predict/Investigate/Modify - Boulder Base (of eigen variant) krijgt een afgeronde, professionele opmaak

### Hoofdstuk 8: Eindproject
**Leerdoelen:** alle technieken uit het blok zelfstandig combineren en verantwoorden
**PRIMM-focus:** volledige **Make** - eigen, complete one-page website + kort verantwoordingsgesprek per student ("Debug deze AI-output" as onderdeel van de toets) in plaats van alleen een productbeoordeling

---

## Wat heb je aan het einde van Blok 3 (26F) geleerd?

✅ **CSS-structuur:** van inline naar externe stylesheet, classes en IDs correct toegepast
✅ **Box Model:** padding, margin, border gericht ingezet voor consistente spacing
✅ **Semantische HTML:** header/nav/main/section/footer i.p.v. alleen `<div>`
✅ **Selectoren:** descendant selectors, pseudo-classes (`:hover`, `:focus`)
✅ **Buttons:** consistente, herbruikbare knop-styling met states
✅ **Kleuren & Typografie:** CSS-variabelen, kleurenschema, typografische hiërarchie
✅ **Navigatie:** horizontale nav met hover/actief-state
✅ **Site-opmaak:** complete one-page structuur met container en sectie-onderscheid
✅ **Code lezen en verantwoorden:** AI-output kunnen controleren, fouten vinden, eigen keuzes uitleggen

---

## Voorbereiding op Blok 4

Na dit inhaalblok staat 26F op het niveau waarmee klas 26AB Blok 3 (cards, layout, flexbox) instapte. Check bij de start van Blok 4 of dit klopt - waar nodig eerst extra herhaling van box model/spacing inbouwen voordat aan cards/flexbox begonnen wordt.
