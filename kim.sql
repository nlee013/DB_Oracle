select * from tab; --�ڵ� ������ ctrl + ENTER ġ�� data�� �Ʒ��� ����
select * from PERSONNEL;
select * from DIVISION;
select * from bonus;
select pno,pname,pay,dno from personnel;

--distinct �ߺ�����
select distinct job from personnel;

--����order by
ORDER BY pay ASC; --��������
SELECT pno, pname, pay FROM personnel ORDER by pname;

--ASC = ascending�� default ��������
select pno,pname,pay from personnel order by pname; --ORDER BY�� ������ ASC �� ����?(ASC �������)
--������ temp.dbf�� ���ĳ��� ����

SELECT pno, pname, pay from personnel ORDER BY pay DESC; --��������

SELECT * from personnel order by startdate DESC;

--�����ȣ�� ���� ������� �����Ͻÿ�
--ȸ�翡���� *��ǥ �� �Ⱦ�
--* �� ��ü��� ��
--�����;��� ����������� ����!!
--DB ���� ��簢 
--Ư�� ������ ����Ҷ���!

SELECT * FROM personnel ORDER BY pno DESC;--�� �ڵ� ��� �Ʒ� DESC PERSONNEL;���

SELECT * FROM PERSONNEL;

DESC PERSONNEL;
DESCRIBE PERSONNEL;--�̰� �ٿ��� ���� �ڵ�� ����.����Ŭ�� 10000�� ���� ����

SELECT PNO, PNAME, PAY+1000 FROM PERSONNEL;--PAY+1000-> �Ļ��÷�: ������ �÷�(��� ������� �÷�)
--SELECT PNO, PNAME, PAY+1000 AS �� �� �� FROM PERSONNEL; ->������. ���� ���ϰ�
SELECT PNO, PNAME, PAY+1000 AS ���ʽ� FROM PERSONNEL;
--SELECT PNO, PNAME, PAY+1000 AS '��' '��' '��' FROM PERSONNEL;-> ��?
SELECT PNO, PNAME, PAY+1000 AS "��_��_��" FROM PERSONNEL;--����� ����� _�����. ������ ""ū����ǥ ���.-as�� �г��Ӽ��� �����ϰ� ��.���� ����ǥ ������ ��?
SELECT PNO, PNAME, PAY+1000 ���ʽ� FROM PERSONNEL;--AS ��������."" ū����ǥ�� ��������.

SELECT PNO, PNAME, PAY, PAY+1000 ���ʽ� FROM PERSONNEL ORDER BY ���ʽ�; --ORDER BY�� *Ī�� ������ ���� �ִ�
SELECT PNO, PNAME, PAY, PAY+1000 ���ʽ� FROM PERSONNEL ORDER BY 4;--ȸ�翡���� ���� �߾Ⱦ�. PNO, PNAME, PAY, PAY+1000�� 4��°�� �ǹ�.

SELECT * FROM PESONNEL ORDER BY 4;--�� �ڵ带 �̿Ͱ��� ����.

SELECT DNO, PNO, PNAME FROM PERSONNEL ORDER BY DNO, PNO;

SELECT * FROM PERSONNEL ORDER BY DNO DESC PNO;
--�μ���ȣ DNO�� ��������, �����ȣ PNO�� �������� ����
SELECT * FROM PERSONNEL ORDER BY DNO, PNO DESC;

SELECT * FROM PERSONNEL ORDER BY MANAGER ASC; --NULL�� �� �Ʒ��� ���� ���� �ֱ⿡ Ȯ���ؾ�?-NULLã�� ��ɾ ���� ����
--TABLE ���� �� ���� NULL�� ������ ������. NULL�� ���� ū���̴�. �׷��Ƿ� DESC�� �ϸ� �ٷ� ���� ��

--����� �޿��� �ϳ�ġ ����(ANNUAL)�� ���Ͻÿ�
SELECT DNO, PNO, PNAME, PAY, (PAY*12) + NVL(BONUS, 0) ANNUAL_PAY FROM PERSONNEL; --BONUS�� NULL�̹Ƿ� ������ DATA�� NULL�� ����
--NVL(BONUS, 0) -> ���ʽ��� ������ �� ���ʽ��� ���� ���̰� �ƴϸ� 0���� ǥ���ض�.
--SELECT DNO, PNO, PNAME, PAY, NVL(BONUS, 0),(PAY*12) + BONUS ANNUAL_PAY FROM PERSONNEL;

