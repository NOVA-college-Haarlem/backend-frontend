# Curriculum Web Development - Jaar 1

**Opleiding:** MBO niveau 4, Software Development (developer track)
**Klas:** zwsd26ab
**Scope:** Blok 1 t/m Blok 4 (jaar 1). Jaar 2 (Blok 5-8) volgt in een apart document.
**Bronnen:** `zwsd26ab` (frontend Blok 1-4, backend-pilot PRIMM).

> Dit document beschrijft alleen het curriculum van **zwsd26ab**. Klas **zwsd26f** volgt een eigen, losstaand programma - zie `curriculum-jaar 1 - zwsd26f.md`.

> Dit document is een **overzicht**, geen lesmateriaal. Voor de volledige lesuitwerking, zie de bronbestanden per blok/week.

---

## 1. Blokoverzicht

| Blok | Frontend | Backend |
|---|---|---|
| **1** | Introductie HTML & CSS (Hoofdstuk 1-8) | - (start pas Blok 3) |
| **2** | CSS Verdieping & Basis Styling (Week 1-8) | - |
| **3** | Cards, Layout Trucjes & Flexbox (Week 1-8) | PRIMM-pilot: van statisch PHP naar Laravel/CRUD (Week 1-10) |
| **4** | Formulieren & Responsive/Mobile Development (Week 1-8) | *nog niet uitgewerkt - zie Openstaande punten* |

---

## 2. Blok 1 - Introductie HTML & CSS

**Doelgroep:** MBO studenten (beginners) · **Duur:** 8 hoofdstukken

| # | Hoofdstuk | Leeruitkomsten |
|---|---|---|
| 1 | Introductie HTML | Uitleggen wat HTML is; correcte mappenstructuur opzetten; basis HTML-document structureren; headings en paragrafen toevoegen |
| 2 | Afbeeldingen en Links | Afbeeldingen toevoegen; links maken naar andere websites; DevTools gebruiken om HTML te inspecteren; broncode van andere sites bekijken |
| 3 | CSS Introductie & Copilot | Externe CSS-stylesheet aanmaken en linken; basis CSS-properties toepassen (kleur, font); uitleggen wat Copilot is; verantwoord Copilot-gebruik |
| 4 | Projectweek - "Mijn Hobby Pagina" | Kennis van hoofdstuk 1-3 zelfstandig toepassen in een eigen project |
| 5 | CSS Classes en IDs | Verschil classes/IDs uitleggen; classes en IDs correct toepassen; meerdere classes combineren; beslissen wanneer class vs. ID |
| 6 | Het Box Model | Box model uitleggen (content, padding, border, margin); padding en margin toepassen; borders stylen; DevTools voor box model-inspectie |
| 7 | Semantische HTML | Waarom semantische HTML belangrijk is; correct gebruik van `<header>`, `<main>`, `<footer>`, `<section>`, `<article>`; code netjes inspringen |
| 8 | Projectweek 2 | Uitgebreide portfolio/hobbywebsite met alle geleerde technieken |

**Eindresultaat Blok 1:** HTML-structuur en semantische elementen, basis CSS-styling, box model, classes/IDs, DevTools, zelfstandig een simpele website bouwen.

---

## 3. Blok 2 - CSS Verdieping & Basis Styling

**Doelgroep:** basis HTML/CSS uit Blok 1 · **Duur:** 8 weken
**Let op:** Blok 2 is bewust eenvoudig gehouden - ook toegankelijk voor studenten die niet de developer-richting opgaan. Cards, formulieren, responsiveness en layout-trucjes zijn hieruit verplaatst naar Blok 3/4 (developer track).

| # | Week | Leeruitkomsten |
|---|---|---|
| 1 | Herhaling & CSS Selectoren Uitbreiden | Blok 1-concepten herhalen; descendant/child/adjacent sibling selectors; multiple selectors combineren; `:hover`/`:focus` toepassen |
| 2 | Buttons Maken | Button-basics stylen; types (primary/secondary/outline/danger); sizes; hover/active/disabled states; `cursor: pointer`; transitions |
| 3 | Kleuren, Typografie en Afbeeldingen | Kleurenschema's en CSS-variabelen (`:root`); color formats (hex/rgb/rgba); typografische hiërarchie; line-height/letter-spacing; afbeeldingen stylen; `object-fit`; filters |
| 4 | Projectweek - "Style Guide & Button Library" | Week 1-3 combineren in een kleurenpalet, typografie, button library en afbeeldingstijlen |
| 5 | Lijsten en Navigatie | HTML-lists stylen; list-style properties; horizontale navigatie (inline-block); verticale/sidebar-navigatie; active/hover states |
| 6 | Layouts Basis | Block/inline/inline-block; centreren met `margin: 0 auto`; `max-width`; inline-block layouts; `vertical-align`; white-space-probleem |
| 7 | Website Opmaak | Complete structuur (header/main/footer); hero sections; secties onderscheiden met achtergronden; footer met kolommen; call-to-action |
| 8 | Eindproject - "Persoonlijke Website" | Complete one-page website met alle Blok 2-technieken |

