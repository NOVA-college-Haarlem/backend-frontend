# Je code mondeling toelichten

**Klas:** zwsd25f, Blok 8
**Duur:** 4 lessen van 90 minuten
**Wat je nodig hebt:** je eigen Laravel-app (uit Blok 6/7), lokaal draaiend, en een editor met "Go to definition"

In deze vier lessen bouw je niets nieuws. Je leert je eigen app **uitleggen**: wat je code doet, hoe het werkt, waarom je het zo gebouwd hebt en wat je ook had kunnen doen. Dat is precies wat er in het mondeling assessment gevraagd wordt.

**Einddoel:** je kunt een willekeurig stuk eigen code aanwijzen (of laten aanwijzen) en het uitleggen volgens het WHWA-model.

| Les | Thema | Wat je oefent | Wat je aan het eind hebt |
| --- | --- | --- | --- |
| 1 | Van "het werkt" naar "ik kan het uitleggen" | Een request volgen van route tot view | Eigen codekaart + WHWA-uitleg van 1 feature |
| 2 | Design patterns in je eigen app | Patterns zoeken in Laravel en in je eigen code | Pattern-kaart: 3 patterns aangewezen in je eigen app |
| 3 | Kwaliteit en verantwoording | Stations langs + kruisverhoor | Lijst met 2 zwakke plekken + verbetervoorstel |
| 4 | Generale repetitie | Proefassessment van 12 minuten | Ingevulde rubric + persoonlijk actiepunt |

---

## Het WHWA-model

Elke uitleg volgt vier stappen:

1. **Wat** doet dit stuk code? In gewone taal: "Hier wordt een bestelling opgeslagen."
2. **Hoe** werkt het? Technisch: welke route, controller, model, query, view.
3. **Waarom** zo? Je keuze en de reden: "Ik gebruik een Form Request zodat de validatie niet in mijn controller staat."
4. **Alternatief:** hoe had het ook gekund en waarom deed je dat niet? "Ik had de validatie in de controller kunnen zetten, maar dan wordt die te lang."

"Wat" en "Hoe" laten zien dat je code werkt. "Waarom" en "Alternatief" laten zien dat je hem **begrijpt**. Daar zit het verschil tussen voldoende en goed.

## Werken in drietallen

Bij elke oefening werk je in een drietal. De rollen wisselen elke ronde:

- **Uitlegger:** deelt het scherm en licht de eigen code toe.
- **Assessor:** stelt vragen uit de vragenbank (bijlage A).
- **Observator:** let op het WHWA-model en de vakbegrippen en geeft 1 top en 1 tip.

---

## Les 1: Van "het werkt" naar "ik kan het uitleggen"

**Je leert:**
- de weg van een request benoemen: route → (middleware) → controller → model → view;
- bij een eigen feature snel het juiste bestand en de juiste methode vinden;
- die feature uitleggen volgens WHWA, met de juiste vakbegrippen (route, controller, Eloquent-model, Blade, MVC).

### Opdracht 1: codekaart
Kies één CRUD-feature uit je eigen app, bijvoorbeeld "product toevoegen". Teken op A4 de weg die het request aflegt:

```
URL + HTTP-methode → route → Controller@methode → model / tabel → view
```

Schrijf bij elke pijl één regel: wat gebeurt hier?

Handige hulpmiddelen:
- De Network-tab in DevTools: welke URL en welke methode (GET/POST) worden er verstuurd?
- `php artisan route:list`: welke route hoort daarbij?
- "Go to definition" in je editor: spring van de route naar de controller, en van de controller naar het model.

Laat je kaart door een klasgenoot controleren: kan die alles terugvinden in je code?

### Opdracht 2: drietallen (3 rondes van 11 minuten)
- **Uitlegger (4 min):** leg je feature uit met WHWA, aan de hand van je codekaart.
- **Assessor (3 min):** stel 2 vragen uit bijlage A, deel 1.
- **Observator (2 min):** 1 top, 1 tip. Zijn alle vier de stappen van WHWA langsgekomen?

### "Verboden zinnen"
Deze antwoorden kosten punten. Zo bouw je ze om:

