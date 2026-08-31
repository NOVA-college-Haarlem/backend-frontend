# Hoofdstuk 6 - Full Stack App: Esports Platform

## Introductie

In de vorige hoofdstukken heb je een eigen REST API gebouwd op een bestaand project. Nu gaan we een stap verder: je bouwt een **full stack applicatie** van nul. Dat betekent:

- Een **Laravel backend** die data uit een database serveert via een eigen API
- Een **frontend** (HTML + JavaScript) die die API aanroept en de data toont aan de gebruiker

Het project: een **Esports Platform**. Denk aan teams, games en wedstrijden — zoals bij echte esports-competities. De database staat al klaar in de map `Extra API`.

**Wat ga je bouwen?**

| Laag     | Wat                                  | Technologie               |
| -------- | ------------------------------------ | ------------------------- |
| Database | Esports data (games, matches, teams) | MySQL                     |
| Backend  | REST API die JSON teruggeeft         | Laravel 11                |
| Frontend | Webpagina die de API aanroept        | HTML + JavaScript (fetch) |

**Wat ga je leren?**

- Een nieuw Laravel project opzetten en koppelen aan een database
- API-ondersteuning installeren met `php artisan install:api`
- Models en controllers aanmaken voor `games` en `matches`
- Een **API Resource** gebruiken om JSON-responses te formatteren
- Een frontend bouwen die jouw eigen API aanroept

---

## Opdracht 1: Nieuw Laravel project aanmaken

**Doel:** Een vers Laravel project opzetten als basis voor je esports API.

### 1.1 Project aanmaken

Open je terminal en navigeer naar de map waar je projecten staan. Maak een nieuw Laravel project met Herd. Noem dit project "esports-api".



### 1.2 Controleer of het werkt

Ga naar `http://localhost:8000` in je browser. Je ziet de standaard Laravel welkomstpagina. Goed, het project werkt.

---

## Opdracht 2: Database aanmaken en koppelen

**Doel:** De esports database aanmaken en koppelen aan je Laravel project.

### 2.1 Database aanmaken in MySQL

Om Mysql te gebruiken maken we gebruik van docker. Clone de repository `docker-template` van github. en start de containers met `docker compose up -d`.

Open **phpMyAdmin** of je MySQL-tool en maak een nieuwe database aan, noem deze "esports_platform".

> Je kunt ook gewoon op "Nieuwe database" klikken in phpMyAdmin en de naam `esports_platform` invullen.

### 2.2 SQL-bestanden inladen

In de map `Extra API` staan twee bestanden:
- `esports_schema.sql` — de tabelstructuur (CREATE TABLE statements)
- `esports_seed.sql` — de testdata (INSERT INTO statements)

Importeer ze in deze volgorde via phpMyAdmin (of via de terminal):

**Via phpMyAdmin:**
1. Klik op de database `esports_platform`
2. Kies het tabblad **Importeren**
3. Importeer eerst `esports_schema.sql`
4. Importeer daarna `esports_seed.sql`

**Via de terminal (alternatief):**
```bash
mysql -u root -p esports_platform < "pad/naar/esports_schema.sql"
mysql -u root -p esports_platform < "pad/naar/esports_seed.sql"
```

Controleer in phpMyAdmin of de tabellen er staan: `users`, `games`, `teams`, `matches`, enzovoort.

### 2.3 .env koppelen

