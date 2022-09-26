delimiter //

drop table if exists OldTable; // 
drop table if exists NewTable; // 
drop procedure if exists curp1;
create table OldTable(rollno int); // 

insert into OldTable values(75); //

insert into OldTable values(20); //


create table NewTable(rollno2 int); //




create  procedure curp1(in rno1 int)

begin 
declare c1 CURSOR for select rollno from OldTable where rollno = rno1;

Open c1;
fetch c1 into rno1;

if not exists(select * from NewTable where rollno2 = rno1) then 
	insert into NewTable select * from OldTable  where rollno = rno1;
end if ;
 
 close c1;
 
 end; //
 
 delimiter ;
 
 call curp1(20);
 
 select * from NewTable;
 
 
