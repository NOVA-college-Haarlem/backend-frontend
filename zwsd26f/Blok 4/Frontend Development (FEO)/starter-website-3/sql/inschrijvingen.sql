-- BEO Hoofdstuk 6: inschrijvingen, gekoppeld aan workshops
-- Let op: importeer eerst workshops.sql (de foreign key verwijst naar workshops.id)

CREATE TABLE inschrijvingen (
    id INT AUTO_INCREMENT PRIMARY KEY,
    workshop_id INT NOT NULL,
    naam VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefoon VARCHAR(20),
    aantal INT NOT NULL,
    dieet VARCHAR(20) NOT NULL DEFAULT 'geen',
    opmerking TEXT,
    aangemaakt_op DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (workshop_id) REFERENCES workshops(id)
);

INSERT INTO inschrijvingen (workshop_id, naam, email, telefoon, aantal, dieet, opmerking) VALUES
(1, 'Lisa Jansen', 'lisa@voorbeeld.nl', '0612345678', 2, 'geen', NULL),
(1, 'Mohamed el Amrani', 'mohamed@voorbeeld.nl', NULL, 1, 'vegetarisch', NULL),
(2, 'Ahmed Bakker', 'ahmed@voorbeeld.nl', '0687654321', 4, 'geen', 'Glutenvrij graag'),
(2, 'Emma de Groot', 'emma@voorbeeld.nl', NULL, 2, 'geen', NULL),
(2, 'Tom Visser', 'tom@voorbeeld.nl', NULL, 4, 'geen', NULL),
(3, 'Fatima Yilmaz', 'fatima@voorbeeld.nl', '0611122233', 1, 'veganistisch', NULL),
(3, 'Daan Smit', 'daan@voorbeeld.nl', NULL, 3, 'geen', 'Notenallergie'),
(4, 'Noor Hendriks', 'noor@voorbeeld.nl', NULL, 2, 'vegetarisch', NULL),
(6, 'Lisa Jansen', 'lisa@voorbeeld.nl', '0612345678', 1, 'geen', NULL),
(6, 'Ahmed Bakker', 'ahmed@voorbeeld.nl', NULL, 3, 'geen', NULL);
