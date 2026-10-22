-- Boulder Base - lessen
-- Importeer dit bestand via het tabblad SQL in PHPMyAdmin.
--
-- Let op: deze tabel bevat meer kolommen dan er nu op de overzichtspagina
-- (index.php) getoond worden. De kolommen naam, niveau, korte_beschrijving
-- en prijs gebruik je op de overzichtspagina. De overige kolommen
-- (lange_beschrijving, duur_weken, groepsgrootte, instructeur,
-- benodigdheden) gebruik je pas op de detailpagina.

CREATE TABLE lessen (
    id INT AUTO_INCREMENT PRIMARY KEY,
    naam VARCHAR(100) NOT NULL,
    niveau VARCHAR(50) NOT NULL,
    korte_beschrijving VARCHAR(255) NOT NULL,
    prijs DECIMAL(5,2) NOT NULL,
    lange_beschrijving TEXT NOT NULL,
    duur_weken INT NOT NULL,
    groepsgrootte VARCHAR(50) NOT NULL,
    instructeur VARCHAR(100) NOT NULL,
    benodigdheden VARCHAR(255) NOT NULL
);

INSERT INTO lessen
    (naam, niveau, korte_beschrijving, prijs, lange_beschrijving, duur_weken, groepsgrootte, instructeur, benodigdheden)
VALUES
    (
        'Beginnerscursus',
        'Beginner',
        'In 4 weken leer je de basistechnieken.',
        49.00,
        'Je leert de basis van boulderen: veilig vallen, grip zoeken en je eerste routes uitlezen. Ideaal als je nog nooit eerder hebt geklommen.',
        4,
        'Max. 8 personen',
        'Sanne de Boer',
        'Sportkleding. Klimschoenen kun je gratis lenen bij de balie.'
    ),
    (
        'Techniektraining',
        'Gevorderd',
        'Verbeter je grip, balans en routeplanning.',
        59.00,
        'Voor klimmers die de basis al beheersen en gerichter willen trainen op techniek: voetwerk, balans en het vooraf uitlezen van een route.',
        6,
        'Max. 6 personen',
        'Ruben Aksoy',
        'Eigen klimschoenen aanbevolen, sportkleding verplicht.'
    ),
    (
        'Jeugdklim',
        '8-14 jaar',
        'Klimmen op een speelse, veilige manier.',
        39.00,
        'Een speelse kennismaking met boulderen voor kinderen, met extra aandacht voor veiligheid en plezier. Onder begeleiding van een gecertificeerde jeugdinstructeur.',
        4,
        'Max. 10 kinderen',
        'Fenna Willemse',
        'Sportkleding. Klimschoenen worden door de hal geleverd.'
    );

-- Extra lessen voor Blok 3B (filteren en voordelige lessen).
-- Heb je lessen.sql al eerder geïmporteerd? Importeer dan alleen dit INSERT-blok.

INSERT INTO lessen
    (naam, niveau, korte_beschrijving, prijs, lange_beschrijving, duur_weken, groepsgrootte, instructeur, benodigdheden)
VALUES
    (
        'Kennismakingsles',
        'Beginner',
        'Eén les om te ontdekken of boulderen iets voor jou is.',
        15.00,
        'Een losse les van anderhalf uur waarin je de hal leert kennen, een warming-up doet en je eerste makkelijke routes klimt. Perfect om te proberen voordat je een cursus kiest.',
        1,
        'Max. 12 personen',
        'Sanne de Boer',
        'Sportkleding. Klimschoenen zijn inbegrepen.'
    ),
    (
        'Veilig vallen',
        'Beginner',
        'Leer hoe je veilig valt en landt op de mat.',
        25.00,
        'Vallen hoort bij boulderen. In deze korte cursus oefen je hoe je gecontroleerd springt, landt en afrolt, zodat je met meer vertrouwen hoger durft te klimmen.',
        2,
        'Max. 8 personen',
        'Ruben Aksoy',
        'Sportkleding. Klimschoenen kun je gratis lenen bij de balie.'
    ),
    (
        'Krachttraining voor klimmers',
        'Gevorderd',
        'Train vingerkracht en core voor zwaardere routes.',
        65.00,
        'Een trainingsprogramma met hangboard, campusboard en core-oefeningen. Je krijgt een eigen schema mee zodat je ook buiten de lessen gericht kunt trainen.',
        8,
        'Max. 6 personen',
        'Lisa Verhoeven',
        'Eigen klimschoenen verplicht, sportkleding en een handdoek.'
    ),
    (
        'Wedstrijdtraining',
        'Gevorderd',
        'Voorbereiding op je eerste boulderwedstrijd.',
        75.00,
        'Je oefent met wedstrijdroutes onder tijdsdruk, leert routes snel uitlezen en krijgt tips over spanning en rust tijdens een wedstrijd. Afsluiting met een onderlinge wedstrijd in de hal.',
        6,
        'Max. 6 personen',
        'Lisa Verhoeven',
        'Eigen klimschoenen verplicht, sportkleding.'
    ),
    (
        'Jeugdtechniek',
        '8-14 jaar',
        'Voor kinderen die al vaker geklommen hebben.',
        45.00,
        'Een vervolg op Jeugdklim. Kinderen leren betere voetentechniek en moeilijkere routes uitlezen, in kleine groepjes en met veel aandacht voor veiligheid.',
        6,
        'Max. 8 kinderen',
        'Fenna Willemse',
        'Sportkleding. Klimschoenen worden door de hal geleverd.'
    );