Open het bestand `.env` in de root van je project. Pas de database-instellingen aan:

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3307
DB_DATABASE=esports_platform
DB_USERNAME=root
DB_PASSWORD=password
```

> Vul bij `DB_PASSWORD` je eigen MySQL-wachtwoord in. Op veel lokale installaties is dit leeg.

Test de verbinding:
```bash
php artisan db:show
```

Je ziet de tabellen van je database als het werkt. Krijg je een foutmelding? Controleer je `.env` instellingen.

---

## Opdracht 3: API-ondersteuning installeren

**Doel:** Laravel klaarmaken voor het afhandelen van API-verzoeken.

In Laravel 11 is API-ondersteuning niet meer standaard ingebouwd. Je installeert het met één commando:

```bash
php artisan install:api
```

Laravel vraagt of je **Laravel Sanctum** wilt installeren. Sanctum is een pakket voor API-authenticatie (inloggen via tokens). Typ `yes` en druk op Enter.

Daarna voert Laravel automatisch de benodigde migraties uit.

**Wat heeft dit commando gedaan?**

- Het bestand `routes/api.php` is aangemaakt — hier komen jouw API-routes
- Sanctum is geïnstalleerd voor (toekomstige) authenticatie
- De `api`-middleware is geconfigureerd

Controleer of het bestand bestaat:
```bash
cat routes/api.php
```

Je ziet een leeg routebestand met een voorbeeld. Goed, de API-laag staat klaar.

---

## Opdracht 4: Het Game model

**Doel:** Een Eloquent model aanmaken voor de `games` tabel.

### 4.1 Wat is een model?

Een **model** in Laravel is een PHP-klasse die één tabel in de database vertegenwoordigt. Via het model kun je data ophalen, aanmaken, aanpassen en verwijderen — zonder zelf SQL te schrijven.

De tabel `games` ziet er zo uit:

| Kolom       | Type    | Omschrijving                             |
| ----------- | ------- | ---------------------------------------- |
| `id`        | BIGINT  | Uniek ID                                 |
| `name`      | VARCHAR | Naam van het spel (bijv. "Valorant")     |
| `slug`      | VARCHAR | URL-vriendelijke naam (bijv. "valorant") |
| `genre`     | VARCHAR | Genre (bijv. "Tactical Shooter")         |
| `cover_url` | VARCHAR | Link naar een afbeelding                 |
| `is_active` | TINYINT | Is het spel actief (1) of niet (0)?      |

### 4.2 Model aanmaken

```bash
php artisan make:model Game
```

Open het aangemaakte bestand `app/Models/Game.php`. Pas het aan:

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Game extends Model
{
    protected $table = 'games';

    protected $fillable = [
        'name',
        'slug',
        'genre',
        'cover_url',
        'is_active',
    ];

    protected $casts = [
        'is_active' => 'boolean',
    ];
}
```

**Wat doet dit?**

| Eigenschap  | Uitleg                                                          |
| ----------- | --------------------------------------------------------------- |
| `$table`    | Vertelt Laravel welke tabel bij dit model hoort                 |
| `$fillable` | De kolommen die je mag invullen via de API                      |
| `$casts`    | Laravel converteert `is_active` automatisch naar `true`/`false` |

### 4.3 GameController aanmaken

Een **controller** bevat de logica: wat moet er gebeuren als iemand een API-verzoek stuurt?

```bash
php artisan make:controller GameController --api
```

De vlag `--api` genereert automatisch de standaard methodes: `index`, `show`, `store`, `update` en `destroy`.

Open `app/Http/Controllers/GameController.php` en vul de methodes `index` en `show` in:

```php
<?php

namespace App\Http\Controllers;

use App\Models\Game;
use Illuminate\Http\JsonResponse;

class GameController extends Controller
{
    /**
     * Alle games ophalen.
     * GET /api/games
     */
    public function index(): JsonResponse
    {
        $games = Game::all();

        return response()->json($games);
    }

    /**
     * Één game ophalen op ID.
     * GET /api/games/{id}
     */
    public function show(Game $game): JsonResponse
    {
        return response()->json($game);
    }

    public function store() {}
    public function update() {}
    public function destroy() {}
}
```

> **Route Model Binding**: Doordat de parameter `Game $game` heet, zoekt Laravel automatisch het juiste record op via het `id` in de URL. Je hoeft zelf geen `Game::find($id)` te schrijven.

### 4.4 Routes toevoegen

Open `routes/api.php` en voeg de routes toe:

```php
<?php

use App\Http\Controllers\GameController;
use Illuminate\Support\Facades\Route;

Route::get('/games', [GameController::class, 'index']);
Route::get('/games/{game}', [GameController::class, 'show']);
```

### 4.5 Testen in de browser

Start de server:
```bash
php artisan serve
```

Ga naar:
- `http://localhost:8000/api/games` → je ziet alle games als JSON
- `http://localhost:8000/api/games/1` → je ziet alleen Valorant

Voorbeeld van wat je ziet bij `/api/games/1`:

```json
{
    "id": 1,
    "name": "Valorant",
    "slug": "valorant",
    "genre": "Tactical Shooter",
    "cover_url": "https://picsum.photos/seed/valorant/400/200",
    "is_active": true,
    "created_at": "...",
    "updated_at": "..."
}
```

---

## Opdracht 5: Het MatchGame model

**Doel:** Een model aanmaken voor de `matches` tabel.

### 5.1 Waarom "MatchGame" en niet "Match"?

`Match` is een **gereserveerd woord** in PHP — je kunt geen klasse `Match` aanmaken. Daarom noemen we het model `MatchGame`. We vertellen Laravel vervolgens expliciet dat dit model naar de tabel `matches` wijst.

De tabel `matches` ziet er zo uit:

| Kolom            | Omschrijving                               |
| ---------------- | ------------------------------------------ |
| `id`             | Uniek ID                                   |
| `tournament_id`  | Welk toernooi                              |
| `team_home_id`   | Het thuisteam                              |
| `team_away_id`   | Het uitteam                                |
| `round`          | Speelronde                                 |
| `score_home`     | Score thuisteam (NULL = nog niet gespeeld) |
| `score_away`     | Score uitteam (NULL = nog niet gespeeld)   |
| `winner_team_id` | Winnend team (NULL = nog niet beslist)     |
| `played_at`      | Wanneer gespeeld                           |

### 5.2 Model aanmaken

```bash
php artisan make:model MatchGame
```

Open `app/Models/MatchGame.php` en vul het in:

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MatchGame extends Model
{
    protected $table = 'matches';

    protected $fillable = [
        'tournament_id',
        'team_home_id',
        'team_away_id',
        'round',
        'score_home',
        'score_away',
        'winner_team_id',
        'played_at',
    ];

    protected $casts = [
        'played_at' => 'datetime',
    ];

    // Relatie: match hoort bij een tournament
    public function tournament()
    {
        return $this->belongsTo(Tournament::class);
    }

    // Relatie: thuisteam
    public function homeTeam()
    {
        return $this->belongsTo(Team::class, 'team_home_id');
    }

    // Relatie: uitteam
    public function awayTeam()
    {
        return $this->belongsTo(Team::class, 'team_away_id');
    }
}
```

> De `casts` zorgen ervoor dat `played_at` automatisch als datum-object wordt teruggegeven in plaats van een ruwe string.

### 5.3 MatchController aanmaken

```bash
php artisan make:controller MatchController --api
```

Open `app/Http/Controllers/MatchController.php`:

```php
<?php

namespace App\Http\Controllers;

use App\Models\MatchGame;
use App\Http\Resources\MatchGameResource;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;

class MatchController extends Controller
{
    /**
     * Alle matches ophalen.
     * GET /api/matches
     */
    public function index(): AnonymousResourceCollection
    {
        // Haal alle matches op inclusief de teamgegevens (eager loading)
        $matches = MatchGame::with('homeTeam', 'awayTeam')->get();

        return MatchGameResource::collection($matches);
    }

    /**
     * Één match ophalen op ID.
     * GET /api/matches/{id}
     */
    public function show(MatchGame $matchGame): MatchGameResource
    {
        return new MatchGameResource($matchGame);
    }

    public function store() {}
    public function update() {}
    public function destroy() {}
}
```

> Merk op: de `MatchController` gebruikt een **API Resource** (`MatchGameResource`) in plaats van `response()->json()`. Dat is het onderwerp van de volgende opdracht.

### 5.4 Route toevoegen

Voeg de match-routes toe aan `routes/api.php`:

```php
use App\Http\Controllers\GameController;
use App\Http\Controllers\MatchController;
use Illuminate\Support\Facades\Route;

Route::get('/games', [GameController::class, 'index']);
Route::get('/games/{game}', [GameController::class, 'show']);

