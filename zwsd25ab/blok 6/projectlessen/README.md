# Projectlessen Blok 6: SoleStore

## 📋 Wat ga je doen?

In de theorielessen bouw je de **Spelshop**. Op donderdag (2 × 1,5 uur projectles) bouw je met dezelfde stof een tweede webshop: **SoleStore**, een sneakerwinkel. Iedereen bouwt hetzelfde project, onder begeleiding van de docent.

Het werk is verdeeld over **kaarten**, net als bij een eindproject. Eén kaart per lesweek. Vanaf les 2 staan de kaarten als **Issue** in je repository op GitHub. Een kaart is pas af als de docent hem heeft **afgetekend**.

> 🔄 **Les 2:** begin met [Overstap naar GitHub-kaarten](Overstap%20naar%20GitHub-kaarten.md). Je verhuist je project naar de organisatie en krijgt daarna je kaarten als Issue.

Zo zie je in de projectweek of je de stof echt zelf kunt toepassen. Daar krijg je namelijk een **ander** project, zonder begeleiding.

## 🗓️ Planning

| Week | Theorie | Projectles | Kaart |
|------|---------|------------|-------|
| 1 | H1–H3: setup, producten, detailpagina | donderdag | [Kaart 1 – Fundament](Kaart%201%20-%20Fundament.md) |
| 2 | H4–H6: layout, relaties, nieuwe entiteiten | donderdag | Kaart 2 – Datamodel |
| 3 | H7: CRUD en validatie | donderdag | Kaart 3 – Beheer |
| **Projectweek A** | | | [Eindproject 6A](../eindprojecten%206A/Eindproject%20Blok%206A.md) + mondeling |
| 4 | H8: authenticatie en middleware | donderdag | Kaart 4 – Toegang |
| 5 | H9: reviews en policies | donderdag | Kaart 5 – Reviews |
| 6 | H10–H11: bestellingen, FormRequests | donderdag | Kaart 6 – Bestellen |
| **Projectweek B** | | | [Eindproject 6B](../eindprojecten%206B/Eindproject%20Blok%206B.md), mondeling de week erna |

> ⚠️ Een kaart die op donderdag niet af is, maak je thuis af. Je laat hem de **volgende** projectles als eerste aftekenen. Kaarten worden **op volgorde** afgetekend. Je mag vooruitwerken.

---

## 🗣️ Het verhaal van de opdrachtgever

*Gesprek met Jayden Mulder, eigenaar van SoleStore:*

"We verkopen sneakers van verschillende **merken**: Nike, Adidas, New Balance, Asics en nog een paar kleinere. Van elk merk willen we de naam, het land waar het vandaan komt en een korte beschrijving laten zien.

Van elke **sneaker** tonen we de naam, het merk, de kleurstelling, het jaar waarin hij uitkwam en een beschrijving. Een sneaker hoort altijd bij één merk.

Prijzen veranderen nogal eens, bijvoorbeeld in de sale. We willen dus niet alleen de huidige **prijs** weten, maar ook vanaf wanneer een prijs geldt. Dan kunnen we later terugzien hoe de prijs veranderd is.

Klanten maken een account aan. Daarna kunnen ze een **review** schrijven over een sneaker: een cijfer van 1 tot 5 en een stukje tekst. Een klant mag alleen zijn eigen review verwijderen.

Klanten kunnen ook **bestellen**. In een bestelling kunnen meerdere sneakers zitten, elk met een aantal. In een oude bestelling moet altijd blijven staan wat de klant **toen** betaald heeft, ook als wij de prijs later aanpassen. Een klant kan een bestelling annuleren.

Wij als medewerkers zijn **admin**: wij voegen sneakers toe, passen ze aan en verwijderen ze. Een gewone klant mag dat natuurlijk niet."

> 💡 Herken je het? SoleStore heeft precies dezelfde opbouw als de Spelshop: merk = categorie, sneaker = product. Leg het ERD van de Spelshop ernaast als je vastloopt.

---

## ✍️ Aftekenen: zo werkt het

1. Je leest de kaart bij **Issues** in je repository en werkt hem af. Controleer zelf alle punten onder **Aftekencriteria**.
2. Push je laatste commit en typ `/klaar` als reactie op de kaart. Je komt in de wachtrij van de docent. Onder je reactie verschijnt een overzicht van je commits voor deze kaart.
3. Je laat de docent je werk zien. Dat is een **demo**: je laat het in de browser werken.
4. De docent stelt een **uitlegvraag** over je eigen code. Kun je die niet beantwoorden, dan wordt de kaart niet afgetekend.
5. Goed? De docent sluit de kaart en de volgende kaart verschijnt. Nog niet goed? Je krijgt feedback op de kaart. Pas aan en typ opnieuw `/klaar`.

## 💾 Commits

Elke commit begint met het nummer van de kaart waar je aan werkt:

```
K1: voeg Brand model en migration toe
K1: toon sneakers op de merkpagina
K3: valideer prijs bij opslaan sneaker
```

- Commit **klein en vaak**: minimaal na elke stap die werkt.
- Bij elke push controleert GitHub of je commitberichten met een kaartnummer beginnen (tabblad **Actions**).
- Als je `/klaar` typt, ziet de docent per kaart hoeveel commits je hebt gemaakt, welke geen kaartnummer hebben en welke heel groot zijn.
- Eén grote commit aan het eind van de week wordt **niet** afgetekend. Dan kan de docent niet zien hoe je werk is ontstaan.

## 🤖 AI-gebruik

- Je mag AI gebruiken voor testdata in je seeders.
- Gebruik je AI voor code, dan moet je die code bij het aftekenen kunnen uitleggen. Lukt dat niet, dan wordt de kaart niet afgetekend.
