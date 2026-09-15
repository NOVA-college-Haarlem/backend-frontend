# Eindproject Blok 3A - Backend op je eigen site (Projectweek 1)

## 📋 Projectomschrijving

Je bouwt geen los oefenproject, maar geeft **je eigen FEO/JSO-eindproject** (de RetroPixel- of Boulder Base-variant, of je eigen thema, die je in Frontend Development hebt gemaakt) een echte backend. De kaarten/items die je tot nu toe hardgecodeerd in HTML had staan, komen voortaan uit een database die je zelf ontwerpt. Dit project vormt de basis voor het vervolgproject in Blok 3B (Projectweek 2).

**Waarom op je eigen site?** Je hebt deze site al gestyled, gestructureerd en (in JSO) interactief gemaakt. Nu voeg je er de laatste laag aan toe: écht dynamische data. Aan het eind van het blok heb je één site die je zelf helemaal hebt opgebouwd - front, interactie én data.

## ✅ Startpunt

- Je RetroPixel- of Boulder Base-variant (of eigen thema) uit FEO Hoofdstuk 3/6, het liefst al bijgewerkt t/m FEO Hoofdstuk 7 (site-opmaak)
- Je site bevat een overzicht met meerdere "items" (games, klimroutes, of wat je eigen thema ook is) - dat overzicht ga je dynamisch maken

## 🛠️ Wat je moet bouwen

### 0. Project geschikt maken voor PHP (Verplicht)

Je FEO/JSO-project heeft nog geen PHP/database-omgeving. Voeg die toe:

1. Kopieer de `docker-compose.yml`-template van je docent naar de root van je eigen projectmap
2. Start de omgeving: `docker compose up -d`
3. Zet `index.html` om naar `index.php` (net als in Hoofdstuk 1)
4. Open je browser op `http://localhost` - je bestaande site moet nog steeds werken

### 1. Overzichtspagina (Verplicht)

Je bestaande kaartenoverzicht (bijv. de game-cards van je RetroPixel-variant) moet nu **vanuit een database** komen in plaats van hardgecodeerde HTML.

**Vereisten:**
- Bedenk zelf een tabel die past bij jouw content (bijv. `games` met kolommen als `naam`, `categorie`, `prijs`, `beschrijving`, `afbeelding` - gebruik de attributen die je site al toont)
- Database connectie via `database.php`
- SELECT query om alle data op te halen
- Foreach loop om de items te tonen - de HTML/CSS-structuur (de "kaart") blijft hetzelfde als wat je al had, alleen de inhoud komt nu uit `$item['...']` in plaats van vast te staan

### 2. Dynamisch menu (Verplicht)

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

## 📁 Bestandsstructuur

```
jouw-project/
├── index.php              # Overzichtspagina met database data
├── database.php           # Database connectie
├── menu.php               # Dynamisch menu (include in elke pagina)
├── style.css               # Je bestaande styling - blijft grotendeels ongewijzigd
└── sql/
    └── [eigen-tabel].sql  # Zelf gemaakt, gebaseerd op je site-inhoud
```

## 🎓 Technieken uit Hoofdstuk 1 t/m 3

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

### Code Kwaliteit
- ✅ DRY-principe (Don't Repeat Yourself)
- ✅ Modulaire code (aparte bestanden)
- ✅ Duidelijke variabele namen

## 📊 Beoordelingscriteria

| Criterium | Punten | Omschrijving |
|-----------|--------|--------------|
| **Overzichtspagina** | 40% | Eigen content-items correct vanuit database getoond |
| **Dynamisch Menu** | 25% | Menu met array en foreach, werkt op alle pagina's |
| **Database** | 20% | Correcte connectie en SELECT query |
| **Code Kwaliteit** | 10% | DRY-principe, menu.php, duidelijke code |
| **Behoud van je eigen design** | 5% | Site ziet er nog steeds uit als jouw ontwerp, alleen nu dynamisch |

**Totaal: 100%**

## 🚀 Stappenplan (Projectweek 1)

**Dag 1**
1. 📝 Docker-compose toevoegen aan je eigen projectmap, `docker compose up -d`
2. 📝 `index.html` omzetten naar `index.php`, controleer dat je site nog werkt
3. 📝 Ontwerp je eigen databasetabel op basis van je site-inhoud
4. 📝 Importeer de tabel in PHPMyAdmin

**Dag 2**
5. 📝 Maak `database.php` met de database connectie, test de connectie
6. 📝 Maak `menu.php` met associatieve array en foreach, include in je pagina's

**Dag 3**
7. 📝 Vervang de hardgecodeerde kaarten in `index.php` door een SELECT-query + foreach-loop
8. 📝 Controleer dat de site er nog precies zo uitziet als voorheen - nu met echte data
9. 📝 Code opschonen, final check met de checklist

## ✅ Checklist voor Inleveren

**Functionaliteit:**
- [ ] Overzichtspagina toont je eigen content-items uit de database
- [ ] Dynamisch menu werkt op alle pagina's
- [ ] Database connectie werkt
- [ ] Geen PHP errors

**Code Kwaliteit:**
- [ ] Menu in apart bestand `menu.php`
- [ ] Database connectie in `database.php`
- [ ] Associatieve array voor menu-items
- [ ] Foreach loop voor menu en overzicht
- [ ] Duidelijke variabele namen

**Behoud van je eigen design:**
- [ ] Site ziet er nog hetzelfde uit als je FEO-eindproduct - alleen data komt nu uit de database

**Git:**
- [ ] Reguliere commits met duidelijke messages
- [ ] Code gepusht naar GitHub

## 💡 Tips

1. **Je hoeft de styling niet opnieuw te doen** - die heb je al. Focus op het vervangen van hardgecodeerde HTML door PHP + database-data die er hetzelfde uitziet
2. **Start met het menu**: volg de stappen uit Hoofdstuk 1, Opdracht 7 en 8
3. **Database eerst**: bepaal welke kolommen jouw content nodig heeft, vóór je gaat programmeren
4. **Kopieer de structuur**: gebruik het Pokémon- of Formula 1-voorbeeld uit de les als referentie voor de PHP-code, niet voor de content
5. **Test stap voor stap**: test na elke wijziging of alles nog werkt
6. **var_dump()**: gebruik dit om te zien wat je query teruggeeft

## 📚 Referenties

- **Hoofdstuk 1**: PHP basics, menu.php, dynamisch menu met array
- **Hoofdstuk 2**: database.php, SELECT query, foreach met database data
- **Hoofdstuk 3**: navbar.php, tabel met database
- **Je eigen FEO Hoofdstuk 3/6/7-bestanden**: de HTML/CSS die je nu van data gaat voorzien

## 📅 Deadline

**Inleverdatum**: Zie planning van je docent

**Inleveren via**: Submit je project in GitHub

---

*Dit project vormt de basis voor Blok 3B (Projectweek 2), waar je de detailpagina en extra functionaliteit toevoegt.*
