DROP PROCEDURE IF EXISTS GetWatchHistoryBySubscriber;

DELIMITER //
CREATE PROCEDURE GetWatchHistoryBySubscriber(IN sub_id INT)
	BEGIN
	    -- Only if the subscriber has watched any shows then it will display the watch history
		IF EXISTS (SELECT 1 FROM WatchHistory WHERE SubscriberID = sub_id) THEN
			SELECT subs.SubscriberName, sh.Title AS ShowName, w.WatchTime AS MinutesWatched 
			FROM WatchHistory w
			INNER JOIN Subscribers subs ON w.SubscriberID = subs.SubscriberID
			INNER JOIN Shows sh ON w.ShowID = sh.ShowID
			WHERE w.SubscriberID = sub_id;
		ELSE
            SELECT CONCAT('Subscriber did not watch any shows yet') AS message;
		END IF;
	END //
    
DELIMITER ;
