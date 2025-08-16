drop procedure if exists SendWatchTimeReport;
delimiter // 

create procedure SendWatchTimeReport() 
begin
	declare done bool default false;
    declare subid int;
	declare cur cursor for select distinct subscriberid from watchhistory;
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
-- call SendWatchTimeReport(); 