| Zwak antwoord | Sterk antwoord |
| --- | --- |
| "Dat doet Laravel gewoon." | "Eloquent zet `Product::create()` om in een INSERT-query op de tabel `products`." |
| "Dat werkt gewoon zo." | "De route stuurt een POST naar `ProductController@store`, die valideert en opslaat." |
| "Dat heb ik van YouTube / ChatGPT." | "Ik heb het idee uit een tutorial gehaald en aangepast: ik heb X toegevoegd omdat…" |
| "Weet ik niet." | "Dat weet ik niet zeker, maar ik denk dat… Ik kan het controleren door…" |

Heb je code uit een tutorial of van AI? Zeg dat eerlijk. De assessor vraagt dan door, dus zorg dat je elke regel kunt uitleggen.

### Huiswerk
Neem met je telefoon een uitleg van 2 minuten op over een **tweede** feature (bijvoorbeeld inloggen of verwijderen), volgens WHWA. Luister hem terug en schrijf één ding op dat je beter wilt doen.

**Extra (snel klaar):** volg ook de middleware (`auth`, `csrf`). Wat doen die voordat de controller draait?

---

## Les 2: Design patterns in je eigen app

Je gebruikt al design patterns, omdat Laravel erop gebouwd is. In deze les leer je ze aanwijzen en benoemen. Een pattern noemen én in je eigen code laten zien is een sterk antwoord in een assessment.

**Je leert:**
- uitleggen wat een design pattern is: een herbruikbare oplossing voor een probleem dat vaak voorkomt;
- minstens 3 patterns in je eigen app aanwijzen, en per pattern zeggen welk probleem het oplost;
- het verschil uitleggen tussen een architectuurpatroon (MVC) en een design pattern (bijvoorbeeld Observer).

### Pattern-kaart

| Pattern | Probleem dat het oplost | Vergelijking | Waar je het ziet in Laravel | Voorbeeldzin voor het assessment |
| --- | --- | --- | --- | --- |
| MVC (architectuur) | Alles door elkaar in één bestand | Restaurant: ober (controller), keuken (model), bord (view) | `app/Http/Controllers`, `app/Models`, `resources/views` | "Mijn controller haalt via het model de data op en geeft die aan de view." |
| Active Record | Voor elke actie SQL schrijven | Elke rij in de tabel is een object dat zichzelf kan opslaan | Eloquent: `$product->save()`, `Product::find(1)` | "Eloquent is Active Record: het model kent zijn eigen tabel." |
| Facade | Lange code om een dienst op te halen | Receptie van een hotel: één loket voor alles | `Auth::user()`, `DB::table()`, `Route::get()` | "`Auth` is een facade: een korte toegang tot de authenticatie-service." |
| Dependency Injection / Service Container | Klassen die zelf hun afhankelijkheden maken (en daardoor vastzitten aan elkaar) | Een kok krijgt de ingrediënten aangeleverd en kweekt ze niet zelf | `public function store(Request $request)` | "Laravel geeft mijn controller het Request-object, zodat ik het niet zelf hoef te maken." |
| Builder | Een ingewikkelde query in één keer opbouwen | Een burger samenstellen: stap voor stap toppings erbij | `->where()->orderBy()->get()` | "Met de query builder bouw ik de query stap voor stap op." |
| Chain of Responsibility (Pipeline) | Controles vóór elk request (ingelogd? CSRF?) | Beveiligingspoortjes op Schiphol | Middleware: `->middleware('auth')` | "Middleware controleert eerst of je ingelogd bent; zo niet, dan stopt het request." |
| Observer | Na een gebeurtenis moeten meerdere dingen gebeuren | YouTube-abonnement: nieuwe video, iedereen krijgt een melding | Events/Listeners, model observers, het `Registered`-event | "Bij registratie vuur ik een event af; listeners sturen de mail. Mijn controller blijft klein." |
| Strategy | Wisselen tussen manieren om iets te doen | Betalen met iDEAL, PayPal of creditcard | Drivers in `config/mail.php`, `config/cache.php` | "Ik kan van mail-driver wisselen in de config, zonder mijn code aan te passen." |

