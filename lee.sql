select * from tab; --�ڵ� ������ ctrl + ENTER ġ�� data�� �Ʒ��� ����
--�����ּ�
/* �����ּ�*/
select * from CUSTOM;

SELECT * FROM COMPANY;

SELECT USERID, PAY, ROUND (PAY, -4) PAY FROM COMPANY;

select * from CUSTOM;

--�ֹι�ȣ * ǥ�� ����� :970614-2******
SELECT RPAD(SUBSTR(JUMIN, 1, 8), 14, '*') JUMIN FROM CUSTOM;

SELECT COUNT(*) INWON FROM CUSTOM WHERE JOB = 'ȸ���';

SELECT COUNT(*) INWON FROM CUSTOM WHERE ADDR1 LIKE '����%';

SELECT COUNT(*) INWON FROM CUSTOM WHERE POINT >= 200;

SELECT * FROM COMPANY;--TABLE�� �̸��� COLUMN�� �̸��� �ߺ��Ǹ� �߸��� ���̴�. �ϸ� �ȵȴ�

--�븮�� �޴� �ѱݾ�
SELECT COUNT(PAY) FROM COMPANY WHERE POSIT = '�븮';
--SUM: �հ�
SELECT SUM(PAY) FROM COMPANY WHERE POSIT = '�븮';

SELECT * FROM CUSTOM;

--������ �ο���
SELECT JOB, COUNT(*) INWON FROM CUSTOM GROUP BY JOB;

--�зº� POINT�� ���
SELECT SCHOL, ROUND(AVG(POINT)) INWON FROM CUSTOM GROUP BY SCHOL;

--������ POINT�� �հ�
SELECT ADDR1, ROUND(SUM(POINT)) INWON FROM CUSTOM GROUP BY ADDR1;

SELECT ADDR1, ROUND(SUM(POINT)) INWON, MAX(POINT)"MAX", MIN(POINT) "MIN" FROM CUSTOM GROUP BY ADDR1;


-- ���� ������ ��� �ο���
SELECT SEX, ROUND(AVG(AGE)) "AVG", COUNT(*) "CNT" FROM CUSTOM GROUP BY SEX;

SELECT CASE SEX WHEN '1' THEN '����' WHEN '0' THEN '����'
END GENDER, ROUND(AVG(AGE)) "AVG", COUNT(*) "CNT" FROM CUSTOM GROUP BY SEX;
/*
SELECT 
CASE �÷���                         
	WHEN 1 THEN 100,                          
	WHEN 2 THEN 200,                         
	WHEN 3 THEN 300,                         
	WHEN 4 THEN 400                          
	ELSE 500                        
END AS RESULT(RESULT->�Ļ� �÷���)            
FROM DUAL;
*/

--�ϳ��� ���� WHEN 1 THEN 100  ELSE 0 ó�� ����

SELECT*FROM COMPANY;
--��å�� ��ü ������ �հ�, ���, MAX, MIN
SELECT POSIT, COUNT(*) CNT, ROUND(AVG(PAY)) ���, MAX(PAY) �ִ�,
MIN(PAY) �ּ� FROM COMPANY GROUP BY POSIT;

HAVING CNT > 60 --  COUNT(*)���� �����͸� ����.*ǥ�� �ٲܼ� ����.*Ī ������.