**Eindresultaat Blok 2:** CSS-selectoren, buttons, kleuren/typografie, afbeeldingen, navigatie, basis layout, complete website-opmaak.

---

## 4. Blok 3 - Cards, Layout Trucjes & Flexbox (Frontend) + PRIMM Backend-pilot

### 4a. Frontend: Cards, Layout Trucjes & Flexbox

**Doelgroep:** developer track, HTML/CSS uit Blok 1-2 · **Duur:** 8 weken · CSS Grid is bewust niet opgenomen (focus op herhaling met Flexbox)

| # | Week | Leeruitkomsten |
|---|---|---|
| 1 | Cards Bouwen (Basis) | Wat cards zijn en waarvoor; basis card-structuur (HTML); stylen met borders/shadows/spacing; layouts met inline-block; hover-effecten; `object-fit` in cards |
| 2 | Meer Card Variaties | Horizontale cards; badges met absolute positioning; card headers/footers; color schemes; overlay-effecten (position + opacity); float voor horizontale cards |
| 3 | Layout Trucjes | Float voor layouts/text-wrap; clearfix; position (relative/absolute/fixed); 2-kolom layouts met float; z-index; fixed headers |
| 4 | Projectweek - "Card-Based Website" | Header, hero, 12+ cards (3 variaties), 2-kolom layout, badges, hover-effecten, footer |
| 5 | Flexbox Introductie | Wat Flexbox is en waarom beter dan float/inline-block; `display: flex`; `flex-direction`; `justify-content`; `align-items`; `gap`; navigatie en cards met Flexbox |
| 6 | Flexbox Verdieping | `flex-grow`/`flex-shrink`/`flex-basis`; `flex`-shorthand; `flex-wrap`; `align-content`; `order`; `align-self`; geneste flex containers; 2-/3-kolom layouts |
| 7 | Flexbox Praktijk (veel herhaling) | Veelvoorkomende layoutpatronen; troubleshooting; Flexbox + cards combineren; perfect centreren; navigatiepatronen; responsive columns |
| 8 | Eindproject - "Complete Flexbox Website" | Flexbox voor alle layouts, 8+ cards, position voor badges, fixed header, gecentreerde hero, responsive met flex-wrap |

**Eindresultaat Blok 3 (frontend):** cards (alle varianten), oude layouttechnieken (float/position), Flexbox diepgaand (container- én item-properties, wrap, nesting, troubleshooting).

### 4b. Backend: PRIMM-pilot - van statisch naar dynamisch (PHP → Laravel)

**Doelgroep:** eerste backend-blok, developer track · **Duur:** 10 weken · **Didactiek:** PRIMM (Predict-Run-Investigate-Modify-Make), doorlopende context "PlayList" (eigen catalogus-app)

| # | Week | Leeruitkomsten |
|---|---|---|
| 1 | Van statisch naar dynamisch (PHP) | Verschil client-side (HTML/CSS) vs. server-side (PHP) uitleggen; PHP-variabele maken/vullen/tonen met `echo`; voorspellen wat PHP-code toont |
| 2 | Data tonen met arrays | Verschil array vs. associatieve array; lijst tonen met `foreach`; `if` gebruiken om weergave te bepalen; loop-gedrag voorspellen |
| 3 | Data uit de database (PDO) | Waarom data in een database i.p.v. in code; een tabel herkennen (rijen/kolommen); een `SELECT`-query lezen/uitvoeren via PDO; data tonen met `foreach` |
| 4 | Projectweek - eigen catalogus | Zelfstandig een dynamische catalogus bouwen (database + PDO + foreach), integratie van week 1-3 |
| 5 | Waarom een framework? (Laravel-intro) | Problemen die een framework oplost benoemen; rol van een route uitleggen; MVC op hoofdlijn benoemen; bestaande route/Blade-view lezen en aanpassen |
| 6 | Eloquent & Models | Wat een Model is; wat een Controller doet; `Game::all()` koppelen aan `SELECT`; database-data tonen via controller + Blade |
| 7 | Formulieren & opslaan (Create + validatie) | De route formulier→POST→controller→database volgen; waarom formulierdata valideren; een `store`-methode lezen/aanpassen; wat `@csrf` doet |
| 8 | CRUD compleet (Update & Delete) | De vier CRUD-operaties koppelen aan controller-methodes en SQL; edit/`update` lezen en aanpassen; delete veilig uitvoeren (POST/DELETE, niet via link); eigen CRUD-schema uittekenen |
| 9 | Afronden & assessmentvoorbereiding | Eigen app foutloos demonstreren en elke laag benoemen (route→controller→model→view); een regel code verantwoorden; AI-code controleren en verbeteren; rubric toepassen op eigen werk |
| 10 | Mondeling assessment | Summatief: begrip en verificatie van de eigen PlayList-app verantwoorden (geen "werkt het"-toets) |

