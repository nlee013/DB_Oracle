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
--A AND B OR C -> AND�� ���� ���� �� OR�� ����??
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

--CEIL/FLOOR (�ø�/����) : ���������� ��ȯ. �Ҽ��� ��??
SELECT CEIL(461.21) FROM DUAL; --462
SELECT FLOOR(461.91) FROM DUAL; --461

--MOD : ������ ���ϱ�
SELECT MOD(10, 3) FROM DUAL; --1

--ABS : ���밪. ������ ��� �������(�� �Ⱦ��̴µ�)
SELECT ABS(-123)FROM DUAL;--123
--������ ����()�ȿ� �÷��� ���� DUAL ��� TABLE�� ���� ??

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

SELECT SYSDATE + 4 FROM DUAL; --��¥�� �⺻������ ������ ?? 

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

SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD') + 10 FROM DUAL; --���ڴ� ������ ��??

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

SELECT TO_NUMBER('ABC') FROM DUAL; --���ڰ� �ƴϿ��� �����??

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
SELECT PNAME, BONUS, DNO, PAY, DECODE(GRADE SIGN(PAY - 3500), 1, 'GOOD', 'POOR') FROM PERSONNEL;--�����??

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

------2021.01.25.ȭ-------------

SELECT * FROM PERSONNEL;
--SELF JOIN�� ��� �� ���� MANAGER ��ȣ�� 1001�̰�
--SALESMAN ��ȣ�� 1116�϶� SALESMAN�� MANAGER�� ��������
--�̷��� ������ ã�� �� ���
--ǥ �ΰ��� ���ļ� ����ϴ� ���

--SELF JOIN :���� ���̺��� ��
SELECT * FROM PERSONNEL;

SELECT A.PNAME ����, B.PNAME ������ --���� �ѱ۷� �Ⱦ�
FROM PERSONNEL A, PERSONNEL B
WHERE A.MANAGER = B.PNO;--���� manager�� 1001���� ��ȣ

--NON EQUI JOIN : Ư�� ���� �� ������ ���� ���ϴ� �����͸� ã�� ��.����Ŭ������.
SELECT * FROM PERSONNEL;
SELECT * FROM PAYGRADE;

SELECT PNAME, PAY, GRADE
FROM PERSONNEL, PAYGRADE
WHERE PAY BETWEEN LOWPAY AND HIGHPAY;

--��Ÿ(OPERATION)
--:JOIN���� �ƴ����� �ΰ��� ���̺��� ���� �����͸� �������� ���� ����

/*
A = [1, 2, 5, 6] B = [1, 2, 4]

A UNION ALL B = [1, 2, 5, 6, 1, 2, 4] --�ߺ�
A UION B = [1, 2, 4, 5, 6] --�ߺ� ���� �� ����
A MINUS B = [5, 6] --A���� B�� ���� 4�� �ȳ���
B MINUS A = [4]
A INTERSECT B = [1, 2] -����� �κи� ����.������
*/

--UNION/ALL
SELECT * FROM PERSONNEL
UNION ALL
SELECT * FROM PERSONNEL; --�Ȱ��� �����͵� �� ���� ���

SELECT * FROM PERSONNEL
UNION
SELECT * FROM PERSONNEL; --�ߺ����� ���� �����͸� ���

--�׷� �̰� ���� ����ұ�?
--LEE ���Ͽ��� Ȯ���غ���

--MINUS
SELECT DNO FROM DIVISION --10, 20, 30, 40
MINUS 
SELECT DNO FROM PERSONNEL;--10, 20, 30
--���: 40

SELECT DNO FROM DIVISION --10, 20, 30, 40
INTERSECT 
SELECT DNO FROM PERSONNEL;--10, 20, 30
--���: 10, 20, 30(������)

--------------------------------------------------------------
--PAIR WISE

--EX) �̸��� ȫ�浿�̰� ������ ������ ����� �����Ϳ��� ã�� �ʹ�
--�ΰ��� ���Ѵ�
--MS-SQL������ ����� �� ����!! = ���ٴ� �̾߱�

--���ϴ� �÷��� ������ ���� �� ��
SELECT * FROM PERSONNEL;

SELECT PNAME, DNO, PAY, BONUS FROM PERSONNEL
WHERE(PAY, BONUS) IN(SELECT PAY, BONUS FROM PERSONNEL
WHERE DNO = 30);

--���⼭ -1����� ���� 0�� ���ϱ� ���ؼ� ��� �� ���ϻ�
SELECT PNAME, DNO, PAY, NVL(BONUS, -1) FROM PERSONNEL
WHERE(PAY, NVL(BONUS, -1)) IN(SELECT PAY, BONUS FROM PERSONNEL
WHERE DNO = 30);

SELECT PAY, BONUS FROM PERSONNEL WHERE DNO = 30;

SELECT PNAME, DNO, PAY, NVL(BONUS, -1) FROM PERSONNEL
WHERE (PAY = 1600 AND BONUS = 500) OR (PAY = 1450 AND BONUS = 300)
OR (PAY = 1200 AND BONUS = 0) OR (PAY = 3550 AND BONUS IS NULL);

---------2021.01.26.��-----------------------------------------------

--dml(data manipulation language)
--insert������ ����, update����, delete����

--crud

SELECT * FROM division;
desc division;--not null �ݵ�� ���� �־��?

INSERT into division values(50, 'operation', '031-111-2222', 'DAEGU');
DELETE division values(50, 'operation', '031-111-2222', 'daegu');
INSERT INTO DIVISION (DNO) VALUES(60);
INSERT INTO DIVISON (DNAME, POSITION) VALUES ('ACCOUNT', 'DAEJUN');--�����?
--DNO�� NOT NULL�̹Ƿ� ���� ������ �־�ߵǴµ� �� �ڵ忡�� �ȵ��� �����?

