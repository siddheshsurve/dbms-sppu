delimiter //
drop procedure if exists AddNewData;
drop table if exists Table1; //
drop table if exists Table2; //
create table Table1(roll1 int); //
insert into Table1 values(1); //
insert into Table1 values(2); //
insert into Table1 values(3); //
insert into Table1 values(4); //
create table Table2(roll2 int); //

drop procedure if exists NewData;//
create procedure NewData()
BEGIN
	DECLARE rno2 int;
	DECLARE stop BOOLEAN;
	
	DECLARE C1 CURSOR FOR SELECT roll1 FROM Table1;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET stop = TRUE;
	
	OPEN C1;
	startloop: LOOP
	FETCH C1 INTO rno2;
		IF NOT EXISTS (SELECT * FROM Table2 WHERE roll2=rno2) THEN
			INSERT INTO Table2 SELECT * FROM Table1 WHERE roll1=rno2;
		END IF;
		IF stop THEN 
			CLOSE C1;
			LEAVE startloop;
		END IF;
	END LOOP startloop;
END;
//

call NewData(); //

select * from Table1; //

select * from Table2; //

insert into Table1 values(2); //

call NewData(); //

select * from Table2;//

























