# Samenvattingsquiz HTML & CSS (Mentimeter)

**Klas:** zwsd26f · **Stof:** FEO Hoofdstuk 1-10 · **Duur:** ca. 20-25 min · **Type Menti-slide:** Quiz → *Select answer*

**Werkvorm (peer instruction):** laat eerst iedereen alleen stemmen. Heeft minder dan ~70% het goed? Dan 1 minuut overleggen met je buur en de vraag opnieuw stellen (slide dupliceren). Het juiste antwoord staat aangegeven met ✅.

> Menti toont geen code-opmaak. Code in een vraag staat daarom kort op één regel. Wil je het mooier, zet de code dan in een screenshot als afbeelding bij de vraag.

---

### 1. Externe CSS koppelen (20 s)
Hoe koppel je een extern stylesheet aan je HTML?
- ✅ `<link rel="stylesheet" href="css/style.css">`
- `<style src="css/style.css">`
- `<script href="css/style.css">`
- `<css>style.css</css>`

### 2. Waarom externe CSS? (20 s)
Waarom gebruik je externe CSS in plaats van inline styles?
- Inline styles werken niet in Chrome
- ✅ Je past de stijl op één plek aan en die geldt overal
- Externe CSS is verplicht in HTML5
- Externe CSS maakt de pagina altijd sneller

### 3. Class of id (20 s)
Wat is het verschil tussen een class en een id?
- Een class is voor tekst, een id voor afbeeldingen
- Er is geen verschil
- ✅ Een id is uniek per pagina, een class mag je vaker gebruiken
- Een id mag je vaker gebruiken, een class maar één keer

### 4. Box model rekenen (30 s)
`width: 200px; padding: 20px; border: 5px solid;` Hoe breed is het element in totaal?
- 200px
- 225px
- 240px
- ✅ 250px

*Uitleg: 200 + 2×20 + 2×5 = 250 (standaard box-sizing).*

### 5. Box model (20 s)
Welke ruimte zit **buiten** de border?
- padding
- ✅ margin
- content
- outline-padding

### 6. Semantische HTML (20 s)
Welk element gebruik je voor de hoofdnavigatie van je site?
- `<div class="nav">`
- `<section>`
- ✅ `<nav>`
- `<menu-bar>`

### 7. Semantische HTML (20 s)
Hoe vaak mag `<main>` voorkomen op één pagina?
- ✅ 1 keer
- 2 keer
- Zo vaak als je wilt
- 0 keer, het is verouderd

### 8. Selectoren (30 s)
Welke elementen raakt de selector `.card a`?
- Elementen met class `card` én class `a`
- ✅ Alle links die binnen een element met class `card` staan
- Alleen de eerste link in een card
- Een element met class `"card a"`

### 9. Pseudo-classes (20 s)
Wanneer is `:focus` actief?
- Als je met de muis over een element gaat
- Als de pagina geladen is
- ✅ Als een element geselecteerd is, bijvoorbeeld met de Tab-toets
- Als een link al eens bezocht is

### 10. CSS-variabelen (30 s)
In `:root` staat `--hoofdkleur: #e63946;` Hoe gebruik je die?
- `color: --hoofdkleur;`
- ✅ `color: var(--hoofdkleur);`
- `color: $hoofdkleur;`
- `color: root(--hoofdkleur);`

### 11. Waarom variabelen? (20 s)
Wat is het grootste voordeel van CSS-variabelen?
- De site laadt sneller
- ✅ Je past een kleur op één plek aan en hij verandert overal
- Je hebt geen classes meer nodig
- Je kunt geen fouten meer maken

### 12. Duplicatie (30 s)
Drie knoppen hebben elk een eigen class (`.knop-card-1`, `-2`, `-3`) met precies dezelfde CSS. Wat is de beste oplossing?
- Alles inline zetten
- Drie ids gebruiken
- ✅ Eén class `.knop` maken voor alle drie
- Het zo laten, het werkt toch

### 13. Flexbox (20 s)
Op welk element zet je `display: flex`?
- Op elk item apart
- ✅ Op de container (het ouder-element)
- Op `<body>`, altijd
- Op het eerste item

### 14. Flexbox (20 s)
Wat doet `justify-content: space-between`?
- Zet alle items in het midden
- Zet items onder elkaar
- ✅ Verdeelt de ruimte tussen de items
- Geeft elk item 10px marge

### 15. Media queries (30 s)
Wanneer geldt de CSS in `@media (max-width: 600px) { ... }`?
- Op schermen breder dan 600px
- ✅ Op schermen van 600px of smaller
- Alleen op telefoons van Apple
- Altijd, maar pas na 600 milliseconden

### 16. AI-code debuggen (30 s)
ChatGPT geeft `<link rel="stylesheet" href="style.css">`, maar je bestand staat in de map `css/`. Wat gebeurt er?
- Werkt gewoon, de browser zoekt zelf
- ✅ Geen opmaak: het pad naar het bestand klopt niet
- Je krijgt een foutmelding op de pagina
- Alleen de kleuren werken niet
