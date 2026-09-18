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
