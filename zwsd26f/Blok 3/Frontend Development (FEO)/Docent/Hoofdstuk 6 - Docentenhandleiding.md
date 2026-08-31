## Hoofdstuk 6: Navigatie en Eigen Variant - Docentenhandleiding

*Bij: `../Hoofdstuk 6 - Navigatie en Eigen Variant.md` (studentversie)*

**Taakklasse 2 van 3** - Boulder Base (afronding)
**PRIMM-fasen dit hoofdstuk:** Modify (navigatie) → **Make** (eigen variant)

### Leerdoelen
Na deze les kan de student:
- Een horizontale navigatie stylen met hover- en actief-state
- Een eigen, getransformeerde variant van Boulder Base maken en de keuzes daarin verantwoorden
- Een stuk AI-gegenereerde CSS controleren op fouten

### AI-gebruik dit hoofdstuk
Modify (navigatie) **AI mag, met verantwoording**. Make: **AI mag vrij gebruikt worden**, mits elke student aan het eind willekeurig aangewezen regels kan uitleggen.

### Lesopbouw (90 minuten)

**Terugblik (5 min)**
Check: staan alle kleuren nu in variabelen? Klopt de typografische hiërarchie?

**Modify: navigatie stylen (25 min)**

De `<nav>` in Boulder Base werkt, maar heeft geen hover- of actief-state:
```css
nav a {
    color: white;
    text-decoration: none;
    padding: 8px 12px;
    border-radius: 4px;
    transition: background-color 0.3s ease;
}
nav a:hover,
nav a.actief {
    background-color: var(--primary);
}
```
**Oefening:** voeg een `.actief` class toe aan de navigatielink van de sectie waar de bezoeker zich "bevindt" (handmatig voor nu, geen JavaScript).

**Make: eigen variant (55 min) - AI mag, verantwoording verplicht**

Net als bij RetroPixel in Hoofdstuk 3: maak een **eigen versie** van Boulder Base. Zelfde technieken (selectoren, buttons met states, CSS-variabelen, typografische hiërarchie, navigatie), maar een ander thema.

**Opdracht:**
1. Kies een eigen thema dat qua opzet op Boulder Base lijkt (drie "producten/diensten" + drie "abonnementen/pakketten" is een prettige structuur om te hergebruiken) - bijvoorbeeld een dansschool, een tattoo-studio, een foodtruck-festival
2. Herschrijf content en pas het kleurenschema aan via de CSS-variabelen
3. Zorg dat alle knoppen consistente classes gebruiken met hover/focus
4. Zorg voor een kloppende typografische hiërarchie

**"Debug deze AI-output" (laatste 15 min, of als start van huiswerk):**
Geef een stukje AI-gegenereerde CSS met een bewuste fout - bijvoorbeeld een `var(--kleur)` die niet overeenkomt met de naam in `:root`, of een `:hover`-selector die per ongeluk op de verkeerde class staat. Wie vindt de fout, en waarom gaat het mis?

### Huiswerk
Maak de eigen variant van Boulder Base af:
1. Eigen thema volledig doorgevoerd
2. CSS-variabelen voor kleuren consequent gebruikt
3. Knoppen met hover/focus, geen duplicatie
4. Navigatie met hover- en actief-state
5. Wees voorbereid op een verantwoordingsvraag volgende les

### Tips voor docent
- Dit is het tweede Make-moment in het blok - vergelijk kort met de eerste (RetroPixel-variant): is de eigenaarschap dit keer zichtbaar sterker, nu de student meer technieken beheerst?
- Bewaar tijd voor minstens een paar korte verantwoordingsvragen aan het eind - ook als niet elke student aan de beurt komt, weet de klas dat het kan gebeuren
- Sommige studenten kopiëren bijna 1-op-1 - stuur bij: minimaal kleuren, content én één structuurkeuze moeten anders zijn

### Veelgemaakte fouten
1. `.actief`-class toevoegen in CSS maar vergeten in de HTML te zetten
2. Bij de eigen variant: kleuren direct hardcoden in plaats van de bestaande variabelen aan te passen
3. Nieuwe knoppen toevoegen zonder de bestaande `.knop`-classes te hergebruiken (duplicatie sluipt terug)

---