INSERT INTO PERSONNEL (PNO, PNAME, PAY, DNO)
VALUES (7711, 'YOUNG', 4000, 20);

SELECT*FROM PERSONNEL;
DESC PERSONNEL;
--ERROR: UNIQUE CONSTRAINTS ->�Ȱ��� ���� (�̹�)���ִ� ��� ���� 
--�Ͻ���

--�����

INSERT INTO DIVISION VALUES (70, 'PLANNING', '010-5777-7890', NULL);
INSERT INTO DIVISION VALUES (70, 'PLANNING', '010-5777-7890', '');

SELECT * FROM DIVISION;
UPDATE DIVISION SET DNAME = 'OPERATION', POSITION = 'DAEGU' WHERE DNO = 50;


INSERT INTO PERSONNEL (PNO, PNAME, JOB, STARTDATE, DNO)
VALUES (1300, 'CHO', 'SALESMAN', SYSDATE, 10);

SELECT*FROM PERSONNEL;

SELECT STARTDATE, TO_CHAR(STARTDATE, 'YYYY-MM-DD') NALJJA FROM PERSONNEL;

---ġȯ����---����Ŭ����.
SELECT PNO, PNAME, JOB, STARTDATE, DNO
FROM PERSONNEL
WHERE DNO = 30;--���� �ִ� ���� ������ �ٲ� �� ����

SELECT PNO, PNAME, JOB, STARTDATE, DNO
FROM PERSONNEL
WHERE DNO =& DIV_DNO;--&�� ����� ġȯ������.
--���� �� �ڵ�� ���⼭ ����ȵǾ �Ϲ� CMD â ����
/*
CREATE TABLE MANAGER --�Ŵ��� ���̺� ������
AS 					 --���?
	SELECT * FROM PERSONNEL-- �۽��ο��� ������ ���·� ���̺� ������
	WHERE 1=2; --1=2�� ���� �����̹Ƿ� �����͸� �Ȱ������� ���̺�
				 ���¸� ����Ǿ �������
*/
SELECT * FROM MANAGER;
DESC MANAGER;

SELECT * FROM SALESMAN;
SELECT * FROM BUSEO;
--������ SAVE �۾��� ���带 ���ؼ� ���� �����͸� �����ؼ�
--���� ������ ���̺�� ������ �ʰ� ���� ���̺� ���� ����

SELECT * FROM DIVISION;

COMMIT;--SAVE

SELECT * FROM SAWON;

SELECT * FROM TAB;

--SUB-QUERY
SELECT * FROM MANAGER;
DESC MANAGER;

SELECT * FROM PERSONNEL WHERE JOB = 'MANAGER';

--SELECT�� ����� Ư�� �����Ϳ� ����ִ� ��
INSERT INTO MANAGER(PNO, PNAME, PAY, STARTDATE)
SELECT PNO, PNAME, PAY, STARTDATE FROM PERSONNEL
WHERE JOB = 'MANAGER';

SELECT * FROM MANAGER;


--������ SALEMAN�� ����� ��� ������ SALESMAN TABLE�� ����

SELECT * FROM SALESMAN;

INSERT INTO SALESMAN
SELECT * FROM PERSONNEL
WHERE JOB = 'SALESMAN';

COMMIT;--�ؿ� AUTO COMMIT ����� �ִ�.

--UPDATE
--�����ȣ�� 1111�� ����� �μ��� 30���� ����
SELECT* FROM PERSONNEL WHERE PNO = 1111;
UPDATE PERSONNEL SET DNO = 30--������� �ϸ� ��� �����Ͱ� DNO�� �� 30���� �ٲ�
WHERE PNO = 1111;

UPDATE PERSONNEL SET JOB = 'SALESMAN', MANAGER = 1111,
STARTDATE = SYSDATE, BONUS = 200 WHERE PNO = 7711;

SELECT * FROM PERSONNEL;

COMMIT;--�ݵ�� ���� �� SAVE�ϱ�

SELECT * FROM SAWON;

UPDATE SAWON SET DNO = 20;

ROLLBACK; 

--SUB-QUERY�� ����

SELECT DNO FROM DIVISION WHERE DNAME = 'SALES';--30

SELECT * FROM PERSONNEL
WHERE DNO = (SELECT DNO FROM DIVISION WHERE DNAME = 'SALES');

UPDATE PERSONNEL SET JOB = 'SALESMAN'
WHERE DNO = (SELECT DNO FROM DIVISION WHERE DNAME = 'SALES');

SELECT * FROM PERSONNEL;
SELECT * FROM DIVISION;

--JOIN

SELECT A.*
FROM PERSONNEL A INNER JOIN DIVISION B
ON A.DNO = B.DNO
AND DNAME = 'SALES';

SELECT A.*
FROM PERSONNEL A, DIVISION B
WHERE A.DNO = B.DNO
AND DNAME = 'SALES';

UPDATE PERSONNEL SET JOB = 'SALESMAN'
FROM PERSONNEL A, DIVISION B
WHERE A.DNO = B.DNO
AND DNAME = 'SALES';--����Ŭ���� ��?. MS-SQL������ ?

COMMIT;

--DELETE
--�����ȣ�� 1300�� ��� ����

SELECT * FROM PERSONNEL WHERE PNO = 1300;

DELETE FROM PERSONNEL WHERE PNO = 1300;
--FROM�� ����Ŭ, MS-SQL �Ѵ� ���� ����

SELECT * FROM SAWON;

DELETE SAWON;

ROLLBACK;

COMMIT;
--�μ����� BUSAN�� �μ��� �μ���ȣ�� ã�� �� �μ��� �ش��ϴ� ���� ����

SELECT * FROM PERSONNEL
WHERE DNO = (SELECT DNO FROM DIVISION WHERE POSITION = 'BUSAN');

DELETE PERSONNEL
WHERE DNO = (SELECT DNO FROM DIVISION WHERE POSITION = 'BUSAN');

