-- BEO Hoofdstuk 1: de workshops in de database
-- Dezelfde gegevens als data/workshops.json

CREATE TABLE workshops (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titel VARCHAR(100) NOT NULL,
    categorie VARCHAR(50) NOT NULL,
    datum DATE NOT NULL,
    prijs DECIMAL(6,2) NOT NULL,
    plekken INT NOT NULL DEFAULT 0
);

INSERT INTO workshops (titel, categorie, datum, prijs, plekken) VALUES
('Verse pasta maken', 'Italiaans', '2026-12-05', 45.00, 8),
('Sushi voor beginners', 'Aziatisch', '2026-12-12', 55.00, 0),
('Brood bakken', 'Bakken', '2026-12-19', 39.50, 4),
('Vegetarisch kerstdiner', 'Vegetarisch', '2026-12-20', 65.00, 10),
('Thaise curry''s', 'Aziatisch', '2027-01-09', 49.00, 6),
('Taarten en gebak', 'Bakken', '2027-01-16', 42.50, 2);
