## Hoofdstuk 5: Responsive en Toegankelijke Formulieren

**Taakklasse 3 van 3** - De Smaakmakers (`starter-website-3`), daarna je eigen variant (`mijn-variant`)
**PRIMM-fasen dit hoofdstuk:** Investigate → Modify

Dit hoofdstuk duurt **twee lessen**: les 1 over mobiel, les 2 over toegankelijkheid.

### Leerdoelen
Na dit hoofdstuk kan je:
- Een formulier mobile-first opbouwen: één kolom, naast elkaar vanaf een breakpoint
- Tikvlakken groot genoeg maken (minimaal 44px)
- Uitleggen waarom invoervelden minstens `font-size: 16px` hebben
- `autocomplete` gebruiken zodat de browser velden kan invullen
- Een formulier volledig met het toetsenbord bedienen en dat testen
- Een hint koppelen aan een veld met `aria-describedby`
- Fouten tonen op een manier die niet alleen van kleur afhangt
- Een formulier controleren met de Lighthouse-toegankelijkheidscheck

### AI-gebruik dit hoofdstuk
Investigate: **geen AI**. Modify: AI mag, met verantwoording.

---

## Les 1: het formulier op mobiel

### Investigate: test op een telefoon
1. Open DevTools en klik op het icoon voor **device toolbar** (telefoon/tablet), of druk `Ctrl + Shift + M` (Mac: `Cmd + Shift + M`)
2. Kies bovenaan een telefoon, bijvoorbeeld **iPhone SE** (375px breed)
3. Bekijk je formulier en beantwoord:
   - Staan e-mail en telefoon nog naast elkaar? Zijn ze nog bruikbaar?
   - Moet je ergens horizontaal scrollen?
   - Probeer de checkbox en de radio's aan te klikken. Zijn ze makkelijk te raken met een vinger?
   - Hoe breed is de verstuurknop? Waar zou je duim zitten?

### Nieuw: mobile-first
In Blok 3 (H10) maakte je een pagina responsive met media queries. Bij formulieren werk je het liefst **mobile-first**: de standaard-CSS is voor een smal scherm, en met een media query voeg je dingen toe voor brede schermen.

| Desktop-first (`max-width`) | Mobile-first (`min-width`) |
|---|---|
| Begin met de brede versie, haal dingen weg voor mobiel | Begin met één kolom, voeg kolommen toe als er ruimte is |
| `@media (max-width: 700px) { ... }` | `@media (min-width: 700px) { ... }` |

Een formulier op mobiel is bijna altijd **één kolom**. Dat is dus je startpunt.

### Modify 1: de rij pas naast elkaar op een breed scherm
Haal `display: flex` weg uit je `.rij`-regel uit Hoofdstuk 4 en zet het in een media query:
```css
@media (min-width: 700px) {
    .rij {
        display: flex;
        gap: var(--ruimte);
    }

    .rij .veld {
        flex: 1;
    }
}
```
Test op 375px en op een breed scherm. Sleep de breedte langzaam: waar springt het om?

### Modify 2: groot genoeg om te tikken
Apple en Google adviseren tikvlakken van minimaal **44 bij 44 pixels**.
- Geef invoervelden en `.keuze`-labels `min-height: 44px;`
- Maak checkboxes en radio's groter: `width: 22px; height: 22px;`
- Omdat het **label** om de checkbox heen staat, kun je ook op de tekst tikken. Test het: waarom helpt dat zo veel op mobiel?

### Modify 3: de knop
Maak de verstuurknop op mobiel even breed als het formulier (`width: 100%`) met `min-height: 48px`. Vanaf je breakpoint mag hij weer `width: auto` zijn. Waar zet je welke regel?

### Investigate: waarom 16px?
Een iPhone **zoomt automatisch in** als je in een veld tikt met een lettergrootte kleiner dan 16px. Daarna moet de bezoeker zelf weer uitzoomen. Controleer in DevTools → Computed of al je velden `font-size: 16px` (of meer) hebben.

