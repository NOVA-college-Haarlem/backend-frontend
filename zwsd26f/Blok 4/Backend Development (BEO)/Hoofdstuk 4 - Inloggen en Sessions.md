# Hoofdstuk 4 - Inloggen en Sessions

Gebruikers kunnen een account maken. Nu gaan ze inloggen, en zorgen we dat alleen een **medewerker** (rol `admin`) workshops kan beheren.

## Leerdoelen

Na dit hoofdstuk kun je:
- Een inlogformulier maken dat het wachtwoord controleert met `password_verify`
- Uitleggen wat een session is, en `session_start()` en `$_SESSION` gebruiken
- Pagina's afschermen voor niet-ingelogde gebruikers (`session_check.php`)
- Pagina's afschermen voor gebruikers zonder de juiste rol (`admin_check.php`)
- Een gebruiker laten uitloggen
- Uitleggen waarom een inlogfout niet verklapt of het e-mailadres bestaat

**AI-gebruik:** bij de vragen (Onderzoek) **geen AI**. Bij de opdrachten mag AI, maar je moet elke regel kunnen uitleggen.

**Testaccounts** (wachtwoord van allebei: `Welkom123!`):
| E-mail | Rol |
|---|---|
| `admin@desmaakmakers.nl` | admin |
| `ahmed@voorbeeld.nl` | klant |

---

### Wat is een session?

Elke keer dat je een pagina opent, is dat voor de server een nieuw verzoek. De server **vergeet** alles tussen twee verzoeken. Hoe weet hij dan dat jij net bent ingelogd?

Met een **session**: de server bewaart gegevens over jou, en je browser krijgt een cookie met een sessie-ID. Bij elk volgend verzoek stuurt je browser dat ID mee, en de server weet weer wie je bent.

```php
session_start();                          // altijd eerst, bovenaan
$_SESSION['voornaam'] = 'Sanne';          // iets bewaren
echo $_SESSION['voornaam'];               // op een andere pagina weer lezen
```

### Opdracht 1 - Het inlogformulier

Maak `login.php`. Zelfde opzet als in Hoofdstuk 2 en 3:

```php
<?php
session_start();
require 'database.php';

$fout  = '';
$email = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email      = trim($_POST['email'] ?? '');
    $wachtwoord = $_POST['wachtwoord'] ?? '';

    $result    = mysqli_execute_query($conn, "SELECT * FROM gebruikers WHERE email = ?", [$email]);
    $gebruiker = mysqli_fetch_assoc($result);

    if ($gebruiker && password_verify($wachtwoord, $gebruiker['wachtwoord'])) {
        session_regenerate_id(true);

        $_SESSION['gebruiker_id'] = $gebruiker['id'];
        $_SESSION['voornaam']     = $gebruiker['voornaam'];
        $_SESSION['email']        = $gebruiker['email'];
        $_SESSION['rol']          = $gebruiker['rol'];

        header('Location: account.php');
        exit;
    }

    $fout = 'E-mailadres of wachtwoord is onjuist.';
}

$paginatitel = 'Inloggen';
require 'header.php';
?>
```

Maak daaronder het formulier zelf: e-mail (`autocomplete="email"`) en wachtwoord (`type="password"`, `autocomplete="current-password"`). Toon `$fout` boven het formulier als die niet leeg is, en zet het e-mailadres terug na een fout.

**Onderzoek:**
- Wat geeft `mysqli_fetch_assoc` als er **geen** gebruiker met dit e-mailadres is? (Tip: `var_dump($gebruiker);`)
- Waarom staat er `$gebruiker &&` vóór `password_verify`?
- Er is maar één foutmelding, voor een onbekend e-mailadres én voor een fout wachtwoord. Waarom? Wat zou een hacker kunnen doen als de melding "Dit e-mailadres is onbekend" was?
- `session_regenerate_id(true)` geeft je na het inloggen een nieuw sessie-ID. Dat voorkomt dat iemand een sessie-ID kan "klaarzetten" voordat je inlogt. Je hoeft dit niet uit je hoofd te kennen, wel dat het er hoort.

### Opdracht 2 - De accountpagina

Maak `account.php`:
```php
<?php
require 'session_check.php';

$paginatitel = 'Mijn account';
require 'header.php';
?>

<h1>Welkom, <?php echo htmlspecialchars($_SESSION['voornaam']); ?>!</h1>

<?php if ($_SESSION['rol'] === 'admin'): ?>
    <h2>Beheer</h2>
    <ul>
        <li><a href="workshops_overzicht.php">Workshops beheren</a></li>
        <li><a href="workshop_create.php">Nieuwe workshop</a></li>
    </ul>
<?php endif; ?>

<?php require 'footer.php'; ?>
```

### Opdracht 3 - De poortwachters

`session_check.php`: alleen voor ingelogde gebruikers.
```php
<?php
session_start();

if (!isset($_SESSION['gebruiker_id'])) {
    header('Location: login.php');
    exit;
}
```

`admin_check.php`: alleen voor medewerkers.
```php
<?php
require 'session_check.php';

if ($_SESSION['rol'] !== 'admin') {
    http_response_code(403);
    echo 'Deze pagina is alleen voor medewerkers. <a href="account.php">Terug naar je account</a>';
    exit;
}
```

Zet bovenaan `workshops_overzicht.php` en `workshop_create.php`, als **eerste** regel na `<?php`:
```php
require 'admin_check.php';
```

**Test:**
1. Niet ingelogd → open `workshop_create.php`. Waar kom je uit?
2. Inloggen als `ahmed@voorbeeld.nl` → open `workshop_create.php`. Wat zie je?
3. Inloggen als admin → werkt alles?

**Onderzoek:**
- Waarom staat `exit` na `header('Location: ...')`? Haal hem eens weg in `session_check.php` en open `workshop_create.php` zonder in te loggen. Kijk in DevTools → Network → Response van het verzoek: wat stuurt de server toch mee?
- Waarom moet `require 'admin_check.php';` helemaal bovenaan staan, en niet halverwege de pagina?

### Opdracht 4 - Uitloggen

`logout.php`:
```php
<?php
session_start();
session_destroy();

header('Location: login.php');
exit;
```

### Opdracht 5 - Een slimme navigatie

Pas de `<nav>` in `header.php` aan:
```php
<nav>
    <a href="index.html">Website</a>
    <?php if (isset($_SESSION['gebruiker_id'])): ?>
        <a href="account.php">Mijn account</a>
        <a href="logout.php">Uitloggen</a>
    <?php else: ?>
        <a href="login.php">Inloggen</a>
        <a href="registreren.php">Registreren</a>
    <?php endif; ?>
</nav>
```

> **Regel:** de header kan alleen `$_SESSION` lezen als de session gestart is. Elke PHP-pagina begint dus met `session_start();` of met `require 'session_check.php';` / `require 'admin_check.php';` (die starten de session zelf). Zet `session_start();` bovenaan `registreren.php`.

Pas in `registreren.php` de doorverwijzing aan, zodat een nieuwe gebruiker meteen kan inloggen:
```php
header('Location: login.php?geregistreerd=1');
```
En toon in `login.php` de melding "Je account is aangemaakt. Je kunt nu inloggen." als `$_GET['geregistreerd']` bestaat.

Voeg in `index.html` een link "Inloggen" toe aan de navigatie.

### Huiswerk

1. Inloggen, uitloggen en registreren werken samen
2. Een klant kan geen workshops beheren, een niet-ingelogde bezoeker wordt naar `login.php` gestuurd
3. Leg uit: wat bewaart de server in een session, en wat bewaart de browser?
