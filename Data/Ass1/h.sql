create table Student(rollno int NOT NULL,name varchar(20),branch varchar(4),DOJ Date, Primary Key(rollno));

insert into Student values(1,"Hari","COMP",curdate());

insert into Student values(2,"Ram","COMP",curdate());

alter table Student modify branch varchar(2);


delete from Student where rollno =2;
