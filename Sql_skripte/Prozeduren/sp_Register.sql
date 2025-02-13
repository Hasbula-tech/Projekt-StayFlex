DELIMITER $$

CREATE PROCEDURE sp_Register(
    IN p_name VARCHAR(255),
    IN p_adresse VARCHAR(255),
    IN p_geschlecht VARCHAR(10),
    IN p_geburtsdatum DATE,
    IN p_email VARCHAR(255),
    IN p_passwort VARCHAR(255),
    OUT p_result VARCHAR(255)
)
BEGIN
    DECLARE v_userID INT;

    -- Prüfen, ob die E-Mail bereits existiert
    IF EXISTS (SELECT 1 FROM Login WHERE EMail = p_email) THEN
        SET p_result = 'Email already exists';
    ELSE
        -- Neuen Benutzer in die User-Tabelle einfügen
        INSERT INTO User (Name, Adresse, Geschlecht, Geburtsdatum, StammUser, IsAdmin)
        VALUES (p_name, p_adresse, p_geschlecht, p_geburtsdatum, FALSE, FALSE);

        -- Die generierte UserID abrufen
        SET v_userID = LAST_INSERT_ID();

        -- Login-Daten mit gehashtem Passwort einfügen
        INSERT INTO Login (EMail, Passwort, UserID)
        VALUES (p_email, SHA2(p_passwort, 256), v_userID);

        SET p_result = 'Registration successful';
    END IF;
END$$

DELIMITER ;
