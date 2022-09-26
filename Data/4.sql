
create table Borrower(rollno int,name varchar(20); DOJ DATE;name



create procedure Proc (rollno int(20),name varchar(50))
begin
declare ldate date;
declare fine int(20);
declare day int (20);

select Date_of_Issue into date from Borrower
where rollno = rollno and update Borrower set Status ='R'

where rollno = rollno and name = name;

name = name;

set day = DATEDIFF (CURDATE(),1date);

IF(day>=15 and day<=30)
then set fine-day*5;
ELSEIF (day>30) then 
set fine ((15*5)+((day-30)*50)
end IF;

IF(fine is not null) then 
insert into Fine value (roll,CURDATE(),fine);

end IF;
end;

