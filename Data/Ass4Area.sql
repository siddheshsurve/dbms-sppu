
delimiter //

create FUNCTION Area1(radius int)
returns float DETERMINISTIC 
begin 
Declare area float;
set area = radius * radius * PI();
return area;
end;
//

select Area1(6); //


create PROCEDURE Area12(in radius float, out  area float)
begin 
set area = radius * radius *PI();

end;

call Area12(6,@area);

select @area; //

delimiter ;