**Eindresultaat Blok 3 (backend):** client/server, variabelen, arrays/loops/condities, database & queries (PDO), formulierverwerking, volledige CRUD, MVC-basis (routing/model/controller/view) in Laravel, validatie en basisveiligheid (`@csrf`).

---

## 5. Blok 4 - Formulieren & Responsive/Mobile Development (Frontend)

**Doelgroep:** developer track, HTML/CSS/Flexbox uit Blok 1-3 · **Duur:** 8 weken
**Backend-integratie:** formulieren worden hier alleen frontend voorbereid; verwerking (`$_POST`, validatie server-side, opslag) komt in het backend-vervolg.

| # | Week | Leeruitkomsten |
|---|---|---|
| 1 | Formulier Basics & Text Inputs | Waarom formulieren belangrijk zijn; `<form>`/`<label>`/`<input>`-structuur; text-inputtypes (text/email/password/number/tel/url); labels koppelen (for/id); placeholder/required; basis formulierstyling; `:focus`/`:valid`/`:invalid` |
| 2 | Radio Buttons, Checkboxes & Select | Radio buttons en checkboxes maken/stylen; custom styling (`appearance: none`); select dropdowns; `<optgroup>`; multiple select; `<fieldset>`/`<legend>` |
| 3 | Textarea, Buttons & Validatie | Textarea + `resize`; button-types en states; HTML5-validatie (`required`/`pattern`/`min`/`max`/lengte); custom validatiefeedback; `:invalid`/`:valid` |
| 4 | Projectweek - "Contact & Registratie Formulieren" | Contact- en registratieformulier met 8+ inputtypes, custom radio/checkbox, select, textarea, validatie, error/success states, toegankelijkheid, responsive layout |
| 5 | Responsive Development Intro | Wat responsive design is en waarom; viewport meta tag; media queries (`@media`); breakpoints kiezen; mobile-first vs. desktop-first; responsive units (%, vw, vh, em, rem) |
| 6 | Mobile-First & Touch Interfaces | Mobile-first strategie; touch-friendly elementen (44×44px); hamburgermenu (+ basis JS-toggle); touch- vs. click-events; scrollgedrag; landscape/portrait |
| 7 | Responsive Formulieren & Patterns | Formulieren responsive maken; stacked vs. inline layouts; labels/inputs responsive positioneren; touch-friendly tap targets; `inputmode`; full-width buttons op mobile |
| 8 | Eindproject - "Complete Responsive Form Application" | Multi-step formulierapplicatie: alle inputtypes, validatie, volledig responsive (mobile-first), hamburgermenu, toegankelijk, progress-indicator, review- en successpagina |

**Eindresultaat Blok 4 (frontend):** volledige formulierbouw en -styling (incl. custom inputs en validatie-UI), responsive/mobile-first development, touch-friendly en toegankelijke interfaces - klaar om aan backend-verwerking te koppelen.

---

## 6. Eindbeeld na Jaar 1 (Blok 1-4)

Na jaar 1 kan een developer-track student:

**Frontend**
- Semantische, toegankelijke HTML-structuur opzetten
- CSS extern organiseren met classes/IDs, selectoren en variabelen
- Cards en herbruikbare componenten bouwen
- Layouts maken met zowel klassieke technieken (float/position) als Flexbox
- Volledige, gevalideerde formulieren bouwen en stylen (incl. custom inputs)
- Websites responsive en mobile-first opbouwen

**Backend**
- Het verschil client/server en de basis van PHP toepassen
- Data structureren (arrays) en tonen (loops/condities)
- Data opslaan/ophalen uit een database (PDO en Eloquent)
- Een MVC-framework (Laravel) gebruiken: routes, controllers, models, Blade-views
- Volledige CRUD bouwen, incl. formulierverwerking, validatie en basisveiligheid
- De eigen code mondeling verantwoorden (AI-bestendige toetsing)

---

## 7. Openstaande punten

- **Backend Blok 4** is nog niet uitgewerkt. De frontend-formulieren uit Blok 4 zijn hier klaar voor, maar er is nog geen lesplan voor de bijbehorende backend-verwerking (validatie server-side, opslag, security, mogelijk sessions/file uploads). Zie ook `todo.md`.
- **Jaar 2 (Blok 5-8)** is nog niet in kaart gebracht - apart curriculumdocument.
- **Lesmateriaal Blok 1-4** (zwsd26ab) staat inhoudelijk, maar de docent wil dit op termijn herzien. Dit document beschrijft de huidige stand, niet per se de gewenste eindstand.
