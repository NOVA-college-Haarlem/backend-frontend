# 🎯 Praktijkopdrachten Week 3: Game Server Status-pagina


## Deel 1: Dashboard Basis, Kleuren & Typografie


### Doel

Zet de basis van je Game Server Status-pagina op met een duidelijk kleurenpalet, goede leesbaarheid en technische server-info in monospace.

### Stappen

1. Maak een nieuw projectmapje aan (bijv. server-status) met index.html en style.css.
2. Neem de startcode hieronder over en kies je eigen kleuren in :root (check het contrast van je tekst op WebAIM Contrast Checker).
3. Pas de tekst aan naar jouw favoriete online game of eigen server (bijv. Valorant EU-West, Minecraft Survival, FiveM RP).
4. Check: Staat de paginatitel (`<h1>`) strak in een sans-serif font en staan het IP-adres, poortnummer en ping netjes in een monospace blok?

#### Startcode Deel 1 (index.html)

```html
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Server Status Dashboard</title>
</head>
<body>

    <header>
        <h1>Game Network Status</h1>
        <p>Live overzicht van onze EU-servers en diensten.</p>
    </header>

    <main class="container">

        <details class="report-outage">
            <summary>Meld hier een storing</summary>

            <!-- 
                MAAK HIER HET FORMULIER 
            -->
                
        </details>

        <article class="server-card">
            <h2>EU-West Matchmaking</h2>
            <p class="tech-info">IP: 185.40.64.12:27015 | Ping: 14ms</p>
            <p>Alle matchmaking-servers draaien stabiel zonder wachtrijen.</p>
            <span class="badge online">● Online</span>
        </article>

    </main>

</body>
</html>
```

#### Startcode Deel 1 (style.css)

```css
:root {
    --bg-color: #12161f;
    --card-bg: #1e2433;
    --text-color: #f1f5f9;
    --status-online: #22c55e;
    --status-maintenance: #f59e0b;
    --status-offline: #ef4444;
}

body {
    background-color: var(--bg-color);
    color: var(--text-color);
    font-family: Arial, Helvetica, sans-serif;
    font-size: 16px;
    line-height: 1.6;
    margin: 0;
    padding: 20px;
}

header {
    text-align: center;
    margin-bottom: 30px;
}

h1 {
    font-size: 32px;
    margin-bottom: 5px;
}

.container {
    max-width: 800px;
    margin: 0 auto;
}

.server-card {
    background-color: var(--card-bg);
    border: 1px solid #2e374d;
    border-radius: 10px;
    padding: 20px;
    margin-bottom: 20px;
}

.tech-info {
    font-family: 'Courier New', monospace;
    background-color: #0d1017;
    padding: 6px 10px;
    border-radius: 5px;
    font-size: 14px;
}

.badge {
    display: inline-block;
    padding: 5px 12px;
    border-radius: 20px;
    font-weight: bold;
    font-size: 14px;
}

.online {
    background-color: var(--status-online);
    color: #052e16;
}

.report-outage {
    background-color: #1a1519;                 /* donkere, licht rode tint i.p.v. --card-bg */
    background-image: linear-gradient(
        180deg,
        rgba(239, 68, 68, 0.08),
        transparent 120px
    );
    border: 1px dashed var(--status-offline);  /* gestippeld = duidelijk anders dan de solide card-rand */
    border-left: 4px solid var(--status-offline); /* accentstreep links */
    border-radius: 4px 10px 10px 4px;          /* subtiel andere vorm */
    padding: 24px;
    margin-top: 40px;                          /* visuele scheiding van de serverlijst */
    margin-bottom: 20px;
}

.report-outage h2 {
    margin-top: 0;
    color: var(--status-offline);
    font-size: 22px;
}

.report-outage label {
    display: block;
    margin-bottom: 6px;
    font-size: 14px;
    font-weight: bold;
}

.report-outage input,
.report-outage select,
.report-outage textarea {
    width: 100%;
    box-sizing: border-box;
    background-color: #0d1017;                 /* zelfde donkere tint als .tech-info */
    color: var(--text-color);
    border: 1px solid #2e374d;
    border-radius: 5px;
    padding: 10px 12px;
    margin-bottom: 16px;
    font-family: inherit;
    font-size: 16px;
}

.report-outage input:focus,
.report-outage select:focus,
.report-outage textarea:focus {
    outline: none;
    border-color: var(--status-offline);
    box-shadow: 0 0 0 3px rgba(239, 68, 68, 0.25);
}

.report-outage button {
    background-color: var(--status-offline);
    color: #fff;
    border: none;
    border-radius: 5px;
    padding: 10px 20px;
    font-weight: bold;
    font-size: 16px;
    cursor: pointer;
}

.report-outage button:hover {
    filter: brightness(1.1);
}
```

## Deel 2: Extra Statuskaarten & Afbeeldingen Stylen (na uitleg 3)


### Doel

Breid je dashboard uit naar een compleet overzicht met verschillende serverstatussen en strak gestylede afbeeldingen.

### Stappen

1. Voeg 2 extra `<article class="server-card">` kaarten toe in index.html:
	• Kaart 2: Een dienst met status Maintenance (bijv. Voice Chat of Database), inclusief eigen IP/poort in monospace.
	• Kaart 3: Een dienst met status Offline (bijv. Login Server of EU-North Node).
2. Maak de CSS-classes .maintenance en .offline aan en gebruik de statuskleuren uit :root (let op dat de tekst op de gele/oranje badge goed leesbaar blijft!).
3. Voeg aan elke kaart een afbeelding toe (bijv. een afbeelding van de game-map, een serverrack of een netwerkicoon) met `<img src="..." alt="..." class="card-img">` bovenaan in de kaart.
4. Style .card-img in CSS met:
	• max-width: 100% (of width: 100%)
	• border-radius: 8px
	• box-shadow voor diepte
	• Een :hover-effect met transform: scale(1.03) en een soepele transition: transform 0.3s
