DROP PROCEDURE IF EXISTS SendWatchTimeReport;

DELIMITER //
CREATE PROCEDURE SendWatchTimeReport()
BEGIN
	-- variables
    DECLARE finishedSearching BOOL DEFAULT FALSE;
    DECLARE sub_id INT;
    -- cursor, we will select the subscriber ids from WatchHistory table, because it will contain all the ids who have watched any shows
    DECLARE cur CURSOR FOR SELECT DISTINCT SubscriberID FROM WatchHistory;
    -- handler
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedSearching = TRUE;

    OPEN cur;
	theLoop: LOOP
		FETCH cur INTO sub_id;
		IF finishedSearching THEN LEAVE theLoop;
		END IF;
		CALL GetWatchHistoryBySubscriber(sub_id);
	END LOOP;
    CLOSE cur;
END //

DELIMITER ;
