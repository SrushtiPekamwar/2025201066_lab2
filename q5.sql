DROP PROCEDURE IF EXISTS SendWatchTimeReport5;

DELIMITER //
CREATE PROCEDURE SendWatchTimeReport5()
BEGIN
	-- variables
    DECLARE finishedSearching BOOL DEFAULT FALSE;
    DECLARE subID INT;
    -- cursor, we will select subId from Subscribers table as it will contain subId even if they haven't watched any shows
    DECLARE cur CURSOR FOR SELECT SubscriberID FROM Subscribers;
    -- handler
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedSearching = TRUE;

    OPEN cur;
	theLoop: LOOP
		FETCH cur INTO subID;
		IF finishedSearching THEN LEAVE theLoop;
		END IF;
		CALL GetWatchHistoryBySubscriber(subID);
	END LOOP;
    CLOSE cur;
END //

DELIMITER ;