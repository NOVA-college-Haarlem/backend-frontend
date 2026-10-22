# Samenvattingsquiz JavaScript (Mentimeter)

**Klas:** zwsd26f · **Stof:** JS Hoofdstuk 1-7 · **Duur:** ca. 25 min · **Type Menti-slide:** Quiz → *Select answer*

**Werkvorm (peer instruction):** laat eerst iedereen alleen stemmen. Heeft minder dan ~70% het goed? Dan 1 minuut overleggen met je buur en de vraag opnieuw stellen (slide dupliceren). Het juiste antwoord staat aangegeven met ✅.

> Menti toont geen code-opmaak. Code in een vraag staat daarom kort op één regel. Wil je het mooier, zet de code dan in een screenshot als afbeelding bij de vraag.

---

### 1. Script koppelen (20 s)
Hoe koppel je een JavaScript-bestand aan je HTML?
- `<link rel="script" href="js/script.js">`
- ✅ `<script src="js/script.js"></script>`
- `<style src="js/script.js">`
- `<js>script.js</js>`

### 2. Console (20 s)
Waar zie je de uitkomst van `console.log("Hoi")`?
- Bovenaan de webpagina
- In een pop-up
- ✅ In de console van de developer tools (F12)
- Nergens, het is een opmerking

### 3. Variabelen (20 s)
`let naam = "Sam"; console.log("Hoi " + naam);` Wat verschijnt er?
- `Hoi naam`
- ✅ `Hoi Sam`
- `HoiSam`
- Een foutmelding

### 4. Strikvraag (30 s)
`let leeftijd = "17"; console.log(leeftijd + 1);` Wat verschijnt er?
- 18
- ✅ 171
- Een foutmelding
- undefined

*Uitleg: "17" is tekst (string), dus + plakt de 1 erachter.*

### 5. querySelector (20 s)
Hoe selecteer je het eerste element met class `card`?
- `document.querySelector("card")`
- `document.querySelector("#card")`
- ✅ `document.querySelector(".card")`
- `document.getElement(".card")`

### 6. querySelector vs querySelectorAll (20 s)
Wat is het verschil tussen `querySelector` en `querySelectorAll`?
- Er is geen verschil
- ✅ De eerste geeft één element, de tweede alle passende elementen
- De eerste is voor classes, de tweede voor ids
- `querySelectorAll` is verouderd

### 7. Tekst aanpassen (20 s)
Je hebt `let titel = document.querySelector("h1");` Hoe verander je de tekst?
- `titel = "Welkom";`
- `titel.style = "Welkom";`
- ✅ `titel.textContent = "Welkom";`
- `h1.textContent = "Welkom";`

### 8. Events (20 s)
In `knop.addEventListener("click", function () { ... })`, wat is `"click"`?
- De naam van de knop
- ✅ Het event waarop gereageerd wordt
- De class van de knop
- Een variabele

### 9. preventDefault (30 s)
Wat doet `event.preventDefault()` bij een klik op een link?
- Het verwijdert de link
- ✅ Het voorkomt dat de browser de link volgt
- Het opent de link in een nieuw tabblad
- Het voorkomt dat de rest van je code draait

### 10. Condities, strikvraag (30 s)
`let prijs = 50; if (prijs > 50) { tekst = "Duur"; } else { tekst = "Betaalbaar"; }` Wat is `tekst`?
- Duur
- ✅ Betaalbaar
- Allebei
- Een foutmelding

*Uitleg: 50 is niet groter dan 50. Bij `>=` was het "Duur" geweest.*

### 11. = of === (20 s)
Wat is het verschil tussen `=` en `===`?
- Geen verschil
- ✅ `=` geeft een waarde, `===` vergelijkt twee waarden
- `===` geeft een waarde, `=` vergelijkt
- `===` is alleen voor getallen

### 12. classList.toggle (20 s)
Wat doet `document.body.classList.toggle("dark")`?
- Zet de class `dark` altijd aan
- Verwijdert altijd de class `dark`
- ✅ Zet `dark` aan als die er niet is, en uit als die er wel is
- Maakt de pagina zwart-wit

### 13. Dark mode (30 s)
Bij de dark mode van Boulder Base: wie doet wat?
- JavaScript zet alle kleuren één voor één om
- ✅ JS wisselt een class, CSS (met variabelen) bepaalt de kleuren
- CSS detecteert de klik zelf
- De browser regelt het automatisch

### 14. Arrays (20 s)
`let lessen = ["Beginner", "Techniek", "Jeugd"];` Wat is `lessen[1]`?
- "Beginner"
- ✅ "Techniek"
- "Jeugd"
- undefined

*Uitleg: tellen begint bij 0.*

### 15. forEach (20 s)
`lessen.forEach(function (les) { console.log(les); });` Hoe vaak wordt er iets gelogd?
- 1 keer
- 2 keer
- ✅ 3 keer
- Oneindig vaak

### 16. Formulier-input (20 s)
Hoe lees je uit wat iemand in een `<input>` heeft getypt?
- `invoer.textContent`
- ✅ `invoer.value`
- `invoer.text`
- `invoer.input`

### 17. Bug zoeken (30 s)
`document.querySelector("knop")` geeft `null`, terwijl er een `<button class="knop">` is. Waarom?
- Buttons kun je niet selecteren
- ✅ De punt ontbreekt: het moet `".knop"` zijn
- Het moet `querySelectorAll` zijn
- Het script staat te laat in de HTML

### 18. Duplicatie (30 s)
Boulder Base heeft drie bijna identieke click-handlers voor de drie "Boek deze les"-links. Wat is de beste oplossing?
- Drie aparte JS-bestanden maken
- ✅ De links met `querySelectorAll` ophalen en met `forEach` één handler koppelen
- Er één weghalen
- Alles in een `alert` zetten