COMMIT;

--DML ���� ����� ������
--INSERT ERROR

SELECT* FROM PERSONNEL;
DESC PERSONNEL;

INSERT INTO PERSONNEL (PNO, PNAME, DNO) VALUES(1300, 'SONG', 99);--X
--unique constraint �������� ������ ����� ������
--PK (PRIMARY KEY) = ���� �ߺ��� ���x. NULL ��� X. �ݵ�� �� �Է�.
--TABLE�� 1���� COLUMN ��������. �ٸ� �÷����� ������. 1���� �÷��� ����

SELECT * FROM USER_CONSTRAINTS;--�������Ǹ� ������ ���̺�

--UPDATE ERROR
SELECT * FROM DIVISION;
SELECT * FROM PERSONNEL;
--PERSONNEL_DNO_FK - FOREIGN KEY

UPDATE PERSONNEL SET DNO = 90;--DNO�� 90�����Ƿ� �������� ERROR.

--DELETE ERROR
DELETE DIVISION WHERE DNO = 30;--��� ������
--PERSONNEL�� DIVISION���� ���ÿ� ����ϰ� �ִ� �����͸� �����Ϸ��� �ؼ�
--ERROR��

COMMIT;

--TRANSACTION LOG
--EX) A���¿��� B���·� 5000�� �۱�
/*
1. A���� �ִ��� ���� Ȯ��
2. A���� �ܾ� Ȯ��(10000��)
3. A���¿��� 5000�� ���� (�ܾ� 5000�� ���)
4. B���� Ȯ��
5. B���·� 5000�� �۱� --���⼭ �������� 
6. B���� �ܾ� Ȯ��(6000��)
7. B���� 5000�� ����(�ܾ� 11000��)
8. �۾� �� --COMMIT;
*/
 
 --UNDO1.LOG
-- 3���� ���� LOG���� �����ص� ������
--INSERT, UPDATE, DELETE ��� �� ���� �Ǿ��� �� TRANSATION ����
--�����͸� �� ���� COMMIT, �����ؾߵǸ� ROLLBACK���� �ϰ� COMMIT
--3���� ���� ���� TRANSATION

--TRANSACTION LOCK

--2022-09-10 FLIGHT TICKET ����

--TCL(TRANSACTION CONTROL LANGUAGE)
--COMMIT, ROLLBACK, SAVEPOINT = CHECKPOINT



--AUTO COMMIT-
--DDL(CREATE, ALTER, DROP, RENAME)->������ AUTO COMMIT
--DCL(GRANT, REVOKE) GRANT ���� �ֱ�. REVOKE ���� ���

SELECT * FROM TAB;
SELECT * FROM DIVISION;

--DDL(CREATE, ALTER, DROP, RENAME)
--OBJECT : TABLE, INDEX, SYNONYM, SEQUENCE, VIEW

--TABLE : DATA TYPE�� ���� �־��?
/*
CHAR : ����(��������)
VARCHAR2 : ����(��������)
VARCHAR -�������� ������ VARCHAR2�� ��
NUMBER(P, S) : ����
DATE : ��¥(���� ����)
LONG : ����(���� ����, 2GB) --�߾Ⱦ�
*/

/*
5�ڸ� ������ 4�ڸ��� �Է� ���� ���

CHAR(5) - ���� 1�ڸ� ������ �״�� �־� �ʿ���� ���� ���� ����.
		- ������ ó�� �ӵ� ����.(�д� �ӵ� ����)
		- �̸�, �����ȣ ó�� ����� ������ ������ �� �� ���
		
VARCHAR(5) - ���� 1�ڸ��� �޸�OS�� ��ȯ���Ѽ� ���� �ʰ�
�ʿ��� �� �ٽ� �޶�� �ؼ� ��밡��(���ʿ��� ���� ���� ����)
		   - ������ �����Ͱ� ����� ������ ����� ������ ���� �ʾ�
		   HEADER �а� �����͸� �б� ������ �ӵ� ����.
		   - �ּҰ��� ������ �� �� ���
		   - A A A A A B AB��½� �� �޸𸮿� B�� �߰������� 
		   ���ŷӱ⿡ '����ȭ' �۾� �ʿ�
*/

SELECT * FROM PERSONNEL WHERE PNO = 1111;
--�Ϲ������� PNO�� CHAR�� ���� -> �д� �Ҹ� ����

CREATE TABLE BUSEO1--�׻� ()���η� ������
(DNO NUMBER(2), --99������ �� 2�ڸ�����
DNAME VARCHAR(14),
ZIPCODE CHAR(7));

SELECT * FROM BUSEO1;
DESC BUSEO1;

INSERT INTO BUSEO1 VALUES(10, 'AAA', '123-123');

INSERT INTO BUSEO1 VALUES(20, 'BBB', '222-333');

/*
1.������ ����(30��)
2.������,���� ��밡��(����������)
3.Ư�����ڴ� _,$,#�� ��밡��
4.�̸��� �ߺ�������
5.�÷����� Ʋ������
6.����� ������-���⼭ ���� ���� ��? SELECT, VALUES���� �ɷ� �̸� ����

--��밡���� �̸�
Sawon,P_NO,Division10,Name_Rule--������ ������

--���Ұ����� �̸�
10division, $sal, p-no, Alter--������ ������, ALTER �����

*/

CREATE TABLE CUSTOM
(ID CHAR(5) PRIMARY KEY,
PWD CHAR(3),
NAME CHAR(6),
ADDR VARCHAR2(50),
ZIP CHAR(5),
BIRTH DATE,
JUMIN CHAR(14),
AGE NUMBER,--���ڸ� �Ⱦ��� ���� ���� ��ŭ= ����
TEL CHAR (14));

DESC CUSTOM;

INSERT INTO CUSTOM
VALUES('A001', '123', 'SUZI', '����', '12345','94-10-10', '941010-2123456', 29, '010-1234-5656');