SELECT PAY, PAY-500 FROM PERSONNEL;
SELECT PNAME || PNO FROM PERSONNEL; --�÷��� ���� ������ �� ���
SELECT PNAME || ' ' ||PNO FROM PERSONNEL; -- ���ڴ� ''���� ����ǥ. ���� ���� ���⸦ �־��
--�÷����� ���� �ΰ��� ����� ���� ������ ����? ex) �����, �ּҶ�� �ϸ� ���� ������ ���� ����Ǿ� ǥ�� ����

SELECT PNAME || ' ' ||PNO PNAME FROM PERSONNEL;--SELECT PNAME || ' ' ||PNO (AS)PNAME FROM PERSONNEL;

SELECT PNAME, PNO FROM PERSONNEL; -->�÷�.��(row) ����

--WHERE �� ���� ���ǹ�
SELECT * FROM PERSONNEL WHERE JOB = 'SALESMAN'; --�ҹ��� salesman�� ��? ����Ŭ�� �ҹ��ڰ� �빮�ڷ� ����/SQL�� �ҹ��� ����
--������ : = , <. >. <=. >=
--����Ŭ���� <> : �����ʴ�

--�޿��� 1600�� ��� �˻��ض�
SELECT * FROM PERSONNEL WHERE PAY = 1600;

--�����ȣ�� 1116�� ��� �˻�
SELECT * FROM PERSONNEL WHERE PNO = 1116;

--����� �޿��� 2000 ������ ��� �˻�
SELECT * FROM PERSONNEL WHERE PAY <= 2000;

--1990�� 12�� 17�Ͽ� �Ի��� ���
SELECT * FROM PERSONNEL WHERE STARTDATE = '1990/12/17';
SELECT * FROM PERSONNEL WHERE STARTDATE = '1990-12-17'; --���� ����ȵ� ���� ����
--��¥, �������(�ȹٲ�� ������ϴ� ���ڴ� ���ڷ� ǥ���ص� ?

--ȯ�����â����
SELECT * FROM NLS_SESSION_PARAMETERS;
--RR/MM/DD -> �⺻ OS�� ��¥ ����

--������ CLERK�� ���
SELECT * FROM PERSONNEL WHERE JOB = 'CLERK';

--�̸��� JAMES�� ���
SELECT * FROM PERSONNEL WHERE PNAME = 'JAMES';

--��������
--AND, OR, NOT -> NOT�� !�� ����.
--AND�� ������ �ΰ��� ���ƾ�?

--EX) �μ���ȣ�� 10���̰� �޿��� 3000�̻� ���
SELECT * FROM PERSONNEL WHERE DNO = 10 AND PAY >= 3000;

--������ SALESMAN�̰� 90�����Ŀ� �Ի��� ����
SELECT * FROM PERSONNEL WHERE JOB = 'SALESMAN' AND STARTDATE >= '1991/1/1'; --�Ǵ� 1990/12/31

--91�� 9���� �Ի��� ����
SELECT * FROM PERSONNEL WHERE STARTDATE >= '1991/9/1' AND STARTDATE <= '1991/9/30';

--OR
--�μ���ȣ�� 10���̰ų� �޿��� 3000�̻��� ����˻�
SELECT * FROM PERSONNEL WHERE DNO = 10 OR PAY >= 3000;

--������ MANAGER�̰ų� 90�⵵ ������ �Ի��� ���� �˻�
SELECT * FROM PERSONNEL WHERE JOB = 'MANAGER' OR STARTDATE < '1990/1/1';

--NOT(���ڿ� ������)
--������ SALESMAN �̰ų� CLERK�� ����
SELECT * FROM PERSONNEL WHERE JOB = 'SALESMAN' OR JOB = 'CLERK';
SELECT * FROM PERSONNEL WHERE JOB IN ('SALESMAN', 'CLERK'); --�� �ڵ�� �������� (��� OR�� ���� ����ϱ�)

