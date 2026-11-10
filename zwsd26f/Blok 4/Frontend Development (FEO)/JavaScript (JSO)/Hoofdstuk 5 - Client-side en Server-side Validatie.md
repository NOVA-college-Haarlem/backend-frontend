## Hoofdstuk 5: Client-side en Server-side Validatie

**Taakklasse 3 van 3** - De Smaakmakers: het inschrijfformulier
**PRIMM-fasen dit hoofdstuk:** Predict → Run → Modify → Investigate → Modify

Dit hoofdstuk duurt **twee lessen**.

### Leerdoelen
Na dit hoofdstuk kan je:
- In je eigen woorden uitleggen wat het verschil is tussen **client-side** en **server-side** validatie
- Laten zien dat client-side validatie altijd te omzeilen is
- Een formulier controleren met JavaScript en duidelijke foutmeldingen tonen
- Benoemen welke controles **alleen de server** kan doen
- Een eenvoudige controle toevoegen in PHP
- Uitleggen waarom je een prijs nooit uit het formulier haalt

### AI-gebruik dit hoofdstuk
Predict / Run / Investigate: **geen AI**. Modify: AI mag, met verantwoording.

---

## Les 1: de browser controleert

### Het uitgangspunt
Je werkt vandaag in `starter-website-3` (De Smaakmakers). Bij Frontend Development (Hoofdstuk 1-4) heb je dat formulier al verbeterd. Controleer dat het minstens dit heeft. Nieuw is alleen de lege `<p class="fout">` onder elk veld. Fieldsets, radio's, hints en styling uit FEO laat je gewoon staan:
```html
<form action="verwerk.php" method="post" id="inschrijfformulier">
    <label for="naam">Naam</label>
    <input type="text" id="naam" name="naam" required>
    <p class="fout" id="fout-naam"></p>

    <label for="email">E-mailadres</label>
    <input type="email" id="email" name="email" required>
    <p class="fout" id="fout-email"></p>

    <label for="workshop">Workshop</label>
    <select id="workshop" name="workshop" required>
        <option value="">-- Kies een workshop --</option>
    </select>
    <p class="fout" id="fout-workshop"></p>

    <label for="aantal">Aantal personen (1-4)</label>
    <input type="number" id="aantal" name="aantal" value="1" min="1" max="4" required>
    <p class="fout" id="fout-aantal"></p>

    <label for="opmerking">Allergieën of opmerkingen</label>
    <textarea id="opmerking" name="opmerking"></textarea>

    <label>
        <input type="checkbox" id="akkoord" name="akkoord" required>
        Ik ga akkoord met de voorwaarden
    </label>
    <p class="fout" id="fout-akkoord"></p>

    <input type="hidden" name="prijs" id="prijs" value="0">

    <button type="submit">Verstuur</button>
</form>
```
En in je CSS:
```css
.fout {
    color: var(--kleur-primair);
    font-size: 14px;
}
```

### Predict: wie controleert er?
Er zijn drie plekken waar een formulier gecontroleerd kan worden:

| Laag | Waar | Hoe |
|---|---|---|
| 1. HTML | In de browser | Attributen: `required`, `type="email"`, `min`, `max` |
| 2. JavaScript | In de browser | Jouw eigen code bij het `submit`-event |
| 3. Server | Op de server | PHP in `verwerk.php` |

Laag 1 en 2 heten samen **client-side** (de *client* is de browser van de bezoeker). Laag 3 heet **server-side**.

Voorspel voor elk van deze acties wat er gebeurt als je op Verstuur klikt:
1. Alles leeg
2. E-mail: `kees`
3. Aantal: `9`

### Run
Probeer het. Welke laag hield je tegen? Hoe zien de meldingen eruit? Kun je zelf bepalen wat er staat?

### Modify 1: eigen meldingen met JavaScript
De meldingen van de browser zijn lelijk, verschillen per browser en verdwijnen snel. Met JavaScript maak je ze zelf.

