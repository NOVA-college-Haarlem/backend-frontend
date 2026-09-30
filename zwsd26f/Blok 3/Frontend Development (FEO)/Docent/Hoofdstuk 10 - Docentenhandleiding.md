## Hoofdstuk 10: Responsive Design en Media Queries - Docentenhandleiding

*Bij: `../HTML&CSS/Hoofdstuk 10 - Responsive Design en Media Queries.md` (studentversie)*

**Taakklasse 4 (verdieping)** - Layout: Flexbox & Responsive (afronding). Startcode: Boulder Base met Flexbox (Hoofdstuk 9), daarna het eindproject
**PRIMM-fasen dit hoofdstuk:** Predict → Run → Investigate → begeleide Modify → **Make**

### Plaats in de taakklasse
H9 heeft de layout "flexibel" gemaakt. H10 laat zien dat dat niet genoeg is: op 390px breekt de header nog steeds, is de hero-titel te groot en zoomt de telefoon zonder viewport-tag de hele site uit. Het mooie didactische moment: de cards zijn dankzij `flex-wrap` al grotendeels responsive **zonder** media query. Studenten zien zo dat Flexbox en media queries samenwerken, en dat een media query pas nodig is als flexibiliteit alleen niet genoeg is.

### Leerdoelen
Na deze les kan de student:
- Uitleggen wat responsive design is en waarom het nodig is
- De viewport meta-tag toevoegen en uitleggen
- Testen met de device toolbar in DevTools
- Een media query met `min-width` schrijven
- Mobile first uitleggen en toepassen
- Afbeeldingen en tekst laten meeschalen (`max-width: 100%`, `rem`)

### AI-gebruik dit hoofdstuk
Predict/Run/Investigate **AI uit**. Modify: **AI mag**, mits verantwoord. Make: **AI mag**, maar de student moet van elke media query kunnen zeggen *vanaf welke breedte* en *wat* hij verandert. AI schrijft vaak desktop-first met `max-width` en vergeet de viewport-tag - goed om bij verantwoording op te letten.

### Voorbereiding
- Eigen Boulder Base met H9-Flexbox klaar om live mee te werken
- Device toolbar vooraf openen op het digibord, met een telefoon-preset en "Responsive" (vrij slepen)
- Optioneel: een eigen telefoon om het verschil met/zonder viewport-tag écht te laten zien (via Live Server op hetzelfde netwerk)

### Lesopbouw (2 lessen van 90 minuten)

#### Les 1: begrip opbouwen

**Instap (5 min)**
Vraag: "Wie heeft onze schoolwebsite of een webshop weleens op je telefoon geopend? Moest je inzoomen?" Laat een paar studenten hun eigen site op hun telefoon openen als dat kan - het effect van een ontbrekende viewport-tag is direct voelbaar.

**Predict (10 min) - AI uit**
Tweetallen beantwoorden de drie Predict-vragen. Verwachte antwoorden:
1. Header: logo, nav en knop passen niet naast elkaar; items worden geplet of lopen over
2. Cards: 1 op telefoon, 2 op tablet (reken het samen uit: 250 + 20 + 250 = 520px past in 728px, drie niet)
3. 38px is op een telefoon groot - de titel breekt over drie of vier regels

**Run (15 min)**
Device toolbar openen, *iPhone 12 Pro* kiezen, daarna naar "Responsive" en slepen van 320 naar 1200px. Laat de breedtes opschrijven waarop iets breekt - bijna altijd rond 600-800px voor de header. Die breedte wordt straks het breakpoint: *"het beste breakpoint is waar jouw site breekt"*.

Let op: de device toolbar in Chrome simuleert de viewport-tag deels. Het verschil zie je het best op een echte telefoon. Benoem dat.

**Investigate (45 min) - live coding, AI uit**
1. **Viewport-tag** - voeg toe en leg de twee delen uit. Maak dit een vaste regel: "elke site, altijd"
2. **Eerste media query** - schrijf alleen de `.hero h1`-regel. Lees hem hardop voor: *"vanaf 768 pixels breed..."*. Laat studenten het venster over de 768px-grens slepen en zien dat de titel verspringt
3. **Mobile first** - teken de tabel. Kernargument voor deze doelgroep: *op telefoon staat bijna alles gewoon onder elkaar, dat is makkelijke basis-CSS*
4. **Breakpoints** - noem 768 en 1024 als richtlijn, maar koppel terug aan wat ze bij Run hebben gevonden
5. **Volgorde** - demonstreer live de fout: zet een gewone `.hero h1`-regel ónder de media query en laat zien dat de media query "niet meer werkt". Vraag: "Waarom?" (cascade, herhaling specificiteit/volgorde)
6. **`max-width: 100%` en `rem`** - kort. Laat `rem` zien door in de browserinstellingen de lettergrootte te verhogen: `px`-tekst blijft gelijk, `rem`-tekst groeit mee

**Checkvragen (10 min)**
Antwoorden:
1. De telefoon doet alsof hij ~980px breed is en zoomt uit - alles is piepklein, media queries voor kleine schermen grijpen niet
2. Alleen op schermen van 1024px en breder - laptop/desktop, niet op telefoon of (de meeste) tablets
3. Omdat die CSS altijd moet gelden; grotere schermen *voegen* daar iets aan toe
4. De regel onder de media query overschrijft de media query (zelfde selector, onderste wint). Oplossing: media query onderaan zetten

**Afronding (5 min)**
Modify stap 1 (viewport + `img`) klassikaal afronden.

