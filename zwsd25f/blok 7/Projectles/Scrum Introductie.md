# Scrum Introductie

## Voor wie, wanneer

Deze les hoort bij de start van de projectlessen van Blok 7. Je gaat de komende weken in tweetallen aan één van de vijf projecten werken (zie de projectbeschrijvingen in deze map). In plaats van "gewoon aan de slag gaan", doen we dat dit blok volgens **Scrum** - dezelfde manier van werken die je in veel softwarebedrijven tegenkomt.

Zie voor het totaaloverzicht van de 8 weken: `Sprintplanning Projectlessen.md`.

## Leerdoelen

Na deze les kan je:
- Uitleggen wat Scrum is en waarom softwareteams het gebruiken
- De begrippen sprint, product backlog, sprint backlog, user story en Definition of Done uitleggen
- De Scrum-rollen benoemen en vertalen naar jullie project
- Een taakbord opzetten en gebruiken (GitHub Projects)
- Je eigen Sprint 1 plannen: backlog doornemen, werk verdelen, sprintdoel formuleren

---

## 1. Waarom Scrum? (10 min)

Denk terug aan je vorige projecten (Blok 4-6): je kreeg een opdracht, ging aan de slag, en aan het eind leverde je iets op. Vaak ontdek je dan pas in de laatste week dat een belangrijk onderdeel nog niet werkt, of dat je te veel tijd aan iets kleins hebt besteed.

**Het probleem met "gewoon bouwen":**
- Je weet pas aan het eind of het project goed gaat
- Grote taken blijven vaag ("het inlogsysteem maken") tot je er middenin zit
- Er is geen vast moment om bij te sturen

**Scrum lost dit op** door het werk op te knippen in korte, vaste periodes (**sprints**) met aan het eind van elke sprint een werkend stukje software. Geen "hopelijk werkt het aan het eind", maar elke week een concreet, getest resultaat.

Scrum is een vorm van **Agile** werken - de tegenhanger van de "watervalmethode" waarbij je eerst alles ontwerpt, dan alles bouwt, en pas aan het eind test. Scrum is ontstaan in de software-industrie en wordt nu bij vrijwel elk softwarebedrijf gebruikt, ook buiten IT (marketing, productontwikkeling).

---

## 2. Kernbegrippen (25 min)

### Sprint
Een **sprint** is een vaste, korte periode waarin je aan een afgebakend stuk werk bouwt. Bij ons duurt een sprint **1 week**. Aan het eind van een sprint lever je iets werkends op - niet perfect, maar functioneel.

### Product Backlog
De **product backlog** is de volledige lijst van alles wat het project uiteindelijk moet kunnen - alle functionaliteit, groot en klein, in prioriteitsvolgorde. Voor jullie project staat deze backlog al klaar (zie de sprintbacklog onderaan je projectbeschrijving), verdeeld over de sprints.

### Sprint Backlog
De **sprint backlog** is het deel van de product backlog dat je in de huidige sprint gaat bouwen - een kleine, behapbare selectie.

### User Story
Functionaliteit wordt beschreven als een **user story**, in dit format:

> **Als** `<rol>` **wil ik** `<actie>` **zodat** `<doel>`

Bijvoorbeeld:
> Als melder wil ik een ticket kunnen aanmaken met titel en beschrijving zodat mijn probleem geregistreerd wordt.

Dit dwingt je om altijd te denken vanuit de gebruiker: wie heeft hier iets aan, en waarom? Dat is anders dan een technische taak als "maak een formulier" - die vertelt niet wélk probleem je oplost.

### Definition of Done
Wanneer is een user story écht "klaar"? Spreek per sprint af wat daarvoor nodig is. Een basisversie voor dit vak:
- [ ] De functionaliteit werkt zoals in de user story beschreven staat
- [ ] Er is (server-side) validatie waar nodig
- [ ] De code is gecommit en gepusht naar GitHub met een duidelijke commit message
- [ ] Je kan uitleggen wat je code doet als iemand ernaar vraagt

