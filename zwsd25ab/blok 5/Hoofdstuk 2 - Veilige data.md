# Blok 5 - Hoofdstuk 2 - Veilige data

## Inhoudsopgave

- [Leerdoelen](#leerdoelen)
- [Code verbeteren](#code-verbeteren)
  - [Opdracht 1](#opdracht-1)
- [Htmlspecialchars (XSS)](#htmlspecialchars-xss)
  - [Opdracht 2: XSS demonstreren](#opdracht-2-xss-demonstreren)
  - [Opdracht 3: htmlspecialchars toepassen](#opdracht-3-htmlspecialchars-toepassen)
- [Validatie](#validatie)
  - [Opdracht 4: Validatie bekijken](#opdracht-4-validatie-bekijken)
  - [Opdracht 5: Validatie toepassen](#opdracht-5-validatie-toepassen)
- [Hashing](#hashing)
  - [Opdracht 6: PDO in user_add_process.php](#opdracht-6-pdo-in-user_add_processphp)
  - [Opdracht 7: Wachtwoord hashen](#opdracht-7-wachtwoord-hashen)
  - [Opdracht 8: Wachtwoord verifiëren bij inloggen](#opdracht-8-wachtwoord-verifi%C3%ABren-bij-inloggen)

## Code verbeteren

## Leerdoelen

Na dit hoofdstuk kun je:

- XSS-aanvallen voorkomen met `htmlspecialchars()`
- Formulierinvoer valideren vóór opslag in de database
- Wachtwoorden hashen met `password_hash()` en verifiëren met `password_verify()`

## Code verbeteren

### Opdracht 1

1. Ga verder met het verbeteren van de code door overal PDO te gebruiken.
2. Controleer of de code werkt door alle pagina's te testen die een databaseverbinding hebben.

## Htmlspecialchars (XSS)

Met de functie `htmlspecialchars()` maken we data die we op het scherm tonen veilig.

**Waarom is dit nodig?**
Zonder deze functie kan een aanvaller HTML of JavaScript in een formulier invullen, dat vervolgens door de browser wordt uitgevoerd als code. Dit heet **XSS (Cross-Site Scripting)**. Iemand zou bijvoorbeeld een script kunnen invoeren dat cookies steelt of de pagina omleidt naar een malafide site.

`htmlspecialchars()` zet tekens als `<` en `>` om naar veilige HTML-entiteiten (`&lt;` en `&gt;`). De browser toont ze dan als tekst in plaats van ze als code uit te voeren.

```php
echo htmlspecialchars($tool_name);
```

> Let op: pas `htmlspecialchars()` toe bij het **tonen** van data, niet bij het opslaan. Prepared statements beschermen de database; `htmlspecialchars()` beschermt de browser.

### Opdracht 2: XSS demonstreren

**Stap 1 — HTML injecteren**

1. Maak via het create formulier een nieuwe tool aan met de volgende data:
   - tool_name: `<h1>Hamer van Jupiter</h1>`
   - tool_category: Hamers
   - tool_price: 100
   - tool_brand: Makita
2. Ga naar de pagina waar tools worden getoond. Wat zie je? De `<h1>`-tag wordt door de browser uitgevoerd als HTML — niet als tekst.

**Stap 2 — JavaScript injecteren**

3. Maak een tweede tool aan met de volgende data:
   - tool_name: `<script>alert('XSS! Ik ben gehackt!')</script>`
   - tool_category: Scripts
   - tool_price: 0
   - tool_brand: Hacker
4. Ga naar de pagina waar tools worden getoond. Verschijnt er een pop-up?

   > **Bespreek klassikaal:** Als dit werkt, kan een aanvaller hier elk JavaScript uitvoeren — inclusief code die sessie-cookies steelt en naar een externe server stuurt. De bezoeker van de pagina merkt daar niets van.

   > **Werkt de alert niet?** Sommige browsers blokkeren inline `<script>`-tags. Gebruik dan deze alternatieve payload — die werkt vrijwel altijd:
   >
   > ```
   > <img src=x onerror="alert('XSS via img tag!')">
   > ```
   >
   > De browser probeert de afbeelding `x` te laden, dat mislukt, en voert daarna de `onerror`-handler uit.

5. Dit is een XSS-aanval. We gaan dit oplossen in de volgende opdracht.

### Opdracht 3: htmlspecialchars toepassen

1. Pas overal in de code waar data wordt **getoond** de htmlspecialchars functie toe.

Bijvoorbeeld:

```php
echo htmlspecialchars($data['tool_name']);
echo htmlspecialchars($data['tool_category']);
echo htmlspecialchars($data['tool_price']);
echo htmlspecialchars($data['brand_name']);
```

## Validatie

In deze les gaan we validatie toevoegen aan de applicatie van tools4ever.

Validatie is een belangrijk onderdeel van elke webapplicatie. Het is het proces van controleren of de ingevoerde data voldoet aan de vereisten die we hebben gedefinieerd.

Validatie wordt gebruikt om te voorkomen dat ongeldige data in de database wordt opgeslagen. Dit helpt bij het verbeteren van de data kwaliteit en de betrouwbaarheid van de applicatie.

We hebben al een aantal validaties toegepast in de vorige lessen of er staan ook al validaties in de code. We gaan deze validaties nu verbeteren.

> - Wat gebeurt er bijvoorbeeld als je geen naam invult?
> - Wat gebeurt als je geen prijs invult?

Validatie voorbeeld code kun je vinden in blok 4 **Hoofdstuk 1 - Herhaling, Create en Validatie.** [Link](<../blok%204/backend%20development%20(beo)/Hoofdstuk%201%20-%20Herhaling%2C%20Create%20en%20Validatie.md>)

### Opdracht 4: Validatie bekijken

1. Open het bestand `tool_create_process.php` en bekijk de code.
2. Zoek de plek waar de invoer gevalideerd wordt. Staat er al validatie in?
3. Bedenk samen met de docent welke regels er minimaal moeten gelden:
   - `tool_name`: verplicht, minimaal 2 tekens
   - `tool_price`: verplicht, moet een positief getal zijn
   - `tool_category`: verplicht, mag niet leeg zijn
4. Pas de validatie aan zodat de code aan deze eisen voldoet.

### Opdracht 5: Validatie toepassen

Pas dezelfde validatieregels toe op de overige formulieren in de applicatie:

- `user_add_process.php`: e-mailadres verplicht en geldig formaat (`filter_var($email, FILTER_VALIDATE_EMAIL)`), wachtwoord minimaal 8 tekens
- `brand_create_process.php` (als aanwezig): naam verplicht, minimaal 2 tekens

Controleer per formulier:

1. Wordt elk verplicht veld gecontroleerd op leeg?
2. Wordt de gebruiker teruggestuurd met een foutmelding als de invoer ongeldig is?
3. Wordt er niets opgeslagen als de validatie mislukt?

## Hashing

In deze les gaan we hashing toevoegen aan de applicatie van tools4ever.
Hashing is een proces waarbij een willekeurige tekst wordt omgezet in een unieke tekst. Deze tekst is onomkeerbaar en uniek.
Hashing wordt gebruikt om wachtwoorden veilig op te slaan in de database.

### Opdracht 6: PDO in user_add_process.php

1. Bij het registreren van een nieuwe gebruiker moeten we het wachtwoord hashen.
2. We passen de bestaande code aan zodat de wachtwoord wordt hashed.
3. Dit doen we in het bestand `user_add_process.php`.
4. Heb je de bestaande code al aangepast naar PDO? Heb je dat nog niet gedaan? Pas de code aan zie hieronder.
5. Test de code.

```php

//van mysqli
$sql = "INSERT INTO users (email, password, firstname, lastname, role, address, city, is_active) VALUES ('$email', '$password', '$firstname', '$lastname', '$role', '$address', '$city', '$is_active')";
$result = mysqli_query($conn, $sql);

//naar PDO
$stmt = $conn->prepare("INSERT INTO users (email, password, firstname, lastname, role, address, city, is_active) VALUES (:email, :password, :firstname, :lastname, :role, :address, :city, :is_active)");
$result = $stmt->execute(['email' => $email, 'password' => $password, 'firstname' => $firstname, 'lastname' => $lastname, 'role' => $role, 'address' => $address, 'city' => $city, 'is_active' => $is_active]);

if ($result) {
    $user_id = $conn->lastInsertId(); // haal het ID van de net aangemaakte gebruiker op
    $backgroundColor = $_POST['backgroundColor'];
    $font = $_POST['font'];
    $stmt2 = $conn->prepare("INSERT INTO user_settings (user_id, backgroundColor, font) VALUES (:user_id, :backgroundColor, :font)");
    $result2 = $stmt2->execute(['user_id' => $user_id, 'backgroundColor' => $backgroundColor, 'font' => $font]);
    if ($result2) {
        header("Location: users_index.php");
    }
}
```

Nu gaan we het wachtwoord hashen bij het registreren van een nieuwe gebruiker.

### Opdracht 7: Wachtwoord hashen

1. Wachtwoord hashen bij het registreren/aanmaken van een gebruiker.
2. Voeg onderstaande code toe aan het bestand `user_add_process.php`.

```php
//zet deze code net boven de query
$password = password_hash($password, PASSWORD_DEFAULT);
```

3. Test de code door een nieuwe gebruiker te registreren.

### Opdracht 8: Wachtwoord verifiëren bij inloggen

Een gehashed wachtwoord kan niet worden teruggedraaid — hashing is een eenrichtingsfunctie. Om een inlogpoging te controleren, gebruik je `password_verify()`. Deze functie vergelijkt het ingevoerde wachtwoord met de hash in de database en geeft `true` of `false` terug.

1. Pas het bestand `login_process.php` aan:

```php
<?php
// Haal de gebruiker op uit de database op basis van e-mailadres
$stmt = $conn->prepare("SELECT * FROM users WHERE email = :email");
$stmt->execute(['email' => $email]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

// Verifieer het wachtwoord
if ($user && password_verify($password, $user['password'])) {
    session_start();
    $_SESSION['user'] = $user;
    header('Location: dashboard.php');
    exit;
} else {
    // Toon een foutmelding
    $error = 'Ongeldig e-mailadres of wachtwoord.';
}
?>
```

2. Test door in te loggen met een gebruiker die je in opdracht 7 hebt aangemaakt (wachtwoord is nu gehashed in de database).
