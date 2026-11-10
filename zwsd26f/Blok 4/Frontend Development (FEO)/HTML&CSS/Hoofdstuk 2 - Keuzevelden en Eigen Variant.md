## Hoofdstuk 2: Keuzevelden en Eigen Variant

**Taakklasse 1 van 3** - De Smaakmakers (afronding)
**PRIMM-fasen dit hoofdstuk:** Investigate → Modify → **Make** (eigen variant)

### Leerdoelen
Na dit hoofdstuk kan je:
- Radio buttons, checkboxes, een `<select>` en een `<textarea>` gebruiken
- Kiezen welk soort veld past bij een vraag
- Radio buttons groeperen met dezelfde `name`
- Velden groeperen met `<fieldset>` en `<legend>`
- Een stuk AI-gegenereerde HTML controleren op fouten

### AI-gebruik dit hoofdstuk
Investigate: **geen AI**. Modify: AI mag, met verantwoording. **Make: AI mag vrij**, mits je aan het eind willekeurig aangewezen regels kan uitleggen.

---

### Investigate

#### 1. Welk veld past?
Bekijk de tabel. Bedenk bij elke vraag rechts welk veld je zou kiezen, **voordat** je de uitleg leest.

| Veld | Wanneer? | Voorbeeldvraag |
|---|---|---|
| Radio buttons | Precies **één** keuze uit een paar (2-5) opties die je allemaal wil laten zien | "Heb je een dieetwens?" |
| Checkbox (één) | Ja/nee | "Ik ga akkoord met de voorwaarden" |
| Checkboxes (meer) | **Nul of meer** keuzes | "Welke keukens vind je leuk?" |
| `<select>` | Eén keuze uit **veel** opties | "Welke workshop?" |
| `<textarea>` | Langere tekst, meerdere regels | "Allergieën of opmerkingen" |

Welk veld kies je bij: "Hoe heb je ons gevonden?" (Google, Instagram, vrienden, anders), "In welke provincie woon je?", "Wil je de nieuwsbrief?"

#### 2. Radio buttons
Plak dit in je formulier, ná het veld voor het aantal personen:
```html
<p>Dieetwens</p>
<label><input type="radio" name="dieet" value="geen" checked> Geen</label>
<label><input type="radio" name="dieet" value="vegetarisch"> Vegetarisch</label>
<label><input type="radio" name="dieet" value="veganistisch"> Veganistisch</label>
```
- Klik een paar opties aan. Hoeveel kun je er tegelijk kiezen?
- Verander bij de laatste de `name` in `dieet2`. Wat gebeurt er nu? Zet hem daarna terug.
- Verstuur en kijk in Network → Payload: wat wordt er verstuurd, de tekst naast het rondje of de `value`?
- Wat doet `checked`?

> Radio buttons met dezelfde **`name`** horen bij elkaar: je kunt er maar één kiezen. De **`value`** is wat er naar de server gaat.

#### 3. Checkboxes
Voeg een checkbox toe voor de nieuwsbrief:
```html
<label><input type="checkbox" name="nieuwsbrief"> Stuur mij de nieuwsbrief</label>
```
- Verstuur met én zonder vinkje. Wat zie je in Payload? Wat wordt er verstuurd als het vakje **niet** is aangevinkt?

#### 4. Groeperen met fieldset en legend
Bij de radio's staat "Dieetwens" in een losse `<p>`. Een screenreader weet niet dat die tekst bij de drie rondjes hoort. Zo wel:
```html
<fieldset>
    <legend>Dieetwens</legend>
    <label><input type="radio" name="dieet" value="geen" checked> Geen</label>
    <label><input type="radio" name="dieet" value="vegetarisch"> Vegetarisch</label>
    <label><input type="radio" name="dieet" value="veganistisch"> Veganistisch</label>
</fieldset>
```
- Wat doet de browser met een `<fieldset>`? En met de `<legend>`?
- Je kunt ook een groot formulier in delen verdelen. Welke twee groepen zie jij in het inschrijfformulier?

---

### Modify
1. Verdeel het formulier in twee `<fieldset>`'s: **Jouw gegevens** (naam, e-mail, telefoon) en **Workshop** (workshop, aantal, dieetwens, opmerkingen)
2. De dieetwens krijgt een eigen `<fieldset>` binnen de groep Workshop
3. Voeg de nieuwsbrief-checkbox toe, boven de akkoord-checkbox
4. Geef de `<textarea>` een hoogte met `rows="4"`

Controleer in Network → Payload of alles aankomt.

---

### Make: eigen variant
Je maakt van De Smaakmakers je **eigen variant**. Die gebruik je dit hele blok voor de Make-opdrachten en het eindproject, bij FEO én bij JavaScript.

Vanaf nu heb je **twee mappen**:

| Map | Wat doe je erin? |
|---|---|
| `starter-website-3/` (De Smaakmakers) | Alle oefeningen uit de lessen, bij FEO en JS. Hier verander je het onderwerp **niet**: de lessen gaan uit van deze site. |
| `mijn-variant/` | Alle Make-opdrachten en de eindprojecten. Jouw eigen site. |

**Voorbereiding:** kopieer de hele map `starter-website-3` en noem de kopie `mijn-variant`. Open `mijn-variant/docker-compose.yml` en verander `"80:80"` in `"8080:80"` en `"8000:80"` in `"8001:80"`. Typ in een terminal in die map `docker compose up -d`. Je eigen variant staat nu op http://localhost:8080 (phpMyAdmin op http://localhost:8001), en De Smaakmakers blijft op http://localhost. Zo kunnen ze allebei tegelijk draaien.

Werk vanaf hier in `mijn-variant`:

1. Kies een onderwerp waarvoor bezoekers zich inschrijven, iets boeken of bestellen. Bijvoorbeeld: een dansschool, een escaperoom, een fietsverhuur, een muziekfestival, een dierenpension. Je mag ook kookworkshops houden, met een eigen draai.
2. Geef je site een eigen naam en kleuren. Pas daarvoor alleen de CSS-variabelen in `:root` aan. (Weet je nog, Blok 3 Hoofdstuk 5?)
3. Pas de cards aan naar jouw onderwerp
4. Pas het formulier aan: het moet passen bij jouw onderwerp, en minstens dit hebben:
   - Drie verschillende input-types (bijv. `text`, `email`, `number`)
   - Eén `<select>`
   - Eén groep radio buttons in een `<fieldset>` met `<legend>`
   - Eén checkbox
   - Eén `<textarea>`
   - Alle velden met een label en een `name`

### Debug deze AI-output
Een student vroeg AI om "een formulier voor een fietsverhuur". Het antwoord:
```html
<form action="verwerk.php" method="get">
    <input type="text" placeholder="Je naam">
    <label for="mail">E-mail</label>
    <input type="email" id="email" name="email">

    <p>Soort fiets</p>
    <input type="radio" name="fiets1" value="stad"> Stadsfiets
    <input type="radio" name="fiets2" value="e-bike"> E-bike

    <label>Aantal dagen</label>
    <input type="text" name="dagen">
    <button>Huren</button>
</form>
```
Er zitten minstens **zes** problemen in. Vind ze, leg per probleem uit wat er misgaat voor de bezoeker of voor de server, en verbeter de code.

### Huiswerk
1. Je eigen variant heeft een eigen naam, eigen kleuren en eigen cards
2. Het formulier van je eigen variant voldoet aan de lijst hierboven
3. Elke label werkt (klik-test) en alles komt aan in Payload

---
