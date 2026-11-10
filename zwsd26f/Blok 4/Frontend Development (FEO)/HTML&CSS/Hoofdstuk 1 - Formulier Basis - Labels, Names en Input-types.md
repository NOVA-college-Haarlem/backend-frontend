## Hoofdstuk 1: Formulier Basis - Labels, Names en Input-types

**Taakklasse 1 van 3** - De Smaakmakers (`starter-website-3/`)
**PRIMM-fasen dit hoofdstuk:** Predict → Run → Investigate → Modify

### Waarom dit hoofdstuk?
Tot nu toe kon een bezoeker op je sites alleen kijken en klikken. Met een **formulier** stuurt de bezoeker iets naar jou: een inschrijving, een bestelling, een bericht. Dit blok leer je formulieren bouwen die kloppen, die er goed uitzien en die voor iedereen werken. Bij JavaScript en Backend gebruik je hetzelfde formulier.

### Leerdoelen
Na dit hoofdstuk kan je:
- Uitleggen wat `action` en `method` van een `<form>` doen, en het verschil tussen GET en POST
- Een `<label>` koppelen aan een invoerveld met `for` en `id`
- Uitleggen wat het `name`-attribuut doet
- Het juiste input-type kiezen: `text`, `email`, `tel`, `number`
- Uitleggen waarom een placeholder geen label is

### AI-gebruik dit hoofdstuk
Predict / Run / Investigate: **geen AI**. Modify: AI mag, maar je moet elke regel kunnen uitleggen.

### Opstarten
1. Open de map `starter-website-3` in VS Code
2. Open een terminal en typ: `docker compose up -d`
3. Ga in je browser naar http://localhost en scroll naar **Inschrijven**

---

### Predict
Bekijk het formulier in `index.html` (zoek naar `<form`). Nog niets aanpassen. Beantwoord in tweetallen:
1. Je vult het formulier in en klikt op Verstuur. Naar welk bestand gaat de informatie? Hoe zie je dat?
2. Je klikt op de tekst "Aantal personen". Wat gebeurt er?
3. Je typt een naam in het eerste veld. Hoe weet je daarna nog wat er in dat veld moest?

### Run
Vul het formulier in en verstuur het. Klik ook op de teksten naast de velden. Klopten je voorspellingen?

---

### Investigate

#### 1. Wat wordt er verstuurd?
1. Ga terug naar het formulier en open DevTools → **Network**
2. Vul het formulier in en verstuur
3. Klik in Network op `verwerk.php` en open het tabblad **Payload**

Je ziet nu precies wat de browser naar de server stuurt. Elke regel is `name: waarde`.
- Waar komen de namen links vandaan? Zoek ze op in `index.html`.
- Haal bij het e-mailveld het `name`-attribuut weg, ververs en verstuur opnieuw. Wat zie je in Payload? En op de bevestigingspagina?

> **`name`** is de naam waaronder de waarde naar de server gaat. Zonder `name` wordt een veld **niet verstuurd**, ook al heeft de bezoeker het ingevuld.

Zet het `name`-attribuut daarna terug.

#### 2. action en method
```html
<form action="verwerk.php" method="post">
```
- `action`: naar welk bestand het formulier gaat
- `method`: **hoe** het verstuurd wordt

Verander `method="post"` in `method="get"`, ververs en verstuur.
- Kijk naar de adresbalk. Wat zie je?
- Waarom laat `verwerk.php` nu niets meer zien? (Tip: `verwerk.php` leest `$_POST`.)
- Bij Backend gebruikte je `$_GET` om een `id` uit de URL te lezen. Zie je het verband?

| | GET | POST |
|---|---|---|
| Waar staan de gegevens? | In de URL (`?naam=Kees&...`) | Onzichtbaar in het verzoek |
| Gebruik je voor | Zoeken, filteren, een detailpagina | Iets versturen of opslaan: inschrijven, inloggen, bestellen |

Zet `method` terug op `post`. Waarom wil je een inschrijving niet in de URL hebben staan?

#### 3. Labels
In de startcode staat bij telefoon alleen losse tekst:
```html
Telefoon (optioneel)
<input type="text" name="telefoon">
```
Met een `<label>` koppel je de tekst aan het veld:
```html
<label for="telefoon">Telefoon (optioneel)</label>
<input type="text" id="telefoon" name="telefoon">
```
- Pas het aan, ververs en klik op de tekst. Wat gebeurt er nu?
- `for` en `id` moeten precies hetzelfde zijn. Wat gebeurt er als je een typfout maakt?
- Een blinde bezoeker gebruikt een **screenreader** die de pagina voorleest. Wat leest die voor bij een veld zonder label?

> `id` en `name` lijken op elkaar, maar doen iets anders. **`id`** is voor de pagina (label, CSS, JavaScript). **`name`** is voor de server. Meestal geef je ze dezelfde waarde.

#### 4. Placeholder is geen label
Het naamveld heeft alleen `placeholder="Naam"`. Typ iets in het veld.
- Waar is het woord "Naam" gebleven?
- Wat betekent dat voor iemand die het formulier half invult en dan even weggaat?
- Placeholder-tekst is lichtgrijs. Is dat goed leesbaar?

> Een placeholder mag een **voorbeeld** geven (`bijv. 0612345678`), maar vervangt nooit een label.

#### 5. Input-types
| Type | Voor | Wat doet de browser extra? |
|---|---|---|
| `text` | Gewone tekst | Niets |
| `email` | E-mailadres | Controleert op `@`, telefoon toont een toetsenbord met `@` |
| `tel` | Telefoonnummer | Telefoon toont het cijfertoetsenbord |
| `number` | Getal | Pijltjes omhoog/omlaag, telefoon toont cijfers |

Verander het e-mailveld in `type="email"`, typ `kees` en verstuur. Wat gebeurt er? (Hier kom je in Hoofdstuk 3 op terug.)

---

### Modify
Verbeter het hele formulier:
1. Elk veld krijgt een `<label>` met `for`, en een `id` dat overeenkomt
2. Haal de placeholders weg die als label dienden. Bij telefoon mag een voorbeeld-placeholder blijven.
3. Kies voor elk veld het juiste type: `email`, `tel` en `number` voor aantal
4. Controleer: heeft elk veld nog een `name`? Kijk in Network → Payload of alles aankomt.

Gebruik voor `id` en `name` dezelfde namen als nu: `naam`, `email`, `telefoon`, `workshop`, `aantal`, `opmerking`, `akkoord`. JavaScript gebruikt die straks.

De checkbox heeft een label **om** het vakje heen. Dan heb je geen `for` en `id` nodig:
```html
<label>
    <input type="checkbox" id="akkoord" name="akkoord">
    Ik ga akkoord met de voorwaarden
</label>
```

Het ziet er nog niet mooi uit. Dat komt in Hoofdstuk 4.

### Huiswerk
1. Elk veld heeft een werkend label (testen: klik op de tekst, het veld wordt actief)
2. Elk veld heeft het juiste type en een `name`
3. Leg in je eigen woorden uit: wat is het verschil tussen `id` en `name`? En tussen GET en POST?

---