SELECT * FROM CUSTOM;

INSERT INTO CUSTOM
VALUES(NULL, '123', 'INNA', '����', '12345','94-10-10', '941010-2123456', 29, '010-1234-5656');

INSERT INTO CUSTOM
VALUES('A001', '123', 'INA', '����', '12345',SYSDATE, '941010-2123456', 29, '010-1234-5656');

DROP TABLE CUSTOM;

SELECT * FROM USER_CONSTRAINTS;--DICTIONARY
--PK �̸� ȸ�縶�� �ٸ��� ���� ���� ������ �� �ְ�
--����Ŭ ���� ������ �� ���� ����.
--DIVISION_DNO_PK PRIMARY KEY �̷������� �����
--�̸�_PK �������� ������ָ� ���� ����

DROP TABLE CUSTOM;

SELECT * FROM CUSTOM;

SELECT * FROM USER_CONSTRAINTS;

CREATE TABLE CUSTOM
(ID CHAR(5) CONSTRAINT CUSTOM_ID_PK PRIMARY KEY,
PWD CHAR(3),
NAME CHAR(6),
ADDR VARCHAR2(50),
ZIP CHAR(5),
BIRTH DATE,
JUMIN CHAR(14),
AGE NUMBER,--���ڸ� �Ⱦ��� ���� ���� ��ŭ= ����
TEL CHAR (14));

DESC CUSTOM;
COMMIT;

---------2021.01.27.��---------------------------------

CREATE TABLE SALESMAN1
AS SELECT PNO, PNAME, JOB, PAY FROM PERSONNEL
WHERE JOB = 'SALESMAN';

SELECT * FROM SALESMAN1;

CREATE TABLE MANAGER1
AS SELECT * FROM PERSONNEL WHERE JOB = 'MANAGER';

SELECT * FROM MANAGER1;

CREATE TABLE PAY3000
AS
SELECT * FROM PERSONNEL WHERE PAY >= 3000;

SELECT * FROM PAY3000;

--PERSONNEL ���̺��� 12���޿� �Ի��� �������� �����͸� MON12�̶� ���̺�� ����


CREATE TABLE MON12
AS
SELECT * FROM PERSONNEL WHERE TO_CHAR(STARTDATE, 'MM') = '12';

--CREATE TABLE MON13
--AS
--SELECT * FROM PERSONNEL WHERE EXTRACT (MONTH FROM STARTDATE) = 12;


SELECT * FROM MON12;

DROP TABLE MON13 PURGE;--��������

CREATE TABLE MON4
AS
SELECT * FROM PERSONNEL WHERE TO_CHAR(STARTDATE, 'MM') = '04';

SELECT * FROM MON4;

DROP TABLE MON4 PURGE;

CREATE TABLE ANALYST (NUM, NAME, JOB, DNUM)
AS
SELECT PNO, PNAME, JOB, DNO FROM PERSONNEL
WHERE JOB = 'ANALYST';

SELECT * FROM ANALYST;

--�μ���ȣ�� 10�� �μ��� �ѱ޿� ������ DIV10 ���̺�� ����ÿ�

SELECT * FROM PERSONNEL;
CREATE TABLE DIV10
AS
SELECT DNO, SUM(PAY) SUM_PAY FROM PERSONNEL
GROUP BY DNO
HAVING DNO = 10;--�μ���ȣ�� 10�����̶�� ������ �־ HAVING���

SELECT * FROM DIV10;

 SELECT * FROM PERSONNEL;
 CREATE TABLE SAWON1
 AS
 SELECT * FROM PERSONNEL
 WHERE 0 = 1; --���� ���� �Է�->����Ÿ ���X.���̺� ����?
 
 SELECT * FROM SAWON1;
 
 DESC PERSONNEL;
 --NOT NULL�� PRIMARAY KEY������ �������
 --PK : NULL X, �ߺ� X. ���̺� 1������.
 
 DESC SAWON1;--PK�� ���� �ȵǾ ���� ��������?
 
 --CREATE�� OBJECT ���� �� ���
 
 SELECT * FROM SALESMAN1;
 DESC SALESMAN1;
 
-- COLUMN �߰�
ALTER TABLE SALESMAN1
ADD (DNO NUMBER(2)); --�÷��߰�.
--�÷� �ٲٱ� ALTER(SQL���� = ��������)/MODIFY(����Ŭ)

SELECT * FROM SALESMAN1;

--��ȹ->��ɰ˻�->DB ¥��

ALTER TABLE SALESMAN1
ADD(JUMIN CHAR(14), ZIP CHAR(7));--2�� �̻��� �� ()����

SELECT * FROM SALESMAN1;
--L TABLE �־���. �̰� ���� �߰� �ؼ� ����� L �̶�� �ϴµ�
--�̷��� ������ ����..����

ALTER TABLE SALESMAN1
ADD BIGI VARCHAR2(10) DEFAULT('AA');--DEFAULT(SYSDATE)�� ����
--DEFAULT�� �ƹ����� ���� �ʾ��� �� NULL��� �־��� �ܾ� �ִ´�.

ALTER TABLE SALESMAN1
ADD (MARRIAGE CHAR(8) CONSTRAINT SALESMAN1_MARRIAGE_CK
CHECK (MARRIAGE IN ('SINGLE', 'MARRIED')));

SELECT * FROM SALESMAN1;

INSERT INTO SALESMAN1 VALUES(111, 'CHO', 'SALESMAN', 2000, 10,
'11111', '123-123', 'BB', 'SINGLE');

INSERT INTO SALESMAN1 VALUES(222, 'CHO', 'SALESMAN', 2000, 10,
'11111', '123-123', 'BB', 'SOLO');

SELECT * FROM USER_CONSTRAINTS;

---MS- NOT NULL �������� �ƴ�
--����Ŭ�� DEFAULT 

--PK �� ���. ������ ������?

