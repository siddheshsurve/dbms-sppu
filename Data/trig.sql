delimiter //
	
drop table if exists Book;//
drop table if exists Library_Audit; // 
drop trigger if exists update_book; //
drop trigger if exists update_trig; //
drop trigger if exists insert_validation_trig; //

create table Book(bid int, bname varchar(20),copies int, author varchar(20),price int);//

insert into Book values(1,"My Life",2000,"Shreyash",1000 );
insert into Book values(2,"Big Life",2000,"Prajwal" ,200);
insert into Book values(3,"Lost Life",2000,"Saurabh" ,300);
insert into Book values(4,"New Life",2000,"Hari" ,400);
create table Library_Audit (bid int ,oldname varchar(20),newname varchar(20),oldprice int,newprice int ,author varchar(20) ,status varchar(20),DATE Timestamp,username varchar(20 )) ; // 

create trigger update_trig after update on Book for each row
	begin
	insert into Library_Audit set bid = OLD.bid ,oldname = OLD.bname , newname = NEW.bname , oldprice = OLD.price, newprice = NEW.price ,  author = OLD.author,status = "UPDATED" , date  =CURRENT_TIMESTAMP(), username  = CURRENT_USER();
	
	end; //  
	

create trigger insert_validation_trig before insert on Book for each row
	begin
		if NEW.copies<=0 then 
		 SIGNAL SQLSTATE '45000'
		 SET MESSAGE_TEXT = 'Add Number of Copies greater than 0'; 
	else
			insert into Library_Audit set bid = NEW.bid, oldname = NEW.bname , newname = NEW.bname , oldprice = NEW.price, newprice = NEW.price ,  author = NEW.author,status = "NEW INSERTED" , date  =CURRENT_TIMESTAMP() , username = CURRENT_USER();

end if;
end;

create trigger delete_book_trigger after delete on Book for each row
	begin
		insert into Library_Audit set bid = OLD.bid, oldname = OLD.bname , newname = old.bname , oldprice = OLD.price, newprice = OLD.price ,  author = OLD.author,status = "DELETED" , date  =CURRENT_TIMESTAMP(), username =CURRENT_USER();

end;

//