Route::get('/matches', [MatchController::class, 'index']);
Route::get('/matches/{matchGame}', [MatchController::class, 'show']);
```

---

## Opdracht 6: API Resource aanmaken

**Doel:** De JSON-output van de `matches` endpoint zelf bepalen met een Resource.

### 6.1 Wat is een API Resource?

Tot nu toe gaf je met `response()->json($model)` alle kolommen terug — ook kolommen die je misschien niet wil tonen (wachtwoorden, interne velden, of lelijke timestamps).

Een **API Resource** is een klasse die bepaalt welke velden in de JSON-response komen en hoe ze heten. Je hebt volledige controle over de output.

### 6.2 Resource aanmaken

```bash
php artisan make:resource MatchGameResource
```

Open `app/Http/Resources/MatchGameResource.php` en vul het in:

```php
<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class MatchGameResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id'           => $this->id,
            'round'        => $this->round,
            'score_home'   => $this->score_home,
            'score_away'   => $this->score_away,
            'played_at'    => $this->played_at?->format('d-m-Y H:i'),
            'is_played'    => $this->played_at !== null,
            'winner_team_id' => $this->winner_team_id,
            'teams' => [
                'home' => $this->homeTeam->name,
                'away' => $this->awayTeam->name,
            ],
        ];
    }
}
```

**Wat is hier nieuw?**

| Veld                      | Uitleg                                                                              |
| ------------------------- | ----------------------------------------------------------------------------------- |
| `played_at?->format(...)` | Datum netjes formatteren. De `?->` betekent: alleen als het niet `null` is.         |
| `is_played`               | Een **extra veld** dat niet in de database zit, maar wel handig is voor de frontend |
| `$this->homeTeam->name`   | Je spreekt de relatie aan **als property**: Eloquent roept dan zelf de `homeTeam()`-methode van het model aan en geeft je het gerelateerde `Team`-record terug, waar je `->name` op kunt lezen |
| `teams`                   | In plaats van de kale team-ID's tonen we nu de teamnamen zelf, in een genest object |

> **Let op:** wil je dat `$this->homeTeam` geen extra database-query per match doet, zorg dan dat de relatie vooraf is eager-loaded (zoals in `MatchController::index()` met `with('homeTeam', 'awayTeam')`). Zonder eager loading laadt Eloquent de relatie alsnog automatisch (lazy loading) — dat werkt, maar kost bij veel matches wél extra queries. Dit is precies het N+1-probleem dat je in Blok 6 hebt gezien.

### 6.3 Testen

Ga naar `http://localhost:8000/api/matches/1`. De output ziet er nu zo uit:

```json
{
    "data": {
        "id": 1,
        "round": 1,
        "score_home": 13,
        "score_away": 7,
        "played_at": "01-03-2024 15:00",
        "is_played": true,
        "winner_team_id": 1,
        "teams": {
            "home": "Team Alpha",
            "away": "Team Bravo"
        }
    }
}
```

> Laravel wikkelt een Resource automatisch in een `"data"` wrapper. Dat is standaard gedrag van API Resources - ook bij `MatchController::index()`, sinds we daar `MatchGameResource::collection(...)` direct teruggeven in plaats van 'm handmatig met `response()->json()` te verpakken.

Ga ook naar `/api/matches` voor de volledige lijst.

---

## Opdracht 7: Alle routes overzicht

**Doel:** Controleren of alle routes correct zijn geregistreerd.

Voer dit commando uit:
```bash
php artisan route:list --path=api
```

Je ziet zoiets:

```
GET  api/games              GameController@index
GET  api/games/{game}       GameController@show
GET  api/matches            MatchController@index
GET  api/matches/{matchGame} MatchController@show
```

Klopt dit? Dan zijn je endpoints klaar. Test ze allemaal in je browser of in Postman.

**Checklist:**

| Endpoint             | Verwacht resultaat                     |
| -------------------- | -------------------------------------- |
| `GET /api/games`     | JSON-lijst van alle 5 games            |
| `GET /api/games/1`   | JSON van Valorant                      |
| `GET /api/games/99`  | 404 foutmelding                        |
| `GET /api/matches`   | JSON-lijst van alle 8 matches          |
| `GET /api/matches/1` | JSON van match 1 via MatchGameResource |

---

## Opdracht 8: CRUD afronden voor Games

**Doel:** Naast lezen (`index`/`show`) ook schrijven (`store`/`update`/`destroy`) toevoegen, met validatie.

Tot nu toe kan de API alleen games *lezen*. Een REST API die alleen leest is nog geen volwaardige API. We ronden `GameController` af met dezelfde aanpak die je in Hoofdstuk 5 hebt geleerd: valideren met `$request->validate()`, de juiste HTTP-statuscode teruggeven, en foutafhandeling bij een niet-bestaand record.

