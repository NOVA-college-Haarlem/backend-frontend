# Lesprogramma Web Development

Lesmateriaal voor de opleiding Software Development (MBO niveau 4) van NOVA College Haarlem: frontend (HTML, CSS, JavaScript) en backend (PHP, MySQL, Laravel). Het materiaal staat per klas, per blok en per hoofdstuk.

## Snel naar

| Wil je... | Ga naar |
|---|---|
| De lessen van je eigen klas | `zwsd<jaar><klas>/Blok <n>/` (zie hieronder) |
| Het overzicht van een blok | `blok<n>-samenvatting.md` of `README.md` in de blokmap |
| Weten wat er in een jaar aan bod komt | `Curriculum Web Development/` |

## Indeling per klas

Een klascode bestaat uit vier delen:

| Deel | Betekenis |
|---|---|
| `zw` | Locatie **Zijlweg** |
| `sd` | **Software Developer** |
| `26` | Jaar van instroom |
| `a`, `b`, `ab` | Klas A, klas B, of beide klassen samen |
| `f` | Instroom in **februari** |

Voorbeelden: `zwsd25ab` is klas A en B van 2025, `zwsd26f` is de februari-instroom van 2026.

| Map | Inhoud |
|---|---|
| `zwsd26f/` | Blok 1-4: FEO, JavaScript en BEO op één doorlopend project per blok |
| `zwsd26ab/` | Blok 1-4, inclusief de PRIMM-pilot voor backend |
| `zwsd25f/` | Blok 3-7 |
| `zwsd25ab/` | Blok 3-10: PHP, PDO, beveiliging, Laravel |
| `zwsd24ab/` | Blok 5-8: Laravel, API's, Scrum, testen en deployen |
| `zwsd23a/` | Blok 10, projectweken en projectarchief |
| `Curriculum Web Development/` | Curriculumoverzichten per jaar en klas, analyse en vernieuwingsvoorstel |
| `Specialisatie.md` | Werkprocessen specialisatie: softwarepakket- en technisch onderzoek, user stories, marktonderzoek |
| `Moodle.md` | Weekoverzicht backend Blok 4 voor Moodle |
| `_archief/` | Oud materiaal dat niet meer gebruikt wordt |

## Opbouw van een blok

Een blok duurt ongeveer 9 lesweken. Per vak staan de hoofdstukken als losse bestanden:

```
zwsd26f/Blok 4/
├── Frontend Development (FEO)/
│   ├── blok4-samenvatting.md          ← overzicht, planning, leerdoelen
│   ├── HTML&CSS/Hoofdstuk 1 - ....md
│   ├── JavaScript (JSO)/Hoofdstuk 1 - ....md
│   └── starter-website-3/             ← startcode voor alle vakken van dit blok
└── Backend Development (BEO)/
    ├── blok4-samenvatting.md
    └── Hoofdstuk 1 - ....md
```

Begin altijd bij de **samenvatting** van het blok. Daar staat welke week bij welk hoofdstuk hoort en hoe de vakken op elkaar aansluiten.

### Werkwijze (zwsd26f en zwsd26ab)

De nieuwere blokken zijn gebouwd volgens **PRIMM** (Predict, Run, Investigate, Modify, Make):

- **Predict / Run / Investigate:** je leest en voorspelt bestaande code en test die. Hier gebruik je **geen AI**.
- **Modify:** je past de code aan. AI mag, als je kunt uitleggen wat je gebruikt.
- **Make:** je bouwt iets eigens (je eigen variant), vaak met een opdracht **"Debug deze AI-output"**.

Bovenaan elk hoofdstuk staat wat er van AI-gebruik verwacht wordt. In het eindgesprek moet je je code kunnen uitleggen.

## Startcode draaien

Blokken met een backend gebruiken Docker (PHP + Apache, MariaDB en phpMyAdmin). In de map van de startcode:

```bash
docker compose up -d
```

- Website: http://localhost
- phpMyAdmin: http://localhost:8000 (gebruiker `root`, wachtwoord `password`)

Draai je twee sites tegelijk (bijvoorbeeld de startcode en je eigen variant), geef de tweede dan andere poorten in `docker-compose.yml`, bijvoorbeeld `8080:80` en `8001:80`. De `README.md` in elke startmap beschrijft de details.

## Voor docenten

Docentenhandleidingen, uitwerkingen en antwoordmodellen staan **niet** in deze repo, maar in een aparte, privé docentenrepo met dezelfde mappenstructuur. Mappen met de naam `Docent/` of `solutions/` worden hier genegeerd (`.gitignore`), zodat ze niet per ongeluk worden gecommit.