Niet elke app heeft Observer of Strategy in de eigen code. Dan is dit een sterk antwoord: "Ik gebruik het nog niet, maar het zou passen bij… omdat…"

### Opdracht 1: pattern-jacht (in duo's)
Zoek in je eigen code bij elk pattern uit de kaart een voorbeeld. Noteer het bestand en het regelnummer. Lukt het niet bij een pattern? Schrijf op waar het zou passen.

### Opdracht 2: pattern-verhoor (drietallen, rondes van 11 minuten)
- **Uitlegger:** kies 2 patterns en leg ze uit met WHWA. Beantwoord ook: wat als je dit pattern níet had gebruikt?
- **Assessor:** gebruik vragen uit bijlage A, deel 2.
- **Observator:** werd het **probleem** genoemd, of alleen de naam van het pattern?

### Exit ticket
Noem 1 pattern in jouw app, waar het staat en welk probleem het oplost.

**Extra (snel klaar):** zoek een stuk code dat na een actie meerdere dingen doet. Bouw het om naar een Event + Listener en leg het verschil uit.

---

## Les 3: Kwaliteit en verantwoording

Je kijkt kritisch naar je eigen app: beveiliging, database, codekwaliteit en testen. Een zwakke plek die je **zelf** benoemt, met een verbetervoorstel, scoort hoger dan een zwakke plek die je verbergt.

**Je leert:**
- uitleggen hoe je app zich beschermt tegen SQL-injectie, XSS, CSRF en mass assignment;
- de database-relaties in je app uitleggen (migraties, foreign keys, `hasMany`/`belongsTo`);
- het Single Responsibility-principe (de S van SOLID) toepassen op een eigen controller: een class of methode heeft één taak;
- zwakke plekken in je eigen code benoemen en een verbetering voorstellen.

### Opdracht 1: stations (in duo's, 4 × 10 minuten)
Bij elk station zoek je in de app van één van jullie twee. Bij station 3 en 4 neem je de andere app. Noteer per station: wat is goed, wat kan beter, en hoe zou je het verbeteren?

**Station 1: Beveiliging**
- Worden wachtwoorden gehasht (`Hash::make` / `bcrypt`)? Waarom sla je ze nooit leesbaar op?
- Staat `@csrf` in elk formulier? Wat doet het?
- Gebruik je Eloquent of de query builder (veilig tegen SQL-injectie door parameter binding), of ergens ruwe SQL met `DB::raw`?
- Waar gebruik je `{!! !!}` in Blade? Is dat nodig?
- Staat `$fillable` (of `$guarded`) in elk model?
- Kan gebruiker A de gegevens van gebruiker B aanpassen door een ID in de URL te veranderen? (autorisatie, Policies)

**Station 2: Database**
- Teken de tabellen en relaties van je app (ERD op papier).
- Wijs in je migraties de foreign keys aan. Wat gebeurt er bij verwijderen (`cascade`)?
- Waar gebruik je `hasMany`, `belongsTo`, `belongsToMany`?
- N+1-probleem: haal je in een lus relaties op? Ken je `with()` (eager loading)?

**Station 3: Codekwaliteit**
- Welke controller-methode is het langst? Doet die meer dan één ding?
- Waar staat je validatie: in de controller of in een Form Request?
- Kloppen je namen (Engels, duidelijk, Laravel-conventies zoals `ProductController` en een `products`-tabel)?
- Staat er dubbele code die in één methode of component kan (Blade components, `@include`)?

**Station 4: Testen en werkwijze**
- Heb je tests (`php artisan test`, zie Blok 7 H8)? Zo nee: welke feature zou je als eerste testen en waarom?
- Hoe heb je getest dat je app werkt (handmatig, testplan)?
- Laat je Git-geschiedenis zien: wat zeggen je commits over je werkwijze?
- Wat staat er in `.env`, en waarom staat dat niet in Git?

### Opdracht 2: kruisverhoor (drietallen, 3 × 5 minuten)
De assessor stelt **alleen** "wat als…?"- en "waarom niet…?"-vragen uit bijlage A, deel 3. Als uitlegger oefen je ook: "Dat weet ik niet zeker, maar…"

