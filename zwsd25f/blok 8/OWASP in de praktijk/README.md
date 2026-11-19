# OWASP in de praktijk: LekkerShop

**Klas:** zwsd25f, Blok 8
**Tijd:** 4 lesweken van 2 × 1,5 uur
**Wat je nodig hebt:** Laravel Herd, VS Code met de extensie SQLite Viewer, een GitHub-account in de organisatie

## 📋 Wat ga je doen?

De OWASP Top 10 is de lijst met de tien meest voorkomende beveiligingsproblemen in webapplicaties. Je kunt die lijst uit je hoofd leren, maar dan weet je nog niet hoe zo'n lek er in **jouw** code uitziet.

Daarom krijg je **LekkerShop**: een Laravel-webshop met dingen die je al kent (Breeze, controllers, policies, Eloquent, Blade). In de shop zitten bewust lekken uit alle tien de categorieën. Per lek doe je drie dingen:

1. 🔓 **Hacken:** je misbruikt het lek in de browser.
2. 🧪 **Testen:** je schrijft een test die bewijst dat het lek er is. De test is **rood**.
3. 🔧 **Fixen:** je dicht het lek. De test wordt **groen**.

In de laatste week zoek je dezelfde lekken in je **eigen** app uit blok 6/7. Wat je vindt, gebruik je in het mondeling.

## 🗓️ Planning

| Week | Les 1 | Les 2 | Kaart |
|------|-------|-------|-------|
| 3 | Start, spelregels, [Introductie testen](Introductie%20testen.md) | Kaart 1 samen afmaken, daarna kaart 2 | 1 Toegang (A01), 2 Injectie (A05) |
| **Projectweek** | | | |
| 4 | Kaart 3 | Kaart 4 | 3 Inloggen en loggen (A07, A09), 4 Vertrouw de browser niet (A08, A06) |
| 5 | Kaart 5 | Kaart 5 | 5 Instellingen, versleuteling en fouten (A02, A04, A10) |
| 6 | Kaart 6 deel A + start deel B | Kaart 6 deel B | 6 Andermans code en je eigen app (A03 + audit) |

> ⚠️ Een kaart die in de les niet af is, maak je thuis af. Kaarten worden **op volgorde** afgetekend.

## 🚀 Starten (les 1)

1. Open https://github.com/Nova-College-Haarlem-Students/ZWSD25F---OWASP-Blok-8
2. Klik op **Use this template → Create a new repository**.
3. Kies bij **Owner** de organisatie `Nova-College-Haarlem-Students` (**niet** je eigen account).
4. Repository name: `lekkershop-` met je GitHub-naam erachter, bijvoorbeeld `lekkershop-pietjansen`.
5. Ga naar **Actions**. Klik op de groene knop als die er staat. Ga daarna naar **Kaarten → Run workflow**. Kaart 1 verschijnt bij **Issues**.
6. Volg de README van je nieuwe repository om de shop te installeren.

## ⚠️ Spelregels

- Je valt **alleen LekkerShop** aan, en **alleen op je eigen laptop**.
- Wat je hier leert, probeer je **nooit** op een echte website. Ook "even kijken of het werkt" is strafbaar: computervredebreuk, artikel 138ab Wetboek van Strafrecht.
- Securityspecialisten doen precies dit werk, maar dan **met schriftelijke toestemming** van de eigenaar. Zonder toestemming ben je geen tester maar een inbreker.

## 🧪 Waarom tests?

Een lek dat je hebt gedicht, kan ongemerkt terugkomen. Een collega zet bijvoorbeeld "even" de rate limiting uit, of verandert `{{ }}` in `{!! !!}`. Een test vangt dat op: hij wordt rood zodra het lek terug is. In het bedrijfsleven draaien tests automatisch bij elke push.

Je hebt nog nooit getest? Begin dan bij [Introductie testen](Introductie%20testen.md).

## Hoe hangt dit samen met het mondeling?

Bij het mondeling kan de assessor vragen hoe je je app beveiligd hebt. Met kaart 6 heb je daar een concreet antwoord op: een lek uit je eigen code, de test die het bewijst en de fix. Die leg je uit volgens het WHWA-model uit [Je code mondeling toelichten](../Je%20code%20mondeling%20toelichten.md).
