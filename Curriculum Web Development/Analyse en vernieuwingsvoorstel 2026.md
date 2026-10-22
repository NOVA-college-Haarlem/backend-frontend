# Curriculumanalyse & vernieuwingsvoorstel Web Development

> **Klassen:** zwsd24ab · zwsd25ab · zwsd25f (25FN) · zwsd26f
> **Datum:** 10 oktober 2026
> **Doel:** in kaart brengen wat er nu staat, waar herhaling zit, en hoe we naar een **helikopterview** kunnen: minder regel-voor-regel instructie, meer grote concepten. Studenten werken nu met AI.

---

## 1. Kern in vijf punten

1. **CRUD is over drie blokken uitgesmeerd en wordt daarna in Laravel opnieuw geleerd.** Read zit in blok 3, Create + login in blok 4, Update/Delete + beveiliging in blok 5, en in blok 6 (Laravel) begint alles weer bij nul. Dat is ruim 30 lesweken voor één patroon.
2. **Elk blok heeft 2–3 herhalingsmomenten.** Blok 3 (25ab/26f) bestaat voor ongeveer **39 %** uit herhaling (H3 + H6). Verder zijn er 17 aparte herhalings- en samenvattingsbestanden in de vier klassen.
3. **De instructie zit op regelniveau.** Hoofdstukken bestaan voor 25–50 % uit codeblokken met "maak bestand X, neem deze code over". Met AI is dat precies het deel dat studenten overslaan, en het is ook het deel dat het minst leert.
4. **Veiligheid wordt achteraf aangeleerd.** Studenten schrijven blok 3 en 4 met `mysqli` en string-queries. Pas in blok 5 komen PDO, prepared statements, hashing en XSS. Een half jaar lang wordt het onveilige patroon ingeslepen.
5. **In 26f en de 26ab-pilot staat de vernieuwing al.** PRIMM, AI-beleid per fase, "Debug deze AI-output" en verantwoordingsgesprekken zijn daar uitgewerkt. Het voorstel hieronder trekt die aanpak door naar blok 4–8 en zet er een conceptlijn boven.

---

## 2. Scope en bronnen

