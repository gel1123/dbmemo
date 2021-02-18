drop table sot;
drop sequence sec;
create sequence sec
	increment by 2
	start with 0
	maxvalue 5
	minvalue 0 -- default val: 0
	cycle
	cache 3 -- キャッシュは1サイクルより小さな値の必要あり
;
create table sot(
	num number(2) default sec.nextval not null,
	name varchar(4)
);
insert into sot(name) values('hoge');
insert into sot(name) values('fuge');
insert into sot(name) values('sage');
insert into sot(name) values('age');
insert into sot(name) values('hoge');
insert into sot(name) values('fuge');
insert into sot(name) values('sage');
insert into sot(name) values('age');
insert into sot(name) values('hoge');
insert into sot(name) values('fuge');
insert into sot(name) values('sage');
insert into sot(name) values('age');

select * from sot;

select num "num(union)", name from sot where name='hoge' union select * from sot where num=0;
select num "num(union_all)", name from sot where name='hoge' union all select * from sot where num=0;
select num "num(minus)", name from sot where name='hoge' minus select * from sot where num=0;
select num "num(intersect)", name from sot where name='hoge' intersect select * from sot where num=0;

select num "num(sorted:union)", name from sot where name='hoge' union select * from sot where num=0 order by name;
