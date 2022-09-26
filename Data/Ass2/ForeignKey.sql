
create table Book(bid int NOT NULL,bname varchar(20),publication varchar(20),price int, Primary Key(bid));


insert into Book values(1,"The Boys","PICT",100);
insert into Book values(2,"The Girls","Bharti VP",100);

create table Author(auth_name varchar(20),bid int NOT NULL, foreign key(bid) references Book(bid));

insert into Book values("Ram Prakash",3);
