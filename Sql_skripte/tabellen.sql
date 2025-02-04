CREATE DATABASE IF NOT EXISTS hotelmanagement;
USE hotelmanagement;

-- Tabelle Hotel

IF not EXISTS
CREATE TABLE Hotel (
    HotelID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Adresse VARCHAR(255) NOT NULL,
    Stadt VARCHAR(100) NOT NULL,
    Sterne INT CHECK (Sterne BETWEEN 1 AND 5)
);

-- Tabelle Zimmer
IF not EXISTS
CREATE TABLE Zimmer (
    ZimmerID INT AUTO_INCREMENT PRIMARY KEY,
    Kategorie VARCHAR(50) NOT NULL,
    Preis DECIMAL(10, 2) NOT NULL,
    Typ VARCHAR(50) NOT NULL,  -- Einzelzimmer/Doppelzimmer
    Verfuegbarkeit BOOLEAN NOT NULL DEFAULT TRUE,
    HotelID INT,
    FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID)
);

-- Tabelle Gast
IF not EXISTS
CREATE TABLE Gast (
    GastID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Adresse VARCHAR(255),
    Geschlecht VARCHAR(10),
    Geburtsdatum DATE,
    Stammgast BOOLEAN DEFAULT FALSE
);

-- Tabelle Buchung
CREATE TABLE Buchung (
    BuchungID INT AUTO_INCREMENT PRIMARY KEY,
    GastID INT,
    ZimmerID INT,
    Buchungsdatum DATE NOT NULL,
    CheckIn DATE NOT NULL,
    CheckOut DATE NOT NULL,
    Kosten DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (GastID) REFERENCES Gast(GastID),
    FOREIGN KEY (ZimmerID) REFERENCES Zimmer(ZimmerID)
);

-- Tabelle Rechnung
IF not EXISTS
CREATE TABLE Rechnung (
    RechnungsID INT AUTO_INCREMENT PRIMARY KEY,
    BuchungID INT,
    Betrag DECIMAL(10, 2) NOT NULL,
    Erstellungsdatum DATE NOT NULL,
    FOREIGN KEY (BuchungID) REFERENCES Buchung(BuchungID)
);

-- Tabelle Bewertung
IF not EXISTS
CREATE TABLE Bewertung (
    BewertungsID INT AUTO_INCREMENT PRIMARY KEY,
    GastID INT,
    HotelID INT,
    Text TEXT,
    SterneBewertung INT CHECK (SterneBewertung BETWEEN 1 AND 5),
    Freigeschaltet BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (GastID) REFERENCES Gast(GastID),
    FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID)
);
