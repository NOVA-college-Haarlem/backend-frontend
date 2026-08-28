# Versiegeschiedenis

Bijgehouden per sessie/wijziging. Zie `todo.md` voor openstaande punten.

## 2026-08-26

**Scope-afspraak vastgelegd:** vanaf nu wordt alleen gewerkt in `.claude/`, `zwsd26f/` en `Curriculum Web Development/`. Overige klassenmappen (zwsd26ab, zwsd24ab, zwsd25f, ...) worden alleen als bron gelezen, nooit gewijzigd.

- **zwsd26f - Blok 3 Frontend Development opgezet** (herhalings-/inhaalblok, 8 hoofdstukken)
  - Nieuw: `Hoofdstuk 1 - Herhaling Van Inline naar Externe CSS.md` t/m `Hoofdstuk 8 - Eindproject.md`, plus `blok3-samenvatting.md`
  - Nieuw: `starter-website/index.html` (RetroPixel game shop, bewust volledig inline CSS) als gezamenlijk startpunt voor Hoofdstuk 1
  - Reden: kennis van 26F bleek na Blok 1-2 nog niet stevig genoeg voor cards/flexbox; dit blok herhaalt eerst externe CSS/box model/semantische HTML, en bouwt daarna door naar selectoren, kleuren/typografie en site-opmaak
- **zwsd26f - Blok 3 hernoemd van "Week" naar "Hoofdstuk"**
  - Alle 8 bestanden hernoemd (git mv) en interne koppen/verwijzingen ("Volgende week" → "Volgend hoofdstuk", etc.) aangepast
  - "Projectweek"/"Eindproject" als term bewust ongewijzigd gelaten (bestaande conventie, ook in zwsd26ab Blok 1 gebruikt binnen Hoofdstuk-bestanden)
- **`Curriculum Web Development/curriculum-jaar 1.md` geschreven**
  - Overzicht van alle onderwerpen + leeruitkomsten per week/hoofdstuk voor Blok 1 t/m 4
  - Bronnen: zwsd26ab (frontend Blok 1-4, backend PRIMM-pilot Blok 3) en zwsd26f (zijspoor Blok 3)
  - Aanname: "jaar 1" = Blok 1-4 (gebaseerd op bestaande mapstructuur in zwsd26ab, die alleen Blok 1-4 bevat)
  - Open punt benoemd: backend Blok 4 is nog niet uitgewerkt
- **`.claude/todo.md` en `.claude/versie.md` aangemaakt** voor het bijhouden van openstaand werk en wijzigingen

**Herontwerp zwsd26f Blok 3 volgens 4C/ID + PRIMM**, naar aanleiding van een discussie over top-down didactiek (4C/ID-taakklassen, PRIMM-cyclus, expliciet AI-beleid, verantwoordingseis tegen competentie-illusie, eigenaarschap via transformatie i.p.v. bouwen vanaf nul):
- Structuur omgezet naar **3 taakklassen** i.p.v. 8 losse onderwerpen:
  - Taakklasse 1 (Hoofdstuk 1-3): RetroPixel - ongewijzigd qua site, lesplan herschreven rond expliciete Predict/Run/Investigate/Modify-fasen; Hoofdstuk 3 krijgt een **Make-fase** (eigen thema-variant) i.p.v. de losse Projectweek
  - Taakklasse 2 (Hoofdstuk 4-6): nieuwe, complexere startsite. Bestanden hernoemd: "Hoofdstuk 4 - Projectweek.md" → "Hoofdstuk 4 - CSS Selectoren en Buttons.md", "Hoofdstuk 5 - CSS Selectoren en Buttons.md" → "Hoofdstuk 5 - Kleuren, Typografie en CSS-variabelen.md", "Hoofdstuk 6 - Kleuren, Typografie en Navigatie.md" → "Hoofdstuk 6 - Navigatie en Eigen Variant.md" (git mv)
  - Taakklasse 3 (Hoofdstuk 7-8): ongewijzigd qua onderwerp (site-opmaak, eindproject), Hoofdstuk 8 uitgebreid met een **verantwoordingsgesprek** als apart beoordelingscriterium naast de rubric
