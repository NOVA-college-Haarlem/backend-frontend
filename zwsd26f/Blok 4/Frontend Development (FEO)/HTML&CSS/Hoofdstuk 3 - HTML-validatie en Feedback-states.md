## Hoofdstuk 3: HTML-validatie en Feedback-states

**Taakklasse 2 van 3** - De Smaakmakers (`starter-website-3`), daarna je eigen variant (`mijn-variant`)
**PRIMM-fasen dit hoofdstuk:** Predict → Run → Investigate → Modify

### Leerdoelen
Na dit hoofdstuk kan je:
- Validatie-attributen gebruiken: `required`, `min`/`max`, `minlength`/`maxlength`, `pattern`
- Met CSS laten zien of een veld goed of fout is (`:focus`, `:invalid`, `:user-invalid`)
- Verplichte en optionele velden duidelijk aangeven
- Uitleggen dat de controle van de browser te omzeilen is

### AI-gebruik dit hoofdstuk
Predict / Run / Investigate: **geen AI**. Modify: AI mag, met verantwoording.

---

### Predict
Zet deze attributen in het formulier van De Smaakmakers:
```html
<input type="text" id="naam" name="naam" required>
<input type="email" id="email" name="email" required>
<input type="number" id="aantal" name="aantal" value="1" min="1" max="4" required>
<input type="checkbox" id="akkoord" name="akkoord" required>
```
Voorspel wat er gebeurt als je op Verstuur klikt bij:
1. Een leeg formulier
2. Naam ingevuld, e-mail `kees`
3. Alles goed, maar aantal `7`
4. Alles goed, maar het akkoord-vakje niet aangevinkt

### Run
Probeer alle vier. Komt het formulier bij `verwerk.php` aan? Welke meldingen zie je? Probeer het ook in een andere browser: zien de meldingen er hetzelfde uit?

---

### Investigate

#### 1. Validatie-attributen
| Attribuut | Controleert | Voorbeeld |
|---|---|---|
| `required` | Veld mag niet leeg zijn | Naam, e-mail |
| `type="email"` | Moet op een e-mailadres lijken | `kees@site.nl` |
| `min` / `max` | Kleinste en grootste getal (bij `number`) | 1 tot 4 personen |
| `minlength` / `maxlength` | Minimaal en maximaal aantal tekens | Opmerking max. 500 tekens |
| `pattern` | Tekst moet aan een patroon voldoen | Telefoonnummer: 10 cijfers, begint met 0 |

Probeer `pattern` op het telefoonveld:
```html
<input type="tel" id="telefoon" name="telefoon" pattern="0[0-9]{9}">
```
- Lees het patroon: `0`, dan `[0-9]` (een cijfer) `{9}` (negen keer). Hoeveel cijfers in totaal?
- Typ `0612345678`, daarna `06-12345678`, daarna niets. Welke worden geaccepteerd? Waarom wordt "niets" geaccepteerd?

#### 2. Feedback met CSS
De browser weet nu of een veld goed of fout is. Dat kun je stylen:
```css
input:invalid {
    border: 2px solid red;
}
```
- Ververs de pagina. Wat zie je, **voordat** je iets hebt ingevuld? Is dat prettig voor een bezoeker?

Vervang `:invalid` door `:user-invalid`:
```css
input:user-invalid {
    border: 2px solid red;
}
```
- Wat is nu het verschil? Wanneer wordt een veld rood?

> **`:invalid`** is meteen actief, ook als de bezoeker nog niets heeft gedaan. **`:user-invalid`** wacht tot de bezoeker het veld heeft aangeraakt of op Verstuur heeft geklikt. Gebruik dus `:user-invalid`.

En `:focus` kende je al van buttons. Waarom is het handig dat een bezoeker ziet in welk veld hij aan het typen is?

#### 3. Verplicht of optioneel?
Een bezoeker kan `required` niet zien. Hoe weet hij welke velden verplicht zijn? Twee gangbare manieren:
- Verplichte velden een `*` geven, met bovenaan "Velden met * zijn verplicht"
- Optionele velden het woord "(optioneel)" geven

Als bijna alles verplicht is (zoals hier), is "(optioneel)" bij de paar uitzonderingen duidelijker. Waarom?

#### 4. Is het nu veilig?
1. Open DevTools → **Elements** en zoek het naamveld
2. Dubbelklik op `required` en haal het weg
3. Verstuur het formulier met een lege naam

Wat gebeurt er? Wat zegt dat over deze controle? **Schrijf je antwoord op.** Bij JavaScript kom je hier in Hoofdstuk 5 uitgebreid op terug.

---

### Modify
Maak het formulier van De Smaakmakers compleet (JavaScript gebruikt dit formulier in Hoofdstuk 5):
1. Elk verplicht veld krijgt `required`
2. Elk getal-veld krijgt een logische `min` en `max`
3. Het `<textarea>`-veld krijgt een `maxlength`
4. Minstens één veld krijgt een `pattern` (bijv. telefoon of postcode: `[0-9]{4} ?[A-Za-z]{2}`). Zet in een korte hint onder het veld wat het formaat is.
5. Optionele velden krijgen "(optioneel)" in het label, bijvoorbeeld zo:
```html
<label for="telefoon">Telefoon <span class="optioneel">(optioneel)</span></label>
```
6. Voeg CSS toe voor `:focus` en `:user-invalid`

### Huiswerk
1. Het formulier van De Smaakmakers laat geen leeg verplicht veld, verkeerd e-mailadres of te hoog getal door
2. Pas alles van vandaag ook toe op het formulier in `mijn-variant`
3. In beide formulieren is voor een bezoeker duidelijk welke velden optioneel zijn
4. Beantwoord: "Je hebt nu `required` op alle velden. Is je formulier veilig?" Leg uit waarom wel of niet.

---
