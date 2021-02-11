-- drop table seq cascade constrainsts purge;
drop table seq;
create table seq ( num Number );
insert into seq values(2);
insert into seq values(3);
insert into seq values(1);
insert into seq values(3);
insert into seq values(3);
insert into seq values(4);
insert into seq values(4);
insert into seq values(2);
insert into seq values(4);
insert into seq values(4);
select * from seq;

-- row_limiting_clause
select * from seq order by num desc offset 2 rows fetch first 3 row with ties;
