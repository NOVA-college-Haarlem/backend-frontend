## Hoofdstuk 6: Eindproject - Formulier en Verantwoording

**Taakklasse 3 van 3** - volledige **Make**, op je eigen variant
**PRIMM-fase dit hoofdstuk:** Make + verantwoordingsgesprek

### Projectomschrijving
Afsluitend hoofdstuk van FEO. Je maakt het formulier van je eigen variant af, zodat het klopt, er goed uitziet, op elke schermbreedte werkt en door iedereen te gebruiken is. Het is **dezelfde site** als je JavaScript-eindproject: daar komt de data en de validatie bij, hier de structuur en vormgeving.

### Leerdoelen
Na dit hoofdstuk kan je:
- Zelfstandig een volledig, goed opgebouwd formulier maken
- Alle technieken uit dit blok combineren (structuur, keuzevelden, validatie, styling, responsive, toegankelijk)
- Een willekeurige regel in je eigen HTML of CSS uitleggen: wat doet die, en waarom staat die er?
- Een stuk (AI-)code controleren op fouten en verbeteren

### Projecteisen (Voldoende)

**Structuur**
- [ ] Minstens 7 velden, waaronder drie verschillende input-types, een `<select>`, een groep radio buttons, een checkbox en een `<textarea>`
- [ ] Elk veld heeft een gekoppeld label (`for`/`id`, of label om het veld heen) en een `name`
- [ ] Velden gegroepeerd met `<fieldset>` en `<legend>`
- [ ] `method="post"` en een passende `action`

**Validatie**
- [ ] `required` op alle verplichte velden; optionele velden zichtbaar als "(optioneel)"
- [ ] Minstens één `min`/`max` of `maxlength`, en één `pattern` met een hint

**Vormgeving**
- [ ] Consistente styling met je CSS-variabelen, `font-family: inherit` op de velden
- [ ] Zichtbare focus (`:focus-visible`) en een knop met `:hover`-state
- [ ] Fout-states met `:user-invalid`

**Responsive en toegankelijk**
- [ ] Mobile-first: één kolom op 375px, geen horizontaal scrollen
- [ ] Tikvlakken van minimaal 44px, velden minimaal 16px tekst
- [ ] `autocomplete` op naam, e-mail en (als je het hebt) telefoon
- [ ] Volledig met het toetsenbord in te vullen en te versturen
- [ ] Lighthouse Accessibility minimaal 90 (mobiel)

### Bonus (Goed/Uitstekend)
- [ ] Een tweede formulier op je site (bijv. contact of nieuwsbrief) met dezelfde stijl
- [ ] Hints met `aria-describedby` bij elk veld met een formaat-eis
- [ ] Getest met een echte schermlezer (VoiceOver of Verteller), met een korte notitie wat je hoorde

### Programma

**Les 1: Bouwen** - formulier afmaken op de eigen variant (AI mag, mits verantwoordbaar)

**Les 2: Peer review + Debug deze AI-output + polijsten**
- Peer review in tweetallen met de checklist hieronder
- **Debug deze AI-output:** een AI-gegenereerd formulier met ingebouwde fouten
- Verbeteringen doorvoeren, Lighthouse opnieuw draaien

**Les 3: Verantwoordingsgesprek**
Eén gesprek samen met JavaScript (circa 10 min):
1. **Demo:** laat je site en formulier zien, op desktop én in device-mode op 375px
2. **Toetsenbordvraag:** vul je formulier in zonder muis
3. **Verantwoordingsvraag:** een willekeurige regel HTML of CSS wordt aangewezen: "wat doet dit, voor wie maakt het verschil, wat gebeurt er als je het weghaalt?"
4. Daarna het JS-deel (met de kraakvraag, zie JS Hoofdstuk 6)

### Peer Review Checklist
- [ ] Klik op elk label: wordt het juiste veld actief?
- [ ] Verstuur leeg: worden alle verplichte velden tegengehouden?
- [ ] Network → Payload: komen alle velden met een logische naam aan?
- [ ] 375px: één kolom, geen horizontaal scrollen, alles goed aan te tikken?
- [ ] Alleen toetsenbord: alles bereikbaar, focus altijd zichtbaar?
- [ ] Lighthouse Accessibility: score?
- [ ] Kan je klasgenoot een willekeurige regel uitleggen?

### Beoordelingscriteria

| Criterium | Onvoldoende | Voldoende | Goed |
|---|---|---|---|
| **Structuur** | Velden zonder label of `name`, geen groepering | Alle velden met label en `name`, juiste types, fieldsets | Logische veldkeuzes en volgorde, kan elke keuze onderbouwen |
| **Validatie** | Geen of nauwelijks validatie-attributen | `required`, `min`/`max` en `pattern` correct toegepast, optioneel zichtbaar | Plus duidelijke hints en fout-states die niet alleen op kleur leunen |
| **Vormgeving** | Standaard browserstijl, geen focus zichtbaar | Consistent, CSS-variabelen, zichtbare focus, button-states | Verzorgd en passend bij de eigen site, ook in fout-states |
| **Responsive & toegankelijk** | Breekt op mobiel of niet met toetsenbord te gebruiken | Mobile-first, 44px tikvlakken, toetsenbord werkt, Lighthouse ≥ 90 | Plus `autocomplete`, `aria-describedby`, eventueel getest met schermlezer |
| **Verantwoording** | Kan aangewezen regel niet uitleggen | Kan de meeste code uitleggen | Legt uit wat een regel doet én voor wie hij verschil maakt, ook bij AI-gegenereerde delen |

---
