CREATE DATABASE if NOT EXISTS funrest;

USE funrest;

CREATE TABLE zimmer (
    ZimmerID INT AUTO_INCREMENT PRIMARY KEY,
    Kategorie VARCHAR(50) NOT NULL,
    Preis DECIMAL(10, 2) NOT NULL,
    Typ VARCHAR(50) NOT NULL, -- Einzelzimmer/Doppelzimmer
    Anzahl INT NOT null
);
 
CREATE TABLE gast (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Adresse VARCHAR(255),
    Geschlecht VARCHAR(10),
    Geburtsdatum DATE,
    StammUser BOOLEAN DEFAULT FALSE,
    IsAdmin BOOLEAN DEFAULT FALSE
);
 
-- Tabelle Buchung
CREATE TABLE buchung (
    BuchungID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    ZimmerID INT,
    Buchungsdatum DATE NOT NULL,
    CheckIn DATE NOT NULL,
    CheckOut DATE NOT NULL,
    Kosten DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES gast (UserID),
    FOREIGN KEY (ZimmerID) REFERENCES Zimmer(ZimmerID)
);
 
CREATE TABLE rechnung (
    RechnungsID INT AUTO_INCREMENT PRIMARY KEY,
    BuchungID INT,
    Betrag DECIMAL(10, 2) NOT NULL,
    Erstellungsdatum DATE NOT NULL,
    Zahlungsstatus BOOL NOT NULL,
    FOREIGN KEY (BuchungID) REFERENCES Buchung(BuchungID)
);

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    isAdmin BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE bewertungen (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,  -- Verknüpfung mit der users-Tabelle
    name VARCHAR(100) NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),  -- Bewertung von 1 bis 5 Sterne
    kommentar TEXT NOT NULL,
    is_approved BOOLEAN DEFAULT FALSE,  -- Standardmäßig nicht freigegeben
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

