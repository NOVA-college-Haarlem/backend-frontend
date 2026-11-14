# Frontend Ontwikkeling - Blok 2

## Week 2: Buttons, Input Velden & Formulier Basics

### Algemene Informatie
- **Doelgroep:** MBO-4 studenten (SE & SD)
- **Lesduur:** 90 minuten
- **Voorkennis:** CSS selectoren, box model, :hover
- **Tools:** VS Codium, Browser

---

### Leerdoelen
Na deze les kan de student:
- Button basics stylen (padding, border, border-radius, background)
- Hover, active en disabled states implementeren
- Verschillende button types toepassen (primary, secondary, danger)
- HTML formulierelementen (`<form>`, `<input>`, `<label>`) begrijpen
- Input velden en buttons stylen
- Focus states op inputs toepassen
- `cursor: pointer` gebruiken voor betere UX

---

### Lesopbouw (90 minuten)

**1. Introductie: Buttons in de Wildernis (5 min)**

**Live Demo:**
- Open GitHub, Spotify of Gmail
- Kijk naar de buttons
- Vragen aan studenten:
  - "Zie je alle buttons?"
  - "Zijn ze allemaal hetzelfde?"
  - "Welke vallen het meest op?"
  - "Wat gebeurt er als je erover hovert?"

**Observaties:**
- Primary button (blauw/groen, groot) = "Belangrijkste actie"
- Secondary button (grijs, klein) = "Alternatief"
- Buttons hebben hover effect (kleur verandert!)
- "Hover" zegt: "Jij kan op mij klikken"

**Vraag:** "Hoe maken zij deze effecten met CSS?"

---

**2. Button Basics - Hoe zouden zij dit gedaan hebben? (20 min)**

**Observatie van echte website:**
- Button heeft padding (ruimte rond tekst)
- Button is afgerond (border-radius)
- Button heeft achtergrondkleur
- Button verandert kleur bij hover

**Hypothese:** "Wat doen jullie denken dat er in CSS staat?"

*Laat studenten gokken/discussiëren*

**De waarheid - CSS Properties:**
```css
.btn {
    /* Ruimte rond tekst */
    padding: 10px 20px;

    /* Afgeronde hoeken */
    border-radius: 5px;

    /* Kleur achtergrond */
    background-color: #3498db;
    color: white;

    /* Geen border (cleanere look) */
    border: none;

    /* Cursor verandert in pointer */
    cursor: pointer;
}
```

**Samen Doen: Jouw Eerste Button (10 min)**

HTML:
```html
<button class="btn">Mijn Eerste Button</button>
```

CSS:
```css
.btn {
    padding: 10px 20px;
    border-radius: 5px;
    background-color: #3498db;
    color: white;
    border: none;
    cursor: pointer;
}

.btn:hover {
    background-color: #0056b3;
}

```

Test in browser!
- Klik → voelt het aan als een button?
- Pas padding aan → voelt anders?
- Pas border-radius aan → voelt anders?

---

**🚀 OEFENING 1: Button Hackathon (15 min)**

**Doel:** Vind buttons in het wild en reverse-engineer ze!

**Fase 1: Onderzoek (5 min) - Duo's**
- Duo krijgt een website: GitHub, Spotify of Gmail
- **Missie:** Vind een **simpele** button (niet te veel effecten/gradients/animaties)
- Vraag: "Waarom valt deze op?"
- Inspect Element (F12) → let op de **kern properties**: padding, background-color, border-radius, color

**Fase 2: Nabootsen (8 min)**
- Probeer de button na te bouwen met de **kern properties**
- Match:
  - Kleur (background-color)
  - Grootte (padding)
  - Hoeken (border-radius)
  - (Hover effect - optioneel)
- Je hoeft niet alles perfect te doen - focus op: **wat maakt deze button herkenbaar?**

**Fase 3: Presentatie (2 min)**
- Duo zit aan hun plek
- Duo vertelt: *"Onze button van GitHub is blauw met 15px padding en afgeronde hoeken"*
- Jij typt snel in VS Code: de **kern properties** van hun button
- Toon de echte button op browser-tab ernaast
- Vergelijk: *"Zien jullie dat de basis hetzelfde is?"*
- Applaus!

---

**🎮 INTERMEZZO: Live CSS Tweaking Sessie (10 min)**

**Setup:** Beamer + 1 docent-laptop + studenten kijken

**Doel:** Students voelen de MACHT van CSS door direct visuele feedback

**Hoe:**
1. Open je button code op beamer (grote font!)
2. Vraag: "Wie wil iets proberen?"
3. Student zegt: "Maak padding groter!"
4. Typ: `padding: 30px;` → CLICK Save → button wordt MASSIVE!
5. Volgende student: "Maak het rond!"
6. Typ: `border-radius: 50%;` → POOF, RONDE BUTTON!
7. Volgende: "Maak achtergrond paars!"
8. Typ: `background-color: purple;` → WHOA!

**Waarom dit werkt:**
- Immediate visual feedback (geen wachten)
- Students durven experimenteren ("ik breek het niet")
- Humor moment (paarse buttons = grappig)
- Concretiseert: "Dit CSS property doet DIT"

**Je kan ook:**
- Vraag: "Wat gebeurt er als ik dit weghaal?" (remove padding)
- Vraag: "Wat als ik dit veranderen?" (change color to random)
- "Wie durft het gekste te proberen?"

---

