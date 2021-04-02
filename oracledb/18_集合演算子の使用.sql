drop table sot;
drop sequence sec;
create sequence sec
	increment by 2
	start with 0
	maxvalue 5
	minvalue 0 -- default値は1であり, start withはminvalue以上の値を要求するので、ここは明示的に0を指定やる必要がある
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

-- ----------------------------------
-- ▼ 実行結果
-- 
-- 
-- SQL*Plus: Release 19.0.0.0.0 - Production on 金 2月 19 08:37:45 2021
-- Version 19.3.0.0.0
-- 
-- Copyright (c) 1982, 2019, Oracle.  All rights reserved.
-- 
-- 最終正常ログイン時間: 金 2月  19 2021 08:33:51 +09:00
-- 
-- 
-- Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
-- Version 19.3.0.0.0
-- に接続されました。
-- SQL> 
-- 表が削除されました。
-- 
-- SQL> 
-- 順序が削除されました。
-- 
-- SQL>   2    3    4    5    6    7    8  
-- 順序が作成されました。
-- 
-- SQL>   2    3    4  
-- 表が作成されました。
-- 
-- SQL> 
-- 1行が作成されました。
-- 
-- SQL> 
-- 1行が作成されました。
-- 
-- SQL> 
-- 1行が作成されました。
-- 
-- SQL> 
-- 1行が作成されました。
-- 
-- SQL> 
-- 1行が作成されました。
-- 
-- SQL> 
-- 1行が作成されました。
-- 
-- SQL> 
-- 1行が作成されました。
-- 
-- SQL> 
-- 1行が作成されました。
-- 
-- SQL> 
-- 1行が作成されました。
-- 
-- SQL> 
-- 1行が作成されました。
-- 
-- SQL> 
-- 1行が作成されました。
-- 
-- SQL> 
-- 1行が作成されました。
-- 
-- SQL> SQL> 
--        NUM NAME
-- ---------- ----
-- 	 0 hoge
-- 	 2 fuge
-- 	 4 sage
-- 	 0 age
-- 	 2 hoge
-- 	 4 fuge
-- 	 0 sage
-- 	 2 age
-- 	 4 hoge
-- 	 0 fuge
-- 	 2 sage
-- 
--        NUM NAME
-- ---------- ----
-- 	 4 age
-- 
-- 12行が選択されました。
-- 
-- SQL> SQL> 
-- num(union) NAME
-- ---------- ----
-- 	 0 age
-- 	 0 fuge
-- 	 0 hoge
-- 	 0 sage
-- 	 2 hoge
-- 	 4 hoge
-- 
-- 6行が選択されました。
-- 
-- SQL> 
-- num(union_all) NAME
-- -------------- ----
-- 	     0 hoge
-- 	     2 hoge
-- 	     4 hoge
-- 	     0 hoge
-- 	     0 age
-- 	     0 sage
-- 	     0 fuge
-- 
-- 7行が選択されました。
-- 
-- SQL> 
-- num(minus) NAME
-- ---------- ----
-- 	 2 hoge
-- 	 4 hoge
-- 
-- SQL> 
-- num(intersect) NAME
-- -------------- ----
-- 	     0 hoge
-- 
-- SQL> SQL> 
-- num(sorted:union) NAME
-- ----------------- ----
-- 		0 age
-- 		0 fuge
-- 		0 hoge
-- 		2 hoge
-- 		4 hoge
-- 		0 sage
-- 
-- 6行が選択されました。
-- 
-- SQL> SQL> SQL> SQL> SQL> Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
-- Version 19.3.0.0.0との接続が切断されました。
