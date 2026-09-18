# Eindproject Blok 3A - Backend op de Boulder Base-website (Projectweek 1)

## 📋 Projectomschrijving

Je bouwt geen los oefenproject, maar geeft de gezamenlijke **Boulder Base-website** een echte backend. De lessen-kaarten die nu nog hardgecodeerd in de HTML staan, komen voortaan uit een database, en elke les krijgt een eigen detailpagina met meer informatie. Dit project vormt de basis voor het vervolgproject in Blok 3B (Projectweek 2).

**Waarom Boulder Base?** Iedereen start dit blok vanuit dezelfde website, zodat de focus volledig op de backend-technieken ligt. Voordat je aan de database begint, ruim je eerst de front-end op: er zitten nog een paar bewuste HTML/CSS-bugs in, en een stukje JavaScript ontbreekt nog.

**Wat krijg je al kant-en-klaar aangeleverd?** De omgeving (`docker-compose.yml`) en de startsite staan al klaar in de `boulderbase-start`-repository, en de database-tabel met alle lesgegevens staat al klaar in `sql/lessen.sql`. Je hoeft dus geen omgeving in te richten en geen tabel te ontwerpen - dat komt later in je opleiding nog aan bod. Dit project focust op het uitlezen en tonen van data.

## ✅ Startpunt

- De gezamenlijke Boulder Base-startsite uit `boulderbase-start/` (`index.html`, `les-detail.html`, `css/style.css`, `js/script.js`, `sql/lessen.sql`)
- De site bevat een overzicht met de lessen-kaarten ("Onze lessen") - dat overzicht ga je dynamisch maken
- `sql/lessen.sql` bevat méér gegevens per les dan er nu op de kaarten te zien zijn - de extra gegevens (instructeur, groepsgrootte, duur, benodigdheden, uitgebreide beschrijving) zijn bedoeld voor de detailpagina die je gaat bouwen

## 🛠️ Wat je moet bouwen

### 0. Front-end bugs oplossen (Verplicht, eerst dit)

Voordat je de site dynamisch maakt, werkt de front-end nog niet helemaal goed. Los dit op vóórdat je met PHP begint:

1. **Uitlijning en spacing (box model, Hoofdstuk 2)**: de kaarten bij "Onze lessen" lijken uitgelijnd, maar de padding en margin kloppen niet helemaal - gebruik DevTools om de afwijking te vinden en te fixen. Kijk ook kritisch naar de tekst in de kaarten en de velden van het contactformulier: staat er genoeg ruimte tussen?
2. **Interactieve states (selectors, Hoofdstuk 4/6)**: geen enkele knop of navigatielink heeft nu een `:hover`- of `:focus`-state. Voeg die toe, consistent voor alle knop-varianten en de navigatie.
3. **JavaScript**: er ontbreekt nog functionaliteit - implementeer waar nodig, bijvoorbeeld de dark mode-toggle (`#dark-mode-toggle`) en/of feedback op het contactformulier

Pas als de site er visueel en functioneel goed uitziet, ga je verder met stap 1.

### 1. Omgeving starten (Verplicht)

De repository is al PHP-klaar: `docker-compose.yml` en `index.php` staan er al in. Jij hoeft alleen te starten:
1. Ga naar de `boulderbase-start`-repository op GitHub (Nova College) en fork deze naar je eigen account
2. Clone de repository naar je eigen projectenmap
3. Start de omgeving: `docker compose up -d`
4. Open je browser op `http://localhost` - de site moet er nog precies zo uitzien als je 'm in stap 0 hebt opgeleverd
5. Open PHPMyAdmin en importeer `sql/lessen.sql` (tabblad SQL, plak de inhoud, klik op Start/Go)

### 2. Overzichtspagina (Verplicht)

Het bestaande kaartenoverzicht met de lessen moet nu **vanuit de database** komen in plaats van hardgecodeerde HTML.

**Vereisten:**
- Database connectie via `database.php`
- SELECT query om alle lessen op te halen
- Foreach loop om de items te tonen - de HTML/CSS-structuur (de "kaart") blijft hetzelfde als wat je al had, alleen de inhoud komt nu uit `$item['...']` in plaats van vast te staan
- Gebruik op de kaart alleen de kolommen die er al op stonden (`naam`, `niveau`, `korte_beschrijving`, `prijs`) - de rest bewaar je voor de detailpagina

