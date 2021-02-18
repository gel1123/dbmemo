drop table ord_items cascade constraints;
drop table ords;
drop sequence seq1;
drop sequence ord_seq;

create sequence seq1;

create sequence ord_seq
	increment by 1
	start with 1
	maxvalue 10
	nocycle
	cache 5;

create table ords(
	-- ord_no number(4) default ord_seq.nextval not null, -- <= NG
	ord_no number(4) default seq1.nextval not null primary key,
	-- ord_no number(4) default ord_seq.nextval not null unique,
	name varchar(1)
);
insert into ords(name) values('a');
insert into ords(name) values('b');
insert into ords(name) values('c');
insert into ords(name) values('d');
insert into ords(name) values('e');
insert into ords(name) values('f');
insert into ords(name) values('g');
insert into ords(name) values('h');
insert into ords(name) values('i');
insert into ords(name) values('j');
insert into ords(name) values('k');
insert into ords(name) values('l');
insert into ords(name) values('m');
insert into ords(name) values('n');
insert into ords(name) values('o');
insert into ords(name) values('p');
insert into ords(name) values('q');
insert into ords(name) values('r');
insert into ords(name) values('s');

create table ord_items(
	ord_no number(4) default ord_seq.nextval not null,
	qty number(3),
	expiry_date date,
	-- constraint it_pk primary key(ord_no),
	-- constraint ord_fk foreign key(ord_no)
	--	references ords(ord_no)
	primary key(ord_no), -- <= constraint + 制約名 は省略可能
	foreign key(ord_no) references ords(ord_no) -- <= 同上
);
insert into ord_items(expiry_date) values(sysdate+1);
insert into ord_items(expiry_date) values(sysdate+2);
insert into ord_items(expiry_date) values(sysdate+3);
insert into ord_items(expiry_date) values(sysdate+4);
insert into ord_items(expiry_date) values(sysdate+5);
insert into ord_items(expiry_date) values(sysdate+6);
insert into ord_items(expiry_date) values(sysdate+7);
insert into ord_items(expiry_date) values(sysdate+8);
insert into ord_items(expiry_date) values(sysdate+9);

select * from ords;
select * from ord_items;
