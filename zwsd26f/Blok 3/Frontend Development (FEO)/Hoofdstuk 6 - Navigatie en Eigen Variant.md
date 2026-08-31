## Hoofdstuk 6: Navigatie en Eigen Variant

*Docentenhandleiding: `Docent/Hoofdstuk 6 - Docentenhandleiding.md`*

**Taakklasse 2 van 3** - Boulder Base (afronding)
**PRIMM-fasen dit hoofdstuk:** Modify (navigatie) → **Make** (eigen variant)

### Leerdoelen
Na dit hoofdstuk kan je:
- Een horizontale navigatie stylen met hover- en actief-state
- Een eigen, getransformeerde variant van Boulder Base maken en de keuzes daarin verantwoorden
- Een stuk AI-gegenereerde CSS controleren op fouten

### AI-gebruik dit hoofdstuk
Modify (navigatie): AI mag, met verantwoording. **Make: AI mag vrij**, mits je aan het eind willekeurig aangewezen regels kan uitleggen.

### Modify: navigatie stylen
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
**Oefening:** voeg een `.actief` class toe aan de navigatielink van de sectie waar de bezoeker zich "bevindt" (handmatig, geen JavaScript).

### Make: eigen variant
Net als bij RetroPixel in Hoofdstuk 3: maak een **eigen versie** van Boulder Base. Zelfde technieken (selectoren, buttons met states, CSS-variabelen, typografische hiërarchie, navigatie), maar een ander thema.

**Opdracht:**
1. Kies een eigen thema dat qua opzet op Boulder Base lijkt (drie "producten/diensten" + drie "abonnementen/pakketten" is een prettige structuur om te hergebruiken) - bijvoorbeeld een dansschool, een tattoo-studio, een foodtruck-festival
2. Herschrijf content en pas het kleurenschema aan via de CSS-variabelen
3. Zorg dat alle knoppen consistente classes gebruiken met hover/focus
4. Zorg voor een kloppende typografische hiërarchie

### Debug deze AI-output
Je krijgt een stukje AI-gegenereerde CSS met een bewuste fout erin. Vind de fout en leg uit waarom het misgaat.

### Huiswerk
Maak de eigen variant van Boulder Base af:
1. Eigen thema volledig doorgevoerd
2. CSS-variabelen voor kleuren consequent gebruikt
3. Knoppen met hover/focus, geen duplicatie
4. Navigatie met hover- en actief-state
5. Wees voorbereid op een verantwoordingsvraag volgende les

---