--���Ἲ�� ������
--UK(UNIQUE KEY): �ߺ��� X
--NULL��->����Ŭ�� ��� ���./MS-SQL�� 1���� ��밡��

--NOT NULL = NN
--FOREIGN KEY: �ܺ����� Ű.
--���� : �����Ǵ� �÷��� �����ϴ� �÷� �� �Ѵ� ���ƾ�?.
--VALUES(4)�̸� �Ѵ� �̰ſ���?

--������ ������ ���̽� = ǥ�� ������ ���� ��
--����ȭ? ���̺��� �ɰ��� ��. 1��->2��, 2->3��
--������ȭ : ���̺��� �ɰ��ٰ� �ٽ� ���̴� ��

DESC SALESMAN1;

ALTER TABLE SALESMAN1
ADD CONSTRAINT SALESMAN1_PNO_PK PRIMARY KEY(PNO);
--���������� �߰�.PK��.PNO���ٰ� ����ž�

SELECT * FROM USER_CONSTRAINTS;
SELECT * FROM SALESMAN1;

SELECT * FROM MANAGER1;

--MANAGER1 ���̺� COMM �÷��� NUMBER(5)�� �߰�

SELECT * FROM MANAGER1;

ALTER TABLE MANAGER1
ADD COMM NUMBER(5);

--MANAGER1 ���̺� PNO �÷��� PK�� �߰�
ALTER TABLE MANAGER1
ADD CONSTRAINT MANAGER1_PNO_PK PRIMARY KEY(PNO);

SELECT * FROM USER_CONSTRAINTS;
-----------------------------------------------------
DESC MANAGER1;
SELECT * FROM MANAGER1;

ALTER TABLE MANAGER1
MODIFY PNAME VARCHAR2 (16);

ALTER TABLE MANAGER1
MODIFY PNAME VARCHAR2 (5);--X
--�̹� �� �ִ� �������� ���� ū ������ �����θ� ���� �� �ִ�.
--EX)JOHNSON ���� ���� 7�����̹Ƿ� 7�� ���ϼ� �ִ�

ALTER TABLE MANAGER1
MODIFY PNAME VARCHAR2 (7);

----DROP(�÷�, ��������)

SELECT * FROM USER_CONSTRAINTS;

ALTER TABLE MANAGER1
DROP CONSTRAINT MANAGER1_PNO_PK;

ALTER TABLE SALESMAN1
DROP CONSTRAINT SALESMAN1_PNO_PK;

--PRIMARAY KEY�� 1���̹Ƿ�
--�Ʒ�ó�� ���� �� �ִ�.
ALTER TABLE SALEMAN1
DROP PRIMARY KEY;

--this unique/primary key is referenced by some foreign keys
--�����ϰ� �־ ������
--������ �� �ִ� Ű�� PK�̰ų� UK.
ALTER TABLE DIVISION
DROP PRIMARY KEY;

SELECT * FROM USER_CONSTRAINTS;

ALTER TABLE DIVISION
DROP PRIMARY KEY CASCADE;--���� ����. PK, FK �Ѵ� ������

SELECT * FROM SALESMAN1;
DESC SALESMAN1;

ALTER TABLE SALESMAN1
DROP COLUMN MARRIAGE;


--SET UNUSED
--��Ȱ��ȭ = FLAG�� �ȾƳ���
ALTER TABLE SALESMAN1
SET UNUSED COLUMN DNO;
--�����Ǿ��� ��ó�� ������
--�Ϲ� ����ڰ� ���� �Ұ���

--SELECT * FROM DBA_UNUSED_COL_TABS;-DICTIONARY�� ����

SELECT * FROM SALESMAN1;

--UNUSED DATA ��¥ ����
--FLAG�� DROP �� ���̴�
 ALTER TABLE SALESMAN1
 DROP UNUSED COLUMNS;
 
-- ALTER �϶� ADD, MODIFY, DROP ���

SELECT * FROM TAB;
 
DROP TABLE MANAGER1;

--������ �� �鿩�ٺ���
SELECT * FROM RECYCLEBIN;

SELECT OBJECT_NAME, ORIGINAL_NAME, DROPTIME FROM RECYCLEBIN;

--����
FLASHBACK TABLE MANAGER1 TO BEFORE DROP;
FLASHBACK TABLE "BIN$kttMXXmtQD+3yIhZNTcXlA==$0" TO BEFORE DROP;
--�Ʒ��� �����۾� �ٸ� ������ �����ߴٰ� �ٽ� ������ ����.
SELECT * FROM "BIN$FQHN0CDkSOqCOxHoICut+w==$0";

DROP TABLE SALESMAN1 PURGE;

PURGE RECYCLEBIN;--������ ���� = ��������

--TRUNCATE/DELTE
--DROP�� TABLE �����

SELECT * FROM PERSONNEL;

DELETE PERSONNEL; --DATA �����

ROLLBACK;--INSERT, UPDATE, DELETE �϶��� ���.

-----------------------------------------------------

TRUNCATE TABLE PERSONNEL;--�ٷ� ������ �����ϴ� ��!!!

SELECT * FROM PERSONNEL;

ROLLBACK;

--RENAME
SELECT * FROM TAB;
--TAB�� �⺻������ ������
--TABS�� DB �����ڰ� �ַ� �����

SELECT * FROM PAY3000;

--TABLE �̸� �ٲٱ�
RENAME PAY3000 TO HIGHPAY;

SELECT * FROM HIGHPAY;

--DCL(DATA CONTROL LANGUAGE) : GRANT, REVOKE
/*
GRANT: USER/ OBJECT�� ���� �ο� �� ���
REVOKE : USER/ OBJECT�� ���� ȸ�� �� ���
*/

--�������� �� - ERROR���� ������ �������
--SYSTEM ���� kim���� �����ֱ�
CREATE USER TEST--ID
IDENTIFIED BY TEST--PW
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;


