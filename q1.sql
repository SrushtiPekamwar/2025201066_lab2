drop procedure if exists ListAllSubscribers;
delimiter // 

create procedure ListAllSubscribers() 
begin 
	declare subName varchar(100);
    declare done bool default false;
    declare cur cursor for select SubscriberName from subscribers;
    declare continue handler for not found set done = true;
    
    open cur;
		theLoop: loop 
			fetch cur into subName;
			if done then leave theLoop;
            else select concat(subName) as SubscriberName;
            end if;
		end loop;
    close cur;
end //

delimiter ;

-- call ListAllSubscribers();
