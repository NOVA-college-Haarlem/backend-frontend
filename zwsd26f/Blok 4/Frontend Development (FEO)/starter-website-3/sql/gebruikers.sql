-- BEO Hoofdstuk 3: gebruikers (klanten en medewerkers)
-- Beide testaccounts hebben het wachtwoord: Welkom123!
-- Het wachtwoord staat NIET leesbaar in de database, alleen als hash.

CREATE TABLE gebruikers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    voornaam VARCHAR(50) NOT NULL,
    achternaam VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    wachtwoord VARCHAR(255) NOT NULL,
    rol ENUM('klant', 'admin') NOT NULL DEFAULT 'klant',
    aangemaakt_op DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO gebruikers (voornaam, achternaam, email, wachtwoord, rol) VALUES
('Sanne', 'de Kok', 'admin@desmaakmakers.nl', '$2y$12$cNt3jo1HrDET.EZBWwpX.etdIDFOtr9GenqjJEbH9ARmYeD3N5xdu', 'admin'),
('Ahmed', 'Bakker', 'ahmed@voorbeeld.nl', '$2y$12$SOLaKxtDlV9wmDYanXXSLeVCBfLnVlZWlDkU4.U9.QfaT/suyhAmq', 'klant');