--������ ����Ա� ������ ������
CREATE USER SUZI--ID
IDENTIFIED BY SUZI--PW
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

SELECT * FROM DBA_USERS;
--SELECT * FROM USERS_USERS;--�տ� USERS�� �Ϲ� ����� ���������ؼ�
--���⼭ ���������� ���� DBA_USERS;�� SYSTEM������ �����ϴ�.

--OBJECT ����

GRANT SELECT ON PERSONNEL TO SUZI;

--�ֺ� TEST?
GRANT SELECT, INSERT, DELETE ON DIVISION TO SUZI;

SELECT * FROM PERSONNEL;

COMMIT;

--���� ������ � ����ڿ��� ����� �� �� ����
SELECT * FROM USER_TAB_PRIVS_MADE;

--��� ����ڰ� KIM�� DIVISION�� ���� �����ϰ� �� �� ����
GRANT SELECT ON KIM.DIVISION TO PUBLIC;

-------------------------------------------------------------

--OBJECT ���� PUBLIC ȸ���ϱ�

REVOKE SELECT ON DIVISION FROM PUBLIC;

--SUZI���� ���� ȸ��

REVOKE SELECT ON PERSONNEL FROM SUZI;

REVOKE SELECT, INSERT, DELETE ON DIVISION FROM SUZI;

SELECT * FROM USER_TAB_PRIVS_MADE;

REVOKE INSERT, DELETE ON PERSONNEL FROM SUZI;

CREATE ROLE MANAGER;--���⼭�� ������.SYSTEM���� ����

SELECT * FROM ROLE_SYS_PRIVS
WHERE ROLE IN ('CONNECT', 'RESOURCE');

SELECT * FROM ROLE_SYS_PRIVS
WHERE ROLE ='CONNECT'OR ROLE = 'RESOURCE';

------2021.01.28.��----------
--����
/*
��������(���Ἲ)
PK
FK
UK UNIQUE KEY
NOT NULL
CHECK
*/

CREATE TABLE CUSTOMER
(ID NUMBER(4) CONSTRAINT CUSTOMER_ID PRIMARY KEY,
NAME VARCHAR2(10),
NO NUMBER(4));

SELECT * FROM USER_CONSTRAINTS;

--COLUMN LEVEL�� ������ ��

--ȸ�翡�� �Ʒ� ���� ��ȣ��!!!!!!!!!!!!
CREATE TABLE ORDERS
(NO NUMBER(4), SNO NUMBER(4), --NO NUMBER(4)�� ����
NAME VARCHAR2(10),
COUNT NUMBER(7),
CONSTRAINT OREDRS_NO_PK PRIMARY KEY(NO));--TABLE LEVEL �����̶�� �θ�

/*
CREATE TABLE ORDERS
(NO NUMBER(4), SNO NUMBER(4),
NAME VARCHAR2(10),
COUNT NUMBER(7),
CONSTRAINT OREDRS_NO_PK PRIMARY KEY(NO), �߰�����);
*/

SELECT * FROM ORDERS;
SELECT * FROM CUSTOMER;

ALTER TABLE CUSTOMER
ADD CONSTRAINT CUSTOMER_NO_FK FOREIGN KEY(NO)
REFERENCES ORDERS(NO);

SELECT * FROM USER_CONSTRAINTS;

CREATE TABLE CATALOGS
(CATALOGNO NUMBER(4) CONSTRAINT CATALOGS_CATALOGNO_PK PRIMARY KEY,
NAME VARCHAR2(10),
NO NUMBER(4) CONSTRAINT CATALOGS_NO_FK REFERENCES ORDERS(NO));
--ORDERS�� NUMBER�� �����ϰ� ���� ����.
--ORDERS�� CATALOGS�� ���� ������ ���¿���?

SELECT* FROM ORDERS;

INSERT INTO ORDERS VALUES(10, 111, 'AAA', 11);
INSERT INTO ORDERS VALUES(20, 222, 'BBB', 22);
INSERT INTO ORDERS VALUES(30, 333, 'CCC', 33);


SELECT * FROM CUSTOMER;
INSERT INTO CUSTOMER VALUES(111, 'SUZI', 10);
INSERT INTO CUSTOMER VALUES(222, 'INNA', 20);
INSERT INTO CUSTOMER VALUES(333, 'INSUN', 30);
INSERT INTO CUSTOMER VALUES(444, 'IN', 40);--X. FK ERROR

SELECT * FROM CATALOGS;
INSERT INTO CATALOGS VALUES (777, 'SUZI', 20);
INSERT INTO CATALOGS VALUES (888, 'INNA', 30);
INSERT INTO CATALOGS VALUES (999, 'IN', 40);--X. parent key not found
--PK ERROR

DELETE ORDERS WHERE NO = 20;--X.child record found-�����ϴ� ������ �߰�.

DELETE CUSTOMER WHERE NO = 20;

DELETE CATALOGS WHERE NO = 20;

SELECT * FROM CATALOGS;

COMMIT;

SELECT * FROM ORDERS;

--UNIQUE
--ORACLE : NULL ���
--MS -SQL : 1���� ���

SELECT * FROM ORDERS;
DESC ORDERS;

--SNO�� UNIQUE�� �־��(�ʿ��� ���� ������ �־��ֱ⵵��)

ALTER TABLE ORDERS
ADD CONSTRAINT ORDERS_SNO_PK UNIQUE(SNO);

SELECT * FROM ORDERS;

INSERT INTO ORDERS VALUES(40, '', 'DDD', 44);--NULL�� �����
INSERT INTO ORDERS VALUES(50, '', 'EEE', 55);
INSERT INTO ORDERS VALUES(60, '333', 'FFF', 66);--X.�ߺ� ���X
--unique constraint (KIM.ORDERS_SNO_PK) violated


