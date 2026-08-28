# Todo - Curriculum & Lesmateriaal

> Werkscope: `.claude/`, `zwsd26f/`, `Curriculum Web Development/` én (sinds 2026-08-27) `zwsd25f/` - deze klas is op expliciet verzoek van de docent opengesteld voor bewerking. Overige klassen (zwsd26ab, zwsd24ab, zwsd25ab, etc.) blijven ongemoeid - alleen als bron gelezen, niet aangepast.

## Open

- [ ] Curriculum jaar 2 voor zwsd26ab (Blok 5-8) uitwerken, zodra bekend is welke stof daar valt - `curriculum-jaar 2 - zwsd25f.md` kan hiervoor als inhoudelijke referentie dienen (vergelijkbaar traject, één cohort eerder)
- [ ] zwsd25f Blok 1-2 documenteren zodra dat materiaal beschikbaar komt (nog steeds ontbrekend in de repo)
- [ ] `curriculum-jaar 2 - zwsd25f.md` bijwerken met Blok 7 (materiaal is inmiddels verschenen en geanalyseerd/gefixt, zie Afgerond - het curriculumdocument zelf is nog niet bijgewerkt) en Blok 8 zodra dat er is
- [ ] Overige (niet-blocking) bevindingen uit de Blok 7-analyse nog niet opgepakt: Hoofdstuk 6 mixt Laravel Herd met `php artisan serve`/`localhost:8000`; `WeatherService` (Hoofdstuk 1) gebruikt `file_get_contents()` i.p.v. de `Http`-facade zonder foutafhandeling; `Coin::updateOrCreate(...)`-blok 3x gedupliceerd in Hoofdstuk 3; `apiResource` in Hoofdstuk 5 registreert een `update`-route die nooit is geïmplementeerd; typo "vevat" → "bevat" in Hoofdstuk 2
- [ ] Navragen of het zwsd25f Blok 3 FEO-materiaal (Week 1 lijkt inhoudelijk niet bij het bestand te horen, Week 2-4 ontbreken) bewust zo is of een opschoonactie nodig heeft
- [ ] Backend-curriculum voor Blok 4 ontwerpen (nog volledig open - frontend-formulieren uit Blok 4 zijn er wel klaar voor)
- [ ] Bepalen of/hoe zwsd26f na Blok 3 (inhaalblok) aansluit op een vervolgprogramma (niveau-check nodig; curricula van zwsd26f en zwsd26ab staan los van elkaar, dit is geen automatische doorstroom)
- [ ] zwsd26f Blok 1, 2 en 4 uitwerken (nog volledig open, zie `curriculum-jaar 1 - zwsd26f.md` §4)
- [ ] In de klas uitproberen of 2 startsites (RetroPixel + Boulder Base) genoeg variatie geven, of dat een 3e site in taakklasse 3 alsnog wenselijk is
- [ ] Checken of de tijdsboxen per PRIMM-fase (Predict/Run/Investigate/Modify/Make) in 90 minuten passen zoals uitgeschreven, en zo nodig bijstellen na de eerste keer lesgeven
- [ ] In de praktijk checken of FEO en JS goed synchroon lopen qua weekplanning (JS-hoofdstukken verwijzen naar dezelfde site als de FEO-hoofdstuk van die week) - als de twee vakken in de praktijk niet exact gelijk oplopen (bv. andere vakantie/rooster-onderbrekingen), kan dit uit de pas gaan lopen
- [ ] Overwegen of de FEO- en JS-verantwoordingsgesprekken in Hoofdstuk 8 gecombineerd op één dag per student gepland worden

## Afgerond

