# GitHub Copilot Instructions

## Algemene richtlijnen

- Geef altijd kort en bondig antwoord. Hou de toelichting op je antwoorden beknopt.

## Over dit project

Dit repository bevat lesmateriaal voor **NOVA College Haarlem**, MBO-niveau 4, met name voor de opleiding Software Development (SD). Het lesmateriaal in **blok 1 en 2** is ook bedoeld voor studenten System Engineering (SE). Zijn gaan na blok 2 **niet** verder met web development en hebben alleen een korte introductie nodig.

Let op: lesmateriaal in de mappen "blok 1" tot en met "blok 4" zijn bedoeld voor eerstejaars studenten. Lessen in de mappen "blok 5" tot en met "blok 8" zijn gericht op tweedejaars studenten. De eerstejaars studenten beginnen zonder programmeerervaring.

## Structuur

```
zwsd<klas>/
└── blok <nummer>/
    └── Hoofdstuk <nummer> - <onderwerp>.md   ← lesplannen voor docenten
```

Klascodering: `zwsd` = ZWSD, gevolgd door jaarcohort en parallelklas (bijv. `zwsd26ab` = cohort 2026, klas A en B).

## Inhoud per traject

### Frontend Development (Blok 1–2)

- HTML, CSS, semantische structuur, box model, classes/IDs
- Geen JavaScript in blok 1
- Gebruik **geen** inline styles; altijd externe stylesheet
- Classnames en ID-namen altijd in het **Engels**

### Backend Development (Blok 3–10)

- PHP. In blok 3 en 4 gebruiken we `mysqli_*` functies. Pas in blok 5 worden PDO en prepared statements geintroduceerd. In de blokken 3 en 4 dus GEEN PDO voorstellen. In blok 6 beginnen we met Laravel.
- MySQL als database.
- Docker voor lokale ontwikkelomgeving (`docker compose up -d`)

## Coderichtlijnen

### HTML

- Altijd semantische elementen: `<header>`, `<main>`, `<footer>`, `<section>`, `<article>`, `<nav>`
- Gebruik `<ul>/<li>` voor lijsten, ook in navigatie
- Altijd `alt`-attribuut bij `<img>`
- Gebruik `<label>` bij formuliervelden

### CSS

- Classnames in het Engels, kebab-case (`main-title`, `card`, `btn`)
- Geen inline styles
- Altijd externe stylesheet via `<link rel="stylesheet">`

## Doelgroep

- MBO-4, eerstejaars en tweedejaars, mix van SD- en SE-studenten
- Basisniveau: geen voorkennis verondersteld in blok 1
- Schrijf uitleg **eenvoudig en in het Nederlands**, geen lange zinnen, hou de uitleg kort en bondig
- Geef concrete, werkende codevoorbeelden — geen abstracte patronen
- Vermijd geavanceerde concepten tenzij expliciet gevraagd (geen OOP, geen namespaces, geen Composer in blok 3–5)

## Bestandsformaat lesmateriaal

Lesplannen zijn Markdown-bestanden voor docenten en studenten. Ze bevatten:

- Leerdoelen
- Lesopbouw (zonder tijdsaanduidingen)
- Codevoorbeelden
- Opdrachten voor studenten
- Controlelijst en tips voor de docent

Schrijf lesmateriaal altijd in het **Nederlands**.