### Rollen

Scrum kent normaal gesproken drie rollen. In de context van dit vak vertalen we ze zo:

| Scrum-rol | In dit vak |
|---|---|
| **Product Owner** | De docent (bepaalt de prioriteiten in de backlog, beoordeelt of een story écht "done" is tijdens de Sprint Review) |
| **Development Team** | Jullie tweetal - jullie bouwen de sprint backlog |
| **Scrum Master** | Geen aparte rol nodig bij een team van twee - bewaak samen jullie eigen proces (houdt de ander scherp: "hebben we de daily gedaan?") |

---

## 3. Scrum-ceremonies, aangepast aan een lesweek (15 min)

Een "echte" Scrum-sprint heeft vaste bijeenkomsten. We gebruiken een lichte versie, passend bij een lesweek:

| Ceremonie | Wanneer | Wat |
|---|---|---|
| **Sprint Planning** | Begin van de sprintweek | Backlog voor deze sprint doornemen, werk verdelen, sprintdoel in 1 zin formuleren |
| **Daily stand-up** | Elke les/werksessie, kort (5 min) | Ieder beantwoordt: *Wat heb ik gedaan? Wat ga ik nu doen? Loop ik ergens tegenaan?* |
| **Sprint Review** | Einde van de sprintweek | Korte demo van wat werkt aan de docent (Product Owner) |
| **Sprint Retrospective** | Direct na de Review, kort (5 min) | Wat ging goed deze sprint? Wat doen we volgende sprint anders? |

**Waarom de daily stand-up, ook met z'n tweeën?** Het voorkomt dat je een hele week naast elkaar werkt zonder te weten wat de ander doet. Drie vragen, hardop, elke keer - dat is alles.

---

## 4. Taakbord opzetten (20 min)

Een **taakbord** (Kanban-bord) maakt zichtbaar wat er nog moet gebeuren, waar je mee bezig bent, en wat af is. Minimaal drie kolommen: **To Do → In Progress → Done**.

We gebruiken **GitHub Projects**, omdat je toch al met GitHub werkt voor je project-repository:

1. Ga naar jullie GitHub-repository.
2. Klik op het tabblad **Projects** → **New project** → kies het bord-sjabloon (**Board**).
3. Maak drie kolommen: `To Do`, `In Progress`, `Done`.
4. Voeg voor elke user story uit je Sprint 1-backlog een kaart toe in `To Do`.
5. Koppel eventueel kaarten aan issues in je repo (optioneel, maar handig als je met commits naar issues wilt verwijzen).

**Afspraak:** verplaats een kaart zelf als je eraan begint (`In Progress`) en als je 'm afrondt (`Done`). Dit is jullie eigen verantwoordelijkheid - niemand anders doet dit voor je.

---

## 5. Sprint 1 plannen (15 min)

Nu ga je zelf aan de slag met jullie eigen project:

1. Open de sprintbacklog onderaan je projectbeschrijving (zie de bijbehorende `.md` in deze map).
2. Lees de user stories van **Sprint 1** samen door. Zijn ze allebei duidelijk? Vraag het aan de docent als iets onduidelijk is.
3. Verdeel het werk: wie pakt welke story op, of werken jullie samen aan alles? (Bij een klein team van twee is vaak prima om per story te verdelen.)
4. Formuleer samen een **sprintdoel** in één zin: *"Aan het eind van deze week kan een bezoeker inloggen en een [...] aanmaken."*
5. Zet de stories op je taakbord in `To Do`.

**Checkpoint:** aan het eind van deze les heeft elk tweetal een ingericht taakbord met Sprint 1 erop, en een sprintdoel geformuleerd.

---

## Huiswerk / vervolg

- Begin met de eerste user story van Sprint 1.
- Volgende les: eerste daily stand-up, drie vragen, kort.
- Aan het eind van de sprintweek: Sprint Review (korte demo aan de docent) + Retrospective.

---
