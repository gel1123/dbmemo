-- join
select * from command_info c join command_type_info t on c.type=t.type;

-- 連結演算子（文字列や日付のリテラルは一重引用符が必要 ※数値のみ不要
select ename || 'さんの入社日は' || hiredate || 'です' from employees;

-- 代替引用符（q）演算子の利用（区切り文字を一重引用符から変える
select ename || q'?さんの'入社日'は?' || hiredate || 'です' from employees;

-- これは「select all job from employees;」と同じ
select job from employees;
-- 重複業の排除
select distinct job from employees;
-- 複数列の組み合わせで重複排除（distinctを複数回書くわけではない）
select distinct deptno, job from employees;

-- LIKE演算子で使えるワイルドカード
prompt "<< like '%消しゴム' ※「%」は「0文字以上の任意文字」を示す >>"
select pname from products where pname like '%消しゴム';
prompt "<< like '________' ※「_」は「1文字の任意文字」を示す >>"
select pname from products where pname like '_________';

-- LIKE演算子でエスケープする方法（ESCAPEオプションの利用）
prompt "<< ESCAPEオプションでエスケープ文字を指定する >>"
select pname from products where pname like '100$%%' escape '$';
prompt "注意！ エスケープ文字に指定できるのは「1バイト文字」のみ"
-- select pname from products where pname like '100■%%' escape '■';



-- 集約に関する勉強
select deptno, avg(sal) from employees group by deptno;
select max(avg(sal)) from employees group by deptno;
