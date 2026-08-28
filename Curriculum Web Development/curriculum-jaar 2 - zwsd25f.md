# Curriculum Web Development - Jaar 2 (zwsd25f)

**Opleiding:** MBO niveau 4, Software Development
**Klas:** zwsd25f
**Scope:** Blok 5 t/m Blok 8 (jaar 2) - dit document dekt Blok 5 en 6, zie Openstaande punten
**Bron:** `zwsd25f`

> Zie `curriculum-jaar 1 - zwsd25f.md` voor Blok 3-4 van dit cohort. Dit document staat los van de curricula van zwsd26ab en zwsd26f.

---

## 1. Blokoverzicht

| Blok | Status | Inhoud |
|---|---|---|
| **5** | Uitgewerkt | Backend-verdieping: PDO, security, soft delete, AJAX, filtering, error handling (plain PHP) + eindproject |
| **6** | Uitgewerkt | Laravel: MVC, Eloquent-relaties, CRUD, authenticatie/autorisatie, bestellingen (many-to-many) + projecten |
| **7** | *nog niet in deze repo* | - |
| **8** | *nog niet in deze repo* | - |

Blok 7-8 zijn (nog) niet aanwezig in deze repo - dit cohort heeft op het moment van schrijven vermoedelijk Blok 6 net afgerond of is daar nog mee bezig.

---

## 2. Blok 5 - Backend-verdieping: Security & PDO

**Duur:** 6 weken (week 4-6 elk met 2 lessen)
**Stack:** plain PHP, overstap van MySQLi naar **PDO**
**Doorlopende focus:** veiligheid (SQL-injectie, XSS, wachtwoorden) en professionele codestructuur

| Week | Onderwerp | Leeruitkomsten |
|---|---|---|
| 1 | PDO & Prepared Statements | PDO-connectie i.p.v. MySQLi; prepared statements tegen SQL-injectie; wat SQL-injectie is; placeholders (`:naam`-syntax); `fetch()`/`fetchAll()` met `PDO::FETCH_ASSOC`; CREATE en READ met PDO |
| 2 | Security & Update | `htmlspecialchars()` tegen XSS; input-validatie op formulieren; UPDATE-queries met prepared statements; `password_hash()` geïntroduceerd; update-functionaliteit voor meerdere entiteiten |
| 3 | Password Security | Wachtwoorden hashen bij registratie (`password_hash(PASSWORD_DEFAULT)`); verifiëren bij login (`password_verify()`); veilige opslag van gebruikersgegevens |
| 4 | Soft Delete & AJAX | Les 1: soft delete met `deleted_at`-kolom, restore-functionaliteit, queries met `WHERE deleted_at IS NULL`. Les 2: AJAX met `fetch()`, JSON-uitwisseling FE↔BE, foreign keys/relaties, cart-functionaliteit zonder page reload |
| 5 | Security & Filtering | Les 1: sessiebeheer en toegangscontrole, input-validatie (`is_numeric()`), request-method-validatie, actielogboek. Les 2: filtering met GET-parameters, JOIN-queries, dynamische `WHERE`-clausules, meerdere filters combineren |
| 6 | Error Handling & Eindproject | Les 1: HTTP-statuscodes (200/403/404/500), custom error pages, `http_response_code()`, try-catch bij database-fouten. Les 2: code review checklist, integratie- en securitytest van het eindproject |

**Eindresultaat Blok 5:** een volledig beveiligde CRUD-applicatie (PDO + prepared statements overal, gehashte wachtwoorden, XSS-bescherming, sessiebeheer, soft delete, AJAX zonder page reload, filtering, custom error pages) met professionele bestandsstructuur (gescheiden view/process-bestanden, DRY, consistente naamgeving).

### Eindproject Blok 5

Vier volledig uitgewerkte scenario's, elk met user stories die alle rubriekcriteria dekken:

| Project | Thema | 1-op-1 relatie | 1-op-veel relatie |
|---|---|---|---|
| SnapMarket | Tweedehands marktplaats | users ↔ seller_profiles | categories → items |
| GameVault | Game-collectie tracker | users ↔ gamer_profiles | platforms → games |
| SportBuddy | Sportclub-beheer | users ↔ player_profiles | teams → trainingen |
| RecipeBox | Receptenplatform | users ↔ cook_profiles | categories → recipes |

**Eindproject-checklist (functionaliteit, security, codestructuur)** staat volledig uitgeschreven in `Blok5_Leerdoelen_Samenvatting.md` - o.a. alle CRUD-operaties, soft delete + restore, AJAX, filtering, custom error pages, gehashte wachtwoorden, prepared statements overal, escaped output, sessiechecks op alle beschermde pagina's.

---

## 3. Blok 6 - Laravel

**Duur:** 7 hoofdstukken (Hoofdstuk 1 heeft 5 delen: 1, 1b, 1c, 1d, 1e)
**Project:** doorlopende "Spelshop" (game-webshop) applicatie
**Stack:** Laravel (Herd), Eloquent, Blade, Bootstrap

