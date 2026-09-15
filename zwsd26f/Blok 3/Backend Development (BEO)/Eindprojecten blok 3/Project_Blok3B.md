# Eindproject Blok 3B - Detailpagina & Extra functionaliteit (Projectweek 2)

## 📋 Projectomschrijving

Je breidt de backend die je in Blok 3A (Projectweek 1) op je eigen FEO/JSO-eindproject hebt gebouwd verder uit: een detailpagina en extra functionaliteit. Dezelfde site als in Blok 3A - nu een stap verder.

## ✅ Wat je al hebt

- Een overzichtspagina die je eigen content-items uit de database toont
- Database connectie (`database.php`)
- Dynamisch menu (`menu.php`)
- Docker-omgeving en geïmporteerde database

## 🛠️ Wat je moet bouwen

### 1. Detailpagina (Verplicht)

Maak een detailpagina die **één specifiek item** uit jouw content toont (bijv. één game, één klimroute).

**Vereisten:**
- Gebruik GET-parameters in de URL (bijvoorbeeld: `detail.php?id=5`)
- Haal data op met een SELECT WHERE-query
- Toon alle relevante informatie van dat item
- Style de pagina in dezelfde stijl als de rest van je site

### 2. Navigatie (Verplicht)
- Link van overzichtspagina naar detailpagina (klik op een kaart → detailpagina)
- "Terug naar overzicht"-knop op de detailpagina
- Menu dat werkt op alle pagina's

### 3. Extra functionaliteit (kies 2 van de 4)

Kies wat het beste past bij jouw eigen content:

#### A: Filtering
- Filter items op een eigenschap die relevant is voor jouw thema (bijv. categorie, genre, moeilijkheidsgraad, prijsklasse)
- Gebruik GET-parameters, zoals je in Hoofdstuk 5 hebt geoefend

#### B: Zoekfunctionaliteit
- Zoekbalk waarmee je items kunt zoeken
- Gebruik SQL LIKE-query voor zoeken
- Toon resultaten dynamisch

#### C: Sortering
- Sorteer items op prijs, naam, of een ander relevant veld
- Knoppen voor oplopend/aflopend sorteren
- Gebruik ORDER BY in SQL-queries

#### D: Statistiekenpagina
- Bereken en toon interessante statistieken over jouw eigen content
- Bijvoorbeeld: totaal aantal items, gemiddelde prijs, aantal per categorie

## 📁 Bestandsstructuur

```
jouw-project/
├── index.php               # Overzichtspagina (al gemaakt in Blok 3A)
├── detail.php               # Detailpagina (nieuw)
├── database.php             # Database connectie (al gemaakt)
├── menu.php                 # Navigatie (al gemaakt)
├── style.css                 # Je bestaande styling
└── sql/
    └── [eigen-tabel].sql   # Database (al geïmporteerd)
```

## 🎓 Technieken uit Hoofdstuk 1 t/m 6

Je **moet** de volgende technieken gebruiken:

### PHP Basics
- ✅ PHP tags (`<?php ?>`)
- ✅ Variables en echo
- ✅ Include/require voor menu en database

### Arrays & Loops
- ✅ Associatieve arrays
- ✅ Foreach loops
- ✅ Array data uit database

### Database
- ✅ MySQLi connectie (`database.php`)
- ✅ SELECT queries
- ✅ WHERE clauses voor filtering
- ✅ Fetch associative arrays

### Dynamic Content
- ✅ Data uit database tonen
- ✅ GET-parameters gebruiken
- ✅ Dynamic HTML genereren

### Code Kwaliteit
- ✅ DRY-principe (Don't Repeat Yourself)
- ✅ Modulaire code (aparte bestanden)
- ✅ Duidelijke variabele namen

## 📊 Beoordelingscriteria

| Criterium | Punten | Omschrijving |
|-----------|--------|--------------|
| **Detailpagina** | 30% | Werkende detailpagina met alle data van jouw item |
| **Database Queries** | 20% | Correcte SQL-queries met WHERE |
| **Extra Functionaliteit** | 25% | 2 van de 4 opties werkend |
| **Code Kwaliteit** | 15% | Nette code, DRY-principe, comments |
| **Behoud van je eigen design** | 10% | Consistent met je bestaande site-stijl |

**Totaal: 100%**

## 🚀 Stappenplan (Projectweek 2)

**Dag 1**
1. ✅ Controleer dat je overzichtspagina uit Blok 3A nog werkt
2. 📝 Maak `detail.php` aan
3. 📝 Bouw de detailpagina met GET-parameter
4. 📝 Test met verschillende id's

**Dag 2**
5. 📝 Link overzichtspagina naar detailpagina
6. 📝 Kies 2 extra functionaliteiten die passen bij jouw content
7. 📝 Implementeer filtering of zoeken
8. 📝 Implementeer sortering of statistieken

**Dag 3**
9. 📝 Style de nieuwe pagina's in dezelfde stijl als de rest van je site
10. 📝 Test alle functionaliteit
11. 📝 Code opschonen en comments toevoegen
12. 📝 Final check met de checklist

## ✅ Checklist voor Inleveren

**Functionaliteit:**
- [ ] Detailpagina werkt met verschillende id's
- [ ] Navigatie werkt tussen overzicht en detail
- [ ] Minimaal 2 extra features werkend
- [ ] Alle database queries werken correct
- [ ] Geen PHP errors

**Code Kwaliteit:**
- [ ] DRY-principe toegepast (menu in apart bestand)
- [ ] Database connectie in `database.php`
- [ ] Duidelijke variabele namen
- [ ] Comments bij complexe code
- [ ] Nette indentatie

**Behoud van je eigen design:**
- [ ] Detailpagina en extra features zien er consistent uit met de rest van je site
- [ ] Responsive design (werkt op mobile, zoals de rest van je site)

**Git:**
- [ ] Reguliere commits met duidelijke messages
- [ ] Code gepusht naar GitHub

## 💡 Tips

1. **Start simpel**: maak eerst de detailpagina werkend voordat je extra features toevoegt
2. **Test vaak**: test na elke kleine wijziging of alles nog werkt
3. **Gebruik PHPMyAdmin**: kijk in PHPMyAdmin welke kolommen je database heeft
4. **Console debugging**: gebruik `var_dump()` om te zien wat je queries teruggeven
5. **Vraag hulp**: als je vastloopt, vraag dan hulp aan medestudenten of docent

## 📚 Handige Resources

- **PHPMyAdmin**: zie je docker-compose.yml voor de juiste poort - bekijk je database structuur
- **PHP Manual**: https://www.php.net/manual/en/
- **W3Schools PHP**: https://www.w3schools.com/php/
- **Blok 3 Opdrachten**: kijk terug naar Hoofdstuk 1-6 voor voorbeelden

## 📅 Deadline

**Inleverdatum**: Zie planning van je docent

**Inleveren via**: Submit je project in GitHub
