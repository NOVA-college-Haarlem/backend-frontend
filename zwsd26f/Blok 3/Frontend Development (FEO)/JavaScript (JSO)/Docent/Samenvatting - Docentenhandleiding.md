## Samenvatting JavaScript: Café De Kade komt tot leven (les 2 van 2) - Docentenhandleiding

*Opdracht en startbestanden: eigen repo [NOVA-college-Haarlem/De-Kade](https://github.com/NOVA-college-Haarlem/De-Kade) (README = studentversie, deel "Les 2")*
*Les 1 (HTML/CSS, zelfde site): `../../Docent/Samenvatting - Docentenhandleiding.md`*
*Modeluitwerking: `../../Docent/dekade-uitwerking/` (brons + zilver + alle goud-opties)*
*Quiz: `Samenvatting - Quiz JavaScript (Menti).md`*

**Type:** samenvattingsles, 90 minuten. Quiz + bouwen in drie niveaus.
**Technieken:** H1-H7. Nieuw in goud: `toFixed()`, `classList.contains()` en `innerHTML +=` (staan uitgelegd in de opdracht).
**Na les 1:** studenten werken verder in hun eigen versie van les 1. Eerste stap is het script aanzetten (comment weghalen in de `<head>`). Wie brons van les 1 niet af heeft, mist `<header>` of heeft nog `class="Kaart"`: dat eerst oplossen. Wie zilver stap 2 (variabelen) niet deed, ziet dark mode maar half werken, want vaste hex-codes veranderen niet mee.

### Lesopbouw (90 min)

| Tijd | Onderdeel |
|---|---|
| 0-25 | Menti-quiz (peer instruction, zie quizbestand) |
| 25-30 | Opdracht introduceren: open de site op het bord, open de Console, laat de rode foutmelding zien |
| 30-80 | Bouwen: brons → zilver → goud, in eigen tempo |
| 80-90 | Tweetallen: regel aanwijzen en uitleggen |

### Brons: de fouten

| # | Klacht | Oorzaak | Oplossing | Herhaling van |
|---|---|---|---|---|
| 1a | Niets werkt, `Cannot read properties of null (reading 'addEventListener')` op regel 4 | `<script>` staat in de `<head>` zonder `defer`. Het script draait voordat de knoppen bestaan | `defer` toevoegen (of script onderaan `<body>`) | H1 |
| 1b | Zelfde melding, zelfde regel | `querySelector("dark-toggle")`, `#` ontbreekt | `"#dark-toggle"` | H2, quizvraag 5 en 17 |
| 2 | Dark mode gaat niet meer uit | `classList.add("dark")` | `classList.toggle("dark")` | H5, quizvraag 12 |
| 3 | `€ 06.756.75` | `let totaal = "0";` is een string, `+` plakt aan elkaar | `let totaal = 0;` | H1, quizvraag 4 |
| 4 | Pagina ververst bij reserveren | `event.preventDefault()` ontbreekt | Toevoegen bovenaan de submit-handler | H7, quizvraag 9 |
| 5 | `Assignment to constant variable` | `if (naam = "")`: `=` probeert een waarde aan de `const` te geven | `===` | H4, quizvraag 11 |
| 6 | Altijd "Vul je naam in" | `.textContent` van een `<input>` is altijd leeg | `.value` | H7, quizvraag 16 |

**Waarom 1a en 1b dezelfde melding geven:** beide maken `darkKnop` `null`. Wie alleen één van de twee oplost, ziet niets veranderen. Dat is bewust: laat studenten zelf `console.log(darkKnop)` toevoegen om te zien wanneer het `null` is. Goed moment voor het gesprek "een fix die niks lijkt te doen kan toch goed zijn".

**Fout 5 zie je pas na fout 4:** zonder `preventDefault` ververst de pagina en verdwijnt de foutmelding uit de Console. Wie wil, kan in de Console-instellingen "Preserve log" aanzetten.

### Zilver: waar op letten

- Verwacht patroon (zoals H6): `querySelectorAll(".bestel")` + `forEach(function (knop, index) { ... prijzen[index] ... })`
- Veelgemaakte fout: `let totaal = 0` **binnen** de click-handler zetten. Dan begint het totaal bij elke klik opnieuw bij 0. Goed gespreksonderwerp over waar een variabele "leeft"
- Leegmaken: zowel de variabele `totaal` als de tekst moet terug naar 0. Alleen de tekst aanpassen → bij de volgende klik telt hij door vanaf het oude totaal

### Goud: waar op letten

- **toFixed:** `totaal.toFixed(2)` geeft `"20.50"`. Wie een komma wil: `.replace(".", ",")`. Geen eis
- **Vega-filter:** `if (kaart.classList.contains("vega") === false)` + `toggle("verborgen")`. Een student die `.style.display = "none"` gebruikt, is functioneel goed. Vraag dan waarom een class beter is (zelfde redenering als dark mode)
- **Dagmenu:** `innerHTML +=` is nieuw. Check dat ze begrijpen dat `+=` toevoegt en `=` alles vervangt

### Snelle studenten
Klaar met goud: laat ze één fout terugzetten in hun eigen code (zonder te zeggen welke) en een klasgenoot laten zoeken met alleen de Console.
