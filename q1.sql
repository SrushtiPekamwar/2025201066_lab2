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
    
    -- Creating temporary table so that the output from the cursor can be stored 
	CREATE TEMPORARY TABLE IF NOT EXISTS tempStorage (Subscriber VARCHAR(100));
    TRUNCATE tempStorage;

    OPEN cur;
		theLoop: LOOP
			FETCH cur INTO subscriberNameFetched;
				IF 
					finishedSearching THEN LEAVE theLoop; -- if nothing fetched then it will leave the loop
				END IF;
			INSERT INTO tempStorage VALUES (subscriberNameFetched);
		END LOOP;
    CLOSE cur;
    
    -- Display the result fetched from the cursor
    SELECT * FROM tempStorage;
END //

DELIMITER ;