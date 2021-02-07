drop table member;
create table member (
	id number(3),
	phone varchar(13)
);
insert into member values (1, '090-1234-5678');
insert into member values (2, '080-1234-5678');
insert into member values (3, '070-1234-5678');

select id,
rpad(substr(phone, 1, 4), 8, '*')
|| substr(phone, 9, 1)
|| lpad(substr(phone, 13, 1), 4, '*')
"phone_for-cs", phone from member;

select instr(phone, '8'), phone from member;

select
round(1.2345, 3),
round(12345, -2),
trunc(1.555, 2),
trunc(1555, -2),
mod(10, 3),
trim('  hoge  '),
trim(leading '*' from '***hoge****'),
trim(trailing '*' from '***hoge***'),
trim(both '*' from '***hoge***'),
replace('hoge', 'ho'),
replace('hoge', 'ho', 'fu')
from member;

select
sysdate,
round(sysdate, 'year'),
trunc(sysdate, 'dd')-trunc(round(sysdate, 'month'), 'dd'),
trunc(sysdate),
round(sysdate),
months_between(round(sysdate, 'year'), sysdate)
from dual;