| # | Hoofdstuk | Leeruitkomsten |
|---|---|---|
| 1 | Introductie Laravel | Laravel Herd installeren; project opzetten; homepage aanpassen; Bootstrap toevoegen; route + view toevoegen; controller aanmaken; data doorgeven aan een view |
| 1b | Producten | Herhaling van het MVC-patroon toegepast op een tweede entiteit (producten) |
| 1c | Detailpagina's | Detailpagina's voor categorieën en producten |
| 1d | Layout files | Gedeelde layout met props en attribute merge (herbruikbare Blade-layouts) |
| 1e | Eloquent relaties in views | Eloquent-relaties direct in Blade-views tonen |
| 2 | Models en Relaties | Migration + seeder + model voor de volledige datastructuur (ERD); `$fillable`; one-to-many en many-to-many in Eloquent; **eager loading** tegen het N+1-probleem |
| 3 | CRUD Formulieren en Validatie | Resource controller (7 standaardmethoden); formulieren met CSRF; validatie met Laravel validation rules; foutmeldingen per veld (`@error`, `old()`); flash messages; zoekfunctie met Eloquent |
| 4 | Authenticatie en Middleware | Laravel Breeze verkennen; registreren/inloggen; layout koppelen aan Breeze; routes beveiligen met middleware; `Auth::user()` in views; adminrol; Gates voor autorisatie |
| 5 | Reviews en Autorisatie | Reviews door ingelogde klanten (geneste routes, `Auth::id()`); gemiddelde beoordeling berekenen; **Policies** voor autorisatie per record (`@can` in Blade); FormRequest classes voor validatie buiten de controller |
| 6 | Bestellingen en Many-to-Many | Bestellingen via `orderrows`-pivottabel; `attach()`/`sync()`/`detach()`; bestelformulier + opslaan + prijsvalidatie; bestellingenoverzicht per gebruiker; bestelling annuleren; paginatie |
| 7 | Herhaling en Verdieping | Validatie centraliseren in FormRequest classes (incl. Nederlandstalige foutmeldingen); categorieën-CRUD afronden; zoekfunctie uitbreiden; zelfstandige voorbereidingsopdrachten voor het eindproject (prijshistorie, admin-bestellingenbeheer, gebruikersprofiel, categorie-filter) |

**Eindresultaat Blok 6:** een complete Laravel-webshop met MVC, Eloquent-relaties (one-to-many én many-to-many via pivot), eager loading, resource-CRUD met validatie en flash messages, Breeze-authenticatie met rollen, Policy-based autorisatie, FormRequest-validatie, en paginatie.

### Projecten Blok 6 (6a)

Zes themaprojecten om het Laravel-patroon zelfstandig te herhalen: Bibliotheek, E-Commerce Shop, Event Management, Fitness Center, Hotel Management, University Management - met een eigen rubric.

---

## 4. Eindbeeld na Jaar 2 (Blok 5-6, zoals aanwezig in deze repo)

Na deze twee blokken kan een zwsd25f-student:

**Security & databases (Blok 5)**
- PDO met prepared statements gebruiken i.p.v. onveilige string-concatenatie in queries
- Wachtwoorden correct hashen en verifiëren
- XSS voorkomen met `htmlspecialchars()`
- Soft delete implementeren (i.p.v. records fysiek verwijderen)
- AJAX gebruiken voor interacties zonder page reload
- Custom error pages en nette foutafhandeling bouwen

**Framework-ontwikkeling (Blok 6)**
- Een Laravel-project opzetten en structureren volgens MVC
- Eloquent-relaties (1-op-1, 1-op-veel, veel-op-veel) modelleren en gebruiken
- Eager loading toepassen om performanceproblemen te voorkomen
- Volledige CRUD bouwen met resource controllers, validatie en flash messages
- Authenticatie (Breeze) en autorisatie (Gates/Policies) implementeren
- Many-to-many relaties met een pivot-tabel beheren (`attach`/`sync`/`detach`)

**Vergelijking met zwsd26ab:** dit niveau ligt ruim voorbij waar zwsd26ab na jaar 1 staat. zwsd26ab's backend-pilot (PRIMM, zie `curriculum-jaar 1.md` §4b) eindigt bij CRUD in Laravel met basisvalidatie - zwsd25f gaat in Blok 5-6 daar al voorbij met security-verdieping (PDO/hashing/XSS/soft delete), AJAX, en in Laravel met Policies, FormRequests en many-to-many relaties. Dit is een goede referentie voor hoe het (nog te schrijven) curriculum-jaar 2 van zwsd26ab er inhoudelijk uit zou kunnen zien.

---

## 5. Openstaande punten

- **Blok 7 en 8 ontbreken** in deze repo - nog te documenteren zodra er materiaal is.
- Zie ook `.claude/todo.md` voor de actuele stand van openstaand werk.
