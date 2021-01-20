
CONNECT system/0000;

/* Create Table for ���K */

CREATE TABLE departments
       (deptno NUMBER(2) CONSTRAINT pk_dept PRIMARY KEY,
	dname VARCHAR2(14) ,
	loc VARCHAR2(10) ) ;

CREATE TABLE employees
       (empno NUMBER(4) CONSTRAINT pk_emp PRIMARY KEY,
	ename VARCHAR2(10),
	yomi VARCHAR2(20),
	job VARCHAR2(8),
	mgr NUMBER(4),
	hiredate DATE,
	sal NUMBER(7),
	comm NUMBER(7),
	deptno NUMBER(2) CONSTRAINT fk_deptno REFERENCES departments(deptno));

INSERT INTO departments VALUES
	(10,'�Ǘ�','��蒬');
INSERT INTO departments VALUES 
	(20,'�����J��','���l');
INSERT INTO departments VALUES
	(30,'�c��','�i��');
INSERT INTO departments VALUES
	(40,'����','����');

INSERT INTO employees VALUES
	(1001,'����','sato','�В�',NULL,to_date('2001-02-25','yyyy-mm-dd'),500000,NULL,10);
INSERT INTO employees VALUES
	(1002,'���','suzuki','����',1013,to_date('2000-03-26','yyyy-mm-dd'),200000,NULL,20);
INSERT INTO employees VALUES
	(1003,'����','takahashi','�c��',1007,to_date('2000-05-30 ','yyyy-mm-dd'),300000,30000,30);
INSERT INTO employees VALUES
	(1004,'�c��','tanaka','�c��',1007,to_date('2002-06-02','yyyy-mm-dd'),355000,50000,30);
INSERT INTO employees VALUES
	(1005,'�n��','watanabe','����',1001,to_date('2002-07-11','yyyy-mm-dd'),280000,NULL,20);
INSERT INTO employees VALUES
	(1006,'�ɓ�','ito','�c��',1007,to_date('2008-01-06','yyyy-mm-dd'),300000,140000,30);
INSERT INTO employees VALUES
	(1007,'�R�{','yamamoto','����',1001,to_date('2000-08-09','yyyy-mm-dd'),285000,NULL,30);
INSERT INTO employees VALUES
	(1008,'����','nakamura','����',1001,to_date('2000-09-17','yyyy-mm-dd'),245000,NULL,10);
INSERT INTO employees VALUES
	(1009,'����','kobayashi','��C',1005,to_date('2006-10-21','yyyy-mm-dd'),300000,NULL,20);
INSERT INTO employees VALUES
	(1010,'�ē�','saito','�c��',1007,to_date('2001-12-17','yyyy-mm-dd'),150000,0,30);
INSERT INTO employees VALUES
	(1011,'����','kato','����',1009,to_date('2006-10-21','yyyy-mm-dd'),110000,NULL,20);
INSERT INTO employees VALUES
	(1012,'�g�c','yoshida','����',1007,to_date('2009-03-13','yyyy-mm-dd'),295000,NULL,30);
INSERT INTO employees VALUES
	(1013,'�R�c','yamada','��C',1005,to_date('2001-03-13','yyyy-mm-dd'),280000,NULL,20);
INSERT INTO employees VALUES
	(1014,'���X��','sasaki','����',1008,to_date('2004-05-02','yyyy-mm-dd'),230000,NULL,10);

CREATE TABLE salgrades
      ( grade CHAR(1) CONSTRAINT pk_grade PRIMARY KEY,
	losal NUMBER(7),
	hisal  NUMBER(7));

INSERT INTO salgrades VALUES ('A',100000,190000);
INSERT INTO salgrades VALUES ('B',190001,280000);
INSERT INTO salgrades VALUES ('C',280001,370000);
INSERT INTO salgrades VALUES ('D',370001,460000);
INSERT INTO salgrades VALUES ('E',460001,999999);

CREATE TABLE customers
	(custno 	NUMBER(5) CONSTRAINT cust_pk PRIMARY KEY,
 	 cname 		VARCHAR2(24),
	 address	VARCHAR2(36),
	 phone		VARCHAR2(12),
	 credit_rating	VARCHAR2(9));