### 3. Dynamisch menu (Verplicht)

De navigatie die je al gestyled hebt (uit FEO Hoofdstuk 6), maak je nu dynamisch:

**Vereisten:**
- Apart bestand `menu.php` (DRY-principe)
- Associatieve array met menu-items
- Foreach loop om menu-items te genereren
- Include/require in elke pagina - het resultaat moet er precies zo uitzien als je bestaande navigatie

**Voorbeeld:**
```php
<?php
$menuItems = [
    'Home' => 'index.php',
    'Over ons' => 'about.php',
    'Contact' => 'contact.php'
];
?>
<?php foreach($menuItems as $label => $url): ?>
    <a href="<?php echo $url; ?>"><?php echo $label; ?></a>
<?php endforeach; ?>
```

### 4. Detailpagina (Verplicht, Hoofdstuk 4)

Elke les krijgt een eigen detailpagina in `les-detail.php`, met **alle** gegevens van die ene les - dus ook de gegevens die niet op de overzichtspagina staan.

**Vereisten:**
- Link vanaf elke kaart op `index.php` 
- In `les-detail.php`: lees de meegegeven `id`.
- SELECT WHERE-query om alléén de gegevens van die ene les op te halen
- Toon op de detailpagina minimaal 2 gegevens die **niet** op de overzichtspagina staan (bijv. `instructeur`, `groepsgrootte`, `duur_weken`, `benodigdheden` of `lange_beschrijving`)
- Terug-link naar `index.php`
- Style de pagina zelf af (de basis-HTML staat al klaar, maar heeft nog geen CSS)


## 📁 Bestandsstructuur

```
jouw-project/
├── index.php              # Overzichtspagina met database data
├── les-detail.php         # Detailpagina van één les (Hoofdstuk 4)
├── database.php           # Database connectie
├── menu.php               # Dynamisch menu (include in elke pagina)
├── css/
│   └── style.css          # Boulder Base-styling - blijft grotendeels ongewijzigd (na de front-end-fix)
|   js/
|   └── script.js          # Boulder Base-JS - blijft grotendeels ongewijzigd (na de front-end-fix)
├── docker-compose.yml     # Al aanwezig in de repository
└── sql/
    └── lessen.sql         # Al aanwezig, kant-en-klaar aangeleverd (incl. detailpagina-gegevens)
```

## 🎓 Technieken uit Hoofdstuk 1 t/m 4

Je **moet** de volgende technieken gebruiken:

### Hoofdstuk 1 - Introductie PHP
- ✅ PHP tags (`<?php ?>`)
- ✅ Variables en echo
- ✅ Include/require voor menu
- ✅ DRY-principe (menu in apart bestand)
- ✅ Associatieve arrays
- ✅ Foreach loop voor dynamisch menu

### Hoofdstuk 2 - Data ophalen en tonen
- ✅ Database connectie (`database.php`)
- ✅ MySQLi connectie met mysqli_connect
- ✅ SELECT query
- ✅ mysqli_query en mysqli_fetch_all
- ✅ Foreach loop met database data
- ✅ Dynamische HTML in de loop

### Hoofdstuk 3 - Herhaling
- ✅ Modulaire structuur (navbar/menu apart)
- ✅ Data uit database in tabel of grid
- ✅ Kolomnamen uit database correct gebruiken

### Hoofdstuk 4 - Detailpagina, dynamische link
- ✅ Dynamische link met een GET-parameter (`?id=...`)
- ✅ `$_GET['id']` uitlezen
- ✅ SELECT WHERE-query voor één specifieke rij
- ✅ `mysqli_fetch_assoc` voor één rij (i.p.v. `mysqli_fetch_all` voor meerdere)
- ✅ `var_dump()` om te controleren wat je query teruggeeft

