drop procedure if exists AddSubscriberIfNotExists;
delimiter // 

create procedure AddSubscriberIfNotExists(in subName varchar(100)) 
begin 
	declare alreadyExists int;
    declare subid int;
    declare subdate date;
    
    select count(*) into alreadyExists from subscribers where subName = subscribername;
    
    if alreadyExists=1 then select concat(subname, " already exists") as message;
    else 
		select max(subscriberid)+1 into subid from subscribers;
		select curdate() into subdate;
		insert into subscribers(subscriberid,subscribername,subscriptiondate) values (subid,subName,subdate);
		select concat(subname, " inserted successfully") as message;
    end if;
end //

delimiter ;

-- call AddSubscriberIfNotExists("sru");
-- select * from subscribers;