--������ SALESMAN, CLERK�� �ƴ� ������ ã���ÿ�
SELECT * FROM PERSONNEL WHERE JOB <>'SALESMAN' AND JOB <>'CLERK';
SELECT * FROM PERSONNEL WHERE JOB NOT IN ('SALESMAN', 'CLERK'); -- NOT�� ��ġ�� ���� �����ϴ� ������ �ٸ�

--�޿��� 1000���� 2000�� ���
SELECT * FROM PERSONNEL WHERE PAY >= 1000 AND PAY <= 2000;
SELECT * FROM PERSONNEL WHERE PAY BETWEEN 1000 AND 2000;--�� �ڵ�� ����
 
SELECT * FROM PERSONNEL WHERE STARTDATE BETWEEN '1991/09/01' AND '1991/09/30';

--�μ���ȣ�� 20�� 30���̰� �ƴ� ���
SELECT * FROM PERSONNEL WHERE DNO NOT IN (20, 30);--20�� 30�� ã�ƶ�
SELECT * FROM DIVISION;--�μ���ȣ Ȯ���Ҽ��ִ� TABLE

SELECT * FROM PERSONNEL WHERE DNO NOT BETWEEN 20 AND 30; --20���� 30���� ã�ƶ�.�� �ڵ�� �ٸ�

--91�� 5�� 1�Ϻ��� 92�� 2�� 24�� ���̿� �Ի��� ����� �ƴ� ���� ã�ƶ�
SELECT * FROM PERSONNEL WHERE STARTDATE NOT BETWEEN '1992/5/1' AND '1992/2/24';

--�̸��� A�� ���۵Ǵ� ������� ã���ÿ�
SELECT * FROM PERSONNEL WHERE PNAME LIKE 'A%';
--LIKE �ڿ� � ���ڰ� �͵� ����.
--LIKE�� ���𰡷� �����ϴ� �ܾ� ã���� ���
--���⼱ A%. �ڹٿ��� A*.
--*********������  %�� LIKE�� ��ߵȴ�*********

--�����ȣ�� 111_�� ��� --> ���⼭ �����_�� �ڸ����̴� _����� �ڿ� ��� ���ڰ� �͵� ���ٴ� �ǹ�. ���⼭ �ڸ��� 4�ڸ�
--��¥�� ���ڴ� �� ���� ����ǥ �ؾ�?

--''�ȿ� ���� ���� �����̱⶧���� ��� ���ڰ� ���� �������
SELECT * FROM PERSONNEL WHERE PNO LIKE '111_'; --����� �ڿ� �ݵ�� �� �ڸ����� �´�
SELECT * FROM PERSONNEL WHERE PNO LIKE '111%';--%�ڿ� ���� �ڸ��� ����
SELECT * FROM PERSONNEL WHERE PNO LIKE '1__1';--���� 4�ڸ��鼭 ����� ���ڸ�.

--90�⵵�� �Ի��� ���
SELECT * FROM PERSONNEL WHERE STARTDATE LIKE '90%'; --�ٸ� ����� ������ �ڿ� ���� ������ %90. %�� �տ� ���δ�.
--1900�⵵ �̸��� ��ǻ�Ͱ� �νľ���

SELECT * FROM PERSONNEL WHERE REGEXP_LIKE(PNO, '11[^2]');--����ȭ ǥ����. ^�� �ƴ϶�� �ǹ�
--���� ���� ���� 112�� ������ �ȵ����� 1112���� 111�̰� 112 3�ڸ��� ������ �� ������, �� �߿� �ϳ��� ���̸� ����.
 
--1�� �����ϰ� �ڿ� 1 �Ǵ� 2
SELECT * FROM PERSONNEL WHERE REGEXP_LIKE(PNO, '1[1, 2]');--�ڸ����� ���������.

--�̸��Ͽ��� ����ȭ ǥ���� �غ��� - ���̵� �����ϱ�
SELECT REGEXP_SUBSTR('NAY@GMAIL.COM', '[^@]+') ���̵� FROM DUAL; --�ѹ��� ����

SELECT REGEXP_SUBSTR('NAY@GMAIL.COM', '[^@]+') ���̵� FROM DIVISION; --DIVISION ������ŭ �Ļ�����Ÿ(���� ����Ÿ) ���?