- Nieuw: `starter-website-2/` - Boulder Base (boulderhal), al met externe CSS maar bewust met gebreken: hardgecodeerde kleuren (~8x herhaald), 6 bijna-identieke button-classes zonder hover/focus, geen typografische hiërarchie, geen containers - elk gebrek is doelbewust gekoppeld aan een leerdoel in Hoofdstuk 4-7
- **AI-gebruiksbeleid** toegevoegd per PRIMM-fase in elk hoofdstuk (Predict/Run/Investigate = AI uit, Modify = AI mag met verantwoording, Make = AI mag mits elke regel uit te leggen), consistent met de bestaande aanpak in de backend PRIMM-pilot
- **"Debug deze AI-output"-oefeningen** toegevoegd in Hoofdstuk 3, 6 en 8 (elke taakklasse één)
- `blok3-samenvatting.md` volledig herschreven rond dit ontwerp (incl. tabel taakklassen/startcode/kern en AI-beleidstabel)
- `curriculum-jaar 1.md` §4a bijgewerkt met de nieuwe taakklasse-structuur (later dezelfde dag weer verwijderd, zie hieronder)

## 2026-08-27

**Curriculum zwsd26f losgetrokken van zwsd26ab** - op verzoek van de docent staat het curriculum van zwsd26f volledig los van de andere klassen, dit was tot nu toe als "zijspoor"/"zijspoor 26F" binnen `curriculum-jaar 1.md` verweven.
- `curriculum-jaar 1.md` opgeschoond: alle verwijzingen naar zwsd26f verwijderd (Bronnen-regel, de "twee sporen in Blok 3"-alinea, de "Zijspoor 26F"-regel bij §4a). Document beschrijft nu uitsluitend zwsd26ab, met een duidelijke koptekst-vermelding **Klas: zwsd26ab** en een verwijzing naar het nieuwe 26F-document.
- Nieuw, apart document: **`curriculum-jaar 1 - zwsd26f.md`** - volledige beschrijving van het zwsd26f-curriculum (Blokoverzicht, Blok 3 in detail met taakklassen/hoofdstukken/leeruitkomsten/AI-beleid, eindbeeld, openstaande punten). Expliciet vermeld dat het niveau na Blok 3 vergelijkbaar is met zwsd26ab Blok 2, maar dat dit een constatering is, geen gedeelde planning of automatische doorstroom.
- `.claude/todo.md` bijgewerkt: item over "aansluiting op zwsd26ab Blok 4" herschreven naar "aansluiting op een vervolgprogramma" (geen aanname meer dat dit per se zwsd26ab wordt), en een nieuw open punt toegevoegd voor het uitwerken van zwsd26f Blok 1/2/4.

**Docentcommentaar gescheiden van het lesmateriaal (zwsd26f Blok 3)** - op verzoek van de docent bevatten de Hoofdstuk-bestanden voortaan geen docentcommentaar/lesregie meer; die staat nu parallel in een submap.
- Alle 8 originele Hoofdstuk-bestanden verplaatst naar `Docent/Hoofdstuk N - Docentenhandleiding.md` (git mv), met een toegevoegde titel-suffix en een verwijzing terug naar de studentversie. Inhoud verder ongewijzigd: volledige lesregie ("Deel uit...", "Laat zien...", "Vraag..."), tijdsboxen per PRIMM-fase, Tips voor docent, Veelgemaakte fouten, AI-toelichting en (Hoofdstuk 8) de beoordelingscriteria.
- Op de oorspronkelijke bestandsnamen (`Hoofdstuk N - ....md`) staan nu nieuwe, kortere **studentversies**: leerdoelen, de opdrachten/codevoorbeelden per PRIMM-fase (zonder regie-taal of timing), en huiswerk. Verwijst bovenaan naar de bijbehorende docentenhandleiding.
- `blok3-samenvatting.md` en `curriculum-jaar 1 - zwsd26f.md` bijgewerkt met een korte uitleg van deze twee-bestanden-per-hoofdstuk-structuur.

