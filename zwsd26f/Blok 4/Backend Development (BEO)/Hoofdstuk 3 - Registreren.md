# Hoofdstuk 3 - Registreren

Iedereen kan nu `workshop_create.php` openen en workshops toevoegen. Dat moet natuurlijk alleen een medewerker kunnen. Daarvoor hebben we **gebruikers** nodig, die kunnen inloggen (Hoofdstuk 4). Dit hoofdstuk: gebruikers die zelf een account aanmaken.

## Leerdoelen

Na dit hoofdstuk kun je:
- Een registratieformulier maken met server-side validatie (zoals in Hoofdstuk 2)
- Controleren of een e-mailadres al in gebruik is
- Een wachtwoord veilig opslaan met `password_hash`
- Uitleggen waarom een wachtwoord nooit leesbaar in de database mag staan

**AI-gebruik:** bij de vragen (Onderzoek) **geen AI**. Bij de opdrachten mag AI, maar je moet elke regel kunnen uitleggen.

---

### Opdracht 1 - De tabel gebruikers

1. Importeer `sql/gebruikers.sql` in phpMyAdmin (tabblad SQL, plakken, Starten)
2. Bekijk de tabel en de structuur

**Onderzoek:**
- Welke kolommen zijn er? Welke zijn verplicht?
- De kolom `email` is `UNIQUE`. Wat betekent dat?
- De kolom `rol` is een `ENUM('klant', 'admin')`. Wat kan er wel en niet in?
- Bekijk de kolom `wachtwoord`. Beide testaccounts hebben het wachtwoord `Welkom123!`. Wat staat er in de database?

### Onderzoek - Wat is een hash?

Een **hash** is een soort vingerafdruk van een tekst. Je kunt van een wachtwoord een hash maken, maar je kunt van een hash **niet** terugrekenen naar het wachtwoord.

Maak een tijdelijk bestand `test.php`:
```php
<?php
echo password_hash('Welkom123!', PASSWORD_DEFAULT);
echo '<br>';
echo password_hash('Welkom123!', PASSWORD_DEFAULT);
```
- Open het in de browser en ververs een paar keer. Zijn de twee hashes hetzelfde? Veranderen ze?
- Hoe kun je dan ooit controleren of iemand het goede wachtwoord intypt? Probeer:
```php
$hashUitDeDatabase = '$2y$12$cNt3jo1HrDET.EZBWwpX.etdIDFOtr9GenqjJEbH9ARmYeD3N5xdu';
var_dump(password_verify('Welkom123!', $hashUitDeDatabase));
var_dump(password_verify('welkom123!', $hashUitDeDatabase));
```

> Bij een **datalek** komt de hele database op straat. Staan wachtwoorden er leesbaar in, dan kan iedereen inloggen. En omdat mensen hetzelfde wachtwoord vaak overal gebruiken, ook op hun mail en hun bank. Met een hash zien ze alleen onleesbare tekens.

Verwijder `test.php` daarna.

### Opdracht 2 - Het formulier

Maak `registreren.php` met dezelfde opzet als `workshop_create.php` uit Hoofdstuk 2: PHP bovenaan, formulier dat naar zichzelf stuurt, fout per veld, waarden terugzetten.

Velden:
| Veld | `name` | Type | Let op |
|---|---|---|---|
| Voornaam | `voornaam` | `text` | `autocomplete="given-name"` |
| Achternaam | `achternaam` | `text` | `autocomplete="family-name"` |
| E-mailadres | `email` | `email` | `autocomplete="email"` |
| Wachtwoord | `wachtwoord` | `password` | `autocomplete="new-password"`, `minlength="8"` |
| Herhaal wachtwoord | `wachtwoord_herhaal` | `password` | `autocomplete="new-password"` |

> Zet het wachtwoord **niet** terug in het formulier na een fout (geen `value`). Waarom niet?

### Opdracht 3 - De controles

Schrijf de controles in het PHP-blok bovenaan:

1. Voornaam en achternaam zijn niet leeg (na `trim`)
2. E-mail is geldig: `filter_var($email, FILTER_VALIDATE_EMAIL)`
3. E-mail is nog niet in gebruik. Gebruik hetzelfde patroon als bij de titel in Hoofdstuk 2:
```php
$result = mysqli_execute_query($conn, "SELECT id FROM gebruikers WHERE email = ?", [$email]);
if (mysqli_num_rows($result) > 0) {
    $fouten['email'] = 'Er bestaat al een account met dit e-mailadres.';
}
```
4. Wachtwoord is minstens 8 tekens
5. De twee wachtwoorden zijn hetzelfde

Test: registreer met `ahmed@voorbeeld.nl`. Wat zie je?

### Opdracht 4 - Opslaan met een hash

Als er geen fouten zijn:
```php
if (count($fouten) === 0) {
    $hash = password_hash($wachtwoord, PASSWORD_DEFAULT);

    mysqli_execute_query(
        $conn,
        "INSERT INTO gebruikers (voornaam, achternaam, email, wachtwoord) VALUES (?, ?, ?, ?)",
        [$voornaam, $achternaam, $email, $hash]
    );

    header('Location: registreren.php?gelukt=1');
    exit;
}
```

Toon boven het formulier een melding als het gelukt is:
```php
<?php if (isset($_GET['gelukt'])): ?>
    <p>Je account is aangemaakt!</p>
<?php endif; ?>
```

**Onderzoek:**
- Registreer jezelf. Hoe ziet je wachtwoord eruit in phpMyAdmin?
- In de `INSERT` staat geen `rol`. Welke rol krijg je? Waar komt die vandaan?
- Voeg in DevTools een veld toe aan het formulier: `<input name="rol" value="admin">`. Registreer opnieuw (ander e-mailadres). Ben je nu admin? Waarom niet?

### Huiswerk

1. `registreren.php` controleert alle velden en toont fouten bij het juiste veld
2. Een bestaand e-mailadres wordt tegengehouden
3. Nieuwe accounts staan in de database met een hash als wachtwoord
4. Leg in je eigen woorden uit: wat is het verschil tussen het wachtwoord versleutelen en hashen? Waarom kiezen we voor hashen?
