drop procedure if exists SendWatchTimeReport5;
delimiter // 

create procedure SendWatchTimeReport5() 
begin
	declare done bool default false;
    declare subid int;
	declare cur cursor for select subscriberid from subscribers;
    declare continue handler for not found set done = true;
    
    open cur;
		theLoop: loop
			fetch cur into subid;
			if done then leave theLoop;
            else
			call GetWatchHistoryBySubscriber(subid);
            end if;
        end loop;
    close cur;
    
end //

delimiter ;
-- call SendWatchTimeReport5(); 
