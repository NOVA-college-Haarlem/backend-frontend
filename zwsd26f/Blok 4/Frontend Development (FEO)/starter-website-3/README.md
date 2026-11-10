# De Smaakmakers - startsite Blok 4

Startsite voor Frontend Development (FEO), JavaScript (JSO) en Backend Development (BEO) in Blok 4: een kookstudio met een workshop-overzicht en een inschrijfformulier.

## Starten

Deze site draait op een webserver met een database, net als je PHP-projecten uit Blok 3.

1. Open deze map in VS Code
2. Open een terminal en typ: `docker compose up -d` (de eerste keer duurt dit even)
3. Website: http://localhost
4. phpMyAdmin: http://localhost:8000 (gebruiker `root`, wachtwoord `password`, database `smaakmakers`)

Stoppen: `docker compose down`

## Wat zit erin?

| Bestand | Wat |
|---|---|
| `index.html` | Workshops (cards) + inschrijfformulier |
| `css/style.css` | Opmaak met CSS-variabelen en flexbox |
| `js/script.js` | Klik-interactie en prijs bijwerken |
| `data/workshops.json` | Alle workshopgegevens als data (gebruik je vanaf JS Hoofdstuk 3) |
| `verwerk.php` | Ontvangt het formulier en toont een bevestiging |
| `sql/` | Database-tabellen voor Backend (BEO Hoofdstuk 1, 3 en 6) |
| `docker-compose.yml`, `Dockerfile` | De omgeving: PHP, MariaDB en phpMyAdmin |

De site werkt, maar is **bewust niet perfect**. Je gaat de gebreken dit blok zelf vinden en oplossen.
