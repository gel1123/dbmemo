
drop table jointest01;
drop table jointest02;

create table jointest01 (
  id varchar(3),
  val1 varchar(12)
);

create table jointest02 (
  id number(2),
  val2 varchar(12)
);

insert into jointest01 values ('01', 'val1-1');
insert into jointest01 values ('2', 'val1-2');
insert into jointest01 values ('3', 'val1-3');
insert into jointest01 values ('4', 'val1-4');
-- insert into jointest01 values ('nan', 'val1-4');
insert into jointest02 values (1, 'val2-1');
insert into jointest02 values (2, 'val2-1');
insert into jointest02 values (3, 'val2-1');
insert into jointest02 values (4, 'val2-1');

select id, t1.val1, t2.val2 from jointest01 t1 natural join jointest02 t2;

select id, t1.val1, t2.val2 from jointest01 t1 join jointest02 t2 using(id);
