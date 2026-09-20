# Eindproject Blok 5 (Hoofdstuk 1 t/m 3)

## Wat is dit?

Dit is het eindproject voor de eerste helft van Blok 5. Je bouwt een complete CRUD-applicatie met een echte opdrachtgever, gebaseerd op de technieken uit **Hoofdstuk 1 (PDO & Prepared Statements)** en **Hoofdstuk 2 (Veilige data)**. **Hoofdstuk 3 (Update)** is optioneel - een mooie uitbreiding als je tijd over hebt, maar niet verplicht om het project af te ronden.

## Thema kiezen

Kies één van de onderstaande zes thema's. Elk thema is een eigen opdrachtgever met een eigen verhaal, maar de technische eisen zijn voor alle zes **exact gelijk** - het maakt voor de moeilijkheidsgraad dus niet uit welk thema je kiest.

1. [Fitness](Fitness.md) - fitnessbedrijf Work4Me
2. [Library Management](Library.md) - bibliotheek De Wijze Uil
3. [Movie Database](Movie.md) - bioscoop De Filmfanaten
4. [Restaurant](Restaurant.md) - restaurant De Gouden Gerechten
5. [Music](Music.md) - muziekwinkel De Notenkraker
6. [Figurines](Figurines.md) - Vocaloid-winkel Vocaloid Vault

## Let op: geen kant-en-klaar databaseontwerp

In het verhaal van de opdrachtgever staan **geen tabellen, kolommen of relaties** genoemd. Dat is met opzet: het bedenken van een passend databaseontwerp is onderdeel van de opdracht. Lees het verhaal goed, en leid er zelf uit af:

- Welke gegevens moet je opslaan?
- Welke tabellen heb je daarvoor nodig?
- Waar zit een **één-op-veel relatie** (verplicht)?
- Waar zou eventueel een **één-op-één relatie** passen (optioneel)?

Twijfel je? Bespreek je ontwerp met de docent vóórdat je gaat bouwen.

## Checklist (Hoofdstuk 1 t/m 3)

**Functionaliteit**

- [ ] Bezoeker kan het aanbod bekijken (overzicht + detailpagina)
- [ ] Lid kan inloggen en uitloggen
- [ ] Lid kan de kernactie van het thema uitvoeren (boeken/reserveren/bestellen/lenen) en de eigen geschiedenis terugzien
- [ ] Medewerker kan inloggen op een afgeschermd beheergedeelte
- [ ] Medewerker kan nieuwe items toevoegen en het overzicht + wie-heeft-wat inzien
- [ ] Optioneel (Hoofdstuk 3): Update-functionaliteit voor minimaal 1 tabel

**Security**

- [ ] Alle queries via PDO met prepared statements - geen variabelen direct in een SQL-string
- [ ] Wachtwoorden gehasht met `password_hash()`, geverifieerd met `password_verify()`
- [ ] Alle getoonde data ge-escaped met `htmlspecialchars()`
- [ ] Formulieren gevalideerd vóór opslag (verplichte velden, juiste vorm)
- [ ] Medewerkerspagina's afgeschermd met een sessie- én rolcheck

**Database-ontwerp**

- [ ] Minimaal 1 één-op-veel relatie aanwezig, en je kan uitleggen waarom je die zo hebt ontworpen
- [ ] (Optioneel) Een één-op-één relatie aanwezig en verantwoord

**Code kwaliteit**

- [ ] Logische naamgeving en gescheiden view/process-bestanden
- [ ] Database connectie in een apart bestand
- [ ] Geen dubbele code

Voor de volledige leerdoelen per week, zie `Blok5_Leerdoelen_Samenvatting.md`.
