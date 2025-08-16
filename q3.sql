DROP PROCEDURE IF EXISTS AddSubscriberIfNotExists;

DELIMITER //
CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100))
BEGIN
    DECLARE alreadyExists INT;
    -- First check whether the subscriber with the same name already exists in the table
    SELECT COUNT(*) INTO alreadyExists FROM Subscribers WHERE SubscriberName=subName;
    
    -- If it does not exist, then add it to the subscirbers table
    IF alreadyExists=0 THEN
        INSERT INTO Subscribers(SubscriberName) VALUES (subName);
        SELECT CONCAT('Subscriber named ',subName,' added successfully') AS message;
    ELSE
        SELECT CONCAT('Subscriber named ',subName,' already exists') AS message;
    END IF;
END //

DELIMITER ;