**JavaScript-introductievak toegevoegd (zwsd26f Blok 3)** - studenten krijgen dit blok 1,5u/week FEO én 1,5u/week JavaScript; nieuw vak opgezet in dezelfde structuur en met dezelfde didactiek als FEO, direct vanaf het begin met studentversie + Docent-handleiding gesplitst (geleerde les uit de vorige herstructurering toegepast).
- Nieuwe map **`zwsd26f/Blok 3/JavaScript (JSO)/`**, sibling van `Frontend Development (FEO)` en `Backend Development (BEO)` (niet als submap ín FEO, na afweging - JS wordt apart ingeroosterd en verdient dezelfde status als eigen vak).
- 8 hoofdstukken, 3 taakklassen, zelfde 4C/ID + PRIMM-ontwerp, AI-beleid en "Debug deze AI-output"-momenten (Hoofdstuk 3, 6, 8) als FEO. Elk hoofdstuk: studentversie in de hoofdmap + `Docent/Hoofdstuk N - Docentenhandleiding.md`.
- **Kernkeuze:** JS bouwt voort op dezelfde FEO-sites (RetroPixel Hoofdstuk 1-3, Boulder Base Hoofdstuk 4-6, eigen eindproject Hoofdstuk 7-8) i.p.v. eigen, losstaande oefenpagina's - versterkt in plaats van verdubbelt de leerstof. Selectors in de JS-lessen zijn bewust structureel (`.card a`, tag-namen, vaste `id`'s) zodat ze niet afhankelijk zijn van hoever een student in FEO staat met de CSS-refactor van die week.
- **Duplicatie-parallel:** `starter-website-2/js/script.js` bevat vanaf het begin drie bijna-identieke click-handlers (analoog aan de CSS-button-duplicatie in FEO) - bewust pas opgelost in JS Hoofdstuk 6 (arrays + `forEach`), zelfde DRY-principe als FEO maar met een andere techniek.
- **Cross-vak aha-moment:** JS Hoofdstuk 5 (dark-mode toggle met `classList`) grijpt in op de CSS-variabelen die diezelfde week in FEO Hoofdstuk 5 worden geïntroduceerd - de toggle demonstreert live hetzelfde "één ding aanpassen, alles verandert mee"-principe, nu interactief i.p.v. door de docent voorgedaan.
- HTML van beide startsites aangepast t.b.v. JS: `starter-website/index.html` kreeg `id="hero-knop"` + gekoppeld script; `starter-website-2/index.html` kreeg een dark-mode-toggle-knop, een contactformulier (voor JS Hoofdstuk 7) en een gekoppeld script. Nieuwe bestanden `starter-website/js/script.js` en `starter-website-2/js/script.js` toegevoegd als "aangeleverde" startcode voor JS Hoofdstuk 1 resp. 4.
- `curriculum-jaar 1 - zwsd26f.md` uitgebreid: Blokoverzicht-tabel kreeg een JS-kolom, nieuwe §3 "Blok 3 - JavaScript" toegevoegd, Eindbeeld-sectie (nu §4) uitgebreid met JS-leeruitkomsten, secties hernummerd.

**Curriculumdocumenten voor zwsd25f geschreven** - op verzoek van de docent, zelfde patroon als eerder (los document per klas, alleen lezen uit de bronmap, niet aanpassen).
- zwsd25f is een ouder cohort met alleen Blok 3-6 in de repo (geen Blok 1-2, nog geen Blok 7-8). Op basis van de verduidelijking "Blok 1-4 is jaar 1, Blok 5-8 is jaar 2" opgesplitst in twee documenten:
  - **`curriculum-jaar 1 - zwsd25f.md`** (Blok 3-4): PHP/SQL-introductie, CRUD, login/registratie, JOINs, zoeken, dashboards - plain PHP/MySQLi, nog geen PDO.
  - **`curriculum-jaar 2 - zwsd25f.md`** (Blok 5-6): Blok 5 = security-verdieping (PDO/prepared statements, wachtwoord-hashing, XSS-bescherming, soft delete, AJAX, custom error pages); Blok 6 = Laravel (MVC, Eloquent-relaties incl. many-to-many, resource-CRUD, Breeze-auth, Policies, FormRequests).
