delimiter //

create FUNCTION rname(rono1 int) returns varchar(20)
Begin
declare Sname varchar(20);
select name into Sname from Student where rollno=rono1 ;
return Sname;
end
//
delimiter ;

select rname(1);


delimiter //

create FUNCTION addition(a int,b int) returns int 
Begin
declare ad int;
set ad = a+b;

return ad;
end
//
delimiter ;

select addition(20,30);


