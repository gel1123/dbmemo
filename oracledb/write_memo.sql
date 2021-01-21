drop table command_type_info;
drop table command_info;
drop table select_type_info;
drop table data_type_info;
drop table test_number_type;
drop table comparison_operator_info;
drop table sga_component_info;

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
-- 列別名はテーブル別名のように変数として利用できはしない
-- 列別名にスペースを含めたり、大文字／小文字の区別をつけさせるなら二重引用符で囲む必要がある（一重引用符ではNG）
select num1 基準値, num1 + 1, num1 * num1 乗算, num1/3 "$# Num1/3" from test_number_type;

create table comparison_operator_info (
	operator varchar(20) primary key,
	description varchar(500)
);
insert into comparison_operator_info values ('=', '統合');
insert into comparison_operator_info values ('>', '大なり');
insert into comparison_operator_info values ('>=', '以上');
insert into comparison_operator_info values ('<', '小なり');
insert into comparison_operator_info values ('<=', '以下');
insert into comparison_operator_info values ('<>, !=, ^=', '不等号');
insert into comparison_operator_info values ('BETWEEN a AND b', 'a以上b以下');
insert into comparison_operator_info values ('NOT BETWEEN a AND b', 'aより小さい or bより大きい');
insert into comparison_operator_info values ('IN(a, b, c)', 'a, b, cのいずれか ※実行時にはこの演算子は論理演算子「OR」を使った記法に評価されなおす。そのためORを使った記法とINを使った記法は、同じ内容の比較を行うのであれば、パフォーマンス上の差異は存在しない');
insert into comparison_operator_info values ('NOT IN(a, b, c)', 'a, b, cのいずれでもない');
insert into comparison_operator_info values ('LIKE', '文字パターン一致');
insert into comparison_operator_info values ('NOT LIKE', '文字パターン不一致');
insert into comparison_operator_info values ('IS NULL', '値がNULLかどうか');
insert into comparison_operator_info values ('IS NOT NULL', '値がNULL以外かどうか');

select operator 演算子, description 説明, length(description), lengthb(description) from comparison_operator_info where length(description) > 5;

prompt "注意！ 「IS NOT NULL演算子」のみ、NOTの位置が他と異なる"
prompt "また、NULL値の比較は「IS NULL」「IS NOT NULL」にしかできない"
prompt "もしこれらの比較演算子以外にNULL値を渡した場合、比較結果は常にNULLとなり、データ取得件数がゼロになる（エラーにはならない）"
prompt "---------------------------"
prompt "※便宜上、NOT付きの演算子も含めて「比較演算子」とここでは紹介したが、実際にはNOTは比較演算子ではなく「論理演算子」のひとつである（AND, OR, NOT）"
prompt "---------------------------"
prompt "なおNULL値ORDER BYで必ず「もっとも大きい値」として扱われる（つまり昇順ソートなら一番最後に表示される）"

create table sga_component_info (
	component varchar(50),
	involved_bgprocess varchar(50),
	description varchar(1000)
);
insert into sga_component_info values ('データベースバッファキャッシュ', 'DBWn, CKPT', 'データファイルから読み込んだブロックをキャッシュする。また、更新済みのブロックを一時的に保管する');
insert into sga_component_info values ('共有プール', '-', '解析済みSQLやデータディクショナリの情報などをキャッシュする');
insert into sga_component_info values ('REDOログバッファ', 'LGWR, ARCn', 'REDOログファイルに書き込む前のREDOデータ（更新履歴）を一時保管する');
insert into sga_component_info values ('Javaプール', '-', 'Javaストアドプログラム(データベースに保管されたプログラム)が利用する');
insert into sga_component_info values ('ラージプール', '-', 'バックアップ／並列処理などの作業領域として利用');

select * from sga_component_info;
