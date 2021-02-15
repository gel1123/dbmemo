drop table st03;
create table st03 (name varchar(4));
insert into st03 values('hoge');
insert into st03 values('fuge');
insert into st03 values('sage');
insert into st03 values('age');
insert into st03 values('ge');
select * from st03;
select * from st03 where name like '_%ge';
