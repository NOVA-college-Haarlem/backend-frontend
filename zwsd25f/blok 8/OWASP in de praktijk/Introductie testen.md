# Introductie testen met PHPUnit

Tot nu toe test je je app door hem in de browser te openen en dingen uit te proberen. Dat werkt, maar je moet het **na elke wijziging opnieuw** doen. Bij tien pagina's en drie soorten gebruikers vergeet je altijd iets.

Een **geautomatiseerde test** is code die je app voor je test. Je schrijft hem één keer, en daarna draai je hem met één commando zo vaak als je wilt.

**Je leert:**
- wat een feature test en een unit test zijn;
- een test lezen en draaien;
- een test schrijven volgens **Arrange, Act, Assert**;
- de belangrijkste `assert`-methodes van Laravel.

---

## Opdracht 1: draai de tests

Open de terminal in LekkerShop en typ:

```bash
php artisan test
```

Je ziet zoiets als:

```
   PASS  Tests\Unit\OrderTest
  ✓ totaal is aantal keer prijs

   PASS  Tests\Feature\WinkelTest
  ✓ de homepage toont producten
  ✓ een verborgen product staat niet op de homepage

  Tests:    3 passed (4 assertions)
```

Drie tests, alle drie **groen**.

## Twee soorten tests

| | Unit test | Feature test |
|---|---|---|
| **Map** | `tests/Unit` | `tests/Feature` |
| **Test** | één klein stukje code, bijvoorbeeld één methode | een hele functie van je app, van route tot view |
| **Database** | nee | ja, een lege testdatabase |
| **Voorbeeld** | klopt `$order->total()`? | ziet een gast de homepage? |
| **Vergelijk het met** | een monteur die één onderdeel van een auto test | een proefrit |

In deze lessen schrijf je vooral **feature tests**. Een lek zit bijna nooit in één methode, maar in hoe route, controller en view samenwerken.

## Opdracht 2: lees een unit test

Open `tests/Unit/OrderTest.php`:

```php
public function test_totaal_is_aantal_keer_prijs(): void
{
    $order = new Order(['quantity' => 3, 'price' => 10.50]);

    $this->assertEquals(31.50, $order->total());
}
```

- De naam van de methode begint met `test_`. Daardoor weet PHPUnit dat dit een test is.
- De naam zegt **wat** er getest wordt. Als de test faalt, weet je meteen wat er kapot is.
- `assertEquals(verwacht, echt)` controleert of twee waarden gelijk zijn.

Open `app/Models/Order.php` en zoek de methode `total()`.

## Opdracht 3: lees een feature test

Open `tests/Feature/WinkelTest.php`:

```php
use RefreshDatabase;

public function test_de_homepage_toont_producten(): void
{
    // Arrange: zet klaar wat je nodig hebt
    Product::factory()->create(['name' => 'Testtoetsenbord']);

    // Act: doe het request
    $response = $this->get('/');

    // Assert: controleer het resultaat
    $response->assertStatus(200);
    $response->assertSee('Testtoetsenbord');
}
```

Elke test heeft drie delen. Ze heten **Arrange, Act, Assert** (AAA):

| Deel | Wat | Hier |
|------|-----|------|
| **Arrange** | Zet de situatie klaar | Een product in de database |
| **Act** | Doe één ding | Open de homepage |
| **Assert** | Controleer de uitkomst | Status 200 en de naam staat op de pagina |

Nog twee nieuwe dingen:

- **`use RefreshDatabase;`** Elke test begint met een **lege** database. Je echte data uit de seeder is er niet. Daarom maak je in Arrange zelf aan wat je nodig hebt.
- **`Product::factory()->create([...])`** Een **factory** maakt een product met nepdata. Alleen wat je meegeeft (hier de `name`) is vast. De factory staat in `database/factories/ProductFactory.php`.

## Opdracht 4: maak een test rood

Een test die altijd groen is, is niets waard. Controleer daarom of de test echt iets test:

1. Verander in `WinkelTest` de regel `assertSee('Testtoetsenbord')` in `assertSee('Bestaat niet')`.
2. Draai `php artisan test`. Lees de foutmelding: welke test faalt, op welke regel, en wat werd er verwacht?
3. Zet de regel terug. Alles weer groen?

> 💡 **Rood is niet erg.** Een rode test vertelt je precies wat er mis is. In deze lessen schrijf je zelfs **expres** eerst een rode test.

## Opdracht 5: schrijf je eerste test

Een verborgen product hoort ook niet op zijn **detailpagina** te staan. In `ProductController@show` staat `abort_if($product->is_hidden, 404)`.

Schrijf in `WinkelTest` een nieuwe test `test_verborgen_product_heeft_geen_detailpagina`:

- **Arrange:** maak een product met `'is_hidden' => true`.
- **Act:** open `'/producten/' . $product->id`.
- **Assert:** de status is `404`.

Draai alleen deze testklasse:

```bash
php artisan test --filter=WinkelTest
```

Groen? Zet dan tijdelijk `//` voor de regel met `abort_if` in de controller. Wordt je test rood? Dan test hij echt iets. Haal de `//` weer weg.

---

## Spiekbrief

### Requests (Act)

| Code | Wat |
|------|-----|
| `$this->get('/url')` | GET-request, zoals een link openen |
| `$this->post('/url', [...])` | formulier versturen |
| `$this->patch('/url', [...])` | bijwerken (`@method('PATCH')`) |
| `$this->actingAs($user)->get(...)` | request als ingelogde gebruiker |

### Controleren (Assert)

| Code | Controleert |
|------|-------------|
| `$response->assertStatus(403)` | HTTP-statuscode |
| `$response->assertSee('tekst')` | tekst staat op de pagina |
| `$response->assertDontSee('tekst')` | tekst staat **niet** op de pagina |
| `$response->assertDontSee('<b>', false)` | idem, maar dan in de ruwe HTML (zonder escapen) |
| `$response->assertSessionHasErrors('veld')` | validatiefout op dit veld |
| `$this->assertGuest()` | niemand is ingelogd |
| `$this->assertEquals(verwacht, echt)` | twee waarden zijn gelijk |
| `$this->assertFalse($waarde)` | waarde is `false` |
| `$model->fresh()` | haalt het model opnieuw op uit de database |

### Commando's

| Commando | Wat |
|----------|-----|
| `php artisan test` | alle tests |
| `php artisan test --filter=Naam` | alleen tests met `Naam` in de klasse of methode |
| `php artisan make:test NaamTest` | nieuwe feature test |
| `php artisan make:test NaamTest --unit` | nieuwe unit test |
