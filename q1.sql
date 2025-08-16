DROP PROCEDURE IF EXISTS ListAllSubscribers;

DELIMITER //
CREATE PROCEDURE ListAllSubscribers()
BEGIN
	-- variables
	DECLARE subscriberNameFetched VARCHAR(100);
    DECLARE finishedSearching BOOL DEFAULT FALSE;
    -- cursor
	DECLARE cur CURSOR FOR SELECT SubscriberName FROM Subscribers;
    -- handler
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedSearching = TRUE;

    OPEN cur;
		theLoop: LOOP
			FETCH cur INTO subscriberNameFetched;
				IF 
				finishedSearching THEN LEAVE theLoop; -- if nothing fetched then it will leave the loop
				END IF;
			SELECT CONCAT (subscriberNameFetched) AS SubscriberName;
		END LOOP;
    CLOSE cur;
END //

DELIMITER ;
