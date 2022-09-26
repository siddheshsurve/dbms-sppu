delimiter //
drop table if exists Student_Marks; //
drop table if exists Result;//
create table Student_Marks(name varchar(20),totalmarks int);//

insert into Student_Marks values("Hari", 1300); // 

insert into Student_Marks values("Shreyash", 970); //

insert into Student_Marks values("Prajwal", 825); //

insert into Student_Marks values("Saurabh", 800);//



create table Result(name varchar(20),class varchar(20));//

drop function if exists Grades1;
create function Grades1(name1 varchar(20))
returns varchar(20)  
Begin 
	Declare marks int;
	Declare class1 varchar(20);
	select totalmarks into marks from Student_Marks where name = name1;

	if (marks <= 1500 and marks >=990) then
		set class1= "DISTINCTION";
		insert into Result values(name1,"Distinction");

	elseif (marks <=989 and marks >=900) then 
		set class1= "FIRSTCLASS";
		insert into Result values(name1,"FirstClass");

	elseif (marks <=899 and marks >=825) then
		set class1= "Second Class";
		insert into Result values(name1,"Second Class");

	else
		insert into Result values(name1,"FAIL");
		set class1= "FAIL";
	end if;
return class1;
end; //


delimiter ;

select Grades1("Hari");

select Grades1("Shreyash");

select Grades1("Prajwal");

select Grades1("Saurabh");

select * from Result;