SELECT * FROM DUAL; -- DUMMY�� X�� ��µǴµ� �ƹ� �ǹ� ���� ����Ÿ..?

--MS-SQL�� ������ �ᵵ �׳� ����.����Ŭ������ FROM�� �� �����?
SELECT 100+300 FROM PERSONNEL; --�μ� ������ŭ ���
SELECT 100+300 FROM DUAL;--DUAL�� ����Ŭ���� �ִ�

--�Ʊ� �ߴ� NULL�� ���� �����غ���
-- �Ʊ ���޵��� NULL���� ��������� ����
SELECT MANAGER FROM PERSONNEL WHERE MANAGER = NULL; --�����?. NULL ã�� ���� �ƴ�. �տ� ���ڰ� �ƿ� �ȵ������. =�� ���ڸ� ã�� ������ ���⼭ NULL�̶�� ���ڸ� ã�⿡ ��?
SELECT MANAGER FROM PERSONNEL WHERE MANAGER = 'NULL'; --�����?

SELECT MANAGER FROM PERSONNEL WHERE MANAGER IS NULL;
--MS-SQL�� =��ȣ�� ����ؼ� NULL�� ã�� �� �ִ�

SELECT MANAGER FROM PERSONNEL WHERE MANAGER IS NOT NULL;
--_______________________________________________________________

--�켱���� �ű� �� ����
--������ 'Manager'�̰� �޿��� 1500�̻��� ��� �Ǵ� ������
--A AND B OR C -> AND�� ���� ���� �� OR�� �����
--'SALESMAN' �� ����� ������ ã���ÿ�

SELECT * FROM PERSONNEL WHERE (JOB = 'MANAGER' AND PAY >= 1500) OR JOB = 'SALESMAN';
--���θ� ������ �� ���� ����

--������ 'PRESIDENT' �Ǵ� 'SALESMAN'�̰� �޿��� 1500�̻� ��� ����
SELECT * FROM PERSONNEL WHERE (JOB = 'PRESIDENT' OR JOB = 'SALESMAN') AND PAY >= 1500;
SELECT * FROM PERSONNEL WHERE JOB IN ('PRESIDENT', 'SALESMAN') AND PAY >= 1500;

--ORACLE FUNCTION ����Ŭ �Լ�
--��ǥ���� �����Լ� : ROUND(�ݿø�)
SELECT ROUND (45.275, 1) FROM DUAL;--45.3
SELECT ROUND (45.275, -1) FROM DUAL;--50

--�ڸ���
--  1  2  3  4 . 5 6 7
-- -4 -3 -2 -1 0 1 2 3 ������ ǥ���ض�

SELECT PNO, PNAME, PAY, ROUND(PAY, -2) FROM PERSONNEL;

--TRUNC(���� - �ڸ���)
SELECT TRUNC(45.245, 2) FROM DUAL; --45.24
SELECT TRUNC(45.245, -1) FROM DUAL;--40

SELECT PNO, PNAME, PAY, TRUNC(PAY, -2) FROM PERSONNEL;

--CEIL/FLOOR (�ø�/����) : ���������� ��ȯ. �Ҽ��� �ȉ�
SELECT CEIL(461.21) FROM DUAL; --462
SELECT FLOOR(461.91) FROM DUAL; --461

--MOD : ������ ���ϱ�
SELECT MOD(10, 3) FROM DUAL; --1

--ABS : ���밪. ������ ��� �������(�� �Ⱦ��̴µ�)
SELECT ABS(-123)FROM DUAL;--123
--������ ����()�ȿ� �÷��� ���� DUAL ��� TABLE�� ���� ��

--SIGN(��� 1, ���� -1, 0�� 0)
SELECT SIGN(100), SIGN(-100), SIGN(0) FROM DUAL; --> 1 -1 0

--����
SELECT POWER(2, 4) FROM DUAL; --16

--������
SELECT SQRT(9) FROM DUAL; --3

--�����Լ�
--UPPER : �ҹ��� -> �빮�ڷ� ��ȯ
SELECT UPPER('ORacle') FROM DUAL; --ORACLE
--LOWER : �빮�� -> �ҹ��ڷ� ��ȯ
SELECT LOWER('ORacle') FROM DUAL; --oracle