### Lijst met zwakke plekken
Schrijf aan het eind van de les op: **2 zwakke plekken in je app + hoe je ze zou verbeteren.** Neem deze lijst mee naar het assessment. Daar komt vaak de vraag: "Wat zou je nu anders doen?"

**Extra (snel klaar):** schrijf een Feature-test voor één route en leg uit wat de test controleert.

---

## Les 4: Generale repetitie

Je doet een proefassessment van 12 minuten, beoordeeld met de rubric (bijlage B). Het doel: het echte assessment voelt straks als de tweede keer, niet als de eerste.

**Je leert:**
- onder lichte druk je eigen app toelichten volgens WHWA;
- reageren op onverwachte vragen, ook met "dat weet ik niet zeker, maar…";
- feedback geven en ontvangen met de rubric.

### Opbouw van het proefassessment (12 minuten)
1. **Pitch (2 min):** wat doet je app, voor wie, met welke techniek?
2. **Code-tour (5 min):** de **assessor** wijst een feature of bestand aan, niet jij. Jij legt uit met WHWA.
3. **Doorvragen (4 min):** minstens 1 vraag over design patterns, 1 over beveiliging of database, en 1 "wat als…?".
4. **Reflectie (1 min):** "Wat zou je nu anders doen?" Gebruik je lijst met zwakke plekken uit les 3.

### Drietallen (3 rondes van 18 minuten)
12 minuten assessment, 4 minuten feedback met de rubric, 2 minuten wisselen. De observator vult de rubric in en houdt de tijd.

### Persoonlijk actiepunt
Schrijf op basis van de rubric **één actiepunt** voor het echte assessment. Bijvoorbeeld: "Ik oefen thuis mijn uitleg van de middleware."

### Tips voor het echte assessment
- Zorg dat je app draait vóór je binnenkomt, en dat je editor open staat.
- Neem de tijd: "Mag ik even kijken?" en dan het bestand opzoeken is prima.
- Weet je iets niet? Zeg het, en vertel hoe je het zou uitzoeken.
- Gebruik vakbegrippen, maar leg ze uit in je eigen woorden.
- Noem zelf een zwakke plek en je verbeteridee. Dat laat inzicht zien.

---

## Bijlage A: Vragenbank voor de assessor

Kies per ronde 2–3 vragen en vraag minstens één keer door met "Waarom?" of "Laat zien waar".

**Deel 1: Structuur en werking (les 1)**
1. Wat gebeurt er als ik op deze knop klik? Laat het hele pad zien.
2. Waar staat de route voor deze pagina? Welke HTTP-methode is het en waarom?
3. Wat is het verschil tussen een GET- en een POST-route in jouw app?
4. Wat doet deze controller-methode, regel voor regel?
5. Hoe komt deze data in de view terecht?
6. Wat is MVC en waar zie ik dat in jouw mappenstructuur?
7. Wat is een migratie en waarom gebruik je die in plaats van tabellen in phpMyAdmin te maken?

**Deel 2: Design patterns (les 2)**
1. Wat is een design pattern? Noem er een uit jouw app.
2. Wat is `Auth::user()` precies? Hoe heet dat pattern?
3. Hoe krijgt jouw controller het `Request`-object? Wie maakt dat aan?
4. Is Eloquent een voorbeeld van een pattern? Welk?
5. Wat doet middleware en waarom is dat handiger dan een check in elke controller?
6. Stel: na een bestelling moet er een mail, een factuur en een voorraadupdate komen. Waar zet je dat?
7. Wat is het verschil tussen MVC en een pattern als Observer?

