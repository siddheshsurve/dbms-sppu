drop table Fine;
drop table Borrower;

create table Borrower(Roll_No int, Name varchar(20), DateOfIssue date, NameOfBook varchar(20), Status varchar(20));
create table Fine(Roll_No int, Curr_Date date, Amt int); 

alter table Borrower add primary key (Roll_No);
alter table Fine add foreign key (Roll_No) references Borrower(Roll_No);

insert into Borrower values(31377, "Harish",  "2022/03/21", "Harry Potter", "Issue");
insert into Borrower values(31375, "Shreysh",  "2022/07/22", "NO PDA", "Issue");
insert into Borrower values(31376, "Prajwal",  "2022/06/22", "Doraemon", "Issue");
insert into Borrower values(31378, "Saurabh",  "2022/08/22", "LP1", "Issue");


drop procedure SunBook;

delimiter @@
create procedure submit_book(in roll_no int, in BookName varchar(20))
begin
	DECLARE days int;
	DECLARE CONTINUE HANDLER FOR NOT FOUND select 'Not Found' as 'Error';
	select DATEDIFF(CURRENT_DATE, DateOfIssue) into days from Borrower where Roll_No=roll_no and NameOfBook=BookName;
	IF days > 15 and days < 30 THEN
	insert into Fine values(roll_no, CURRENT_DATE, (days-15)*5);
	ELSEIF days > 30 THEN
	insert into Fine values(roll_no, CURRENT_DATE, (days-30)*50 + 15*5);
	END IF;
	UPDATE Borrower set Status = "Return" where Roll_No=roll_no and NameOfBook=BookName;
	
end;
@@
delimiter ;


call submit_book(31377, 'LP1');
select * from Fine;
select * from Borrower;