- Beide documenten benoemen expliciet de datakwaliteits-gaten die zijn tegengekomen tijdens het lezen van de bron: Blok 1-2 ontbreken volledig; het Blok 3 FEO-materiaal is onvolledig (alleen Week 1/5/6) en Week 1 lijkt inhoudelijk niet bij het bestand te horen (kop verwijst naar "Blok 2"/Flexbox-intro); vanaf Blok 4 is er geen aparte FEO-map meer. Deze bevindingen zijn ook als open punten in `todo.md` gezet.
- Beide documenten bevatten een korte vergelijking met het niveau van zwsd26ab, omdat dat nuttige context geeft voor toekomstige curriculumplanning (met name voor het nog te schrijven jaar-2-document van zwsd26ab).
- `.claude/todo.md` bijgewerkt met de nieuwe open punten en het afgeronde werk.

**Eenmalige, expliciet geautoriseerde uitzondering op de scope-afspraak: docent-notities toegevoegd aan zwsd25f Blok 5.** De docent had buiten dit gesprek een codebase-review laten uitvoeren van het `tools4ever`-project (het startproject achter Blok 5) en plakte de bevindingen ("overige aandachtspunten" + "advies voor de aanpak") in de chat, met het uitdrukkelijke verzoek dit in de Blok 5-hoofdstukken te verwerken. Dat gaat in tegen de eerder afgesproken regel dat andere klassen dan zwsd26f ongemoeid blijven - de scope-afspraak in `todo.md` is expliciet aangevuld om dit als bewuste, eenmalige uitzondering vast te leggen, niet als stilzwijgende scope-verschuiving.
- **Belangrijke kanttekening:** alleen de daadwerkelijk geplakte tekst is verwerkt. "Sectie 1 (blocking bugs)" en een genoemde "bug #6" uit de review zijn nooit in dit gesprek gedeeld - er is dus bewust niets aan (vermeende) bugs gefixed of specifieks daarover beweerd; alleen de vijf concrete "overige aandachtspunten" zijn als docent-notities verwerkt.
- Aanpak: geen herschrijving van bestaande hoofdstukken, alleen korte `> **📌 Docent-notitie:** ...`-callouts op de plek waar het onderwerp al aan de orde komt (minimal-diff, conform het verzoek "zonder dat de hoofdstukken teveel worden aangepast"):
  - `Hoofdstuk 1 - PDO en Prepared statements.md`: charset/utf8mb4-normalisatie (schema-inconsistentie tussen `users` en `tools`/`brands`), plus een bevestigende opmerking dat de bestaande volgorde (Opdracht 1 = SQL-injectie demonstreren, Opdracht 2 = PDO introduceren) al overeenkomt met het advies "eerst zelf laten demonstreren, dan pas de oplossing" - niet aangepast, enkel bevestigd.
  - `Hoofdstuk 2 - Veilige data.md`: ontbrekende UNIQUE constraint op `users.email`, toegevoegd als extra validatie-vraag naast de bestaande voorbeelden.
  - `Hoofdstuk 3 - Update.md`: bevestiging dat de ontbrekende edit-pagina's (`tools_edit.php` staat in comments) bewust bij dit hoofdstuk horen, plus het verwarrende prijsmodel (`tool_price` DECIMAL met impliciete centen) als aandachtspunt bij het bouwen van het update-formulier.
  - `Hoofdstuk 5 - Security.md`: hardcoded credentials in `database.php`/`docker-compose.yaml` als bruggetje naar een `.env`-gesprek, plus de lege `.gitignore`.
  - `Blok5_Leerdoelen_Samenvatting.md`: strategische notitie dat de eindproject-checklist vrijwel 1-op-1 mapt op de gevonden kwetsbaarheden in tools4ever - een signaal dat het project doelbewust als vervolgcasus is opgezet, te gebruiken als expliciete didactische haak.
- `.claude/todo.md`: scope-afspraak aangevuld met de uitzonderingsvermelding; afgerond werk toegevoegd.

**Scope-uitzondering ingetrokken: zwsd25f is nu structureel onderdeel van de werkscope.** De docent gaf expliciet aan dat de eerdere beperking eraf mag - `todo.md` is aangepast zodat `zwsd25f/` naast `.claude/`, `zwsd26f/` en `Curriculum Web Development/` in de vaste werkscope staat, niet langer als eenmalige uitzondering.

