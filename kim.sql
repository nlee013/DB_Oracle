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