1. Zet `novalidate` op je formulier: `<form ... id="inschrijfformulier" novalidate>`. De browser toont dan zijn eigen meldingen niet meer, zodat jouw JavaScript het overneemt. De `required`-attributen laat je gewoon staan.
2. Voeg toe aan `script.js`:
```js
function toonFout(veld, melding) {
    document.querySelector(`#fout-${veld}`).textContent = melding;
}

document.querySelector("#inschrijfformulier").addEventListener("submit", function (event) {
    let fouten = 0;

    // Eerst alle oude meldingen weghalen
    document.querySelectorAll(".fout").forEach(function (p) {
        p.textContent = "";
    });

    const naam = document.querySelector("#naam").value.trim();
    if (naam === "") {
        toonFout("naam", "Vul je naam in.");
        fouten++;
    }

    if (fouten > 0) {
        event.preventDefault();
    }
});
```
- Wat doet `.trim()`? Test met alleen spaties als naam.
- Waarom staat `event.preventDefault()` alleen binnen de `if`? Wat gebeurt er als je hem bovenaan zet?
- Wat doet `fouten++`?

### Modify 2: de andere velden
Voeg zelf de controles toe voor:
- **E-mail:** moet een `@` en een `.` bevatten. Gebruik `.includes()`. Tip: `!` betekent "niet": `!email.includes("@")` is waar als er **geen** `@` in staat.
- **Workshop:** de waarde mag niet `""` zijn.
- **Aantal:** een heel getal van 1 tot en met 4:
```js
const aantal = Number(document.querySelector("#aantal").value);
if (!Number.isInteger(aantal) || aantal < 1 || aantal > 4) {
    toonFout("aantal", "Je kunt met 1 tot 4 personen inschrijven.");
    fouten++;
}
```
- **Akkoord:** een checkbox heeft geen tekst-waarde. Gebruik `.checked` (`true` of `false`).

### Modify 3: live feedback
Laat de foutmelding bij "naam" verdwijnen zodra de gebruiker begint te typen. Gebruik het `input`-event, net als bij het zoekveld in Hoofdstuk 4.

### Tussenstand
Je formulier controleert nu alles netjes in de browser. Is je formulier nu **veilig**? Schrijf je antwoord op. Volgende les kom je erachter.

---

## Les 2: de server controleert

### Investigate: kraak je eigen formulier
Je gaat proberen om ongeldige inschrijvingen door je eigen formulier te krijgen. **Noteer bij elke poging wat `verwerk.php` laat zien.**

**Poging A - JavaScript uit**
1. Open DevTools, druk op `Ctrl + Shift + P` (Mac: `Cmd + Shift + P`) en typ "Disable JavaScript"
2. Ververs de pagina. Wat valt je op aan de pagina?
3. Verstuur het formulier leeg
4. Zet JavaScript daarna weer aan ("Enable JavaScript")

**Poging B - de prijs aanpassen**
1. Kies een workshop en vul alles netjes in
2. Zoek in Elements het verborgen veld `name="prijs"` en verander de `value` in `0.01`
3. Verstuur. Wat moet je betalen?

**Poging C - een volle workshop**
1. Zet in `data/workshops.json` bij "Sushi voor beginners" `"plekken": 0` (als dat nog niet zo is)
2. Schrijf je in voor Sushi voor beginners. Lukt dat?

**Poging D - een workshop die niet bestaat**
1. Zoek in Elements een `<option>` en verander de `value` in `99`
2. Kies die optie en verstuur

### Wat heb je net gezien?
Elke poging lukte. Alles wat in de browser gebeurt, is van de **bezoeker**: die kan het aanpassen, uitzetten of overslaan. Een hacker gebruikt niet eens een browser, maar stuurt het verzoek direct naar je server.

| | Client-side (HTML + JS) | Server-side (PHP) |
|---|---|---|
| Waar | In de browser van de bezoeker | Op jouw server |
| Doel | **Gemak** voor de bezoeker: snelle, duidelijke feedback | **Betrouwbaarheid**: alleen goede data komt binnen |
| Te omzeilen? | Ja, altijd | Nee, de bezoeker kan er niet bij |
| Weet alles? | Nee, weet bijv. niet of een workshop vol is | Ja, heeft de echte gegevens |
| Verplicht? | Nee, maar wel netjes | **Altijd** |

> **Client-side is service, server-side is beveiliging.** Je doet altijd allebei, en je vertrouwt alleen de server.

Vergelijk het met een club. Het bordje bij de ingang ("18+, neem je ID mee") is client-side: handig voor eerlijke bezoekers, maar het houdt niemand tegen. De portier die je ID echt bekijkt, is server-side.

### Modify 4: verwerk.php repareren
Open `verwerk.php`. Vervang het PHP-blok bovenaan (tot `?>`) door:
```php
<?php
$naam       = trim($_POST['naam'] ?? '');
$email      = trim($_POST['email'] ?? '');
$workshopId = (int) ($_POST['workshop'] ?? 0);
$aantal     = (int) ($_POST['aantal'] ?? 0);
$akkoord    = isset($_POST['akkoord']);
// $_POST['prijs'] gebruiken we bewust NIET meer.