| Klas | Wat er in de repo staat | Opmerking |
|---|---|---|
| **zwsd24ab** | Blok 5 (plain PHP), 6 (Laravel Todo), 7 (API's), 8 (Scrum, Pest, Git, Railway) | Het meest complete beeld van jaar 2 |
| **zwsd25ab** | Blok 3, 4, 5 (plain PHP, incl. Mollie-hoofdstuk) | Blok 6–10 zijn lege mappen |
| **zwsd25f** | Blok 3 (BEO + FEO), 4, 5, 6 (Laravel Spelshop), 7 (API's + Queues + Testen) | Heeft de nieuwste blok 7-versie |
| **zwsd26f** | Blok 3: BEO (= 25ab blok 3) + FEO/JSO (nieuw, PRIMM/4C-ID, docentenhandleidingen) | Blok 1, 2 en 4 zijn nog leeg |
| *zwsd26ab (ter referentie)* | Pilot "Backend PRIMM" + notitie *Didactische aanpak in AI-tijdperk* | Gebruikt als voorbeeld van de gewenste richting |

Bekeken: alle hoofdstukbestanden (koppen, leerdoelen, opdrachtstructuur, verhouding code/tekst), de eindprojecten, de curriculumoverzichten in `Curriculum Web Development/` en de AI-passages.

---

## 3. Huidige opbouw (backend-lijn)

| Blok | Inhoud nu | Kernpatroon |
|---|---|---|
| **3** | PHP-intro, request/response, arrays/foreach, DB lezen (mysqli), detailpagina, afbeeldingen, filter. **H3 en H6 zijn herhaling.** | **R**ead |
| **4** | Create + validatie, registreren, inloggen/sessies, *samenvatting*, JOINs, zoeken, dashboard (25f: nog een herhaling in H1 en H8) | **C**reate + auth |
| **5** | PDO + SQL-injectie, XSS/validatie/hashing, Update, Soft delete + AJAX-cart, Security, Filters, Error pages, (25ab: Mollie) | **U**pdate/**D**elete + beveiliging achteraf |
| **6** | Laravel: setup, routes/views/controllers, migrations/seeders, Eloquent-relaties, CRUD + validatie, Breeze, middleware, gates/policies, many-to-many | **CRUD opnieuw**, nu in een framework |
| **7** | API consumeren (weer, CoinGecko), caching, Chart.js, mail, eigen REST API, full stack, (25f: queues/scheduler, testen) | Systemen koppelen |
| **8** (24ab) | Scrum, user stories, autorisatie, mail/notificaties, Pest, Git branching, deployen, assessment | Werken in teamverband |

Frontend (26f blok 3): CSS-herhaling → box model → semantiek → selectoren → variabelen → navigatie → layout → flexbox → responsive; JS: DOM → events → condities → classList → arrays/loops → formulieren. Dit deel is al vernieuwd (PRIMM + taakklassen + AI-beleid).

---

## 4. Bevindingen

### 4.1 Eén patroon over vier blokken verdeeld

CRUD is hét centrale concept van webbackend, maar studenten zien het nooit als geheel:

```
Blok 3: R ─────────────┐
Blok 4: C (+ login) ───┤  plain PHP, ~30 lesweken
Blok 5: U, D ──────────┘
Blok 6: C R U D opnieuw, in Laravel
```

Het gevolg is dat de vraag "hoe ziet een complete webapplicatie eruit?" pas in blok 5 te beantwoorden is. De pilot in 26ab laat zien dat het ook anders kan: daar komen CRUD en de Laravel-brug samen in **10 weken**.

### 4.2 Herhaling binnen een blok

| Plek | Herhalingsvorm |
|---|---|
| 25ab/26f blok 3 | H3 *Herhaling H1 & H2* + H6 *Herhaling* (Tools4Ever) + samenvatting. Ongeveer 2.450 van 6.340 woorden |
| 25ab blok 4 | H4 *Samenvatting week 1–3* |
| 25f blok 4 | H1 *Herhaling, Create…* + H4 *Samenvatting* + H8 *Herhaling opdrachten* |
| 25f blok 6 | *Samenvatting H1–3* + H11 *Herhaling en verdieping*. H2–H5 zijn ook "herhaling MVC voor producten / detailpagina's" |
| 24ab blok 6 | H6 *Herhaling* |
| Blok 5 (alle) | Filters (al in blok 3), validatie (al in blok 4) en login (al in blok 4, nu met hashing) komen opnieuw |

Herhaling op zich is goed (*retrieval practice*). Het probleem is de **vorm**: hele weken waarin hetzelfde opnieuw wordt nagebouwd in een nieuwe context (Pokémon → Formula 1 → Tools4Ever). Korte, gespreide terugblik in dezelfde context werkt beter en kost minder tijd.

### 4.3 Instructie op regelniveau

- Codeblokken beslaan een groot deel van de tekst: blok 3 H2 **48 %**, blok 5 H8 Mollie **46 %**, blok 7 H7 **27 %**.
- Er staan 30 expliciete "kopieer / plak / neem de volgende code over"-instructies in 25ab + 25f.
- Leerdoelen zijn vaak instrumenteel geformuleerd ("Ik kan `fetchAll()` gebruiken met `PDO::FETCH_ASSOC`"), terwijl er weinig staat op het niveau van **waarom** ("Ik kan uitleggen waarom de server de enige plek is waar je data kunt vertrouwen").

Met AI genereert een student zo'n hoofdstuk in een paar minuten. Het product is dan af, maar het begrip ontbreekt. De huidige eindprojecten beoordelen vooral het product en kunnen dat verschil niet zien.

### 4.4 Eerst onveilig, dan repareren

`mysqli` + string-queries in blok 3 en 4 (5 hoofdstukken elk), PDO pas in blok 5. De SQL-injectie-demo in blok 5 is didactisch sterk, maar komt een half jaar te laat. Bovendien schrijft AI standaard al prepared statements, waardoor de les "van onveilig naar veilig" zijn urgentie verliest. **Secure by default** vanaf de eerste query is eenvoudiger en past beter bij hoe de code er in de praktijk uitziet.

### 4.5 Eindprojecten: veel varianten, weinig verschil

- Blok 4 en blok 5 (25ab) gebruiken **dezelfde vijf thema's** (Fitness, Library, Movie, Music, Restaurant).
- Varianten verschillen vooral in zelfstandige naamwoorden. Neem je Fitness en Library en vervang je de themanaam, dan blijft ongeveer de helft van de regels identiek.
- 6–7 losse projectbestanden per blok per klas betekenen veel onderhoud (zie 4.6) en voegen inhoudelijk weinig toe.

### 4.6 Onderhoud en consistentie

- **Gekopieerd tussen klassen:** 24ab blok 7 H1–H5 = 25f blok 7 H1–H5 (identiek), 25ab blok 3 = 26f blok 3 BEO (identiek). Hergebruik is prima, maar de versies lopen uit elkaar: 25f blok 7 kreeg H6–H8 uitgebreid, 24ab niet. 25ab blok 5 heeft Mollie, 25f niet.
- **Kleine fouten:** de koppen in 24ab blok 6 zeggen "Blok 9", de inhoudsopgave in de README van 25f blok 6 verwijst naar bestandsnamen die niet bestaan (H1b, H1c… tegenover H2, H3… op schijf), in 25ab blok 5 H2 en H3 staan dubbele koppen, en de opdrachtnummering is niet doorlopend.
- **Dubbelingen per klas:** er zijn 7 samenvattingen/leerdoeloverzichten die met de hand worden bijgehouden naast de hoofdstukken.

### 4.7 Wat al goed werkt (behouden en uitbreiden)

- **26f FEO/JSO + 26ab-pilot:** PRIMM-lesritme, taakklassen (4C/ID), één doorlopende context, AI-beleid per fase (*Predict/Investigate: AI uit · Modify: mag met verantwoording · Make: elke regel verantwoorden*), "Debug deze AI-output", verantwoordingsgesprek als toets, docentenhandleidingen.
- **25f blok 7 H7/H8 (queues, testen):** hier staat al conceptueel denken centraal, bijvoorbeeld "meet eerst het probleem" en "laat een test falen".
- **24ab blok 8:** Scrum, Git-branching, PR's, deployen en het mondeling assessment. Dit is beroepspraktijk en sluit goed aan op werken met AI.
- **SQL-injectie- en XSS-demo's:** eerst het gevaar laten zien, dan pas de oplossing. Goed principe, alleen te laat geplaatst (zie 4.4).

### 4.8 Wat ontbreekt op helikopterniveau

Deze concepten worden nu impliciet of niet aangeboden, terwijl ze juist relevant worden als AI de regels schrijft:

| Concept | Waarom nu belangrijk |
|---|---|
| **De webapplicatie als systeem** (browser ↔ server ↔ database, statelessness, sessies) | Om te kunnen beoordelen *waar* AI-code hoort te draaien |
| **Datamodellering** als ontwerpvaardigheid (ERD vóór code) | AI kan tabellen maken, maar niet bepalen wat het domein nodig heeft |
| **Lagen/architectuur** (MVC als idee, niet als Laravel-feature) | Om te herkennen dat AI-code op de verkeerde plek staat |
| **Vertrouwensgrens** (alles van de client is onbetrouwbaar) | Eén principe dat validatie, XSS, SQLi, CSRF en autorisatie verklaart |
| **Authenticatie ≠ autorisatie** | Komt nu op vier plekken versnipperd terug |
| **Contracten** (HTTP-statuscodes, API's, JSON) | Er bestaat al een error-pages-hoofdstuk, maar zonder het overkoepelende idee |
| **Testen als specificatie** | Het belangrijkste middel om AI-output te controleren |
| **Code lezen, debuggen en reviewen** | Een kernvaardigheid als AI het schrijfwerk doet. Nu alleen in 26f H7-extra en de pilot |
| **Versiebeheer en deployment** | Zit alleen in blok 8 van 24ab |

---

## 5. Visie: van schrijver naar ontwerper en reviewer

> De student hoeft niet elke regel zelf te typen, maar moet **elke regel kunnen lezen, uitleggen en verantwoorden**, en vooral kunnen bepalen **wat** er gebouwd moet worden en **of** het klopt.

Daarom stellen we het concept centraal en wordt syntax hulpmiddel. Concreet:

| Van | Naar |
|---|---|
| "Maak `tool_update.php` en neem deze code over" | "Teken de flow GET → formulier → POST → UPDATE. Laat AI het bouwen. Vind de twee fouten in de output." |
| Een techniek per week (filter, zoeken, soft delete) | Een concept per week (vertrouwensgrens, toestand, contracten) met technieken als voorbeelden |
| Nieuwe context per hoofdstuk | Eén doorlopende applicatie per blok die groeit |
| Herhalingsweek | Elke les 5–10 min retrieval in dezelfde context |
| Productbeoordeling | Product + verantwoording + live aanpassing |

**Een belangrijke kanttekening:** helikopterview betekent niet dat de basis wegvalt. Wie een `foreach` niet kan lezen, kan AI-code ook niet beoordelen. Onderzoek naar novice-programmeurs laat zien dat leerlingen die vroeg op generatie leunen een *illusie van competentie* ontwikkelen. De PRIMM-fases met **AI uit** (Predict/Investigate) moeten daarom blijven en zijn in de eerste blokken zelfs zwaarder dan later. De verschuiving zit vooral in **blok 4–8**.

---

## 6. Voorstel

### 6.1 Ontwerpprincipes

1. **Eén concept per week, één applicatie per blok.** Geen contextwissel om te herhalen.
2. **Secure by default.** PDO + prepared statements + `htmlspecialchars` vanaf de eerste query. De demo "zo breek je het" blijft, maar dan in blok 3.
3. **Volledige CRUD binnen één blok.** Daarna verdiepen, niet opnieuw opbouwen.
4. **Laravel als herframing, niet als herstart.** Een mappingtabel "wat je in plain PHP deed ↔ hoe Laravel het noemt" vervangt vier hoofdstukken met stap-voor-stap-herbouw.
5. **PRIMM + AI-fasebeleid** in alle backendblokken (zoals in 26f/26ab).
6. **Ontwerp vóór code:** elk nieuw onderdeel begint met een ERD, flowschets of user story. AI mag de code schrijven, de student ontwerpt.
7. **Herhaling = retrieval.** Een korte startquiz of "voorspel deze code" aan het begin van elke les, plus één cheatsheet per blok in plaats van losse samenvattingen.

### 6.2 Conceptlijn (helikopterview per blok)

| Blok | Groot concept | Technieken als voorbeeld | Wat AI mag doen | Wat de student zelf moet beheersen |
|---|---|---|---|---|
| **3** | **Het web als systeem.** Request/response, server rendert, data komt uit een DB | PHP-templates, arrays/loops, `SELECT` met PDO, detailpagina via GET, filter. Demo SQLi | Opmaak, testdata | Code lezen en voorspellen, request-flow tekenen, query uitleggen |
| **4** | **Toestand en invoer.** Formulieren, sessies, de vertrouwensgrens | Volledige CRUD, validatie, XSS, registreren/inloggen met hashing, JOIN, zoeken | Formulieren, CSS, boilerplate | Vertrouwensgrens benoemen, CRUD-flow ontwerpen, AI-code op lekken controleren |
| **5** | **Structuur en architectuur.** Van spaghetti naar lagen | Eigen code refactoren naar router + controllers + views (mini-MVC), auth vs autorisatie (rollen), AJAX/JSON, externe API (Mollie), HTTP-statuscodes, soft delete | Refactorvoorstellen, AJAX-code | Lagen uitleggen, refactoring verantwoorden. *Waarom een framework?* is hier zelf ontdekt |
| **6** | **Frameworks en conventies.** Laravel als bekende ideeën met nieuwe namen | Routing/MVC-mapping, migrations als versiebeheer van het schema, Eloquent-relaties en N+1, policies, FormRequests, Breeze | Scaffolding, views, seeders | Datamodel en relaties ontwerpen, conventies herkennen, policy-logica verantwoorden |
| **7** | **Systemen koppelen.** Contracten, asynchroon werk, betrouwbaarheid | API consumeren en bouwen, caching, queues/scheduler, **testen als specificatie** | Implementatie van endpoints en jobs | API-contract ontwerpen, tests schrijven en lezen, AI-implementatie toetsen met tests |
| **8** | **Software in team en productie** | Scrum, Git/PR's, code review, CI, deployen, mail/notificaties | Code (via PR) | PR's reviewen, inclusief AI-PR's, architectuurkeuzes verdedigen, deployen |

### 6.3 Wat dit concreet comprimeert

| Nu | Voorstel | Winst |
|---|---|---|
| Blok 3: 2 herhalingshoofdstukken + 3 contexten (Pokémon, F1, Tools4Ever) | 1 context, H3/H6 vervallen, retrieval in de les | ~2 lesweken vrij → tijd voor Create in blok 3 of de SQLi-demo |
| CRUD over blok 3–5 | CRUD compleet in blok 4 | Blok 5 vrij voor architectuur + API |
| mysqli → PDO-ombouw (blok 5 H1) | Direct PDO | ~1 lesweek |
| Validatie/XSS/hashing/security in 4 losse hoofdstukken | 1 concept "vertrouwensgrens" in blok 4, met verdieping in blok 5 | ~1–2 lesweken |
| Blok 6: H1–H5 herbouw MVC stap voor stap | 1 mappingweek + doorbouwen aan het eigen domein | ~2–3 lesweken → ruimte voor testen/policies |
| 6–7 projectvarianten per blok | 1 projectformat + vrije themakeuze binnen vaste eisen | Minder onderhoud, meer eigenaarschap |

### 6.4 Lesformat (backend, 90 min)

Dit is het ritme dat 26f/26ab al gebruiken, aangevuld met een ontwerpstap:

| Fase | Min | AI | Inhoud |
|---|---|---|---|
| Retrieval | 5 | uit | 3 vragen over vorige les, in dezelfde app |
| Concept | 10 | uit | Eén schets of diagram: het *waarom* van vandaag |
| Predict / Run | 15 | uit | Werkende code lezen, voorspellen, draaien |
| Investigate | 15 | uit | Docent bevraagt: "wat als regel X weg is?" |
| Ontwerp | 10 | uit | Student schetst de eigen uitbreiding (flow, ERD, user story) |
| Make met AI | 30 | **aan** | Laat bouwen, test, en **vind en verbeter** fouten |
| Verantwoorden | 5 | uit | Exit-ticket: leg één regel uit de eigen code uit |

### 6.5 Voorbeeld: blok 5 H3 *Update* herontworpen

**Nu:** uitleg update-patroon → link aanpassen (code gegeven) → `tool_update.php` (± 40 regels gegeven) → verwerken (code gegeven) → uitbreiden.

**Voorstel:**
1. *Concept:* teken de update als twee requests. Waar zit het id? Wat gebeurt er als iemand het id in het hidden field aanpast? (→ autorisatie, vertrouwensgrens)
2. *Predict:* een gegeven `UPDATE` zonder `WHERE`. Wat gebeurt er?
3. *Make met AI:* laat AI de update voor de eigen entiteit genereren.
4. *Review-opdracht:* gebruik een checklist: prepared statement? `WHERE`? eigenaar-check? `htmlspecialchars` in de value? Redirect na POST?
5. *Verantwoorden:* "Waarom is dit veilig?", in drie zinnen.

Dezelfde leerdoelen worden gehaald in de helft van de tijd, en er komt een hoger doel bij: **beoordelen**.

### 6.6 Toetsing (AI-bestendig)

Zonder deze aanpassing valt de rest om: als alleen het product telt, wint AI.

- **Mondeling verantwoordingsgesprek** bij elk eindproject (rubric staat al in 26ab/24ab blok 8).
- **Live modify-opdracht:** "voeg in 15 minuten veld X toe, AI uit". Dat laat zien of de student de eigen code begrijpt.
- **Reviewtoets:** een stuk AI-code met 3–4 geplante fouten (beveiliging, logica, plaats in architectuur). Vind ze en leg uit waarom het fouten zijn.
- **Ontwerpproduct** telt mee: ERD, flowdiagram, API-contract, tests.

### 6.7 Projecten

Gebruik per blok **één projectopdracht** met vaste technische eisen, een vaste rubric en één verplicht ontwerpdocument. De student kiest het thema zelf, eventueel uit een lijst. Dat vervangt de 6–7 bijna identieke bestanden en levert eigenaarschap op ("mijn app"), net als PlayList in de pilot.

---

## 7. Risico's en randvoorwaarden

| Risico | Mitigatie |
|---|---|
| Zwakke studenten missen de basisvaardigheid | AI-uit-fases blijven. Blok 3 houdt veel lezen en voorspellen. Taakklassen met oplopende ondersteuning (4C/ID) |
| Niveauverschillen worden groter | "Make" gelaagd aanbieden (basis / uitbreiding / verdieping), zoals in 26f |
| Docenten moeten anders lesgeven (bevragen in plaats van voordoen) | Docentenhandleidingen per hoofdstuk (bestaan al voor 26f) + één gezamenlijke pilotevaluatie |
| Aansluiting op het kwalificatiedossier en de examinering | Concepttabel (6.2) naast de werkprocessen van het KD leggen voordat we herschrijven. Examenproducten aanpassen naar product + verantwoording |
| Te snel te veel veranderen | Gefaseerd invoeren (zie 8). Per blok één pilotklas |

---

## 8. Stappenplan

**Quick wins (geen herontwerp nodig)**
- [ ] PDO en prepared statements vanaf blok 3 H2 (code-aanpassing in bestaande hoofdstukken)
- [ ] Herhalingshoofdstukken vervangen door een retrieval-startactiviteit per les
- [ ] Samenvattingen samenvoegen tot één cheatsheet per blok
- [ ] Kleine fouten herstellen (blok 6 "Blok 9"-koppen, links in de README van 25f blok 6, nummering)
- [ ] AI-fasebeleid uit 26f overnemen in alle backendhoofdstukken

**Fase 1: blok 4 + 5 (eerstvolgende klas)**
- [ ] Blok 4 = volledige CRUD + vertrouwensgrens, één doorlopende applicatie
- [ ] Blok 5 = architectuur/refactor + API + auth/autorisatie
- [ ] Eén projectformat met verantwoordingsgesprek

**Fase 2: blok 6 + 7**
- [ ] Laravel-mappingweek in plaats van H1–H5
- [ ] Testen vroeg in blok 7 (25f H8 naar voren) als middel om AI-output te toetsen
- [ ] Eén bronversie van blok 7 per jaar in plaats van gekopieerde, uiteenlopende versies

**Fase 3: evaluatie**
- [ ] Vergelijk pilot- en reguliere klas op het verantwoordingsgesprek en de reviewtoets

---

## 9. Open vragen voor jou

1. **Blok 3 als basis:** willen we blok 3 BEO (gedeeld door 25ab/26f) ook naar PRIMM ombouwen, of blijft dat bewust instructiever voor de basis?
2. **Plain PHP versus Laravel:** hoe lang blijven we in plain PHP? De pilot gaat al in week 5 naar Laravel. Het voorstel hier houdt plain PHP t/m blok 5 aan om architectuur zelf te laten ontdekken.
3. **Examinering:** hoeveel ruimte is er om de examenproducten te laten verschuiven naar verantwoording en review?
4. **Mollie/AJAX/soft delete:** behouden als losse techniek of opnemen als voorbeeld onder de concepten "contracten" en "toestand"?
5. **Volgende stap** ("hoe wordt dit vormgegeven"): zullen we beginnen met het uitwerken van één blok (bijvoorbeeld blok 4) volgens 6.2–6.5 als template?