### 8.1 `store`, `update` en `destroy` invullen

Open `app/Http/Controllers/GameController.php` en vervang de lege methodes:

```php
public function store(Request $request): JsonResponse
{
    $validated = $request->validate([
        'name'      => 'required|string|max:100',
        'slug'      => 'required|string|max:100|unique:games,slug',
        'genre'     => 'required|string|max:50',
        'cover_url' => 'nullable|string|max:500',
        'is_active' => 'boolean',
    ]);

    $game = Game::create($validated);

    return response()->json($game, 201);
}

public function update(Request $request, Game $game): JsonResponse
{
    $validated = $request->validate([
        'name'      => 'sometimes|required|string|max:100',
        'slug'      => 'sometimes|required|string|max:100|unique:games,slug,' . $game->id,
        'genre'     => 'sometimes|required|string|max:50',
        'cover_url' => 'nullable|string|max:500',
        'is_active' => 'boolean',
    ]);

    $game->update($validated);

    return response()->json($game);
}

public function destroy(Game $game): JsonResponse
{
    $game->delete();

    return response()->json(null, 204);
}
```

**Uitleg:**

| Onderdeel | Wat het doet |
|---|---|
| `'unique:games,slug'` | De `slug` moet uniek zijn in de tabel `games`, kolom `slug` |
| `'unique:games,slug,' . $game->id` | Bij een update: uniek, **behalve** voor het record dat je nu aan het updaten bent (anders zou een game altijd botsen met zichzelf) |
| `sometimes` | Alleen valideren als het veld daadwerkelijk is meegestuurd - handig bij een update waarbij je niet elk veld opnieuw hoeft te sturen |
| `$game->update($validated)` | Werkt bestaande velden bij met de gevalideerde data |
| Statuscode `201` bij store | Nieuw record aangemaakt |
| Statuscode `204` bij destroy | Geslaagd, geen inhoud om terug te geven |

Zorg dat `use Illuminate\Http\Request;` en `use Illuminate\Http\JsonResponse;` bovenaan het bestand staan (ze stonden er al voor `index`/`show`).

### 8.2 Routes toevoegen

Voeg toe aan `routes/api.php`:

```php
Route::post('/games', [GameController::class, 'store']);
Route::put('/games/{game}', [GameController::class, 'update']);
Route::delete('/games/{game}', [GameController::class, 'destroy']);
```

### 8.3 Testen in Postman

**Nieuwe game aanmaken:**
- Methode: POST, URL: `http://localhost:8000/api/games`
- Body → raw → JSON:
```json
{
    "name": "Rocket League",
    "slug": "rocket-league",
    "genre": "Sports",
    "is_active": true
}
```
- Verwacht: `201 Created` met de nieuwe game.

**Game bijwerken:**
- Methode: PUT, URL: `http://localhost:8000/api/games/6` (het ID dat je net terugkreeg)
- Body: `{"is_active": false}`
- Verwacht: `200 OK`, `is_active` staat nu op `false`.

**Game verwijderen:**
- Methode: DELETE, URL: `http://localhost:8000/api/games/6`
- Verwacht: `204 No Content`.

**Validatiefout testen:**
- Methode: POST, Body: `{}`
- Verwacht: `422 Unprocessable Content` met foutmeldingen per veld (voeg de header `Accept: application/json` toe, zoals je in Hoofdstuk 5 hebt geleerd).

**Checkpoint:** Games kunnen nu volledig via de API worden aangemaakt, bijgewerkt en verwijderd.

---

## Opdracht 9: Frontend bouwen

**Doel:** Een webpagina bouwen die jouw eigen API aanroept en de data toont - de laatste laag van de full stack applicatie.

Tot nu toe heb je alleen de backend gebouwd: een database, models, controllers en een API die JSON teruggeeft. Nu bouwen we de laag die een bezoeker daadwerkelijk ziet: een HTML-pagina die met JavaScript (`fetch`) jouw eigen `/api/games` en `/api/matches` endpoints aanroept.

### 9.1 Let op: twee verschillende JSON-vormen