### Code Kwaliteit
- ✅ DRY-principe (Don't Repeat Yourself)
- ✅ Modulaire code (aparte bestanden)
- ✅ Duidelijke variabele namen

## 🚀 Stappenplan (Projectweek 1)

**Dag 1**
1. 📝 Fix de front-end bugs (spacing, hover/focus-states) en voeg ontbrekende JavaScript toe
2. 📝 Clone de `boulderbase-start`-repository, `docker compose up -d`, controleer dat de site nog werkt
3. 📝 Importeer `sql/lessen.sql` in PHPMyAdmin

**Dag 2**
4. 📝 Maak `database.php` met de database connectie, test de connectie
5. 📝 Maak `menu.php` met associatieve array en foreach, include in je pagina's
6. 📝 Vervang de hardgecodeerde kaarten in `index.php` door een SELECT-query + foreach-loop

**Dag 3**
7. 📝 Maak `les-detail.php`: haal met een SELECT WHERE-query de juiste les op
8. 📝 Link elke kaart op `index.php` naar `les-detail.php`
9. 📝 Toon op de detailpagina ook de gegevens die niet op de overzichtspagina staan, en style de pagina af
10. 📝 Code opschonen, final check met de checklist

## ✅ Checklist voor Inleveren

Geen punten of percentages - de docent loopt onderstaande checklist met je na, en je moet elk afgevinkt onderdeel kort kunnen toelichten: wat het doet, en waarom je het zo hebt opgelost.

**Front-end (vóór je met de database begint):**
- [ ] Uitlijning en spacing van de lessen-kaarten en het contactformulier (padding/margin) zijn gefixt
- [ ] Alle knoppen en de navigatie hebben een `:hover`- en `:focus`-state
- [ ] Ontbrekende JavaScript is toegevoegd waar nodig

**Functionaliteit:**
- [ ] Overzichtspagina toont de lessen-content uit de database
- [ ] Klik op een les leidt naar een werkende detailpagina
- [ ] Detailpagina toont minimaal 2 gegevens die niet op de overzichtspagina staan
- [ ] Dynamisch menu werkt op alle pagina's
- [ ] Database connectie werkt
- [ ] Geen PHP errors

**Code Kwaliteit:**
- [ ] Menu in apart bestand `menu.php`
- [ ] Database connectie in `database.php`
- [ ] Associatieve array voor menu-items
- [ ] Foreach loop voor menu en overzicht
- [ ] Duidelijke variabele namen

**Behoud van het Boulder Base-design:**
- [ ] Site ziet er nog hetzelfde uit als de opgeleverde front-end - alleen data komt nu uit de database

**Git:**
- [ ] Reguliere commits met duidelijke messages
- [ ] Code gepusht naar GitHub

## 💡 Tips

1. **Fix eerst de front-end bugs** - pas daarna ga je de styling in PHP hergebruiken, zodat je niet twee keer dezelfde fout overtypt
2. **Start met het menu**: volg de stappen uit Hoofdstuk 1, Opdracht 7 en 8
3. **Bekijk `sql/lessen.sql` vóór je gaat programmeren**: weet welke kolommen er zijn en welke je op de index wel/niet gebruikt
4. **Kopieer de structuur**: gebruik het Pokémon-, Formula 1- of driver-profile-voorbeeld uit de les als referentie voor de PHP-code, niet voor de content
5. **Test stap voor stap**: test na elke wijziging of alles nog werkt
6. **var_dump()**: gebruik dit om te zien wat je query teruggeeft - vooral handig bij de detailpagina om te checken of `$_GET['id']` de juiste les oplevert

## 📚 Referenties

- **Hoofdstuk 1**: PHP basics, menu.php, dynamisch menu met array
- **Hoofdstuk 2**: database.php, SELECT query, foreach met database data
- **Hoofdstuk 3**: navbar.php, tabel met database
- **Hoofdstuk 4**: detailpagina, GET-parameter, SELECT WHERE
- **`boulderbase-start/`**: de Boulder Base-startsite (met front-end bugs) die je nu van data gaat voorzien

## 📅 Deadline

**Inleverdatum**: Zie planning van je docent

**Inleveren via**: Submit je project in GitHub

---

*Dit project vormt de basis voor Blok 3B (Projectweek 2), waar je verder bouwt op de overzichts- en detailpagina met extra functionaliteit (filtering, zoeken, sorteren of statistieken).*