#### Les 2: toepassen

**Terugblik (5 min)**
"Wat betekent `min-width: 768px` in gewone taal?" - "vanaf 768 pixels breed." Wie kan uitleggen waarom we mobile first werken?

**Modify (40 min) - AI mag, met verantwoording**
- Stap 2 (header) - vraag waarom `display: flex` niet in de media query hoeft: die regel staat al in de basis en geldt nog steeds; je overschrijft alleen wat verandert
- Stap 3 (typografie) - controleer dat studenten **één** media query per breakpoint gebruiken, niet per selector een nieuwe
- Stap 4 (cards) - het "aha"-moment: dit werkt al zonder media query. De uitgerekte derde card op tablet is een mooie open ontwerpvraag. Mogelijke oplossingen: `max-width: 400px` op `.card`, of vanaf 1024px `flex-basis` aanpassen. Laat studenten hun oplossing aan elkaar uitleggen
- Stap 5 (footer + formulier) - `width: 100%` op invoervelden, en controleren op horizontaal scrollen

**Make (35 min)**
Eindproject responsive maken volgens de zes eisen. Loop rond met de device toolbar op 320px: moet je horizontaal scrollen? Dan is ergens een vaste `width` of een te brede afbeelding de boosdoener - laat de student die zelf opsporen met DevTools (element selecteren, kijken wat buiten de viewport steekt).

**Debug deze AI-output (10 min)**
Zie antwoord hieronder.

### Antwoord "Debug deze AI-output"
Fouten:
1. **Viewport meta-tag ontbreekt** → "op mijn telefoon is alles piepklein"
2. **`min-width: 768` zonder eenheid** → ongeldige media query, de browser negeert het hele blok. Moet `768px` zijn
3. **Volgorde:** de basisregel `nav { flex-direction: column; }` staat ónder de media query en overschrijft die → "op mijn laptop staat alles óók onder elkaar". Zelfs mét `px` zou dit nog misgaan

Verbeterde versie:
```html
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mijn site</title>
    <link rel="stylesheet" href="css/style.css">
</head>
```
```css
nav {
    display: flex;
    flex-direction: column;
}

@media (min-width: 768px) {
    nav {
        flex-direction: row;
    }
}
```
Bespreek: drie kleine fouten, één symptoom per fout. Laat studenten per symptoom terugredeneren naar de oorzaak - dat is de debugvaardigheid die we willen trainen.

### Huiswerk
1. Boulder Base volledig responsive
2. Eindproject voldoet aan de zes Make-eisen
3. Geen horizontale scrollbalk op 320px
4. Drie schermafbeeldingen (390 / 768 / 1200px) meenemen

**Extra uitdaging:** hamburger-menu met `classList.toggle` (koppeling met JSO H5), `clamp()`, testen op eigen telefoon via Live Server.

### Beoordeling / afsluiting taakklasse 4
Er is geen apart eindproject voor taakklasse 4: de verbeteringen landen in het eindproject uit H8. Gebruik bij een (her)beoordeling of het verantwoordingsgesprek deze aanvulling op de rubric van H8:

| Criterium | Onvoldoende | Voldoende | Goed |
|---|---|---|---|
| **Layout (Flexbox)** | Nog `float`/`inline-block` voor layout | Header en cards met Flexbox, `flex-wrap` en `gap` | Doordacht nesten (bijv. knoppen onderaan), geen overbodige oude regels |
| **Responsive** | Geen viewport-tag of horizontaal scrollen op telefoon | Viewport-tag, mobile first, minimaal 2 breakpoints | Breakpoints gekozen op basis van waar de eigen site breekt, `rem` en `max-width: 100%` toegepast |
| **Verantwoording** | Kan media query niet uitleggen | Kan zeggen vanaf welke breedte een media query geldt | Legt uit waarom mobile first en waarom de cards zonder media query al meeschalen |

Verantwoordingsvragen die goed werken:
- *"Wat gebeurt er als ik deze viewport-regel weghaal?"*
- *"Deze media query - vanaf welke breedte werkt hij, en wat verandert er?"*
- *"Waarom hebben je cards geen media query nodig om op telefoon onder elkaar te staan?"*

### Tips voor docent
- De device toolbar is het belangrijkste gereedschap van dit hoofdstuk. Laat studenten het vanaf nu bij élke CSS-wijziging gebruiken
- Veel studenten gaan zonder na te denken breakpoints toevoegen voor elke paar pixels. Stuur bij: zo weinig mogelijk media queries, pas als Flexbox het niet zelf oplost
- Studenten die AI gebruiken krijgen vaak desktop-first (`max-width`) code. Dat is niet fout, maar vraag ze het om te schrijven naar mobile first - goede verantwoordingsoefening
- Koppeling met Blok 4: benoem dat responsive design vanaf nu een standaardeis is bij elk project, ook in BEO (Project Blok 3A)

### Veelgemaakte fouten
1. Viewport meta-tag vergeten
2. Media query zonder eenheid (`768` i.p.v. `768px`)
3. Media queries bovenaan de CSS, waardoor ze overschreven worden
4. Voor elke selector een aparte media query met hetzelfde breakpoint
5. `min-width` en `max-width` door elkaar gebruiken, waardoor regels elkaar tegenspreken
6. Vaste breedtes (`width: 500px`) op elementen of afbeeldingen, waardoor horizontaal scrollen ontstaat
7. In de media query álle regels herhalen in plaats van alleen wat verandert

---
