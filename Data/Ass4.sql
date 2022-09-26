 create table Borrower(rollno int , name varchar(20),doi date,NameofBook varchar(20),status varchar(20), primary key(rollno));


insert into Borrower values(1, "HARISH" , curdate(),"GOT","Borrowed");

insert into Borrower values(2, "Ramesh" , curdate(),"HARRY POTTER","BORROWED");


insert into Borrower values(3, "RAM" , curdate(),"DORAEMON","BORROWED");

insert into Borrower values(4, "RAMA" , '2022-8-8',"YOU JOKER","BORROWED");

insert into Borrower values(5, "REMA" , '2022-5-5',"YOU MAD","BORROWED");

create table Fine( rollno int not null, doi date , int amt ,foreign key (rollno ) references Borrower(rollno));

delimiter // 
create procedure P1(In rno1,name varchar(30))
begin 
Declare i_date date;
Declare diff int
select doi into i_date from Borrower where rollno = rno1 and NameofBook = name1;

slect DATEDIFF(curdate(),i_date)into diff;
if diff>15 then 
update Borrower 
set status "RETURNED" 
where rollno = rno1 and NameofBook = name1;
End If;
End ;
//
