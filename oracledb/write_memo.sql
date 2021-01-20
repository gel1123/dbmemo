drop table command_type_info;
drop table command_info;
drop table select_type_info;
drop table data_type_info;
drop table test_number_type;

create table command_type_info (
	type varchar(12) primary key,
	description varchar(30),
	ja_name varchar(24),
	auto_commit varchar(10)
);
insert into command_type_info values ('DML', 'Data Manipulation Language', 'データ操作言語', 'invalid');
insert into command_type_info values ('DDL', 'Data Definition Language', 'データ定義言語', 'valid');
insert into command_type_info values ('DCL', 'Data Control Language', 'データ制御言語', 'valid');
insert into command_type_info values ('transaction', 'trunsaction', 'トランザクション', '-');

create table command_info (
	command varchar(15) primary key,
	type varchar(12),
	description varchar(30)
);
insert into command_info values ('SELECT', 'DML', 'データ取得');
insert into command_info values ('INSERT', 'DML', 'データ挿入');
insert into command_info values ('UPDATE', 'DML', 'データ更新');
insert into command_info values ('DELETE', 'DML', 'データ削除');
insert into command_info values ('MERGE', 'DML', 'データ統合');

insert into command_info values ('CREATE', 'DDL', 'オブジェクト作成');
insert into command_info values ('ALTER', 'DDL', 'オブジェクト定義変更');
insert into command_info values ('DROP', 'DDL', 'オブジェクトの削除');
insert into command_info values ('RENAME', 'DDL', 'オブジェクト名変更');
insert into command_info values ('TRUNCATE', 'DDL', '表の切り捨て');
insert into command_info values ('COMMENT', 'DDL', 'コメントの定義');

insert into command_info values ('GRANT', 'DCL', '権限付与');
insert into command_info values ('REVOKE', 'DCL', '権限取消');

insert into command_info values ('COMMIT', 'transaction', '変更確定');
insert into command_info values ('ROLLBACK', 'transaction', '変更取消');
insert into command_info values ('SAVEPOINT', 'transaction', 'セーブポイント作成');

insert into command_info values ('DESCRIBE', 'other', '列の情報を取得');

create table select_type_info (
	type varchar(6),
	description varchar(30),
	usage varchar(100)
);
insert into select_type_info values ('射影', '特定の列を取得', 'select [col, col, col] from [table]');
insert into select_type_info values ('選択', '特定の行を取得', 'select [col] from [table] where [col=xxx]');
insert into select_type_info values ('結合', '複数の表を関連付け', 'select [table1.col, table2.col] from [table1] join [table2] on [table1.col=table2.col]');

create table data_type_info (
	type varchar(10) primary key,
	ja varchar(30),
	description varchar(80)
);
insert into data_type_info values ('VARCHAR', '可変長文字列', '引数でバイト数を指定');
insert into data_type_info values ('CHAR', '固定長文字列', '引数に指定したバイト数になるよう半角スペース');
insert into data_type_info values ('NUMBER', '数値', '第一引数が全体の桁数、第二引数は小数点以下の桁数');


select * from command_info;
select * from command_type_info;
select * from select_type_info;
select * from data_type_info;

prompt "-----------------------------------"
prompt "<< test number type >>"
create table test_number_type (
	num1 number(2, 1)
);
insert into test_number_type values (0);
insert into test_number_type values (1);
insert into test_number_type values (1.1);
insert into test_number_type values (11.1);
insert into test_number_type values (1.11);
select * from test_number_type;