**Deel 3: Kwaliteit, beveiliging en "wat als…?" (les 3)**
1. Wat als iemand `<script>alert(1)</script>` in dit formulier invult?
2. Wat als iemand in de URL het ID verandert naar dat van een andere gebruiker?
3. Wat als iemand een extra veld `is_admin=1` meestuurt?
4. Hoe sla je wachtwoorden op? Waarom zo?
5. Wat doet `@csrf`? Wat gebeurt er als je het weghaalt?
6. Waar valideer je invoer? Waarom daar?
7. Wat gebeurt er met de bestellingen als je een gebruiker verwijdert?
8. Deze methode is lang. Hoe zou je hem opsplitsen?
9. Hoe weet je zeker dat je app werkt? Hoe heb je getest?
10. Wat zou je anders doen als je opnieuw begon?

## Bijlage B: Rubric mondeling toelichten

| Criterium | Onvoldoende | Voldoende | Goed | Excellent |
| --- | --- | --- | --- | --- |
| Code vinden | Kan bestand of methode niet vinden | Vindt de code met hulp of na zoeken | Vindt de code zelfstandig en snel | Navigeert vlot, gebruikt tools (`route:list`, Go to definition) |
| Wat en hoe (WHWA 1–2) | Leest code voor zonder uitleg | Legt uit wat de code doet | Legt wat en hoe uit, volgt het request correct | Legt helder uit, ook voor een niet-programmeur |
| Waarom en alternatief (WHWA 3–4) | Geen onderbouwing ("het werkt gewoon") | Noemt een reden voor een keuze | Onderbouwt keuzes en noemt een alternatief | Weegt alternatieven af met voor- en nadelen |
| Design patterns | Kent geen patterns | Noemt een pattern met hulp | Wijst 2 patterns aan in eigen code en noemt het probleem | Wijst 3+ patterns aan en legt uit wanneer je ze wel of niet gebruikt |
| Kwaliteit en beveiliging | Weet niet hoe de app beveiligd is | Noemt 1–2 beveiligingsmaatregelen | Legt maatregelen uit met code (CSRF, `$fillable`, hashing, escaping) | Benoemt zelf zwakke plekken met een verbetervoorstel |
| Vakbegrippen | Gebruikt geen of verkeerde begrippen | Gebruikt enkele begrippen correct | Gebruikt begrippen correct en consequent | Legt begrippen uit in eigen woorden |
| Omgaan met vragen | Klapt dicht of gokt | Geeft een antwoord, soms na hulp | Reageert rustig, vraagt door bij onduidelijkheid | Geeft eerlijk aan wat de student niet weet en hoe die het zou uitzoeken |

## Bijlage C: Spiekbrief

**WHWA**
- **Wat:** "Dit stuk code zorgt ervoor dat…"
- **Hoe:** "Eerst komt het request binnen via de route…, dan…"
- **Waarom:** "Ik heb gekozen voor… omdat…"
- **Alternatief:** "Ik had ook… kunnen doen, maar dat heb ik niet gedaan omdat…"

**Handige zinnen**
- "Mag ik even het bestand opzoeken?"
- "Dat weet ik niet zeker, maar ik denk dat… Ik zou het controleren door…"
- "Een zwakke plek in mijn app is… Als ik meer tijd had, zou ik…"
- "Dit is een voorbeeld van het …-pattern, dat het probleem oplost dat…"

**Begrippenlijst**

| Begrip | Kort uitgelegd |
| --- | --- |
| Route | Koppelt een URL + HTTP-methode aan een controller-methode |
| Controller | Ontvangt het request, regelt wat er moet gebeuren, geeft een response |
| Model (Eloquent) | Class die een databasetabel vertegenwoordigt |
| View (Blade) | Template dat de HTML maakt |
| Migratie | Code die de structuur van de database beschrijft en versiebeheer mogelijk maakt |
| Middleware | Controle die vóór (of na) de controller draait, bijv. ingelogd zijn |
| Form Request | Aparte class voor de validatie van een formulier |
| CSRF | Aanval waarbij een andere site namens jou een formulier verstuurt; `@csrf` voorkomt dat |
| XSS | Aanval met kwaadaardige scripts in invoer; Blade `{{ }}` escapet dit |
| Mass assignment | Velden ongemerkt meesturen; `$fillable` bepaalt wat mag |
| Eager loading | Relaties in één keer ophalen met `with()`, tegen het N+1-probleem |
| Single Responsibility | Een class of methode heeft één taak |