INSERT INTO customers VALUES (1000,'�i�쏤��','�����s�`��P?��?��','03-1234-xxxx','�D��');
INSERT INTO customers VALUES (1001,'���l���X','���l�s��q��Q?��?��','045-753-xxxx','�v����');
INSERT INTO customers VALUES (1002,'�����','����s�{���P?��?����','048-336-xxxx','�v����');
INSERT INTO customers VALUES (1003,'���~���X','���l�s�ߌ���Q?����','045-505-xxxx','��');
INSERT INTO customers VALUES (1004,'���X�g�A','���s����P�O?����','044-567-xxxx','�D��');
INSERT INTO customers VALUES (1005,'�c�a�}�[�g','�����s����X?����','03-3334-xxxx','�D��');
INSERT INTO customers VALUES (1006,'��蒬����','�����s���c��P?��?��','03-2236-xxxx','��');
INSERT INTO customers VALUES (1007,'�o���G�e�B�O�b�Y','�������܎s�����悘����','048-556-xxxx','��');
INSERT INTO customers VALUES (1008,'���[���h�X�g�A','���l�s�_�ސ�悘��?��','045-654-xxxx','�v����');
INSERT INTO customers VALUES (1009,'�c�a�X�g�A','�����s�a�J�悘��?����','03-5789-xxxx','�v����');


CREATE TABLE products
	(PRODNO		CHAR(3) CONSTRAINT PROD_PK PRIMARY KEY,
	 PNAME		VARCHAR2(30),
	 PRICE		NUMBER(6));

INSERT INTO products VALUES ('A01','100�~�{�[���y��',100);
INSERT INTO products VALUES ('A02','�c���V���[�v�y���V��',100);
INSERT INTO products VALUES ('A03','10�F�{�[���y��',300);
INSERT INTO products VALUES ('A04','�ō������N�M',1000);
INSERT INTO products VALUES ('A05','�ȂȂ��뉔�M',30);
INSERT INTO products VALUES ('A06','���N�{�[���y��',500);

INSERT INTO products VALUES ('B01','���nA4�m�[�g',160);
INSERT INTO products VALUES ('B02','�����w��A4�m�[�g',160);
INSERT INTO products VALUES ('B03','���ʃ��C�_�[������',150);
INSERT INTO products VALUES ('B04','�ËL�X���[�Y�m�[�g',200);
INSERT INTO products VALUES ('B05','���nB5�m�[�g',160);
INSERT INTO products VALUES ('B06','�|�P����B5�m�[�g',160);

INSERT INTO products VALUES ('C01','�L���C���A4�p��',500);
INSERT INTO products VALUES ('C02','�L���C���B5�p��',500);
INSERT INTO products VALUES ('C03','�L���C���A3�p��',600);
INSERT INTO products VALUES ('C04','�\�R�\�R�L���CA4�p��',350);
INSERT INTO products VALUES ('C05','�\�R�\�R�L���CB5�p��',350);
INSERT INTO products VALUES ('C06','�ڂɗD����A4�p��',400);

INSERT INTO products VALUES ('D01','�˂�˂�����S��',50);
INSERT INTO products VALUES ('D02','�Ȃ�ł����������S��',100);
INSERT INTO products VALUES ('D03','�L�G�i�[�C�����S��',200);
INSERT INTO products VALUES ('D04','100%�}�b�V���C���t',350);

INSERT INTO products VALUES ('D15','�J���[�̍�������S��',80);
INSERT INTO products VALUES ('D16','�������̍�������S��',80);


CREATE TABLE orders
	(ordno	NUMBER(8) CONSTRAINT ORD_PK PRIMARY KEY,
	 custno NUMBER(5) CONSTRAINT ORD_CUST_FK REFERENCES customers(CUSTNO),
	 date_ordered	DATE,
	 date_shipped	DATE,
	 salesman_no	NUMBER(4) CONSTRAINT ord_emp_fk REFERENCES employees(empno),
	 payment_type	VARCHAR2(15));

