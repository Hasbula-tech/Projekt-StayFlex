-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server-Version:               10.4.28-MariaDB - mariadb.org binary distribution
-- Server-Betriebssystem:        Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Exportiere Datenbank-Struktur für funrest
CREATE DATABASE IF NOT EXISTS `funrest` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `funrest`;

-- Exportiere Struktur von Tabelle funrest.buchungen_tisch
CREATE TABLE IF NOT EXISTS `buchungen_tisch` (
  `Buchungen_TischID` int(11) NOT NULL AUTO_INCREMENT,
  `TischID` int(11) DEFAULT NULL,
  `KundeID` int(11) DEFAULT NULL,
  `MitarbeiterID` int(11) DEFAULT NULL,
  `Zeitpunkt` datetime DEFAULT NULL,
  `Stoniert` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Buchungen_TischID`),
  KEY `TischID` (`TischID`),
  KEY `KundeID` (`KundeID`),
  KEY `MitarbeiterID` (`MitarbeiterID`),
  CONSTRAINT `buchungen_tisch_ibfk_1` FOREIGN KEY (`TischID`) REFERENCES `restaurant_tische` (`TischID`),
  CONSTRAINT `buchungen_tisch_ibfk_2` FOREIGN KEY (`KundeID`) REFERENCES `kunde` (`KundeID`),
  CONSTRAINT `buchungen_tisch_ibfk_3` FOREIGN KEY (`MitarbeiterID`) REFERENCES `mitarbeiter` (`MitarbeiterID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportiere Daten aus Tabelle funrest.buchungen_tisch: ~40 rows (ungefähr)
INSERT INTO `buchungen_tisch` (`Buchungen_TischID`, `TischID`, `KundeID`, `MitarbeiterID`, `Zeitpunkt`, `Stoniert`) VALUES
	(1, 4, 1, 6, '2025-02-15 18:00:00', 0),
	(2, 8, 1, 6, '2025-02-15 18:00:00', 0),
	(3, 14, 1, 6, '2025-02-15 18:00:00', 0),
	(4, 18, 1, 6, '2025-02-15 18:00:00', 0),
	(5, 24, 1, 6, '2025-02-15 18:00:00', 0),
	(6, 28, 1, 6, '2025-02-15 18:00:00', 0),
	(7, 29, 1, 6, '2025-02-15 18:00:00', 0),
	(8, 34, 1, 6, '2025-02-15 18:00:00', 0),
	(9, 38, 1, 6, '2025-02-15 18:00:00', 0),
	(10, 39, 1, 6, '2025-02-15 18:00:00', 0),
	(11, 4, 1, 6, '2025-02-15 22:00:00', 0),
	(12, 8, 1, 6, '2025-02-15 22:00:00', 0),
	(13, 14, 1, 6, '2025-02-15 22:00:00', 0),
	(14, 18, 1, 6, '2025-02-15 22:00:00', 0),
	(15, 24, 1, 6, '2025-02-15 22:00:00', 0),
	(16, 28, 1, 6, '2025-02-15 22:00:00', 0),
	(17, 29, 1, 6, '2025-02-15 22:00:00', 0),
	(18, 34, 1, 6, '2025-02-15 22:00:00', 0),
	(19, 38, 1, 6, '2025-02-15 22:00:00', 0),
	(20, 39, 1, 6, '2025-02-15 22:00:00', 0),
	(21, 4, 1, 6, '2025-03-15 23:00:00', 0),
	(22, 8, 1, 6, '2025-03-15 23:00:00', 0),
	(23, 14, 1, 6, '2025-03-15 23:00:00', 0),
	(24, 18, 1, 6, '2025-03-15 23:00:00', 0),
	(25, 24, 1, 6, '2025-03-15 23:00:00', 0),
	(26, 28, 1, 6, '2025-03-15 23:00:00', 0),
	(27, 29, 1, 6, '2025-03-15 23:00:00', 0),
	(28, 34, 1, 6, '2025-03-15 23:00:00', 0),
	(29, 38, 1, 6, '2025-03-15 23:00:00', 0),
	(30, 39, 1, 6, '2025-03-15 23:00:00', 0),
	(31, 4, 1, 5, '2024-03-15 23:00:00', 0),
	(32, 8, 1, 5, '2024-03-15 23:00:00', 0),
	(33, 14, 1, 5, '2024-03-15 23:00:00', 0),
	(34, 18, 1, 5, '2024-03-15 23:00:00', 0),
	(35, 24, 1, 5, '2024-03-15 23:00:00', 0),
	(36, 28, 1, 5, '2024-03-15 23:00:00', 0),
	(37, 29, 1, 5, '2024-03-15 23:00:00', 0),
	(38, 34, 1, 5, '2024-03-15 23:00:00', 0),
	(39, 38, 1, 5, '2024-03-15 23:00:00', 0),
	(40, 39, 1, 5, '2024-03-15 23:00:00', 0);

-- Exportiere Struktur von Tabelle funrest.buchungen_zimmer
CREATE TABLE IF NOT EXISTS `buchungen_zimmer` (
  `Buchungen_ZimmerID` int(11) NOT NULL AUTO_INCREMENT,
  `ZimmerID` int(11) DEFAULT NULL,
  `KundeID` int(11) DEFAULT NULL,
  `MitarbeiterID` int(11) DEFAULT NULL,
  `RechnungID` int(11) DEFAULT NULL,
  `Anreise` date DEFAULT NULL,
  `Abreise` date DEFAULT NULL,
  `Storniert` tinyint(1) DEFAULT NULL,
  `Gezahlt` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Buchungen_ZimmerID`),
  KEY `ZimmerID` (`ZimmerID`),
  KEY `KundeID` (`KundeID`),
  KEY `MitarbeiterID` (`MitarbeiterID`),
  KEY `RechnungID` (`RechnungID`),
  CONSTRAINT `buchungen_zimmer_ibfk_1` FOREIGN KEY (`ZimmerID`) REFERENCES `zimmer` (`ZimmerID`),
  CONSTRAINT `buchungen_zimmer_ibfk_2` FOREIGN KEY (`KundeID`) REFERENCES `kunde` (`KundeID`),
  CONSTRAINT `buchungen_zimmer_ibfk_3` FOREIGN KEY (`MitarbeiterID`) REFERENCES `mitarbeiter` (`MitarbeiterID`),
  CONSTRAINT `buchungen_zimmer_ibfk_4` FOREIGN KEY (`RechnungID`) REFERENCES `rechnungen` (`RechnungID`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportiere Daten aus Tabelle funrest.buchungen_zimmer: ~48 rows (ungefähr)
INSERT INTO `buchungen_zimmer` (`Buchungen_ZimmerID`, `ZimmerID`, `KundeID`, `MitarbeiterID`, `RechnungID`, `Anreise`, `Abreise`, `Storniert`, `Gezahlt`) VALUES
	(2, 1, 1, NULL, NULL, '2025-03-01', '2025-03-10', 0, 0),
	(3, 7, 1, 13, NULL, '2025-03-01', '2025-03-10', 0, 0),
	(4, 13, 1, 13, 4, '2025-03-01', '2025-03-10', 0, 0),
	(5, 19, 1, 13, 5, '2025-03-01', '2025-03-10', 0, 0),
	(6, 25, 1, 13, 6, '2025-03-01', '2025-03-10', 0, 0),
	(7, 31, 1, 13, 7, '2025-03-01', '2025-03-10', 0, 0),
	(8, 37, 1, 13, 8, '2025-03-01', '2025-03-10', 0, 0),
	(9, 43, 1, 13, 9, '2025-03-01', '2025-03-10', 0, 0),
	(10, 49, 1, 13, 10, '2025-03-01', '2025-03-10', 0, 0),
	(11, 55, 1, 13, 11, '2025-03-01', '2025-03-10', 0, 0),
	(12, 61, 1, 13, 12, '2025-03-01', '2025-03-10', 0, 0),
	(13, 67, 1, 13, 13, '2025-03-01', '2025-03-10', 0, 0),
	(14, 73, 1, 13, 14, '2025-03-01', '2025-03-10', 0, 0),
	(15, 79, 1, 13, 15, '2025-03-01', '2025-03-10', 0, 0),
	(16, 85, 1, 13, 16, '2025-03-01', '2025-03-10', 0, 0),
	(17, 91, 1, 13, 17, '2025-03-01', '2025-03-10', 0, 0),
	(18, 97, 1, 13, 18, '2025-03-01', '2025-03-10', 0, 0),
	(19, 103, 1, 13, 19, '2025-03-01', '2025-03-10', 0, 0),
	(20, 109, 1, 13, 20, '2025-03-01', '2025-03-10', 0, 0),
	(21, 115, 1, 13, 21, '2025-03-01', '2025-03-10', 0, 0),
	(22, 121, 1, 13, 22, '2025-03-01', '2025-03-10', 0, 0),
	(23, 127, 1, 13, 23, '2025-03-01', '2025-03-10', 0, 0),
	(24, 133, 1, 13, 24, '2025-03-01', '2025-03-10', 0, 0),
	(25, 139, 1, 13, 25, '2025-03-01', '2025-03-10', 0, 0),
	(26, 145, 1, 13, 26, '2025-03-01', '2025-03-10', 0, 0),
	(27, 151, 1, 13, 27, '2025-03-01', '2025-03-10', 0, 0),
	(28, 157, 1, 13, 28, '2025-03-01', '2025-03-10', 0, 0),
	(29, 163, 1, 13, 29, '2025-03-01', '2025-03-10', 0, 0),
	(30, 169, 1, 13, 30, '2025-03-01', '2025-03-10', 0, 0),
	(31, 175, 1, 13, 31, '2025-03-01', '2025-03-10', 0, 0),
	(32, 181, 1, 13, 32, '2025-03-01', '2025-03-10', 0, 0),
	(33, 187, 1, 13, 33, '2025-03-01', '2025-03-10', 0, 0),
	(34, 193, 1, 13, 34, '2025-03-01', '2025-03-10', 0, 0),
	(35, 199, 1, 13, 35, '2025-03-01', '2025-03-10', 0, 0),
	(36, 205, 1, 13, 36, '2025-03-01', '2025-03-10', 0, 0),
	(37, 211, 1, 13, 37, '2025-03-01', '2025-03-10', 0, 0),
	(38, 217, 1, 13, 38, '2025-03-01', '2025-03-10', 0, 0),
	(39, 223, 1, 13, 39, '2025-03-01', '2025-03-10', 0, 0),
	(40, 229, 1, 13, 40, '2025-03-01', '2025-03-10', 0, 0),
	(41, 235, 1, 13, 41, '2025-03-01', '2025-03-10', 0, 0),
	(42, 241, 1, 13, 42, '2025-03-01', '2025-03-10', 0, 0),
	(43, 247, 1, 13, 43, '2025-03-01', '2025-03-10', 0, 0),
	(44, 253, 1, 13, 44, '2025-03-01', '2025-03-10', 0, 0),
	(45, 259, 1, 13, 45, '2025-03-01', '2025-03-10', 0, 0),
	(46, 265, 1, 13, 46, '2025-03-01', '2025-03-10', 0, 0),
	(47, 271, 1, 13, 47, '2025-03-01', '2025-03-10', 0, 0),
	(48, 277, 1, 13, 48, '2025-03-01', '2025-03-10', 0, 0),
	(49, 283, 1, 13, 49, '2025-03-01', '2025-03-10', 0, 0),
	(50, 4, 1, 14, 50, '2025-02-02', '2025-03-07', 0, 0),
	(51, 6, 1, 14, 51, '2025-02-02', '2025-03-07', 0, 0),
	(52, 3, 1, 14, 52, '2025-02-02', '2025-03-07', 0, 0),
	(53, 9, 1, 14, 53, '2025-02-02', '2025-03-07', 0, 0),
	(54, 15, 1, 14, 54, '2025-02-02', '2025-03-07', 0, 0);

-- Exportiere Struktur von Tabelle funrest.kunde
CREATE TABLE IF NOT EXISTS `kunde` (
  `KundeID` int(11) NOT NULL AUTO_INCREMENT,
  `Vorname` varchar(50) DEFAULT NULL,
  `Nachname` varchar(50) DEFAULT NULL,
  `Geschlecht` varchar(50) DEFAULT NULL,
  `Geburtsdatum` date DEFAULT NULL,
  `Ort` varchar(50) DEFAULT NULL,
  `Straße` varchar(50) DEFAULT NULL,
  `PLZ` varchar(50) DEFAULT NULL,
  `Hausnummer` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Stammgast` tinyint(1) DEFAULT NULL,
  `Passwort` varchar(100) DEFAULT NULL,
  `Gast` tinyint(1) DEFAULT NULL,
  `Anrede` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`KundeID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportiere Daten aus Tabelle funrest.kunde: ~10 rows (ungefähr)
INSERT INTO `kunde` (`KundeID`, `Vorname`, `Nachname`, `Geschlecht`, `Geburtsdatum`, `Ort`, `Straße`, `PLZ`, `Hausnummer`, `Email`, `Stammgast`, `Passwort`, `Gast`, `Anrede`) VALUES
	(1, 'Max', 'Mustermann', 'Männlich', '1985-05-10', 'Berlin', 'Musterstraße', '10115', '1', 'max.mustermann@example.com', 1, 'passwort123', 0, NULL),
	(2, 'Erika', 'Mustermann', 'Weiblich', '1990-07-15', 'Hamburg', 'Beispielweg', '20095', '2', 'erika.mustermann@example.com', 1, 'passwort456', 0, NULL),
	(3, 'Hans', 'Müller', 'Männlich', '1980-03-22', 'München', 'Hauptstraße', '80331', '3', 'hans.mueller@example.com', 0, 'passwort789', 1, NULL),
	(4, 'Anna', 'Schmidt', 'Weiblich', '1995-09-30', 'Köln', 'Nebenstraße', '50667', '4', 'anna.schmidt@example.com', 1, 'passwort101', 1, NULL),
	(5, 'Peter', 'Fischer', 'Männlich', '1975-01-05', 'Frankfurt', 'Bachweg', '60311', '5', 'peter.fischer@example.com', 0, 'passwort202', 0, NULL),
	(6, 'Laura', 'Weber', 'Weiblich', '1988-11-20', 'Stuttgart', 'Waldstraße', '70173', '6', 'laura.weber@example.com', 1, 'passwort303', 1, NULL),
	(7, 'Klaus', 'Becker', 'Männlich', '1992-02-14', 'Düsseldorf', 'Blumenweg', '40213', '7', 'klaus.becker@example.com', 0, 'passwort404', 1, NULL),
	(8, 'Marie', 'Hofmann', 'Weiblich', '1983-06-25', 'Leipzig', 'Parkstraße', '04109', '8', 'marie.hofmann@example.com', 1, 'passwort505', 0, NULL),
	(9, 'Stefan', 'Schwarz', 'Männlich', '1998-12-10', 'Dortmund', 'Schulweg', '44135', '9', 'stefan.schwarz@example.com', 1, 'passwort606', 1, NULL),
	(10, 'Julia', 'Richter', 'Weiblich', '1986-04-18', 'Hannover', 'Ringstraße', '30159', '10', 'julia.richter@example.com', 0, 'passwort707', 0, NULL),
	(11, 'John', 'Doe', 'Männlich', '1990-01-01', 'Berlin', 'Hauptstraße', '10115', '1', 'john.doe@example.com', 1, 'passwort123', 0, NULL);

-- Exportiere Struktur von Tabelle funrest.mitarbeiter
CREATE TABLE IF NOT EXISTS `mitarbeiter` (
  `MitarbeiterID` int(11) NOT NULL AUTO_INCREMENT,
  `Vorname` varchar(50) DEFAULT NULL,
  `Nachname` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Passwort` varchar(100) DEFAULT NULL,
  `IstAdmin` tinyint(1) DEFAULT NULL,
  `Restaurant_Dienst` int(11) DEFAULT NULL,
  `Buchungen_Dienst` int(11) DEFAULT NULL,
  PRIMARY KEY (`MitarbeiterID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportiere Daten aus Tabelle funrest.mitarbeiter: ~14 rows (ungefähr)
INSERT INTO `mitarbeiter` (`MitarbeiterID`, `Vorname`, `Nachname`, `Email`, `Passwort`, `IstAdmin`, `Restaurant_Dienst`, `Buchungen_Dienst`) VALUES
	(1, 'Alice', 'Schneider', 'alice.schneider@example.com', 'passwort123', 1, 2, 0),
	(2, 'Bob', 'Meier', 'bob.meier@example.com', 'passwort456', 0, 3, 0),
	(3, 'Clara', 'Huber', 'clara.huber@example.com', 'passwort789', 1, 4, 0),
	(4, 'David', 'Bauer', 'david.bauer@example.com', 'passwort101', 0, 5, 0),
	(5, 'Eva', 'Wagner', 'eva.wagner@example.com', 'passwort202', 1, 6, 0),
	(6, 'Felix', 'Schulz', 'felix.schulz@example.com', 'passwort303', 0, 7, 0),
	(7, 'Gabi', 'Fischer', 'gabi.fischer@example.com', 'passwort404', 1, 1, 0),
	(8, 'Hans', 'Müller', 'hans.mueller@example.com', 'passwort123', 1, 0, 2),
	(9, 'Julia', 'Klein', 'julia.klein@example.com', 'passwort456', 0, 0, 3),
	(10, 'Tom', 'Weber', 'tom.weber@example.com', 'passwort789', 1, 0, 4),
	(11, 'Laura', 'Schmidt', 'laura.schmidt@example.com', 'passwort101', 0, 0, 5),
	(12, 'Markus', 'Lange', 'markus.lange@example.com', 'passwort202', 1, 0, 6),
	(13, 'Nina', 'Krause', 'nina.krause@example.com', 'passwort303', 0, 0, 7),
	(14, 'Lukas', 'Hofmann', 'lukas.hofmann@example.com', 'passwort404', 1, 0, 1);

-- Exportiere Struktur von Tabelle funrest.rechnungen
CREATE TABLE IF NOT EXISTS `rechnungen` (
  `RechnungID` int(11) NOT NULL AUTO_INCREMENT,
  `KundeID` int(11) DEFAULT NULL,
  `MitarbeiterID` int(11) DEFAULT NULL,
  `Erstelldatum` date DEFAULT NULL,
  PRIMARY KEY (`RechnungID`),
  KEY `KundeID` (`KundeID`),
  KEY `MitarbeiterID` (`MitarbeiterID`),
  CONSTRAINT `rechnungen_ibfk_1` FOREIGN KEY (`KundeID`) REFERENCES `kunde` (`KundeID`),
  CONSTRAINT `rechnungen_ibfk_2` FOREIGN KEY (`MitarbeiterID`) REFERENCES `mitarbeiter` (`MitarbeiterID`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportiere Daten aus Tabelle funrest.rechnungen: ~49 rows (ungefähr)
INSERT INTO `rechnungen` (`RechnungID`, `KundeID`, `MitarbeiterID`, `Erstelldatum`) VALUES
	(1, 1, NULL, NULL),
	(2, 1, 13, NULL),
	(3, 1, 1, NULL),
	(4, 1, 13, NULL),
	(5, 1, 13, NULL),
	(6, 1, 13, NULL),
	(7, 1, 13, NULL),
	(8, 1, 13, NULL),
	(9, 1, 13, NULL),
	(10, 1, 13, NULL),
	(11, 1, 13, NULL),
	(12, 1, 13, NULL),
	(13, 1, 13, NULL),
	(14, 1, 13, NULL),
	(15, 1, 13, NULL),
	(16, 1, 13, NULL),
	(17, 1, 13, NULL),
	(18, 1, 13, NULL),
	(19, 1, 13, NULL),
	(20, 1, 13, NULL),
	(21, 1, 13, NULL),
	(22, 1, 13, NULL),
	(23, 1, 13, NULL),
	(24, 1, 13, NULL),
	(25, 1, 13, NULL),
	(26, 1, 13, NULL),
	(27, 1, 13, NULL),
	(28, 1, 13, NULL),
	(29, 1, 13, NULL),
	(30, 1, 13, NULL),
	(31, 1, 13, NULL),
	(32, 1, 13, NULL),
	(33, 1, 13, NULL),
	(34, 1, 13, NULL),
	(35, 1, 13, NULL),
	(36, 1, 13, NULL),
	(37, 1, 13, NULL),
	(38, 1, 13, NULL),
	(39, 1, 13, NULL),
	(40, 1, 13, NULL),
	(41, 1, 13, NULL),
	(42, 1, 13, NULL),
	(43, 1, 13, NULL),
	(44, 1, 13, NULL),
	(45, 1, 13, NULL),
	(46, 1, 13, NULL),
	(47, 1, 13, NULL),
	(48, 1, 13, NULL),
	(49, 1, 13, NULL),
	(50, 1, 14, NULL),
	(51, 1, 14, NULL),
	(52, 1, 14, NULL),
	(53, 1, 14, NULL),
	(54, 1, 14, NULL),
	(55, 1, 2, '2025-02-11'),
	(56, 1, 3, '2025-02-11'),
	(57, 2, 2, '2025-02-11'),
	(58, 2, 3, '2025-02-11');

-- Exportiere Struktur von Tabelle funrest.restaurant_tische
CREATE TABLE IF NOT EXISTS `restaurant_tische` (
  `TischID` int(11) NOT NULL AUTO_INCREMENT,
  `Anzahl_Plätze` int(11) DEFAULT NULL,
  PRIMARY KEY (`TischID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportiere Daten aus Tabelle funrest.restaurant_tische: ~40 rows (ungefähr)
INSERT INTO `restaurant_tische` (`TischID`, `Anzahl_Plätze`) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 2),
	(8, 4),
	(9, 2),
	(10, 6),
	(11, 1),
	(12, 2),
	(13, 3),
	(14, 4),
	(15, 5),
	(16, 6),
	(17, 2),
	(18, 4),
	(19, 2),
	(20, 6),
	(21, 1),
	(22, 2),
	(23, 3),
	(24, 4),
	(25, 5),
	(26, 6),
	(27, 2),
	(28, 4),
	(29, 4),
	(30, 6),
	(31, 1),
	(32, 2),
	(33, 3),
	(34, 4),
	(35, 5),
	(36, 6),
	(37, 2),
	(38, 4),
	(39, 4),
	(40, 6);

-- Exportiere Struktur von Tabelle funrest.rezensionen
CREATE TABLE IF NOT EXISTS `rezensionen` (
  `RezensionenID` int(11) NOT NULL AUTO_INCREMENT,
  `KundeID` int(11) DEFAULT NULL,
  `MitarbeiterID` int(11) DEFAULT NULL,
  `Erstelldatum` date DEFAULT NULL,
  `Anzahl_Sterne` int(11) DEFAULT NULL,
  `Titel` varchar(100) DEFAULT NULL,
  `Inhalt` varchar(60000) DEFAULT NULL,
  `Genehmigt` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`RezensionenID`),
  KEY `KundeID` (`KundeID`),
  KEY `MitarbeiterID` (`MitarbeiterID`),
  CONSTRAINT `rezensionen_ibfk_1` FOREIGN KEY (`KundeID`) REFERENCES `kunde` (`KundeID`),
  CONSTRAINT `rezensionen_ibfk_2` FOREIGN KEY (`MitarbeiterID`) REFERENCES `mitarbeiter` (`MitarbeiterID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportiere Daten aus Tabelle funrest.rezensionen: ~5 rows (ungefähr)
INSERT INTO `rezensionen` (`RezensionenID`, `KundeID`, `MitarbeiterID`, `Erstelldatum`, `Anzahl_Sterne`, `Titel`, `Inhalt`, `Genehmigt`) VALUES
	(1, 1, 2, '2025-02-11', 5, 'Großartiges Erlebnis', 'Der Service war hervorragend und das Zimmer war sauber und komfortabel.', 1),
	(2, 1, 2, '2025-02-11', 2, 'Großartiges Erlebnis nicht ', 'Der Service war hervorragend und das Zimmer war sauber und komfortabel. NICHT!!!!', 1),
	(3, 1, 2, '2025-02-11', 2, 'Großartiges Erlebnis nicht ', 'Der Service war hervorragend und das Zimmer war sauber und komfortabel. NICHT!!!!', 0),
	(4, 1, 2, '2025-02-11', 2, 'Großartiges Erlebnis nicht ', 'Der Service war hervorragend und das Zimmer war sauber und komfortabel. NICHT!!!!', 0),
	(5, 1, 2, '2025-02-11', 2, 'Großartiges Erlebnis nicht ', 'Der Service war hervorragend und das Zimmer war sauber und komfortabel. doch!!!!', 1);

-- Exportiere Struktur von Tabelle funrest.zimmer
CREATE TABLE IF NOT EXISTS `zimmer` (
  `ZimmerID` int(11) NOT NULL AUTO_INCREMENT,
  `Kategorie` varchar(50) DEFAULT NULL,
  `Zimmerart` varchar(50) DEFAULT NULL,
  `Preiskategorie` int(11) DEFAULT NULL,
  PRIMARY KEY (`ZimmerID`)
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportiere Daten aus Tabelle funrest.zimmer: ~288 rows (ungefähr)
INSERT INTO `zimmer` (`ZimmerID`, `Kategorie`, `Zimmerart`, `Preiskategorie`) VALUES
	(1, 'Standard', 'Einzel', 1),
	(2, 'Premium', 'Einzel', 2),
	(3, 'Luxus', 'Einzel', 3),
	(4, 'Standard', 'Doppel', 4),
	(5, 'Premium', 'Doppel', 5),
	(6, 'Luxus', 'Doppel', 6),
	(7, 'Standard', 'Einzel', 1),
	(8, 'Premium', 'Einzel', 2),
	(9, 'Luxus', 'Einzel', 3),
	(10, 'Standard', 'Doppel', 4),
	(11, 'Premium', 'Doppel', 5),
	(12, 'Luxus', 'Doppel', 6),
	(13, 'Standard', 'Einzel', 1),
	(14, 'Premium', 'Einzel', 2),
	(15, 'Luxus', 'Einzel', 3),
	(16, 'Standard', 'Doppel', 4),
	(17, 'Premium', 'Doppel', 5),
	(18, 'Luxus', 'Doppel', 6),
	(19, 'Standard', 'Einzel', 1),
	(20, 'Premium', 'Einzel', 2),
	(21, 'Luxus', 'Einzel', 3),
	(22, 'Standard', 'Doppel', 4),
	(23, 'Premium', 'Doppel', 5),
	(24, 'Luxus', 'Doppel', 6),
	(25, 'Standard', 'Einzel', 1),
	(26, 'Premium', 'Einzel', 2),
	(27, 'Luxus', 'Einzel', 3),
	(28, 'Standard', 'Doppel', 4),
	(29, 'Premium', 'Doppel', 5),
	(30, 'Luxus', 'Doppel', 6),
	(31, 'Standard', 'Einzel', 1),
	(32, 'Premium', 'Einzel', 2),
	(33, 'Luxus', 'Einzel', 3),
	(34, 'Standard', 'Doppel', 4),
	(35, 'Premium', 'Doppel', 5),
	(36, 'Luxus', 'Doppel', 6),
	(37, 'Standard', 'Einzel', 1),
	(38, 'Premium', 'Einzel', 2),
	(39, 'Luxus', 'Einzel', 3),
	(40, 'Standard', 'Doppel', 4),
	(41, 'Premium', 'Doppel', 5),
	(42, 'Luxus', 'Doppel', 6),
	(43, 'Standard', 'Einzel', 1),
	(44, 'Premium', 'Einzel', 2),
	(45, 'Luxus', 'Einzel', 3),
	(46, 'Standard', 'Doppel', 4),
	(47, 'Premium', 'Doppel', 5),
	(48, 'Luxus', 'Doppel', 6),
	(49, 'Standard', 'Einzel', 1),
	(50, 'Premium', 'Einzel', 2),
	(51, 'Luxus', 'Einzel', 3),
	(52, 'Standard', 'Doppel', 4),
	(53, 'Premium', 'Doppel', 5),
	(54, 'Luxus', 'Doppel', 6),
	(55, 'Standard', 'Einzel', 1),
	(56, 'Premium', 'Einzel', 2),
	(57, 'Luxus', 'Einzel', 3),
	(58, 'Standard', 'Doppel', 4),
	(59, 'Premium', 'Doppel', 5),
	(60, 'Luxus', 'Doppel', 6),
	(61, 'Standard', 'Einzel', 1),
	(62, 'Premium', 'Einzel', 2),
	(63, 'Luxus', 'Einzel', 3),
	(64, 'Standard', 'Doppel', 4),
	(65, 'Premium', 'Doppel', 5),
	(66, 'Luxus', 'Doppel', 6),
	(67, 'Standard', 'Einzel', 1),
	(68, 'Premium', 'Einzel', 2),
	(69, 'Luxus', 'Einzel', 3),
	(70, 'Standard', 'Doppel', 4),
	(71, 'Premium', 'Doppel', 5),
	(72, 'Luxus', 'Doppel', 6),
	(73, 'Standard', 'Einzel', 1),
	(74, 'Premium', 'Einzel', 2),
	(75, 'Luxus', 'Einzel', 3),
	(76, 'Standard', 'Doppel', 4),
	(77, 'Premium', 'Doppel', 5),
	(78, 'Luxus', 'Doppel', 6),
	(79, 'Standard', 'Einzel', 1),
	(80, 'Premium', 'Einzel', 2),
	(81, 'Luxus', 'Einzel', 3),
	(82, 'Standard', 'Doppel', 4),
	(83, 'Premium', 'Doppel', 5),
	(84, 'Luxus', 'Doppel', 6),
	(85, 'Standard', 'Einzel', 1),
	(86, 'Premium', 'Einzel', 2),
	(87, 'Luxus', 'Einzel', 3),
	(88, 'Standard', 'Doppel', 4),
	(89, 'Premium', 'Doppel', 5),
	(90, 'Luxus', 'Doppel', 6),
	(91, 'Standard', 'Einzel', 1),
	(92, 'Premium', 'Einzel', 2),
	(93, 'Luxus', 'Einzel', 3),
	(94, 'Standard', 'Doppel', 4),
	(95, 'Premium', 'Doppel', 5),
	(96, 'Luxus', 'Doppel', 6),
	(97, 'Standard', 'Einzel', 1),
	(98, 'Premium', 'Einzel', 2),
	(99, 'Luxus', 'Einzel', 3),
	(100, 'Standard', 'Doppel', 4),
	(101, 'Premium', 'Doppel', 5),
	(102, 'Luxus', 'Doppel', 6),
	(103, 'Standard', 'Einzel', 1),
	(104, 'Premium', 'Einzel', 2),
	(105, 'Luxus', 'Einzel', 3),
	(106, 'Standard', 'Doppel', 4),
	(107, 'Premium', 'Doppel', 5),
	(108, 'Luxus', 'Doppel', 6),
	(109, 'Standard', 'Einzel', 1),
	(110, 'Premium', 'Einzel', 2),
	(111, 'Luxus', 'Einzel', 3),
	(112, 'Standard', 'Doppel', 4),
	(113, 'Premium', 'Doppel', 5),
	(114, 'Luxus', 'Doppel', 6),
	(115, 'Standard', 'Einzel', 1),
	(116, 'Premium', 'Einzel', 2),
	(117, 'Luxus', 'Einzel', 3),
	(118, 'Standard', 'Doppel', 4),
	(119, 'Premium', 'Doppel', 5),
	(120, 'Luxus', 'Doppel', 6),
	(121, 'Standard', 'Einzel', 1),
	(122, 'Premium', 'Einzel', 2),
	(123, 'Luxus', 'Einzel', 3),
	(124, 'Standard', 'Doppel', 4),
	(125, 'Premium', 'Doppel', 5),
	(126, 'Luxus', 'Doppel', 6),
	(127, 'Standard', 'Einzel', 1),
	(128, 'Premium', 'Einzel', 2),
	(129, 'Luxus', 'Einzel', 3),
	(130, 'Standard', 'Doppel', 4),
	(131, 'Premium', 'Doppel', 5),
	(132, 'Luxus', 'Doppel', 6),
	(133, 'Standard', 'Einzel', 1),
	(134, 'Premium', 'Einzel', 2),
	(135, 'Luxus', 'Einzel', 3),
	(136, 'Standard', 'Doppel', 4),
	(137, 'Premium', 'Doppel', 5),
	(138, 'Luxus', 'Doppel', 6),
	(139, 'Standard', 'Einzel', 1),
	(140, 'Premium', 'Einzel', 2),
	(141, 'Luxus', 'Einzel', 3),
	(142, 'Standard', 'Doppel', 4),
	(143, 'Premium', 'Doppel', 5),
	(144, 'Luxus', 'Doppel', 6),
	(145, 'Standard', 'Einzel', 1),
	(146, 'Premium', 'Einzel', 2),
	(147, 'Luxus', 'Einzel', 3),
	(148, 'Standard', 'Doppel', 4),
	(149, 'Premium', 'Doppel', 5),
	(150, 'Luxus', 'Doppel', 6),
	(151, 'Standard', 'Einzel', 1),
	(152, 'Premium', 'Einzel', 2),
	(153, 'Luxus', 'Einzel', 3),
	(154, 'Standard', 'Doppel', 4),
	(155, 'Premium', 'Doppel', 5),
	(156, 'Luxus', 'Doppel', 6),
	(157, 'Standard', 'Einzel', 1),
	(158, 'Premium', 'Einzel', 2),
	(159, 'Luxus', 'Einzel', 3),
	(160, 'Standard', 'Doppel', 4),
	(161, 'Premium', 'Doppel', 5),
	(162, 'Luxus', 'Doppel', 6),
	(163, 'Standard', 'Einzel', 1),
	(164, 'Premium', 'Einzel', 2),
	(165, 'Luxus', 'Einzel', 3),
	(166, 'Standard', 'Doppel', 4),
	(167, 'Premium', 'Doppel', 5),
	(168, 'Luxus', 'Doppel', 6),
	(169, 'Standard', 'Einzel', 1),
	(170, 'Premium', 'Einzel', 2),
	(171, 'Luxus', 'Einzel', 3),
	(172, 'Standard', 'Doppel', 4),
	(173, 'Premium', 'Doppel', 5),
	(174, 'Luxus', 'Doppel', 6),
	(175, 'Standard', 'Einzel', 1),
	(176, 'Premium', 'Einzel', 2),
	(177, 'Luxus', 'Einzel', 3),
	(178, 'Standard', 'Doppel', 4),
	(179, 'Premium', 'Doppel', 5),
	(180, 'Luxus', 'Doppel', 6),
	(181, 'Standard', 'Einzel', 1),
	(182, 'Premium', 'Einzel', 2),
	(183, 'Luxus', 'Einzel', 3),
	(184, 'Standard', 'Doppel', 4),
	(185, 'Premium', 'Doppel', 5),
	(186, 'Luxus', 'Doppel', 6),
	(187, 'Standard', 'Einzel', 1),
	(188, 'Premium', 'Einzel', 2),
	(189, 'Luxus', 'Einzel', 3),
	(190, 'Standard', 'Doppel', 4),
	(191, 'Premium', 'Doppel', 5),
	(192, 'Luxus', 'Doppel', 6),
	(193, 'Standard', 'Einzel', 1),
	(194, 'Premium', 'Einzel', 2),
	(195, 'Luxus', 'Einzel', 3),
	(196, 'Standard', 'Doppel', 4),
	(197, 'Premium', 'Doppel', 5),
	(198, 'Luxus', 'Doppel', 6),
	(199, 'Standard', 'Einzel', 1),
	(200, 'Premium', 'Einzel', 2),
	(201, 'Luxus', 'Einzel', 3),
	(202, 'Standard', 'Doppel', 4),
	(203, 'Premium', 'Doppel', 5),
	(204, 'Luxus', 'Doppel', 6),
	(205, 'Standard', 'Einzel', 1),
	(206, 'Premium', 'Einzel', 2),
	(207, 'Luxus', 'Einzel', 3),
	(208, 'Standard', 'Doppel', 4),
	(209, 'Premium', 'Doppel', 5),
	(210, 'Luxus', 'Doppel', 6),
	(211, 'Standard', 'Einzel', 1),
	(212, 'Premium', 'Einzel', 2),
	(213, 'Luxus', 'Einzel', 3),
	(214, 'Standard', 'Doppel', 4),
	(215, 'Premium', 'Doppel', 5),
	(216, 'Luxus', 'Doppel', 6),
	(217, 'Standard', 'Einzel', 1),
	(218, 'Premium', 'Einzel', 2),
	(219, 'Luxus', 'Einzel', 3),
	(220, 'Standard', 'Doppel', 4),
	(221, 'Premium', 'Doppel', 5),
	(222, 'Luxus', 'Doppel', 6),
	(223, 'Standard', 'Einzel', 1),
	(224, 'Premium', 'Einzel', 2),
	(225, 'Luxus', 'Einzel', 3),
	(226, 'Standard', 'Doppel', 4),
	(227, 'Premium', 'Doppel', 5),
	(228, 'Luxus', 'Doppel', 6),
	(229, 'Standard', 'Einzel', 1),
	(230, 'Premium', 'Einzel', 2),
	(231, 'Luxus', 'Einzel', 3),
	(232, 'Standard', 'Doppel', 4),
	(233, 'Premium', 'Doppel', 5),
	(234, 'Luxus', 'Doppel', 6),
	(235, 'Standard', 'Einzel', 1),
	(236, 'Premium', 'Einzel', 2),
	(237, 'Luxus', 'Einzel', 3),
	(238, 'Standard', 'Doppel', 4),
	(239, 'Premium', 'Doppel', 5),
	(240, 'Luxus', 'Doppel', 6),
	(241, 'Standard', 'Einzel', 1),
	(242, 'Premium', 'Einzel', 2),
	(243, 'Luxus', 'Einzel', 3),
	(244, 'Standard', 'Doppel', 4),
	(245, 'Premium', 'Doppel', 5),
	(246, 'Luxus', 'Doppel', 6),
	(247, 'Standard', 'Einzel', 1),
	(248, 'Premium', 'Einzel', 2),
	(249, 'Luxus', 'Einzel', 3),
	(250, 'Standard', 'Doppel', 4),
	(251, 'Premium', 'Doppel', 5),
	(252, 'Luxus', 'Doppel', 6),
	(253, 'Standard', 'Einzel', 1),
	(254, 'Premium', 'Einzel', 2),
	(255, 'Luxus', 'Einzel', 3),
	(256, 'Standard', 'Doppel', 4),
	(257, 'Premium', 'Doppel', 5),
	(258, 'Luxus', 'Doppel', 6),
	(259, 'Standard', 'Einzel', 1),
	(260, 'Premium', 'Einzel', 2),
	(261, 'Luxus', 'Einzel', 3),
	(262, 'Standard', 'Doppel', 4),
	(263, 'Premium', 'Doppel', 5),
	(264, 'Luxus', 'Doppel', 6),
	(265, 'Standard', 'Einzel', 1),
	(266, 'Premium', 'Einzel', 2),
	(267, 'Luxus', 'Einzel', 3),
	(268, 'Standard', 'Doppel', 4),
	(269, 'Premium', 'Doppel', 5),
	(270, 'Luxus', 'Doppel', 6),
	(271, 'Standard', 'Einzel', 1),
	(272, 'Premium', 'Einzel', 2),
	(273, 'Luxus', 'Einzel', 3),
	(274, 'Standard', 'Doppel', 4),
	(275, 'Premium', 'Doppel', 5),
	(276, 'Luxus', 'Doppel', 6),
	(277, 'Standard', 'Einzel', 1),
	(278, 'Premium', 'Einzel', 2),
	(279, 'Luxus', 'Einzel', 3),
	(280, 'Standard', 'Doppel', 4),
	(281, 'Premium', 'Doppel', 5),
	(282, 'Luxus', 'Doppel', 6),
	(283, 'Standard', 'Einzel', 1),
	(284, 'Premium', 'Einzel', 2),
	(285, 'Luxus', 'Einzel', 3),
	(286, 'Standard', 'Doppel', 4),
	(287, 'Premium', 'Doppel', 5),
	(288, 'Luxus', 'Doppel', 6);

-- Exportiere Struktur von Tabelle funrest.zimmer_preis
CREATE TABLE IF NOT EXISTS `zimmer_preis` (
  `PreisID` int(11) NOT NULL AUTO_INCREMENT,
  `Preis` double DEFAULT NULL,
  PRIMARY KEY (`PreisID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportiere Daten aus Tabelle funrest.zimmer_preis: ~6 rows (ungefähr)
INSERT INTO `zimmer_preis` (`PreisID`, `Preis`) VALUES
	(1, 70),
	(2, 90),
	(3, 120),
	(4, 100),
	(5, 130),
	(6, 150);

-- Exportiere Struktur von Prozedur funrest.create_All
DELIMITER //
CREATE PROCEDURE `create_All`()
    COMMENT 'Prozdeure welche alle create Tabellen Prozeduren ausführt'
BEGIN
CALL create_Kunde();
CALL create_Mitarbeiter();
CALL create_Rechnungen();
CALL create_Rezensionen();
CALL create_Restaurant_Tische();
CALL create_Buchungen_Tisch();
CALL create_Zimmer();
CALL create_Buchungen_Zimmer();
CALL create_Zimmer_Preis();
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.create_Buchungen_Tisch
DELIMITER //
CREATE PROCEDURE `create_Buchungen_Tisch`()
    COMMENT 'Prozedur zur Erstellung oder Bearbeitung der Tabelle Buchungen_Tisch'
BEGIN

-- Erstellt die Tabelle, falls sie nicht existiert
CREATE TABLE IF NOT EXISTS Buchungen_Tisch (
    Buchungen_TischID INT AUTO_INCREMENT PRIMARY KEY,
    TischID INT,
    KundeID INT,
    MitarbeiterID INT,
    FOREIGN KEY (TischID) REFERENCES Restaurant_Tische(TischID),
    FOREIGN KEY (KundeID) REFERENCES Kunde(KundeID),
    FOREIGN KEY (MitarbeiterID) REFERENCES Mitarbeiter(MitarbeiterID),
    Zeitpunkt DATETIME,
    Stoniert BOOL
    
);


-- Ändert die Tabelle, falls sie bereits existiert
-- ALTER TABLE Buchungen_Tisch
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.create_Buchungen_Zimmer
DELIMITER //
CREATE PROCEDURE `create_Buchungen_Zimmer`()
    COMMENT 'Prozedur zur Erstellung oder Bearbeitung der Tabelle Buchungen_Zimmer'
BEGIN

-- Erstellt die Tabelle, falls sie nicht existiert
CREATE TABLE IF NOT EXISTS Buchungen_Zimmer (
    Buchungen_ZimmerID INT AUTO_INCREMENT PRIMARY KEY,
    ZimmerID INT,
    KundeID INT,
    MitarbeiterID INT,
    RechnungID INT,
    FOREIGN KEY (ZimmerID) REFERENCES Zimmer(ZimmerID),
    FOREIGN KEY (KundeID) REFERENCES Kunde(KundeID),
    FOREIGN KEY (MitarbeiterID) REFERENCES Mitarbeiter(MitarbeiterID),
    FOREIGN KEY (RechnungID) REFERENCES Rechnungen(RechnungID),

    Anreise DATETIME,
    Abreise DATETIME,
	 Storniert BOOL,
	 Gezahlt BOOL 
);


-- Ändert die Tabelle, falls sie bereits existiert
-- ALTER TABLE Buchungen_Zimmer

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.create_Kunde
DELIMITER //
CREATE PROCEDURE `create_Kunde`()
    COMMENT 'Prozedur zur Erstellung oder Bearbeitung der Tabelle Kunde'
BEGIN

-- Erstellt die Tabelle, falls sie nicht existiert
CREATE TABLE IF NOT EXISTS Kunde (
    KundeID INT AUTO_INCREMENT PRIMARY KEY,
    Vorname VARCHAR(50),
    Nachname VARCHAR(50),
    Geschlecht VARCHAR(50),
    Geburtsdatum DATE,
    Ort VARCHAR(50),
    Straße VARCHAR(50),
    PLZ VARCHAR(50),
    Hausnummer VARCHAR(50),
    Email VARCHAR(100),
    Stammgast BOOL,
    Passwort VARCHAR(100),
    Gast BOOL,
    Anrede VARCHAR(50)
    
);


-- Ändert die Tabelle, falls sie bereits existiert
-- ALTER TABLE Kunde

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.create_Mitarbeiter
DELIMITER //
CREATE PROCEDURE `create_Mitarbeiter`()
    COMMENT 'Prozedur zur Erstellung oder Bearbeitung der Tabelle Mitarbeiter'
BEGIN

-- Erstellt die Tabelle, falls sie nicht existiert
CREATE TABLE IF NOT EXISTS Mitarbeiter (
    MitarbeiterID INT AUTO_INCREMENT PRIMARY KEY,
    Vorname VARCHAR(50),
    Nachname VARCHAR(50),
    Email VARCHAR(100),
    Passwort VARCHAR(100),
    IstAdmin BOOL,
    Restaurant_Dienst INT,
    Buchungen_Dienst INT
    
);


-- Ändert die Tabelle, falls sie bereits existiert
-- ALTER TABLE Mitarbeiter
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.create_Rechnungen
DELIMITER //
CREATE PROCEDURE `create_Rechnungen`()
    COMMENT 'Prozedur zur Erstellung oder Bearbeitung der Tabelle Rechnungen'
BEGIN

-- Erstellt die Tabelle, falls sie nicht existiert
CREATE TABLE IF NOT EXISTS Rechnungen (
    RechnungID INT AUTO_INCREMENT PRIMARY KEY,
    KundeID INT,
    MitarbeiterID INT,
    Erstelldatum DATE,
    FOREIGN KEY (KundeID) REFERENCES Kunde(KundeID),
    FOREIGN KEY (MitarbeiterID) REFERENCES Mitarbeiter(MitarbeiterID)
);


-- Ändert die Tabelle, falls sie bereits existiert
-- ALTER TABLE Rechnungen
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.create_Rezensionen
DELIMITER //
CREATE PROCEDURE `create_Rezensionen`()
    COMMENT 'Prozedur zur Erstellung oder Bearbeitung der Tabelle Rezensionen'
BEGIN

-- Erstellt die Tabelle, falls sie nicht existiert
CREATE TABLE IF NOT EXISTS Rezensionen (
    RezensionenID INT AUTO_INCREMENT PRIMARY KEY,
    KundeID INT,
    MitarbeiterID INT,
    FOREIGN KEY (KundeID) REFERENCES Kunde(KundeID),
    FOREIGN KEY (MitarbeiterID) REFERENCES Mitarbeiter(MitarbeiterID),
    Erstelldatum DATE,
    Anzahl_Sterne INT,
    Titel VARCHAR(100),
    Inhalt VARCHAR(60000),
    Genehmigt BOOL
    
);


-- Ändert die Tabelle, falls sie bereits existiert
-- ALTER TABLE Rezensionen
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.create_Zimmer
DELIMITER //
CREATE PROCEDURE `create_Zimmer`()
    COMMENT 'Prozedur zur Erstellung oder Bearbeitung der Tabelle Zimmer'
BEGIN

-- Erstellt die Tabelle, falls sie nicht existiert
CREATE TABLE IF NOT EXISTS Zimmer (
    ZimmerID INT AUTO_INCREMENT PRIMARY KEY,
    Kategorie VARCHAR(50),
	 Zimmerart VARCHAR(50),
	 Preiskategorie INT
	 );


-- Ändert die Tabelle, falls sie bereits existiert
-- ALTER TABLE Zimmer


END//
DELIMITER ;

-- Exportiere Struktur von Prozedur funrest.create_Zimmer_Preis
DELIMITER //
CREATE PROCEDURE `create_Zimmer_Preis`()
    COMMENT 'Prozedur zur Erstellung oder Bearbeitung der Tabelle Zimmer_Preis'
BEGIN

-- Erstellt die Tabelle, falls sie nicht existiert
CREATE TABLE IF NOT EXISTS zimmer_preis(
    PreisID INT AUTO_INCREMENT PRIMARY KEY,
    Preis DOUBLE
);

END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