**Docent-notities in zwsd25f Blok 5 omgezet naar echte lesstof.** Op verzoek van de docent zijn de vier callouts uit de vorige stap herschreven van docent-only meta-tekst naar studentgerichte theorie + opdrachten, inclusief uitgebreide theorie bij character sets/collation (was eerder alleen kort benoemd, nu met uitleg wat een charset/collation is, waarom `utf8mb4` de standaard is, en wat er misgaat bij `latin1`).
- `Hoofdstuk 1 - PDO en Prepared statements.md`: callout vervangen door sectie "CHARACTER SET & COLLATION" (theorie) + nieuwe **Opdracht 0.2** om de tabellen te controleren en te normaliseren naar `utf8mb4` (incl. PDO-connectiestring aanpassen). De losse bevestigingsregel over de bestaande Predict-achtige opzet van Opdracht 1/2 is verwijderd (had geen lesstof-waarde, was puur een notitie aan mezelf).
- `Hoofdstuk 2 - Veilige data.md`: callout vervangen door sectie "UNIQUE CONSTRAINTS" (theorie over race conditions en waarom dit op databaseniveau moet) + nieuwe **Opdracht 8** om de constraint toe te voegen en de resulterende `PDOException` (code 23000) netjes af te vangen.
- `Hoofdstuk 3 - Update.md`: callout vervangen door sectie "Geld opslaan: centen of decimaal?" (theorie over DECIMAL vs. INT-centen) + nieuwe **Opdracht 11**, met twee expliciete oplossingsopties (A: centen/INT, B: euro's/DECIMAL). Inhoudsopgave bijgewerkt met de nieuwe sectie/opdracht.
- `Hoofdstuk 5 - Security.md`: callout vervangen door nieuwe "Les 2 - Omgevingsvariabelen en .env" (theorie over secrets in Git-geschiedenis) + nieuwe **Opdracht 7**, met een kleine zelfgeschreven `.env`-loader (bewust geen Composer-library, sluit aan bij het plain-PHP-niveau van dit blok - Composer komt pas in Blok 6 met Laravel).
- `Blok5_Leerdoelen_Samenvatting.md`: de eerder toegevoegde docent-notitie is verwijderd (geen lesstof-equivalent voor een samenvattingsdocument); in plaats daarvan zijn losse leerdoel-bullets toegevoegd bij Week 1, Week 2 en Week 5 die de nieuwe theorie/opdrachten dekken.
- `.claude/todo.md` bijgewerkt: scope-regel aangepast, afgerond-item herschreven van "docent-notities toegevoegd" naar "omgezet naar lesstof" met de concrete secties/opdrachten per hoofdstuk.

## 2026-08-28

**zwsd25f Blok 7 geanalyseerd en top-3 bevindingen gefixt.** Blok 7 (API's, caching, eigen REST API, full-stack esports-project) was nieuw in de repo sinds de vorige sessie. Op verzoek geanalyseerd (6 hoofdstukken + 5 projectlessen + rubric + `Extra API`-schema gelezen), bevindingen gerapporteerd, en na akkoord ("graag") de drie belangrijkste verwerkt:
- **Blocking bug gefixt in `Hoofdstuk 6 - Full Stack app.md`, Opdracht 5.3:** `MatchGame::with('home_team', 'away_team')` gebruikte de verkeerde relatienamen (de modelmethodes heten `homeTeam()`/`awayTeam()`, camelCase) - dit gooide een `BadMethodCallException` zodra een student `GET /api/matches` aanriep, precies het eerste checkpoint van het hoofdstuk. Gefixt naar `with('homeTeam', 'awayTeam')`. Meteen ook `MatchController::index()` consistent gemaakt met `show()` (directe `MatchGameResource::collection(...)` return i.p.v. handmatig `response()->json(...)->resolve()`, wat de automatische `"data"`-wrapper omzeilde).
- **`MatchGameResource` toonde geen teamnamen ondanks de comment "met teamnamen":** `toArray()` gaf alleen de kale `team_home_id`/`team_away_id` terug. Aangepast naar `$this->homeTeam->name` / `$this->awayTeam->name`, met een toegevoegde uitleg over property-toegang tot relaties en een link terug naar het N+1-probleem uit Blok 6. Voorbeeld-JSON in de lesstof (Opdracht 6.3) bijgewerkt om teamnamen te tonen i.p.v. ID's.
- **Ontbrekende frontend-opdracht + Samenvatting toegevoegd aan Hoofdstuk 6:** het hoofdstuk heette "Full Stack app" en beloofde in de introductie expliciet een frontend-laag (HTML + JavaScript/fetch) als leerdoel, maar eindigde na Opdracht 7 zonder frontend, zonder afgeronde CRUD (store/update/destroy stonden als lege stubs) en - als enige hoofdstuk in het blok - zonder afsluitende `## Samenvatting`. Toegevoegd:
  - **Opdracht 8:** `store`/`update`/`destroy` voor `GameController` met validatie (zelfde patroon als Hoofdstuk 5), incl. routes en Postman-teststappen.
  - **Opdracht 9:** een Blade-pagina (`resources/views/dashboard.blade.php`) die met `fetch()` de eigen `/api/games`- en `/api/matches`-endpoints aanroept en toont - inclusief een expliciete opmerking dat `games` een kale array teruggeeft en `matches` (via de Resource) een `"data"`-wrapper, omdat dat verschil anders tot verwarring leidt in de fetch-code.
  - **Samenvatting-sectie** in dezelfde stijl als Hoofdstuk 1-5 (concept-tabel + de driedeling "API's consumeren (H1-4) → eigen API bouwen (H5) → complete full stack app (H6)").
- **Klasnaam gecorrigeerd in `projectlessen/Rubric Projectlessen Blok 7.md`:** stond op "zwsd24ab" (titel én voettekst) - zelfde patroon als de eerdere Blok 3 FEO-mismatch. Gecorrigeerd naar "zwsd25f". De 5 projectbeschrijvingen zelf hadden dit probleem niet.
- **Bewust niet opgepakt** (staan als open punten in `todo.md`, niet gevraagd): Herd/`php artisan serve`-inconsistentie in Hoofdstuk 6, `file_get_contents()` zonder foutafhandeling in Hoofdstuk 1's `WeatherService`, drievoudige letterlijke duplicatie van het `updateOrCreate`-blok in Hoofdstuk 3, de nooit-geïmplementeerde `update`-route die `Route::apiResource` in Hoofdstuk 5 registreert, en een typo ("vevat" → "bevat") in Hoofdstuk 2.
- `.claude/todo.md` bijgewerkt: Blok 7 als afgerond gemarkeerd, nieuw open punt voor het bijwerken van `curriculum-jaar 2 - zwsd25f.md` met Blok 7 (dat document zelf is nog niet aangepast), en de vier niet-opgepakte bevindingen als apart open punt genoteerd.

**`curriculum-jaar 2 - zwsd25f.md` alsnog bijgewerkt met Blok 7** - de docent wees erop dat dit document, ondanks het open-punt in `todo.md`, feitelijk nog niet was aangepast.
- Kop (Scope-regel) en Blokoverzicht-tabel bijgewerkt: Blok 7 staat nu op "Uitgewerkt" i.p.v. "nog niet in deze repo".
- Nieuwe **§4 "Blok 7 - API's & Full Stack Development"** toegevoegd (tussen Blok 6 en Eindbeeld): hoofdstukoverzicht met leeruitkomsten voor alle 6 hoofdstukken, een "Projectlessen Blok 7"-subsectie (5 themaprojecten + rubric-opzet), en een korte kwaliteitscontrole-notitie die verwijst naar de fixes van dezelfde dag (blocking bug, ontbrekende frontend-opdracht, rubric-klasnaam).
- **Eindbeeld** (was §4, nu §5) uitgebreid met een "API's & Full Stack (Blok 7)"-blok met vaardigheden, en de titel/inleidende zin aangepast van "Blok 5-6" naar "Blok 5-7".
- **Vergelijking met zwsd26ab**-alinea bijgewerkt om Blok 7 (eigen REST API, full stack app) mee te nemen.
- **Openstaande punten** (was §5, nu §6): "Blok 7 en 8 ontbreken" vervangen door "Blok 8 ontbreekt" (Blok 7 is nu gedocumenteerd).
- `.claude/todo.md` bijgewerkt: het open punt over `curriculum-jaar 2 - zwsd25f.md` vervangen door een punt dat alleen nog Blok 8 betreft; afgerond werk toegevoegd.