// Dezelfde data die JavaScript met fetch inlaadt
$workshops = json_decode(file_get_contents('data/workshops.json'), true);

$gekozen = null;
foreach ($workshops as $workshop) {
    if ($workshop['id'] === $workshopId) {
        $gekozen = $workshop;
    }
}

$fouten = [];

if ($naam === '') {
    $fouten[] = 'Vul je naam in.';
}
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    $fouten[] = 'Vul een geldig e-mailadres in.';
}
// Maak zelf af: aantal tussen 1 en 4
// Maak zelf af: workshop bestaat niet ($gekozen is null)
// Maak zelf af: niet genoeg plekken vrij
// Maak zelf af: niet akkoord
?>
```
- `$_POST` bevat alles wat het formulier verstuurt, net zoals `$_GET` de gegevens uit de URL bevat. Waar komen de namen `'naam'` en `'email'` vandaan?
- `$fouten[] = '...'` zet een melding achteraan in de array.
- `filter_var(..., FILTER_VALIDATE_EMAIL)` is de echte e-mailcontrole van PHP. Die is strenger dan jouw `.includes("@")`.

Pas daarna de HTML in `verwerk.php` aan:
- Zijn er fouten (`count($fouten) > 0`)? Toon ze in een `<ul>` met een `foreach`, en een link terug naar `index.html#inschrijven`.
- Geen fouten? Toon de bevestiging. Bereken het totaal met `$gekozen['prijs'] * $aantal` en toon de titel met `$gekozen['titel']`.

Gebruik voor alles wat de bezoeker heeft ingetypt `htmlspecialchars()`. Weet je nog waarom? (Hoofdstuk 2: `innerHTML`.)

### Investigate: probeer het opnieuw
Doe poging A, B, C en D nog een keer. Wat gebeurt er nu?

### Reflectie
Beantwoord in je eigen woorden:
1. De regels voor naam, e-mail en aantal staan nu op twee plekken (JS en PHP). Waarom is dat geen dubbel werk?
2. Wat zou er misgaan als je **alleen** server-side valideert?
3. Wat zou er misgaan als je **alleen** client-side valideert?
4. Noem twee controles die alleen de server kan doen. Waarom kan de browser dat niet?

### Debug deze AI-output
Een student vroeg AI: "Maak mijn inschrijfformulier veilig". Het antwoord:

> *"Hier is je beveiligde formulier! Met deze validatie kan niemand meer ongeldige gegevens versturen:"*
```js
document.querySelector("#inschrijfformulier").addEventListener("submit", function (event) {
    event.preventDefault();
    const email = document.querySelector("#email").value;
    const prijs = document.querySelector("#prijs").value;
    if (email.includes("@") && prijs > 0) {
        document.querySelector("#inschrijfformulier").submit();
    }
});
```
- Wat klopt er niet aan de **uitleg** van de AI?
- Welke controle hoort hier helemaal niet in de browser thuis?
- Wat ziet de bezoeker als het e-mailadres fout is?

### Huiswerk
1. Je formulier toont eigen foutmeldingen per veld (client-side)
2. `verwerk.php` houdt poging A tot en met D tegen (server-side)
3. Je reflectievragen zijn beantwoord. Je moet ze in het eindgesprek mondeling kunnen uitleggen.

---
