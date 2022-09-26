create  table Dept(depid int,dname varchar(20),dlocation varchar(20));

insert into Dept values(1,"COMP","PUNE");

 insert into Dept values(2,"DATABASE","PUNE");

 insert into Dept values(3,"STAFF","AMERICA");

create  table emp(eid int NOT NULL, fname varchar(20),lname varchar(20),designation varchar(20),salary  int, joinDate Date, Primary Key(eid),depid int references  Dept(depid) ON DELETE CASCADE);


insert into emp values(6,"S","SHARMA","CEO",50000,'2020-02-01',1);

insert into emp values(7,"Karan","SHARMA","COO",40000,'2019-03-02',2);

insert into emp values(8,"Namit","SHARMA","CAA",30000,'2015-04-03',3);


create table Project(proid int,Pname varchar (20),Plocation varchar(20),Pcost int,Pyear Date,depid int references  Dept(depid) ON DELETE CASCADE ,primary key(proid));

insert into Project values(1,"COLLEGE WEBSITE","AMERICA",100000,'2022-03-08',1);

insert into Project values(2,"I LOVE PICT","PUNE",5000,'2022-04-05',2);

insert into Project values(3,"COLLEGE WEBSITE","WASHINGTON DC",1000, '2022-04-05',3);



SELECT E.eid eid ,E.fname fname, D.depid ,D.dname dname FROM emp E NATURAL JOIN Dept D;


select * from Dept join emp where Dept.depid = emp.eid; 

select * from Dept natural join emp;

select * from Dept join emp where Dept.depid = emp.eid; 

create view Pro as select proid, pname ,plocation from Project;

insert into Project values(4,"Testing View","Pakistan ",100000, '2022-04-05',3);

create unique index unique_index on  emp(eid);

select max(Pcost) from Project ;

select min(Pcost) from Project ;

select min(Pcost) from Project ;

SELECT fname, joinDate, CURDATE(),TIMESTAMPDIFF(MONTH,joinDate,CURDATE()) AS Experince FROM emp;






