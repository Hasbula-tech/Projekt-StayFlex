DELIMITER //

DROP PROCEDURE IF EXISTS sp_HotelBuchen;
CREATE PROCEDURE sp_HotelBuchen(
    IN nUserID INT, 
    IN nZimmerID INT, 
    IN dtCheckIn DATE,
    IN dtCheckOut DATE,
    IN bNoResultSet INT, 
    OUT ErrorNumber INT, 
    OUT ErrorText VARCHAR(200), 
    IN Debug INT
)
BEGIN
    -- ✅ **Lokale Variablen für die Fehlercodes**
    DECLARE v_ErrorNumber INT DEFAULT 0;
    DECLARE v_ErrorText VARCHAR(200) DEFAULT 'OK';
    DECLARE szModule VARCHAR(255);
    DECLARE UtcNow DATETIME;
    DECLARE zimmerStatus TINYINT;

    -- Initialisieren
    SET szModule = 'sp_HotelBuchen';
    SET UtcNow = UTC_TIMESTAMP();

    -- ✅ Debugging-Ausgabe
    IF Debug <> 0 THEN
        SELECT CONCAT('START ', szModule, ': ', UtcNow) AS DebugMessage;
    END IF;

    -- ✅ **Zimmerstatus abrufen**
    SELECT Verfuegbarkeit INTO zimmerStatus 
    FROM hotelmanagement.zimmer 
    WHERE ZimmerID = nZimmerID;

    -- ✅ **Falls Zimmer verfügbar ist, buchen**
    IF zimmerStatus = 1 THEN
        INSERT INTO buchung (UserID, nZimmerID, Erstellungsdatum, CheckIn, CheckOut)
        VALUES (nUserID, nZimmerID, NOW(), dtCheckIn, dtCheckOut);
        
        UPDATE zimmer 
        SET Verfuegbarkeit = 0 
        WHERE ZimmerID = nZimmerID;
    ELSE
        -- Falls Zimmer nicht verfügbar, Fehler setzen
        SET v_ErrorNumber = 1;
        SET v_ErrorText = 'Zimmer nicht verfügbar';
    END IF;

    -- ✅ **OUT-Parameter mit den lokalen Variablen überschreiben**
    SET ErrorNumber = v_ErrorNumber;
    SET ErrorText = v_ErrorText;

    -- ✅ **Ergebnis zurückgeben**
    IF bNoResultSet = 0 THEN
        SELECT ErrorNumber AS nError, ErrorText AS szError;
    END IF;

END //

DELIMITER ;
