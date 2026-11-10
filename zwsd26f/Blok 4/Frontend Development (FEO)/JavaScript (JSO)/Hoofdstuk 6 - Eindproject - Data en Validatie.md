## Hoofdstuk 6: Eindproject - Data en Validatie

**Taakklasse 3 van 3** - volledige **Make**, op je eigen variant
**PRIMM-fase dit hoofdstuk:** Make + verantwoordingsgesprek

### Projectomschrijving
Afsluitend hoofdstuk van het JS-vak. Je maakt van je eigen variant (uit Frontend Development) een **data-gedreven** site: de inhoud staat in een JSON-bestand, JavaScript bouwt de pagina, bezoekers kunnen filteren of zoeken, en een formulier wordt zowel in de browser als op de server gecontroleerd.

Je werkt in `mijn-variant`, met het onderwerp dat je bij FEO Hoofdstuk 2 hebt gekozen. Je eigen JSON-bestand uit Hoofdstuk 4 is je startpunt. Voor de server-side validatie gebruik je je `verwerk.php` uit Hoofdstuk 5 (in `starter-website-3`) als voorbeeld.

### Leerdoelen
Na dit hoofdstuk kan je:
- Zelfstandig een pagina opbouwen vanuit data in een JSON-bestand
- Meerdere technieken uit dit blok combineren (functies met `return`, elementen maken, objecten, `fetch`, `filter`/`find`, validatie)
- Uitleggen waarom server-side validatie altijd nodig is, en het laten zien
- Een willekeurige regel in je eigen code uitleggen: wat doet die, en waarom staat die er?
- Een stuk (AI-)code controleren op fouten en verbeteren

### Projecteisen (Voldoende)
- [ ] Minimaal 6 items in een eigen JSON-bestand, met minstens 4 eigenschappen per item
- [ ] De items worden geladen met `fetch` en op de pagina gezet met een eigen functie (zoals `maakCard`) die HTML **teruggeeft**
- [ ] Er staan geen items handgetypt in de HTML
- [ ] Minimaal 1 filter- of zoekfunctie met `filter()`
- [ ] Een formulier met client-side validatie: eigen foutmeldingen per veld
- [ ] Server-side validatie in PHP voor dezelfde velden
- [ ] Minstens één controle die **alleen** de server doet (bijv. bestaat het item, is het beschikbaar, prijs opzoeken)
- [ ] Geen gedupliceerde, bijna-identieke code
- [ ] Geen foutmeldingen in de console

### Bonus (Goed/Uitstekend)
- [ ] Filteren en zoeken werken samen
- [ ] Sorteren (bijv. op prijs of datum)
- [ ] Live feedback bij meerdere formuliervelden
- [ ] Een melding als het JSON-bestand niet geladen kan worden

### Programma

**Les 1: Bouwen** - data, renderen, filteren (AI mag, mits verantwoordbaar)

**Les 2: Bouwen + Peer review + Debug deze AI-output**
- Formulier en validatie afmaken
- Peer review in tweetallen met de checklist hieronder: **kraak elkaars formulier** (poging A-D uit Hoofdstuk 5)
- **Debug deze AI-output:** een lap AI-gegenereerde code met 3 ingebouwde fouten

**Les 3: Verantwoordingsgesprek**
Kort gesprek per student (5-7 min):
1. **Demo:** laat je site zien, filter iets, verstuur het formulier fout en goed
2. **Kraakvraag:** de docent zet JavaScript uit en verstuurt je formulier leeg. Wat gebeurt er, en waarom?
3. **Verantwoordingsvraag:** een willekeurige regel wordt aangewezen: "wat doet dit, wat gebeurt er als je het weghaalt?"

### Peer Review Checklist
- [ ] Geen foutmeldingen in de console
- [ ] Een item toevoegen aan de JSON zet het op de pagina, zonder de HTML aan te passen
- [ ] Filteren of zoeken werkt, ook bij "geen resultaten"
- [ ] Een leeg formulier geeft nette meldingen per veld
- [ ] Met JavaScript **uit** wordt een leeg formulier door de server tegengehouden
- [ ] Een aangepaste waarde in DevTools (prijs, id) wordt door de server tegengehouden
- [ ] Kan je klasgenoot een willekeurige regel uitleggen?

### Beoordelingscriteria

| Criterium | Onvoldoende | Voldoende | Goed |
|---|---|---|---|
| **Data & renderen** | Items staan in de HTML | Items uit JSON via `fetch`, gerenderd met eigen functie | Nette functies, alles uit één databron (ook formulier) |
| **Filteren/zoeken** | Werkt niet of ontbreekt | Werkende `filter`, inclusief "geen resultaten" | Filteren en zoeken gecombineerd, of sorteren |
| **Validatie** | Alleen client-side, of alleen browsermeldingen | Client-side met eigen meldingen + server-side voor dezelfde velden | Plus controles die alleen de server kan doen, en live feedback |
| **Codekwaliteit** | Gedupliceerde code, onduidelijke namen | Geen duplicatie, logische namen, geen consolefouten | Kleine functies met één taak, goed leesbaar |
| **Verantwoording** | Kan het verschil client/server niet uitleggen | Legt de meeste code en het verschil client/server uit | Legt keuzes overtuigend uit, ook bij AI-gegenereerde delen, en kan de kraakvraag zonder hulp beantwoorden |

---
