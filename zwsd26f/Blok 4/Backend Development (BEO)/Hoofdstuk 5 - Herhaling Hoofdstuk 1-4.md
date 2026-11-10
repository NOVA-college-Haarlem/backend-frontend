# Hoofdstuk 5 - Herhaling Hoofdstuk 1-4

Halverwege het blok. Eerst de samenvatting, daarna oefenen en code debuggen.

**AI-gebruik:** bij "Debug deze code" **geen AI**. Bij de oefenopdrachten mag AI, maar je moet elke regel kunnen uitleggen.

---

## Samenvatting

### Hoofdstuk 1 - POST en CREATE
- Een formulier met `method="post"` stuurt gegevens onzichtbaar naar de server. De `name` van een veld is de sleutel in `$_POST`.
- Opslaan met `INSERT INTO tabel (kolommen) VALUES (?, ?, ...)` en `mysqli_execute_query($conn, $sql, [waarden])`.
- **Alles van een gebruiker gaat via een `?`**, nooit direct in de SQL.
- Na het opslaan: `header('Location: ...');` en direct `exit;`.
- `header.php` en `footer.php` met `require`: één keer schrijven, overal gebruiken.

### Hoofdstuk 2 - Server-side validatie
- De browser controleert voor het gemak, de server voor de veiligheid. De browser is altijd te omzeilen.
- Formulier en verwerking in één bestand: `if ($_SERVER['REQUEST_METHOD'] === 'POST') { ... }`.
- Fouten in `$fouten['veldnaam']`, tonen onder het veld, alleen opslaan als `count($fouten) === 0`.
- Ingevulde waarden terugzetten met `value="<?php echo htmlspecialchars($titel); ?>"`.
- Handige controles: `trim`, `strlen`, `in_array`, `is_numeric`, `ctype_digit`, `filter_var(..., FILTER_VALIDATE_EMAIL)`, `DateTime::createFromFormat`.
- Bestaat het al? Eerst een `SELECT` met `mysqli_num_rows`, dan pas `INSERT`.

### Hoofdstuk 3 - Registreren
- Wachtwoorden **nooit** leesbaar opslaan: `password_hash($wachtwoord, PASSWORD_DEFAULT)`.
- Een hash is eenrichtingsverkeer; twee keer hashen geeft twee verschillende hashes.
- De rol komt uit de database (standaard `klant`), niet uit het formulier.

### Hoofdstuk 4 - Inloggen en sessions
- Inloggen: gebruiker zoeken op e-mail, dan `password_verify($ingetypt, $hashUitDatabase)`.
- Eén foutmelding voor fout e-mailadres én fout wachtwoord.
- Session: `session_start()` bovenaan, gegevens in `$_SESSION`, uitloggen met `session_destroy()`.
- `session_check.php` (ingelogd?) en `admin_check.php` (rol admin?) bovenaan elke afgeschermde pagina.

---

## Debug deze code

Een student heeft deze inlogpagina geschreven (met hulp van AI). Hij "werkt": met het goede wachtwoord kom je binnen. Er zitten wel **vijf** fouten in, waarvan vier een beveiligingsprobleem zijn. Vind ze, leg per fout uit wat er mis kan gaan, en verbeter de code.

```php
<?php
require 'database.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'];
    $wachtwoord = $_POST['wachtwoord'];

    $result = mysqli_query($conn, "SELECT * FROM gebruikers WHERE email = '$email'");
    $gebruiker = mysqli_fetch_assoc($result);

    if (!$gebruiker) {
        echo "Dit e-mailadres kennen we niet: " . $email;
    } elseif ($gebruiker['wachtwoord'] == $wachtwoord) {
        $_SESSION['gebruiker_id'] = $gebruiker['id'];
        header('Location: account.php');
    } else {
        echo "Fout wachtwoord";
    }
}
?>
```

---

## Oefenopdrachten

### Opdracht 1 - Een nieuwe categorie
De Smaakmakers starten met Franse workshops. Zorg dat een medewerker de categorie "Frans" kan kiezen bij een nieuwe workshop. Op hoeveel plekken moest je iets aanpassen? Kan het met één aanpassing?

### Opdracht 2 - Sterker wachtwoord
Pas `registreren.php` aan: een wachtwoord moet minstens één cijfer bevatten. Tip: `preg_match('/[0-9]/', $wachtwoord)` geeft `1` als er een cijfer in staat. Zet de eis ook in het label, zodat de gebruiker hem vooraf ziet.

### Opdracht 3 - "Lid sinds"
Laat op `account.php` zien sinds wanneer de gebruiker een account heeft: "Lid sinds 10-11-2026". De datum staat in de kolom `aangemaakt_op`. Je weet het `id` van de ingelogde gebruiker uit `$_SESSION`. Gebruik een `SELECT` met een `?`.

### Opdracht 4 - Al ingelogd?
Een ingelogde gebruiker die naar `login.php` of `registreren.php` gaat, heeft daar niets te zoeken. Stuur hem door naar `account.php`.

### Opdracht 5 - Een tweede medewerker
Maak via `registreren.php` een account aan voor een tweede medewerker. Hoe maak je diegene admin? (Er zijn twee manieren: welke is veilig voor een echte website, en waarom is "een vinkje 'ik ben medewerker' in het registratieformulier" dat niet?)

---

## Checklist

- [ ] Workshop toevoegen werkt, alleen voor admin, met validatie per veld
- [ ] Registreren werkt, met hash en uniek e-mailadres
- [ ] Inloggen en uitloggen werken, met één foutmelding
- [ ] Je kunt bij elke `?` in je code uitleggen waarom hij er staat
- [ ] De vijf fouten in "Debug deze code" gevonden en uitgelegd
