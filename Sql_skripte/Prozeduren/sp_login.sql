DELIMITER $$

CREATE PROCEDURE sp_Login(
    IN p_email VARCHAR(255),
    IN p_passwort VARCHAR(255),
    OUT p_userID INT,
    OUT p_isAdmin BOOLEAN
)
BEGIN
    DECLARE v_userID INT;
    DECLARE v_isAdmin BOOLEAN;

    -- Überprüfen, ob Benutzer existiert und Passwort korrekt ist
    SELECT u.UserID, u.IsAdmin
    INTO v_userID, v_isAdmin
    FROM User u
    JOIN Login l ON u.UserID = l.UserID
    WHERE l.EMail = p_email AND l.Passwort = p_passwort;

    -- Wenn kein Benutzer gefunden wurde, Werte auf NULL setzen
    IF v_userID IS NULL THEN
        SET p_userID = NULL;
        SET p_isAdmin = NULL;
    ELSE
        SET p_userID = v_userID;
        SET p_isAdmin = v_isAdmin;
    END IF;
END$$

DELIMITER ;