INSERT INTO orders VALUES (1,1001,'2009-12-20','2009-12-27',1003,'�N���W�b�g');
INSERT INTO orders VALUES (2,1001,'2009-12-21','2009-12-27',1003,'�N���W�b�g');
INSERT INTO orders VALUES (3,1001,'2010-01-10','2010-01-17',1003,'�N���W�b�g');
INSERT INTO orders VALUES (4,1002,'2010-01-11','2010-01-18',1010,'�N���W�b�g');
INSERT INTO orders VALUES (5,1008,'2010-01-15','2010-01-22',1003,'�N���W�b�g');
INSERT INTO orders VALUES (6,1005,'2010-01-20','2010-01-27',1003,'�N���W�b�g');
INSERT INTO orders VALUES (7,1007,'2010-01-22','2010-01-29',1006,'�N���W�b�g');
INSERT INTO orders VALUES (8,1006,'2010-01-22','2010-01-29',1010,'����');
INSERT INTO orders VALUES (9,1007,'2010-01-25','2010-02-03',1006,'�N���W�b�g');
INSERT INTO orders VALUES (10,1003,'2010-02-15','2010-02-22',1003,'�N���W�b�g');
INSERT INTO orders VALUES (11,1007,'2010-02-20','2010-02-27',1006,'�N���W�b�g');
INSERT INTO orders VALUES (12,1006,'2010-03-16',null,1010,'����');
INSERT INTO orders VALUES (13,1009,'2010-04-02',null,1006,'����');

CREATE TABLE ord_details
	(ordno		NUMBER(8)   CONSTRAINT ord_det_ord_fk REFERENCES orders(ordno),
	 prodno		CHAR(3)	CONSTRAINT ord_det_prod_fk REFERENCES products(prodno),
	 quantity	NUMBER(5),
         CONSTRAINT ord_det_pk PRIMARY KEY(ordno,prodno));

INSERT INTO ord_details VALUES (1,'A02',30);
INSERT INTO ord_details VALUES (1,'C01',20);
INSERT INTO ord_details VALUES (2,'B01',5);
INSERT INTO ord_details VALUES (2,'B06',10);
INSERT INTO ord_details VALUES (2,'B02',10);
INSERT INTO ord_details VALUES (2,'A01',5);
INSERT INTO ord_details VALUES (3,'C01',10);
INSERT INTO ord_details VALUES (3,'C02',10);
INSERT INTO ord_details VALUES (3,'A04',10);
INSERT INTO ord_details VALUES (3,'B01',20);
INSERT INTO ord_details VALUES (4,'A01',10);
INSERT INTO ord_details VALUES (4,'B01',5);
INSERT INTO ord_details VALUES (4,'A02',10);
INSERT INTO ord_details VALUES (5,'B06',15);
INSERT INTO ord_details VALUES (5,'B01',15);
INSERT INTO ord_details VALUES (6,'A01',30);
INSERT INTO ord_details VALUES (6,'B06',20);
INSERT INTO ord_details VALUES (6,'A04',20);
INSERT INTO ord_details VALUES (6,'A02',50);
INSERT INTO ord_details VALUES (6,'B01',20);
INSERT INTO ord_details VALUES (7,'A01',10);
INSERT INTO ord_details VALUES (7,'A02',5);
INSERT INTO ord_details VALUES (7,'B01',8);
INSERT INTO ord_details VALUES (8,'B06',5);
INSERT INTO ord_details VALUES (8,'B02',5);
INSERT INTO ord_details VALUES (9,'A01',10);
INSERT INTO ord_details VALUES (9,'D01',30);
INSERT INTO ord_details VALUES (9,'D15',30);
INSERT INTO ord_details VALUES (10,'B06',30);
INSERT INTO ord_details VALUES (10,'C02',50);
INSERT INTO ord_details VALUES (10,'A01',10);
INSERT INTO ord_details VALUES (11,'A02',50);
INSERT INTO ord_details VALUES (11,'B01',20);
INSERT INTO ord_details VALUES (11,'D01',10);
INSERT INTO ord_details VALUES (11,'B02',5);
INSERT INTO ord_details VALUES (12,'C02',10);
INSERT INTO ord_details VALUES (12,'A05',10);
INSERT INTO ord_details VALUES (12,'D16',20);
INSERT INTO ord_details VALUES (12,'D04',10);
INSERT INTO ord_details VALUES (12,'B02',15);
INSERT INTO ord_details VALUES (13,'A01',20);
INSERT INTO ord_details VALUES (13,'A02',25);

SPOOL off