`GameController` gebruikt (nog) geen API Resource - `index()` geeft een kale array terug (`response()->json($games)`). `MatchController` gebruikt wél een Resource, dus die data zit gewrapt in een `"data"`-sleutel (zie Opdracht 6.3). Je frontend-code moet daar rekening mee houden:

```javascript
fetch('/api/games').then(r => r.json())        // → array direct
fetch('/api/matches').then(r => r.json())      // → { data: [...] }
```

### 9.2 Route en view aanmaken

Voeg toe aan `routes/web.php` (maak dit bestand aan als het nog niet bestaat):

```php
<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('dashboard');
});
```

Maak `resources/views/dashboard.blade.php`:

```html
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Esports Platform</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 700px;
            margin: 0 auto;
            padding: 20px;
            background-color: #1a1a2e;
            color: #e0e0e0;
        }
        h1, h2 { color: #f5c542; }
        ul { list-style: none; padding: 0; }
        li {
            background-color: #16213e;
            padding: 10px 15px;
            margin-bottom: 8px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <h1>Esports Platform</h1>

    <h2>Games</h2>
    <ul id="games">
        <li>Laden...</li>
    </ul>

    <h2>Matches</h2>
    <ul id="matches">
        <li>Laden...</li>
    </ul>

    <script>
        fetch('/api/games')
            .then(response => response.json())
            .then(games => {
                let html = '';
                games.forEach(game => {
                    html += `<li>${game.name} - ${game.genre}</li>`;
                });
                document.getElementById('games').innerHTML = html;
            });

        fetch('/api/matches')
            .then(response => response.json())
            .then(json => {
                const matches = json.data;
                let html = '';
                matches.forEach(match => {
                    const score = match.is_played
                        ? `${match.score_home} - ${match.score_away}`
                        : 'nog niet gespeeld';
                    html += `<li>${match.teams.home} vs ${match.teams.away}: ${score}</li>`;
                });
                document.getElementById('matches').innerHTML = html;
            });
    </script>
</body>
</html>
```

### 9.3 Testen

Ga naar `http://localhost:8000/`. Je ziet twee lijsten: de games en de matches, allebei geladen via `fetch()` vanuit jouw eigen API.

**Checkpoint:** De pagina toont games en matches zonder dat de HTML zelf uit de database komt - alle data loopt via de API die je in dit hoofdstuk hebt gebouwd. Dit is de kern van een full stack applicatie: backend en frontend zijn twee losse lagen die met elkaar praten via JSON.

**Bonusvraag:** Wat zou je moeten aanpassen als je straks een aparte React- of Vue-frontend zou bouwen in plaats van deze Blade-pagina? (Hint: verandert er iets aan de API zelf?)

---

## Samenvatting

In dit hoofdstuk heb je een complete full stack applicatie gebouwd, van database tot frontend.

| Concept | Wat je hebt geleerd |
|---|---|
| **Project + database koppelen** | Een vers Laravel-project verbinden met een bestaande MySQL-database |
| **`php artisan install:api`** | API-ondersteuning (incl. Sanctum) toevoegen aan een Laravel 11-project |
| **Models met relaties** | `belongsTo`-relaties tussen `MatchGame`, `Team` en `Tournament` |
| **Gereserveerde woorden** | Waarom `MatchGame` i.p.v. `Match` als modelnaam, met `$table` expliciet gezet |
| **Route Model Binding** | `Game $game` / `MatchGame $matchGame` als controller-parameter |
| **Eager loading in de praktijk** | `with('homeTeam', 'awayTeam')` om de N+1-valkuil te voorkomen |
| **API Resources** | Relaties tonen als leesbare velden (teamnamen) in plaats van kale ID's |
| **Volledige CRUD** | `store`/`update`/`destroy` met validatie, ook voor een tweede model (Game) |
| **Frontend via `fetch()`** | Een Blade-pagina die de eigen API aanroept in plaats van direct met Eloquent te werken |

**De volledige cyclus van dit blok:**

```
Hoofdstuk 1-4: API's van anderen gebruiken (consumeren)
Hoofdstuk 5:   Je eigen API bouwen op een bestaand project
Hoofdstuk 6:   Een complete full stack app bouwen: database → API → frontend
```

Je hebt nu alle lagen van een moderne webapplicatie gezien: database, backend-API en frontend - en hoe die drie met elkaar communiceren via JSON.

---
