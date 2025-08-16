drop procedure if exists GetWatchHistoryBySubscriber;
delimiter // 

create procedure GetWatchHistoryBySubscriber(in sub_id int) 
begin 
	select sub.subscriberName, sh.title, w.watchtime 
    from watchhistory as w 
    inner join subscribers sub on w.subscriberid = sub.subscriberid
    inner join shows sh on w.showid = sh.showid
    where w.subscriberid = sub_id;
end //

delimiter ;
-- call GetWatchHistoryBySubscriber(23); 
