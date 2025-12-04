-- Skapa databasen
CREATE DATABASE Litenbokhandel;
USE Litenbokhandel;

-- Tabell för böcker
CREATE TABLE Bocker (
	ISBN VARCHAR(100) PRIMARY KEY, -- ISBN används som primärnyckel
    Titel VARCHAR(255) NOT NULL,
    Forfattare VARCHAR(255) NOT NULL,
    Pris DECIMAL(10,2) NOT NULL CHECK (Pris >= 0),
    Lagerstatus INT NOT NULL CHECK (Lagerstatus >= 0)
);
 
-- Tabell för kunder
CREATE TABLE Kunder (
	KundID INT AUTO_INCREMENT PRIMARY KEY,
    Namn VARCHAR(100) NOT NULL,
    Epost VARCHAR(255) NOT NULL UNIQUE, -- Epost bör vara unik
    Telefon VARCHAR(20) NOT NULL,
    Adress VARCHAR(255) NOT NULL
);

-- Tabel för beställningar
CREATE TABLE Bestallningar (
	Ordernummer INT AUTO_INCREMENT PRIMARY KEY,
    KundID INT NOT NULL, -- Främmande nyckel till kunder
    Datum DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Totalbelopp DECIMAL(10,2) NOT NULL CHECK (Totalbelopp >=0),
    FOREIGN KEY (KundID) REFERENCES Kunder (KundID)
);

-- Tabel för orderrader
CREATE TABLE Orderrader (
	OrderradID INT AUTO_INCREMENT PRIMARY KEY,
    Ordernummer INT NOT NULL, -- Främmande nyckel till beställningar
    BokISBN VARCHAR(13) NOT NULL, -- Främmande nyckel till böcker
    Antal INT NOT NULL CHECK (antal > 0),
    Enhetspris DECIMAL(10.2) NOT NULL CHECK (Enhetspris >=0),
	UNIQUE (Ordernummer, BokISBN)
);

INSERT INTO Kunder (Namn, Epost, Telefon, Adress) VALUES
('Karl Marx', 'Karl@email.com', '0725963059', 'Rödavägen2'),
('John Ark', 'John@email.com', '0720538322', 'Blåvägen4'),
('Mike Kock', 'Mike@email.com', '0729231490', 'Gulavägen6');

-- Infogar data i böcker
INSERT INTO Bocker (Titel, ISBN, Forfattare, Pris, Lagerstatus) VALUES
('The Witcher', '95-646-75-87', 'Andrzej Sapkowski', 699.00, 10),
('Dune', '45-646-35-86', 'Frank Herbert', 299.00, 6),
('Star Wars', '25-456-35-85', 'George Lucas', 499.00, 2);

-- Infogar data i beställningar
INSERT INTO Bestallningar (KundID, Datum, Totalbelopp) VALUE
(2, '2025-03-12', 699.00), -- John Ark 1 bok
(3, '2025-06-24', 299.00), -- Mike Kock 1 bok
(1, '2024-11-04', 798.00); -- Karl Marx 2 böker

-- Infogar data i orderrader
INSERT INTO Orderrader (Ordernummer, BokISBN, Antal, Enhetspris) VALUES
(1, '2435', 1, 699.00);

-- Infogar data i orderrader
INSERT INTO Orderrader (Ordernummer, BokISBN, Antal, Enhetspris) VALUES
(2, '9438', 1, 299.00),
(2, '5392', 1, 499.00);

-- Infogar data i orderrader
INSERT INTO Orderrader (Ordernummer, BokISBN, Antal, Enhetspris) VALUES
(3, '9438', 1, 299.00);

-- Hämtar data från de olika tabellerna
SELECT * FROM Bocker;
SELECT * FROM Kunder;
SELECT * FROM Bestallningar;
SELECT * FROM Orderrader;