--CHECK
SELECT * FROM ORDERS;
ALTER TABLE ORDERS
ADD CONSTRAINT ORDERS_SNO_CK CHECK(SNO BETWEEN 100 AND 500);

INSERT INTO ORDERS VALUES(60, '501', 'FFF', 66);--X.�������

--CHECK ������ ����� NOT NULL -ALTER���
ALTER TABLE ORDERS
ADD CONSTRAINT ORDERS_NAME_NN CHECK (NAME IS NOT NULL);
DESC ORDERS;

SELECT * FROM USER_CONSTRAINTS;

--NOT NULL--Ȯ���غ��� CONSTRAINT_TYPE = C = CHECK�̴�
CREATE TABLE TEST1
(NO NUMBER(4) CONSTRAINT TEST1_NO_NN NOT NULL);

--���������� �߰�,������ ����.���� XID
ALTER TABLE TEST1
DROP CONSTRAINT TEST1_NO NN;

ALTER TABLE ORDERS
DROP CONSTRAINT ORDERS_NO_PK;--X.FK�� �ֱ⿡ ����������
--�������(���� ����)

--DICTIONARY
SELECT COUNT(*) FROM DICTIONARY;--804. �� ������ ������ SYSTEM�� �� ������
SELECT * FROM DICTIONARY;--�츮�� ����ϴ� ���� �����ϴ� ���� ����.
SELECT * FROM USER_CONSTRAINTS; --�������� �����ϴ� DICTIONARY

/*
USER_: USER ������ OBJECT ����
ALL_ : USER���� ACCESS�� ���� OBJECT ����(ALL�� USER�� ���ԵȰ�)
DBA_ : DBA ������ ���� USER�� ACCESS �� �� �ִ� ����.
       �Ѹ���� �����ڱ⿡ �� �� �� ����(��������)
V$   : SERVER�� ���ɿ� ���� ����
*/

SELECT * FROM V$VERSION;--ORACLE VERSION����

SELECT * FROM ALL_CONSTRAINTS;--ALL�� ���������� ū ��. ���ڸ� S���̱�
SELECT * FROM ALL_CONS_COLUMNS WHERE TABLE_NAME = 'ORDERS';
--ORDERS�� � TABLE�� � COLUMN�� � ������ �ִ��� Ȯ�ΰ���

SELECT * FROM DBA_CONS_COLUMNS;--X.table or view does not exist--DBA�� ����.
SELECT * FROM USER_TABLES;
SELECT* FROM USER_SYS_PRIVS;

--VIEW----�� �����??? --����!!!!!!!!!
--���� ���̺�

SELECT * FROM PERSONNEL WHERE DNO = 10;

CREATE VIEW PER10_V
AS
SELECT * FROM PERSONNEL WHERE DNO = 10;

--SYSTEM ���� ���� �ֱ�
-- GRANT CREATE VIEW TO kim; ������ ���༭ ������ �Ʊ� error���� ��.

SELECT * FROM USER_VIEWS;

SELECT * FROM PER10_V;

--INLINE VIEW ���� ���̴� ���̺�. JOIN���� (SELECT ��¼��)A, (SELECT ��¼��)B

SELECT * FROM PER10_V WHERE PNO = 1111;

CREATE VIEW PER20_V
AS
SELECT PNO, PNAME, MANAGER, PAY, DNO FROM PERSONNEL;

--�� �μ��� ���
SELECT * FROM PER20_V;
CREATE VIEW PER_AVG
AS
SELECT DNO, AVG(PAY) ���, SUM(PAY) �հ�
FROM PERSONNEL
GROUP BY DNO;

SELECT * FROM PER_AVG;

SELECT * FROM PER_AVG WHERE DNO = 10;
SELECT * FROM PER_AVG; WHEN �հ� > 8000;

INSERT INTO PER20_V VALUES (1234, 'JJJ', 1001, 2000, 20);

SELECT * FROM PERSONNEL;

UPDATE PER20_V SET PNAME = 'AAA' WHEN PNO = 1234;

DELETE PER20_V WHERE PNO = 1234;

--�̷��� UPDATE, INSERT, DELETE�� �Ǵ� ���� SIMPLE VIEW.
--SIMPLE VIEW : �ϳ��� ���̺��� ���� VIEW�� ����.
--                UPDATE, INSERT, DELETE����
--JOIN������ ���� VIEW�� COMPLETE VIEW��� ��.
--2�� �̻� JOIN���� ���� VIEW�� ������
--2���̻��� ���̺��� JOIN�ؼ� ���� VIEW�� UPDATE, INSERT, DELETE �Ұ���.

SELECT * FROM PERSONNEL;

--PK�� ���� VIEW ���� ���
CREATE VIEW PER
AS
SELECT PNAME, JOB, PAY FROM PERSONNEL;

DROP VIEW PER;

SELECT * FROM PER;	--X.�Է��� ��?

INSERT INTO PER VALUES ('BBB', 'ACCOUNT', 3000);--X NULL�־
	
SELECT * FROM PER_AVG;

INSERT INTO PER_AVG VALUES(40, 1234, 5000);--X
--�����Ͱ� ���� ���¿��� �������� �ؼ� ��?
--40���� �����Ͱ� �ƴ� ���� �����Ͱ� ����?

--����
CREATE -> ALTER; --VIEW������ ALTER ��?

SELECT * FROM USER_VIEWS;

SELECT * FROM PER20_V;

--�����ϱ� : CREATE OR REPLACE �� �Ѵ� ���?
CREATE OR REPLACE VIEW PER20_V --VIEW�� ����.
(��ȣ, �̸�, ����, �μ���ȣ)
AS
SELECT PNO, PNAME, JOB, DNO FROM PERSONNEL
WHERE DNO = 20;

SELECT * FROM PER20_V;

--����
DROP VIEW PER_AVG;

SELECT * FROM PER_AVG;


