# Frontend Ontwikkeling - Blok 2

## Week 2: Buttons & Interactiviteit

### Algemene Informatie
- **Doelgroep:** MBO-4 studenten (SE & SD)
- **Lesduur:** 90 minuten
- **Voorkennis:** CSS selectoren, box model, :hover
- **Tools:** VS Code, Browser

---

### Leerdoelen
Na deze les kan de student:
- Button basics stylen (padding, border, border-radius, background)
- Hover state implementeren
- Active en disabled states maken
- Verschillende button types toepassen (primary, secondary, danger)
- `cursor: pointer` gebruiken voor betere UX

---

### Lesopbouw (90 minuten)

**1. Introductie: Waarom zijn Buttons Belangrijk? (5 min)**

**Vraag aan de klas:**
"Waar zie je buttons op websites?"
- "Koop Nu" buttons
- "Aanmelden" buttons
- "Verzenden" buttons

Buttons maken websites interactief!

---

**2. Button Basics - Anatomie van een Button (20 min)**

**De Basis Properties:**

```css
.btn {
    /* Tekst */
    color: white;
    font-size: 16px;
    font-weight: bold;

    /* Ruimte */
    padding: 10px 20px;

    /* Rand */
    border: none;
    border-radius: 5px;

    /* Achtergrond */
    background-color: blue;

    /* Cursor */
    cursor: pointer;
}
```

**Samen Doen: Eerste Button (15 min)**

HTML:
```html
<button class="btn">Mijn Eerste Button</button>
```

CSS - Stap voor stap:
```css
.btn {
    color: white;
    background-color: #3498db;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
}
```

Test in browser! Klaar.

---

**3. Button Types: Primary, Secondary, Danger (20 min)**

**Waarom verschillende types?**
- **Primary:** Belangrijkste actie (bijv. "Kopen")
- **Secondary:** Minder belangrijke actie (bijv. "Annuleren")
- **Danger:** Gevaarlijke actie (bijv. "Verwijderen")

**HTML:**
```html
<button class="btn btn-primary">Primary</button>
<button class="btn btn-secondary">Secondary</button>
<button class="btn btn-danger">Danger</button>
```

**CSS:**
```css
/* Basis voor alle buttons */
.btn {
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s;
}

/* Primary - blauw */
.btn-primary {
    background-color: #007bff;
    color: white;
}

.btn-primary:hover {
    background-color: #0056b3;
}

/* Secondary - grijs */
.btn-secondary {
    background-color: #6c757d;
    color: white;
}

.btn-secondary:hover {
    background-color: #545b62;
}

/* Danger - rood */
.btn-danger {
    background-color: #dc3545;
    color: white;
}

.btn-danger:hover {
    background-color: #c82333;
}
```

**Oefening 1 (10 min):**
Maak deze 3 button types. Test de hover effecten!

---

**4. Hover, Active & Disabled States (20 min)**

**Hover State - Als je er overheen gaat:**
```css
.btn-primary:hover {
    background-color: #0056b3;
}
```

**Active State - Als je klikt:**
```css
.btn-primary:active {
    transform: scale(0.98);
}
```

**Disabled State - Button is niet klikbaar:**
```html
<button class="btn btn-primary" disabled>Disabled</button>
```

```css
.btn:disabled {
    background-color: #ccc;
    color: #666;
    cursor: not-allowed;
    opacity: 0.6;
}

.btn:disabled:hover {
    background-color: #ccc;  /* Geen hover effect als disabled */
}
```

**Oefening 2 (10 min):**
```html
<button class="btn btn-primary">Normal</button>
<button class="btn btn-primary" disabled>Disabled</button>
```

Style beide. Zorg dat disabled er anders uitziet.

---

**5. Grote Oefening: Button Set Maken (15 min)**

**Opdracht:**
Maak een HTML pagina met 6 buttons:
- 3 primary buttons (normal, hover, disabled)
- 1 secondary button
- 1 danger button
- 1 button met emoji

```html
<button class="btn btn-primary">✅ Opslaan</button>
<button class="btn btn-primary" disabled>Laden...</button>
<button class="btn btn-secondary">Annuleren</button>
<button class="btn btn-danger">🗑️ Verwijderen</button>
```

Style alles netjes met CSS classes.

---

### Controlelijst voor Docent
- [ ] Studenten kunnen basis button styling toepassen
- [ ] Studenten begrijpen padding/border/border-radius
- [ ] Studenten kunnen :hover toepassen
- [ ] Studenten kunnen :active toepassen
- [ ] Studenten kunnen disabled states stylen
- [ ] Studenten begrijpen cursor: pointer

### Tips voor Docent
- **Live coding:** Bouw samen een button op vanaf basis
- **DevTools:** Laat zien hoe je button styling van andere sites inspecteert
- **Veelgemaakte fout:** `cursor: pointer` vergeten
- **Veelgemaakte fout:** Geen transition voor smooth hover effect
- **Motivatie:** Buttons zijn overal - deze skill is super praktisch!

### Resources
- [MDN: HTML Button Element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/button)
- [CSS Tricks: Button Styling](https://css-tricks.com/)

---
