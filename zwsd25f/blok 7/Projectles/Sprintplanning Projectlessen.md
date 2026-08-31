# Sprintplanning Projectlessen (Scrum)

## Overzicht

De projectlessen van Blok 7 zijn opgezet volgens Scrum: tweetallen werken in wekelijkse sprints aan één van de vijf projecten (zie de losse projectbeschrijvingen in deze map, elk met een eigen sprintbacklog onderaan). De totale projectfase duurt **8 weken**:

| Week | Type | Inhoud |
|---|---|---|
| 1 | Sprint 1 | MVP-basis: registreren/inloggen, kernfunctionaliteit voor de "gewone" gebruiker |
| 2 | Sprint 2 | Functionaliteit voor de tweede rol (medewerker/coördinator): overzicht, filteren, toewijzen, status bijwerken |
| 3 | Sprint 3 | Beheerfunctionaliteit (derde rol): categorieën/locaties/gebruikers beheren |
| 4 | **Projectweek 1** | Extra projecturen (geen nieuwe stof) + **tussentijds assessment** |
| 5 | Sprint 4 | Overzichten/statistieken + verfijning van bestaande functionaliteit |
| 6 | Sprint 5 | Bonusfunctionaliteit (uit de "Bonusfunctionaliteit"-lijst van het eigen project) |
| 7 | Sprint 6 | Kwaliteit & afronding: testen, autorisatie controleren, code opschonen, documenteren |
| 8 | **Projectweek 2** | Extra projecturen + eindoplevering, demo en beoordeling (zie `Rubric Projectlessen Blok 7.md`) |

Zie `Scrum Introductie.md` voor de les die hieraan voorafgaat (begrippen, rollen, ceremonies, taakbord).

---

## Waarom deze opbouw?

- **Sprint 1-3** volgen bewust de rolstructuur die in elke projectbeschrijving al staat (gebruiker → medewerker/coördinator → beheerder). Dat is een natuurlijke, oplopende complexiteit: eerst het simpelste pad (iemand kan iets aanmaken en zien), dan de workflow eromheen, dan het beheer.
- **Projectweek 1** na Sprint 3 is een bewust rustpunt: teams die zijn achtergelopen krijgen extra uren om bij te komen, en het tussentijds assessment (zie hieronder) geeft iedereen - ook teams die goed op schema liggen - een moment om individueel te laten zien dat ze hun eigen code begrijpen, ruim vóór de eindbeoordeling.
- **Sprint 4-6** bouwen voort op een werkende basis: overzichten/statistieken, bonusfunctionaliteit, en een "hardening sprint" (kwaliteit, testen, opschonen) - precies de volgorde waarin professionele teams een MVP uitbreiden.
- **Projectweek 2** is de eindoplevering: geen nieuwe backlog-items, alleen afronden, testen en de demo voorbereiden.

---

## Sprintritme (elke sprintweek)

| Moment | Ceremonie | Duur |
|---|---|---|
| Start van de week | Sprint Planning | ~15 min |
| Elke werksessie | Daily stand-up (3 vragen) | ~5 min |
| Eind van de week | Sprint Review (demo aan docent) | ~10 min per team |
| Direct na de Review | Sprint Retrospective | ~5 min |

**Sprint Review-aanpak voor de docent:** loop per team kort langs, laat de user stories van deze sprint live zien (niet alleen code, ook de UI), en stel bij twijfel een korte verantwoordingsvraag ("waarom staat deze logica in de controller?"). Dit is een goede vroege indicator voor wie moeite heeft met begrip, ruim vóór de eindbeoordeling.

---

## Tussentijds assessment (Projectweek 1, na Sprint 3)

Een **kort, formatief** (niet meetellend voor het eindcijfer) individueel gesprek van ~5 minuten per student, bedoeld om op tijd bij te sturen - niet om te beoordelen.

**Opzet:**
1. **Demo (1 min):** student laat zien wat er tot nu toe werkt.
2. **Eén verantwoordingsvraag (2 min):** docent wijst een willekeurige regel code aan uit wat déze student heeft gebouwd - "wat doet dit, en waarom staat het hier?"
3. **Reflectie (2 min):** Wat ging in de eerste drie sprints goed? Waar liep je tegenaan? Wat neem je mee naar de volgende sprints?

**Waarom individueel, ook al is het teamwerk?** Bij tweetallen bestaat het risico dat één teamlid de kar trekt en de ander onvoldoende begrip opbouwt. Een individuele check na 3 sprints - in plaats van pas bij de eindbeoordeling - geeft ruimte om dat nog bij te sturen.

**Uitkomst:** geen cijfer, wel een kort mondeling of schriftelijk signaal per student: "op schema" / "let op: verdiep je in [x] vóór de eindbeoordeling".

---

## Taakverdeling en het taakbord

Elk team houdt een taakbord bij in GitHub Projects (zie `Scrum Introductie.md` §4). Bij de Sprint Review checkt de docent kort:
- Staan de stories van deze sprint op `Done`?
- Zijn er commits van **beide** teamleden zichtbaar in de repository-geschiedenis? (Zie ook criterium 6 "GitHub & Samenwerking" in de eindrubric.)

---

## Relatie met de eindbeoordeling

De sprintstructuur is de **werkwijze**, de eindbeoordeling blijft `Rubric Projectlessen Blok 7.md` (6 criteria, 18 punten). Het tussentijds assessment telt daar niet in mee, maar een team dat de sprints goed heeft doorlopen (werkende functionaliteit per sprint, taakbord bijgehouden, individueel begrip aangetoond) zal op de meeste criteria vanzelf beter scoren - met name **Functionele Eisen**, **Code Begrip & MVC**, en **GitHub & Samenwerking**.