--COMPLEX VIEW
--JOIN������ ���� VIEW
--INSERT, UPDATE, DELETE �Ұ�

CREATE TABLE ������
(����ȣ CHAR(10), �̸� CHAR(10));

CREATE TABLE ȸ������
(����ȣ CHAR(10), ȸ��� CHAR(10));

INSERT INTO ������ VALUES ('A001', 'ȫ�浿');
INSERT INTO ������ VALUES ('A002', '�̼���');
INSERT INTO ȸ������ VALUES ('A001', 'LG');
INSERT INTO ȸ������ VALUES ('A002', 'KAKAO');
DELETE ȸ������ WHERE (�̸� = 'ȫ�浿' , ȸ��� = 'KAKAO');
COMMIT;

SELECT * FROM ������;
SELECT * FROM ȸ������;

CREATE OR REPLACE VIEW ����
AS
SELECT K.����ȣ, �̸�, ȸ���
FROM ������ K, ȸ������ H
WHERE K.����ȣ = H.����ȣ;

SELECT * FROM ����;

INSERT INTO ���� VALUES ('A003', '�����', 'SAMSUNG'); --X

UPDATE ���� SET �̸� = '�����' WHERE ����ȣ = 'A001'; --X


---TOP-N
--���� �ֱٿ� �Ի��� 5���� ����� �̸��� �Ի糯¥ ���
SELECT * FROM PERSONNEL;

SELECT --ROWNUM, 
PNAME, STARTDATE FROM (SELECT * FROM PERSONNEL ORDER BY STARTDATE DESC)
WHERE ROWNUM <= 5;

--���̺� ��½� ���ʿ� ���̴� ���ڴ� ������ȣ!!
--�Ϸù�ȣ. ROWNUM
SELECT ROWNUM, PNAME FROM PERSONNEL;--�Ϸù�ȣ

SELECT ROWNUM, PNAME, STARTDATE FROM PERSONNEL--ROWNUM�� ������ȣ�� ���� ��������
ORDER BY STARTDATE DESC;

SELECT
ROWNUM, PNAME, STARTDATE FROM (SELECT PNAME, STARTDATE FROM PERSONNEL
ORDER BY STARTDATE DESC);

--������ ���ϱ�(3~6)--�ѹ� �� �������?

SELECT ROWNUM, PNAME, STARTDATE FROM
(SELECT ROWNUM, PNAME, STARTDATE FROM
(SELECT PNAME, STARTDATE FROM PERSONNEL ORDER BY STARTDATE DESC))
WHERE ROWNUM >= 3 AND ROWNUM <= 6;--X

SELECT RNUM, PNAME, STARTDATE FROM
(SELECT ROWNUM RNUM, PNAME, STARTDATE FROM
(SELECT PNAME, STARTDATE FROM PERSONNEL ORDER BY STARTDATE DESC))
WHERE RNUM >= 4 AND RNUM <= 5;

--�Խ��� ���� �� GAP �ִ� ������ȣ�� ������ �����ö� ������ ����ϴ� ��
--���߿� �� ��ﶧ �� �˷��ֽ� ����

--MS-SQL
SELECT TOP 5 PNAME, STARTDATE FROM PERSONNEL ORDER BY STARTDATE DESC;
--���� 5%�� ������
SELECT TOP 5 PERCENT PNAME, STARTDATE FROM PERSONNEL ORDER BY STARTDATE DESC;


--SYNONYM(���Ǿ�)-OBJECT :��Ī �����
CREATE SYNONYM INSA FOR PERSONNEL;--X

CREATE OR REPLACE SYNONYM INSA FOR KIM.PERSONNEL;

SELECT* FROM INSA;
SELECT * FROM KIM.PERSONNEL;--�� �� ����� �Ȱ���.

SELECT * FROM PERSONNEL;

SELECT ROWID, PNAME FROM PERSONNEL;
--AAAE7pAAEAAAAH3AAA(ROWID) �ȿ� ROW NUMBER ����.
SELECT * FROM PERSONNEL WHERE PNO = 1111;

CREATE INDEX PER_PAY_IDX
ON PERSONNEL(PAY);

SELECT * FROM USER_INDEXES;
--PK�� ����� ���� PK�� �Ȱ��� INDEX�� �����.
--CLUSTERED MS ���� OR NON-CLUSTERED ����X

CREATE TABLE AAA
(ID NUMBER CONSTRAINT AAA_ID_IDX PRIMARY KEY,
NAME CHAR(10));

SELECT * FROM USER_CONSTRAINTS;
SELECT * FROM USER_INDEXES;

--SEQUENCE(�Ϸù�ȣ) : ������ȣ/�������� ���� �� ���(���� ǥ��)
/*

CREATE SEQUENCE DIV_NO
INCREMENT BY 1
START WITH 1
MAXVALUE 100 || NOMAXVALUE<-��� �þ��
CYCLE || NOCYCLE
CACHE 20 || NOCACHE
*/

CREATE SEQUENCE PER_PNO
START WITH 90
INCREMENT BY 1 --������
MAXVALUE 99
NOCYCLE
NOCACHE;

SELECT*FROM USER_SEQUENCES;

--NEXTVALUE : SEQUENCE�� ����� ��ȣ(SEQUENCE�̸�.NEXTVAL)
--CURRVAL   : SEQUENCE��   ���� ��ȣ(SEQUENCE�̸�.CURRVAL)

SELECT PER_PNO.NEXTVAL FROM DUAL;

INSERT INTO DIVISION (DNO, DNAME, POSITION)
VALUES (PER_PNO.NEXTVAL, 'DEV', 'KOREA');

SELECT* FROM DIVISION;

SELECT PER_PNO.CURRVAL FROM DUAL;
--����:ALTER
ALTER SEQUENCE PER_PNO
INCREMENT BY 1
MAXVALUE 999
CACHE 10
NOCYCLE;

SELECT * FROM USER_SEQUENCES;