SELECT DNO, DNAME FROM DIVISION WHERE DNAME = UPPER('sales');

--�� �ڵ�� ���ƺ������� �� �ڵ庸�� �Ʒ� �ڵ尡 �� ������.
--���� ������ DNAME���� LOWER�� �ҹ��ڷ� �� ��ȯ�ؼ�
--sales�� ���ؼ� �����͸� �������� ������ ����
SELECT DNO, DNAME FROM DIVISION WHERE LOWER(DNAME) = 'sales';--����� �ȳ���
--SYSTEM Ʃ�� --�ý������� �� �޸� �� ������ ���� ������
--SQL Ʃ�� --Ʃ��ó�� �ٲ���

--INITCAP :ù���ڸ� �빮��
SELECT INITCAP ('korea fighting') FROM DUAL;

--CONCAT
SELECT PNAME || DNO FROM PERSONNEL;
SELECT CONCAT(PNAME, DNO) FROM PERSONNEL;

--LENGTH: �������� ����
SELECT LENGTH('KOREA FIGHTING') FROM DUAL; --14

--SUBSTR
SELECT SUBSTR('ABCDEFG', 1, 3) FROM DUAL; --ABC
SELECT SUBSTR('ABCDEFG', 3, 2) FROM DUAL; --CD
SELECT SUBSTR('ABCDEFG', -3, 2) FROM DUAL; --EF -> -3�� �ڿ��� 3��°
SELECT SUBSTR('ABCDEFG',-4) FROM DUAL; --DEFG

--INSTR
SELECT INSTR('ABCDEF','C') FROM DUAL; --3

SELECT INSTR('AAAAAAA', 'A') FROM DUAL; --1
SELECT INSTR('AAAAAAA', 'a') FROM DUAL; --0

--RPAD/LPAD
SELECT RPAD(PNAME, 15, '*') FROM PERSONNEL;
SELECT LPAD(PNAME, 15, '*') FROM PERSONNEL;

--RTRIM:�����ʿ��� ���� ������/LTRIM: ���ʿ��� ���� ������ (���� ���� �� ���.���� �� ��� ���ϴµ�)
SELECT RTRIM ('ABBBBB', 'B') FROM DUAL;
SELECT RTRIM ('A         ', '') FROM DUAL;

SELECT RTRIM('ABBABB', 'B') FROM DUAL;

--��¥�Լ�
--SYSDATE((GETDATE())
SELECT SYSDATE FROM DUAL;

--��¥�Լ�
SELECT SYSDATE FROM DUAL;

SELECT SYSDATE + 4 FROM DUAL; --��¥�� �⺻������ ������ �� 

SELECT STARTDATE -1, STARTDATE, STARTDATE +1 FROM PERSONNEL;

--KIM ����� ���ñ��� �ٹ��� ��� ���Ͻÿ�
SELECT PNAME, CEIL((SYSDATE - STARTDATE)/365) FROM PERSONNEL WHERE PNAME = 'KIM';
SELECT SYSDATE, STARTDATE, CEIL((SYSDATE - STARTDATE)/365) || '��' YEARS FROM PERSONNEL WHERE PNAME = 'KIM';

--ROUND
SELECT STARTDATE, ROUND(STARTDATE, 'YEAR') FROM PERSONNEL;

SELECT STARTDATE, ROUND(STARTDATE, 'MONTH') FROM PERSONNEL;

SELECT STARTDATE, ROUND(STARTDATE, 'DAY') FROM PERSONNEL;

--TRUNC
SELECT STARTDATE, TRUNC(STARTDATE, 'MONTH') FROM PERSONNEL;

--MONTHS_BETWEEN -�� �� ���ϱ�
SELECT ROUND (MONTHS_BETWEEN(SYSDATE, '1997/06/14')/12) YEAR FROM DUAL;

--LAST DAY
SELECT STARTDATE, LAST_DAY(STARTDATE) FROM PERSONNEL;

--NEXT DAY
SELECT NEXT_DAY(SYSDATE, '�����') FROM DUAL;

--ADMONTHS
SELECT ADD_MONTHS(SYSDATE, 4) FROM DUAL;
SELECT ADD_MONTHS(SYSDATE, 24) FROM DUAL;

--��ȯ�Լ�
/*TO_CHAR(���ڳ� ��¥�� ���ڷ� ����)
MM : �޼�(10)
MON: 3���� �� �̸�(MAR)
MONTH : ���� ��ü�̸� Ǯ���� (MARCH)
DD : ���� ��¥ �� (22)
D : ���� �ϼ�(2)
DY : 3������ ���� �̸� (MON)
DAY : ���� Ǯ����. ��ü�̸� (ȭ)
YYYY : 4���ڸ� ����
YY : 2�ڸ� ����
RM : �θ��� �޼�
*/

SELECT SYSDATE, TO_CHAR(SYSDATE, 'D') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'DY') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'RM') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'MON') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'DAY') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;

SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD') + 10 FROM DUAL; --���ڴ� ������ �ȉ�

SELECT SYSDATE, TO_CHAR(SYSDATE, 'DD-YYYY-MM') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'DD-YY-MM') FROM DUAL;

--�ð�����
/*
HH, HH12 ���� 1��
HH24 -> HOURS 13��
MI -> MINUTES
SS -> SECONDS
SSSSSS ->SECOND �ڸ���
AM, PM = A.M, P.
*/

SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'AM HH:MI:SS') FROM DUAL;

--��������
/*
9: �ڸ����� (9999-> 1218)
0: �ڸ����� ��� 0���� ǥ�� (09999 -> 01234)
PR : ���� (9999, PR -><1234>) .�߾Ⱦ���
, : õ�ڸ��� (9,999 -> 1,000)
*/

SELECT TO_CHAR(12506, '$099,999.99') FROM DUAL;

--����
--SP, TH
SELECT SYSDATE, TO_CHAR(SYSDATE, 'DD') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'DDSP') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'DDTH') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'DDSPTH') FROM DUAL;

--TO_DATE
SELECT TO_DATE('22/06/04', 'YY/MM/DD') + 10 FROM DUAL;
SELECT TO_DATE('13:38', 'HH24:MI') FROM DUAL;
SELECT TO_DATE('01:38', 'HH12:MI') FROM DUAL;

--TO_NUMBER
SELECT TO_NUMBER('123') + 100 FROM DUAL;

SELECT TO_NUMBER('ABC') FROM DUAL; --���ڰ� �ƴϿ��� ����ȉ�

--NVL
SELECT BONUS, NVL(BONUS, 0)FROM PERSONNEL;

SELECT MANAGER FROM PERSONNEL;

DESC PERSONNEL;

SELECT MANAGER, NVL(TO_CHAR (MANAGER), 'NON MANAGER') FROM PERSONNEL; --�����δ� �� �Ⱦ��̴µ�

--DECODE: �ѹ��� ó�� JAVA�� IFó��~
--�� ��� �޿� �μ���ȣ�� 10�� ��� 10%,  �μ���ȣ�� 20�� ��� 20%, ������ �μ��� 30% ����

SELECT PNAME, BONUS, DNO, PAY, DECODE(DNO, 10, PAY*1.1, 20, PAY*1.2, PAY*1.3) �λ�� FROM PERSONNEL;

--�޿��� 3500 �̻��� ��쿡�� GRADE�� 'GOOD' �� �̸��� ��쿡�� 'POOR' ���
SELECT PNAME, BONUS, DNO, PAY, DECODE(SIGN(PAY - 3500), 1, 'GOOD', 0, 'SOSO', 'POOR')GRADE FROM PERSONNEL;
SELECT PNAME, BONUS, DNO, PAY, DECODE(GRADE SIGN(PAY - 3500), 1, 'GOOD', 'POOR') FROM PERSONNEL;--����ȉ�

--SIGN(��� 1, ���� -1, 0�� 0)
SELECT SIGN(100), SIGN(-100), SIGN(0) FROM DUAL; --> 1 -1 0

--�׷��Լ� : COUNT
SELECT COUNT(*) FROM PERSONNEL; --������ �����͸� �ϳ��� �����ش�=�ϳ��� ���

--�޿��� 3000�̻��� ����� ��
SELECT COUNT(*) FROM PERSONNEL WHERE PAY >= 3000; --������ ��� 1�� ����̹Ƿ� ������ PNAME �� �� ����

SELECT COUNT(MANAGER) FROM PERSONNEL;-- NULL�� ������ �ϳ� ����
SELECT COUNT(BONUS) FROM PERSONNEL; -- NULL�� ���� 3

--AVG
SELECT AVG(PAY) FROM PERSONNEL;

--SUM:�հ�
SELECT SUM(PAY) FROM PERSONNEL; --���հ�

--MAX/MIN
SELECT MAX(PAY), MIN(PAY) FROM PERSONNEL;

--����� �Ի����� ���� ������ ����
SELECT MIN(STARTDATE) FROM PERSONNEL;


--�Ի����� ���� ������ ����� ���Ի������ ���� ����
SELECT ROUND ((MAX(STARTDATE)- MIN(STARTDATE))/365) AS �� FROM PERSONNEL;-------?

SELECT * FROM PERSONNEL;

--�м��Լ�
--�μ��� ���

--�������� ����Ÿ���� �ϳ����� �����ִ� ����  DISTINCT
SELECT DISTINCT DNO, AVG(PAY) OVER(PARTITION BY DNO) FROM PERSONNEL;
SELECT DNO, AVG(PAY) OVER(PARTITION BY DNO) FROM PERSONNEL;

--OVER : �� ����~ OVER(PARTITION BY DNO)-> (PARTITION BY DNO)�ȿ���

--���� 1200�� �޴� ��� ����
SELECT * FROM PERSONNEL ORDER BY PAY DESC;

SELECT RANK(1200) WITHIN GROUP(ORDER BY PAY DESC) FROM PERSONNEL;

-- WITHIN GROUP: ~�׷� �ȿ���

SELECT PNAME, PAY, RANK() OVER(ORDER BY PAY DESC) "RANK" FROM PERSONNEL;
--RANK() OVER(ORDER BY �÷�) ���� �ܿ��. ���� ������ ��� 1,1,3, �������� ���������
-- ROW_NUMBER() OVER() ** �߿�  ���� ���� �� ** ���ϼ����� ��� 1, 2, 3 �������� ���
-- DENSE_RANK() OVER()�� ���� ������ ��� 1,1,2 �������� ���
-- ROW_NUMBER() OVER()�� �ſ�ſ�ſ� �߿��� �Լ��̹Ƿ� �ݵ�� �˾� �Ѱ� !!!!!!

--GROUP BY ���߰� ��ȯ ����
SELECT PNAME FROM PERSONNEL;

SELECT * FROM PERSONNEL WHERE PAY = 1600; --���߰� ��ȯ ����(������)

SELECT COUNT(*) FROM PERSONNEL; --���ϰ� ��ȯ ����(�ϳ�)

--���ϰ��� ���߰��� ���� ���Ұ�

SELECT PNAME, MIN(STARTDATE) FROM PERSONNEL; --X

SELECT MIN(STARTDATE) FROM PERSONNEL;
--��������
SELECT PNAME, STARTDATE FROM PERSONNEL WHERE STARTDATE = (SELECT MIN(STARTDATE) FROM PERSONNEL);
--�� �ڵ尡 �̿� ���� ����� ��.
--SELECT PNAME, STARTDATE FROM PERSONNEL WHERE STARTDATE = '1989-01-10 00:00:00';

--�μ��� ��� �޿�
--(����)���� ���� ���� GROUP BY ���
SELECT DNO, AVG(PAY) FROM PERSONNEL GROUP BY DNO;

SELECT STARTDATE,
EXTRACT(YEAR FROM STARTDATE) ��,
EXTRACT(MONTH FROM STARTDATE) ��,
EXTRACT(DAY FROM STARTDATE) �� 
FROM PERSONNEL;

--�� �μ��� ��� �޿��� ��ü ��� �޿�(2972.5)���� ũ�� GOOD �ƴϸ� POOR
SELECT ROUND(AVG(PAY)) FROM PERSONNEL;

SELECT DNO,AVG(PAY),
DECODE (SIGN (AVG(PAY) - (SELECT AVG(PAY) FROM PERSONNEL)),
1, 'GOOD', 'POOR') AS GRADE
FROM PERSONNEL GROUP BY DNO HAVING DNO = 20;
--SELECT ���ǹ� WHERE ���
--GROUP BY ���ǹ� HAVING ���

