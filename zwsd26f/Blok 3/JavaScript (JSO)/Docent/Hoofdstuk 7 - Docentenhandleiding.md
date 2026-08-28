## Hoofdstuk 7: Formulier-input Lezen & Feedback Tonen - Docentenhandleiding

*Bij: `../Hoofdstuk 7 - Formulier-input Lezen en Feedback Tonen.md` (studentversie)*

**Taakklasse 3 van 3** - Boulder Base contactformulier / eigen variant
**PRIMM-fasen dit hoofdstuk:** Predict → Investigate → Modify

### Waarom deze opzet
Dit hoofdstuk loopt gelijk met FEO Hoofdstuk 7 (site-opmaak, afronding van de tweede eigen variant). Formulieren komen in zwsd26ab pas in Blok 4 uitgebreid aan bod (server-side verwerking); hier gaat het bewust alleen om de **client-side** kant: voorkomen dat de pagina herlaadt, invoer uitlezen, en feedback tonen. Er wordt niets verzonden - dat is een expliciete grens, geen omissie.

### Lesopbouw (90 minuten)

**Predict (10 min)**
Laat studenten het kale contactformulier in `starter-website-2/index.html` bekijken (geen JS eraan gekoppeld). Voorspel wat er gebeurt bij versturen.

**Investigate (25 min) - live coding, AI uit**
Test het kale formulier: de pagina herlaadt (en eventueel springt de URL met `?naam=...`). Vraag: "Is dit wat we willen?"

Introduceer `event.preventDefault()`. Laat het verschil expliciet zien: eerst zónder (pagina herlaadt), dan mét (niets gebeurt zichtbaars, maar de `console.log` verschijnt).

Bespreek kort waarom dit nu al zinvol is, óók zonder server: je kunt de gebruiker meteen feedback geven vóórdat er iets naar een server gestuurd zou worden (vooruitblik naar client-side validatie, die later gecombineerd wordt met server-side validatie in backend-development).

**Modify (45 min) - AI mag, met verantwoording**
Samen `.value` uitlezen en een `if`/`else`-feedback bouwen (link naar Hoofdstuk 4!). Studenten breiden zelfstandig uit met een tweede veldcontrole.

**Afronding (10 min)**
Vragen? Volgend hoofdstuk: eindproject - alles combineren.

### Tips voor docent
- Benoem expliciet de grens van dit hoofdstuk: er wordt niets echt verzonden. Dat voorkomt verwarring bij studenten die verwachten dat er "iets" met de data gebeurt
- Dit is een mooi moment om vooruit te wijzen naar het backend-vak: "wat we hier client-side doen, doe je daar nog een keer server-side - en dat tweede is het echte veiligheidsnet"
- Herhaal `if`/`else` uit Hoofdstuk 4 expliciet - studenten herkennen het sneller dan ze verwachten

### Veelgemaakte fouten
1. `event.preventDefault()` vergeten, waardoor de pagina alsnog herlaadt en de foutmelding meteen weer verdwijnt
2. `.value` vergeten op het input-element (dan krijg je het hele HTML-element in plaats van de tekst)
3. Alleen op lege string controleren en spaties niet meenemen (bonus: `.trim()`, optioneel te introduceren)
4. De `submit`-listener op de knop zetten in plaats van op het `<form>`-element

---
