-- Skapa databasen
CREATE DATABASE Litenbokhandel;
USE Litenbokhandel;

-- Tabell för böcker
CREATE TABLE Bocker (
	ISBN VARCHAR(100) PRIMARY KEY, -- ISBN används som primärnyckel
    Titel VARBINARY(255) NOT NULL,
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
    Adress TEXT NOT NULL -- Adress kan var hur lång som helst
);

-- Tabel för beställningar
CREATE TABLE Bestallnigar (
	Ordernummer INT AUTO_INCREMENT PRIMARY KEY,
    KundID INT NOT NULL, -- Främmande nyckel till kunder
    Datum DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Totalbelopp DECIMAL(10,2) NOT NULL CHECK (Totalbelopp >=0)
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