- [x] zwsd26f Blok 3 Frontend lesmateriaal opgezet: 8 hoofdstukken + `blok3-samenvatting.md` + starter-website (RetroPixel, inline CSS) voor Hoofdstuk 1
- [x] zwsd26f Blok 3: labeling "Week" → "Hoofdstuk" hernoemd (bestandsnamen + koppen + interne verwijzingen)
- [x] `Curriculum Web Development/curriculum-jaar 1.md` geschreven: overzicht van alle onderwerpen + leeruitkomsten per week/hoofdstuk voor Blok 1-4 (frontend zwsd26ab + backend PRIMM-pilot)
- [x] `.claude/todo.md` en `.claude/versie.md` opgezet
- [x] zwsd26f Blok 3 herontworpen volgens 4C/ID + PRIMM: 3 taakklassen (Hoofdstuk 1-3 RetroPixel, 4-6 Boulder Base, 7-8 site-opmaak/eindproject), expliciet AI-gebruiksbeleid per PRIMM-fase, Make-fase = eigen variant voor eigenaarschap, "Debug deze AI-output"-oefeningen, verantwoordingsgesprek als toetsonderdeel. Tweede startsite `starter-website-2/` (Boulder Base) toegevoegd.
- [x] Curriculum van zwsd26f losgetrokken van zwsd26ab: alle 26F-verwijzingen uit `curriculum-jaar 1.md` verwijderd (dat document beschrijft nu uitsluitend zwsd26ab), nieuw en apart document `curriculum-jaar 1 - zwsd26f.md` aangemaakt
- [x] Docentcommentaar uit de zwsd26f Blok 3-hoofdstukken gehaald: elk hoofdstuk gesplitst in een schone studentversie (`Hoofdstuk N - ....md`) en een volledige `Docent/Hoofdstuk N - Docentenhandleiding.md` (lesregie, timing, tips, veelgemaakte fouten, AI-toelichting, beoordelingscriteria)
- [x] JavaScript-introductievak toegevoegd aan zwsd26f Blok 3 (1,5u/week, parallel aan FEO): nieuwe map `JavaScript (JSO)/` naast `Frontend Development (FEO)` en `Backend Development (BEO)`, 8 hoofdstukken volgens hetzelfde 4C/ID + PRIMM-ontwerp, elk met studentversie + `Docent/`-handleiding, bouwt voort op dezelfde FEO-sites (RetroPixel/Boulder Base). `curriculum-jaar 1 - zwsd26f.md` uitgebreid met een JS-sectie.
- [x] Curriculumdocumenten voor zwsd25f geschreven (los van alle andere klassen, zelfde patroon als eerder): `curriculum-jaar 1 - zwsd25f.md` (Blok 3-4) en `curriculum-jaar 2 - zwsd25f.md` (Blok 5-6), inclusief vergelijking met het niveau van zwsd26ab
- [x] Docent-notities uit zwsd25f Blok 5 omgezet naar echte lesstof (op verzoek: zwsd25f is niet langer uitgezonderd van de werkscope). Op basis van een codebase-review van het tools4ever-project (die de docent buiten dit gesprek had laten uitvoeren) zijn 4 nieuwe theorie+opdracht-blokken toegevoegd, elk met uitleg + concrete stappen voor studenten (geen docent-only callouts meer):
  - **Hoofdstuk 1** (PDO): nieuwe sectie "Character set & Collation" met uitleg over utf8mb4 vs. latin1 + Opdracht 0.2 om de tabellen te normaliseren
  - **Hoofdstuk 2** (Veilige data): nieuwe sectie "UNIQUE constraints" + Opdracht 8 om de constraint op `users.email` toe te voegen en de PDO-foutmelding netjes af te vangen
  - **Hoofdstuk 3** (Update): nieuwe sectie "Geld opslaan: centen of decimaal?" + Opdracht 11 om het prijsmodel van `tool_price` op te schonen
  - **Hoofdstuk 5** (Security): nieuwe "Les 2 - Omgevingsvariabelen en .env" + Opdracht 7 om credentials uit `database.php`/`docker-compose.yaml` naar een `.env`-bestand te verplaatsen
  - `Blok5_Leerdoelen_Samenvatting.md` bijgewerkt met bijpassende leerdoelen-bullets per week; de eerder toegevoegde docent-notitie daar is verwijderd (geen lesstof-equivalent nodig voor een samenvattingsdocument)
- [x] zwsd25f Blok 7 geanalyseerd en top-3 bevindingen verwerkt in de lesstof (zie versie.md voor het volledige overzicht): blocking bug in Hoofdstuk 6 (verkeerde eager-load relatienamen) gefixt, ontbrekende frontend-opdracht + Samenvatting toegevoegd aan Hoofdstuk 6, klasnaam in `projectlessen/Rubric Projectlessen Blok 7.md` gecorrigeerd van zwsd24ab naar zwsd25f