### Modify 4: autocomplete
Je browser kan je naam, e-mail en telefoonnummer automatisch invullen, maar alleen als het formulier zegt wat elk veld is:
```html
<input type="text" id="naam" name="naam" autocomplete="name" required>
<input type="email" id="email" name="email" autocomplete="email" required>
<input type="tel" id="telefoon" name="telefoon" autocomplete="tel">
```
Andere veelgebruikte waarden: `postal-code`, `street-address`, `address-level2` (woonplaats). Voeg ze toe waar ze passen in je eigen variant.

---

## Les 2: het formulier voor iedereen

### Investigate: alleen het toetsenbord
Leg je muis weg. Vul je formulier **helemaal** in met alleen het toetsenbord:
- **Tab**: naar het volgende veld. **Shift + Tab**: terug.
- **Spatie**: checkbox aan/uit
- **Pijltjestoetsen**: tussen radio buttons kiezen
- **Enter**: formulier versturen

Noteer:
- Zie je bij elke stap waar je bent?
- Is de volgorde logisch (van boven naar beneden)?
- Kon je alles bereiken? Ook de knop?

### Investigate: hint en fout bij het juiste veld
Onder je telefoonveld staat een hint ("10 cijfers, bijvoorbeeld 0612345678"). Een ziende bezoeker ziet die. Een screenreader leest bij het veld alleen het label voor. Met `aria-describedby` koppel je de hint aan het veld:
```html
<label for="telefoon">Telefoon <span class="optioneel">(optioneel)</span></label>
<input type="tel" id="telefoon" name="telefoon" autocomplete="tel"
       pattern="0[0-9]{9}" aria-describedby="hint-telefoon">
<p class="hint" id="hint-telefoon">10 cijfers, bijvoorbeeld 0612345678</p>
```
- Welk attribuut verwijst naar welk `id`? Lijkt dat op `for` en `id` bij een label?

### Investigate: niet alleen kleur
Ongeveer 1 op de 12 mannen is (deels) kleurenblind. Een veld dat alleen een rode rand krijgt bij een fout, is voor hen moeilijk te zien.
- Open DevTools → **Rendering** (via de drie puntjes → More tools) en zoek **Emulate vision deficiencies**. Kies "Deuteranopia" (rood-groen).
- Verstuur je formulier fout. Zie je nog welk veld fout is?

> Laat een fout altijd ook in **tekst** zien, direct bij het veld. (Bij JavaScript Hoofdstuk 5 maak je precies die meldingen.)

### Modify 5: alles op orde
1. Hints krijgen `aria-describedby`
2. Elke fout heeft een tekstmelding, niet alleen een rode rand
3. Kleurcontrast: klik in DevTools → Elements op een tekst, en bekijk bij `color` het contrast (vierkantje → contrast ratio). Grijze hints en placeholders moeten minstens **4.5** halen.

### Investigate: Lighthouse
1. DevTools → **Lighthouse**
2. Vink alleen **Accessibility** aan, kies **Mobile** en klik **Analyze page load**
3. Bekijk je score en de lijst met problemen

Los de problemen op die over je formulier gaan. Probeer een score van **minimaal 90** te halen.

> Lighthouse vindt niet alles. Een score van 100 betekent niet dat alles goed is: de toetsenbordtest van vandaag zie je bijvoorbeeld niet terug in de score. Daarom test je altijd ook zelf.

### Huiswerk
1. Je formulier werkt op 375px: één kolom, geen horizontaal scrollen, alles goed aan te tikken
2. Je kunt het formulier volledig met het toetsenbord invullen en versturen
3. Lighthouse Accessibility: minimaal 90
4. Noem drie dingen die je vandaag hebt aangepast, en voor **wie** elk ding verschil maakt
5. Punt 1 t/m 3 gelden ook voor het formulier in `mijn-variant`: dat is de basis voor je eindproject

---