**4. Button States: Hover, Active, Disabled (10 min)**

**Hover State:**
```css
.btn:hover {
    background-color: #0056b3;
}
```

**Active State (bij klikken):**
```css
.btn:active {
    transform: scale(0.98);
}
```

**Disabled State:**
```html
<button class="btn btn-primary" disabled>Loading...</button>
```

```css
.btn:disabled {
    background-color: #ccc;
    color: #666;
    cursor: not-allowed;
    opacity: 0.6;
}
```

**Oefening 2 (5 min):**
Maak buttons met alle states: normal, hover, active, disabled.

---

**🎮 OEFENING 3: Button & CSS Matching Game (10 min)**

Zie werkblad: `werkblad-button-css-matching.html`

---

**5. HTML Formulierelementen Intro (25 min)**

**Wat is een formulier?**
HTML formulieren verzamelen data van gebruikers.

**Basis Formulier:**
```html
<form>
    <label for="naam">Naam:</label>
    <input type="text" id="naam" name="naam">

    <label for="email">Email:</label>
    <input type="email" id="email" name="email">

    <button type="submit" class="btn btn-primary">Verzenden</button>
</form>
```

**HTML Elementen:**
- `<form>` - Container voor formulier
- `<label>` - Label voor input veld
- `<input>` - Invoerveld (text, email, password, etc.)
- `type="submit"` - Verzend button

**Waarom `<label>`?**
- ✅ Accessible (screenreaders begrijpen het)
- ✅ Click target groter (klik op label = focus op input)
- ✅ Semantic HTML

**Input Types:**
```html
<input type="text">       <!-- Tekst -->
<input type="email">      <!-- Email (validatie!) -->
<input type="password">   <!-- Verborgen tekst -->
<input type="number">     <!-- Nummers alleen -->
<input type="date">       <!-- Datepicker -->
```

**Oefening 2b: Maak een Contact Form HTML (10 min):**
```html
<form class="contact-form">
    <label for="name">Naam:</label>
    <input type="text" id="name" name="name" required>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required>

    <label for="message">Bericht:</label>
    <textarea id="message" name="message" rows="4"></textarea>

    <button type="submit" class="btn btn-primary">Verzenden</button>
</form>
```

---

**6. Formulier Styling (15 min)**

**Input Styling:**
```css
input, textarea {
    padding: 10px;
    border: 2px solid #ddd;
    border-radius: 5px;
    font-size: 16px;
    font-family: Arial, sans-serif;
}

input:focus, textarea:focus {
    border-color: #007bff;
    outline: none;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
}
```

**Label Styling:**
```css
label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
    color: #333;
}
```

**Formulier Layout:**
```css
.contact-form {
    max-width: 500px;
    margin: 0 auto;
}

.contact-form input,
.contact-form textarea {
    width: 100%;
    margin-bottom: 15px;
    box-sizing: border-box;
}

.contact-form button {
    width: 100%;
}
```

**Oefening 4: Form Styling (5 min)**
Style het contactformulier van Oefening 2b.

---

**🎯 Grote Oefening: Complete Contact Form (10 min)**

**Opdracht:**
Maak een contact formulier met:
- 3 input velden (naam, email, onderwerp)
- 1 textarea (bericht)
- 1 primary button (Verzenden)
- Styled labels, inputs, button
- Focus state op inputs
- Button hover effect

```html
<form class="contact-form">
    <h2>Contact Met Ons</h2>

    <label for="name">Volledige Naam</label>
    <input type="text" id="name" name="name" required>

    <label for="email">Email Adres</label>
    <input type="email" id="email" name="email" required>

    <label for="subject">Onderwerp</label>
    <input type="text" id="subject" name="subject" required>

    <label for="message">Bericht</label>
    <textarea id="message" name="message" rows="5" required></textarea>

    <button type="submit" class="btn btn-primary">Verzenden</button>
</form>
```

Style met:
- Consistent spacing
- Focus states
- Button hover effect
- Professional look

---

### Controlelijst voor Docent
- [ ] Studenten kunnen buttons stylen (3 types minimum)
- [ ] Studenten begrijpen button states (hover, active, disabled)
- [ ] Studenten begrijpen HTML formulierelementen
- [ ] Studenten kunnen forms stylen
- [ ] Studenten begrijpen `<label>` en `for` attribuut
- [ ] Studenten weten verschil tussen input types

### Tips voor Docent
- **Live coding:** Bouw samen een contact form
- **Accessibility:** Benadruk waarom `<label>` belangrijk is
- **DevTools:** Inspecteer formulieren van bekende websites
- **Voorbereiding:** Dit is voorbereiding op Blok 3 (form verwerking)
- **Veelgemaakte fout:** `<label>` vergeten of `for` attribuut niet gekoppeld
- **Veelgemaakte fout:** Buttons/inputs zonder `padding` (zien er klein/smal uit)
- **Veelgemaakte fout:** Geen `:focus` state op inputs (moeilijk om te zien waar je bent)
- **Button/CSS Matching Game:** Print beide sets en laat duo's de juiste matches vinden. Voeg extra "verwarrende" CSS kaarten toe (bijv. `color: red;`, `width: 100%;`) voor extra challenge.

### Resources
- [MDN: HTML Forms](https://developer.mozilla.org/en-US/docs/Learn/Forms)
- [MDN: Form Accessibility](https://developer.mozilla.org/en-US/docs/Learn/Forms/Form_validation)

---
