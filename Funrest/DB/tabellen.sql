CREATE DATABASE IF NOT EXISTS hotelmanagement;
USE hotelmanagement;



-- Tabelle Zimmer
CREATE TABLE Zimmer (
    ZimmerID INT AUTO_INCREMENT PRIMARY KEY,
    Kategorie VARCHAR(50) NOT NULL,
    Preis DECIMAL(10, 2) NOT NULL,
    Typ VARCHAR(50) NOT NULL,  -- Einzelzimmer/Doppelzimmer
    Verfuegbarkeit BOOLEAN NOT NULL DEFAULT TRUE
);

-- Tabelle User
CREATE TABLE User (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Adresse VARCHAR(255),
    Geschlecht VARCHAR(10),
    Geburtsdatum DATE,
    StammUser BOOLEAN DEFAULT FALSE,
    IsAdmin BOOLEAN DEFAULT FALSE
);

-- Tabelle Login
CREATE TABLE Login (
	LoginID INT AUTO_INCREMENT PRIMARY KEY, 
	EMail VARCHAR(255),
	Passwort VARCHAR(255),
	UserID INT,
	FOREIGN KEY (UserID) REFERENCES USER(UserID)
);

-- Tabelle Buchung
CREATE TABLE Buchung (
    BuchungID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    ZimmerID INT,
    Buchungsdatum DATE NOT NULL,
    CheckIn DATE NOT NULL,
    CheckOut DATE NOT NULL,
    Kosten DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (ZimmerID) REFERENCES Zimmer(ZimmerID)
);

-- Tabelle Rechnung
CREATE TABLE Rechnung (
    RechnungsID INT AUTO_INCREMENT PRIMARY KEY,
    BuchungID INT,
    Betrag DECIMAL(10, 2) NOT NULL,
    Erstellungsdatum DATE NOT NULL,
    FOREIGN KEY (BuchungID) REFERENCES Buchung(BuchungID)
);

-- Tabelle Bewertung
CREATE TABLE Bewertung (
    BewertungsID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    Text TEXT,
    SterneBewertung INT CHECK (SterneBewertung BETWEEN 1 AND 5),
    Freigeschaltet BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);
