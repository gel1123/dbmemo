truncate table member;
create table member (
	id number(3),
	phone varchar(13)
);
insert into member values (1, '090-1234-5678');
insert into member values (2, '080-1234-5678');
insert into member values (3, '070-1234-5678');

select id,  rpad(substr(phone, 0, 4), 8, '*') || lpad(substr(phone, 12, 12), 4, '*') "phone_for-cs", phone from member;
