SELECT * FROM TAB;
SELECT * FROM EMP;--�μ�
SELECT* FROM DEPT;
SELECT * FROM SALGRADE;

--2. EMP ���̺��� �޿��� 3000�̻��� ����� ������ �����ȣ,�̸�,������,�޿��� ����ϴ� SELECT ������ �ۼ��Ͻÿ�.
SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE SAL >= 3000;

--3. EMP ���̺��� �����ȣ�� 7782�� ����� �̸��� �μ���ȣ�� ����ϴ� SELECT ������ �ۼ��Ͻÿ�.

SELECT ENAME, DEPTNO FROM EMP WHERE EMPNO = 7782;

--4. EMP ���̺��� �Ի����� February 20, 1981�� May 1, 1981 ���̿� �Ի��� ����� �̸�,����,�Ի����� ����ϴ� SELECT ������ �ۼ��Ͻÿ�. �� �Ի��� ������ ����Ͻÿ�.
SELECT ENAME, JOB, HIREDATE FROM EMP WHERE HIREDATE BETWEEN '81-02-20' AND '81-05-01';

--5. EMP ���̺��� �μ���ȣ�� 10,20�� ����� ��� ������ ����ϴ� SELECT ������ �ۼ��Ͻÿ�. �� �̸������� �����Ͽ���.
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM EMP WHERE DEPTNO IN(20, 30) ORDER BY ENAME;
 
--6. EMP ���̺��� �޿��� 1500�̻��̰� �μ���ȣ�� 10,30�� ����� �̸��� �޿��� ����ϴ� SELECT ������ �ۼ��Ͽ���. �� HEADING�� Employee�� Monthly Salary�� ����Ͽ���.
SELECT ENAME AS "Employee", SAL "Monthly Salary" FROM EMP WHERE SAL >= 1500 AND DEPTNO IN (10, 30);
 
--7. EMP ���̺��� 1982�⿡ �Ի��� ����� ��� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM EMP WHERE HIREDATE >= '82-01-01';
 
--8. EMP ���̺��� COMM�� NULL�� �ƴ� ����� ��� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM EMP WHERE COMM IS NOT NULL;
 
--9. EMP ���̺��� ���ʽ��� �޿����� 10%�� ���� ��� �������� ���Ͽ� �̸�,�޿�,���ʽ��� ����ϴ� SELECT ���� �ۼ��Ͽ���.
SELECT ENAME, SAL, COMM FROM EMP WHERE COMM >= SAL*1.1;
 
--10. EMP ���̺��� ������ Clerk�̰ų� Analyst�̰� �޿��� 1000,3000,5000�� �ƴ� ��� ����� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM EMP WHERE JOB IN('CLERK', 'ANALYST') AND SAL NOT IN(1000, 3000, 5000);
 
--11. EMP ���̺��� �̸��� L�� �� ���� �ְ�  �μ��� 30�̰ų� �Ǵ� �����ڰ� 7782�� ����� ��� ������ ����ϴ� SELECT ���� �ۼ��Ͽ���.
SELECT * FROM EMP WHERE REGEXP_COUNT (ENAME,'L') = 2 AND (MGR = 7782 OR DEPTNO = 30);
SELECT * FROM EMP WHERE ENAME LIKE '%L%L%' AND (MGR = 7782 OR DEPTNO = 30);

--------------2021.01.25.ȭ-----------------------------

--1. ���� ��¥�� ����ϰ� �� ���̺��� Current Date�� ����ϴ� SELECT ������ ����Ͻÿ�.

SELECT CURRENT_DATE FROM DUAL;

--2. EMP ���̺��� ���� �޿��� 15%�� ������ �޿��� �����ȣ,�̸�,����,�޿�,������ �޿�(New Salary),������(Increase)�� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT * FROM EMP;
SELECT EMPNO, ENAME, JOB, SAL AS "New Salary", SAL*1.15 AS "Increase" from emp;

--3. EMP ���̺��� �̸�,�Ի���,�Ի��Ϸκ��� 6���� �� ���ƿ��� ������ ���Ͽ� ����ϴ� SELECT ������ ����Ͻÿ�.
select ename, hiredate, NEXT_DAY(ADD_MONTHS(hiredate,6),'������') from emp;

--4. EMP ���̺��� �̸�,�Ի���, �Ի��Ϸκ��� ��������� �� ��,�޿�, �Ի��Ϻ��� ��������� �޿��� �Ѱ踦 ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ename, hiredate,ceil((SYSDATE - hiredate)/365*12), sal, floor(sal * (SYSDATE - hiredate)/365*12) from emp;

select ename,hiredate,ceil(months_between(sysdate,hiredate)) as ����,
sal, floor(months_between(sysdate,hiredate)*sal) as �޿��Ѱ� from emp;
--5. EMP ���̺��� ������ ����� ��µǵ��� �ۼ��Ͻÿ�.
--Dream Salary
------------------------------------------------------------
--3�� ����
--KING earns $5,000.00 monthly but wants $15,000.00
--BLAKE earns $2,850.00 monthly but wants $8,550.00
--CLARK earns $2,450.00 monthly but wants $7,350.00
--. . . . . . . . . .
--14 rows selected
SELECT ENAME  ||' earns '|| TO_CHAR(sal, '$99,999.99') ||' monthly but wants '|| TO_CHAR(SAL*3, '$999,999.99')  as "Dream Salary" FROM EMP;

--6. EMP ���̺��� ��� ����� �̸��� �޿�(15�ڸ��� ��� ������ ����� ��*���� ��ġ)�� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ename, lpad(sal, 15, '*') from emp;

--7. EMP ���̺��� ��� ����� ������ �̸�,����,�Ի���,�Ի��� ������ ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ename, job, hiredate, TO_CHAR(hiredate, 'day') as ���� from emp; 

--8. EMP ���̺��� �̸��� ���̰� 6�� �̻��� ����� ������ �̸�,�̸��� ���ڼ�,������ ����ϴ� SELECT ������ ����Ͻÿ�.
select * from emp where LENGTH(ename) >= 6 ;

--9. EMP ���̺��� ��� ����� ������ �̸�,����,�޿�,���ʽ�,�޿�+���ʽ��� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ename, job, sal, nvl(comm, 0) as bonus, (sal+nvl(comm, 0)) as "Pay+Bonus" from emp;

---------2021.01.26.��-----------------------
--1. EMP ���̺��� �ο���,�ִ� �޿�,�ּ� �޿�,�޿��� ���� ����Ͽ� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT * FROM EMP;

SELECT COUNT(*) INWON, (MAX)SAL, (MIN)SAL, SUM(SAL) FROM EMP; 

--2. EMP ���̺��� �� �������� �ִ� �޿�,�ּ� �޿�,�޿��� ���� ����ϴ� SELECT ������ �ۼ��Ͽ���.

 SELECT MAX(SAL) "MAX", MIN(SAL) "MIN", SUM(SAL) "SUM" FROM EMP GROUP BY JOB;

--3. EMP ���̺��� ������ �ο����� ���Ͽ� ����ϴ� SELECT ������ �ۼ��Ͽ���.

 SELECT JOB, COUNT(*) INWON FROM EMP GROUP BY JOB;

--4. EMP ���̺��� �ְ� �޿��� �ּ� �޿��� ���̴� ���ΰ� ����ϴ� SELECT ������ �ۼ��Ͽ���.

 SELECT MAX(SAL) "MAX", MIN(SAL) "MIN", MAX(SAL) - MIN(SAL) "����" FROM EMP;

--5. EMP ���̺��� �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.(group by)

SELECT TO_CHAR(HIREDATE, 'YY') H_YEAR, COUNT(*), MIN(SAL), MAX(SAL), AVG(SAL), SUM(SAL) FROM EMP GROUP BY HIREDATE;
--H_YEAR  COUNT(*)  MIN(SAL)  MAX(SAL)  AVG(SAL)  SUM(SAL)

------ --------- --------- --------- --------- ---------
/*
    81       10       950      5000    2282.5	  22825

    82        1      1300      1300      1300      1300

    80        1       800       800       800       800
 

5�� 6�� Ǯ ��
 SELECT 
CASE �÷���                         
	WHEN 1 THEN 100                          
	WHEN 2 THEN 200                         
	WHEN 3 THEN 300                         
	WHEN 4 THEN 400                          
	ELSE 500                        
END AS RESULT             
FROM DUAL;

*/
SELECT TO_CHAR(HIREDATE, 'YY') FROM EMP;

SELECT * FROM EMP;

SELECT
COUNT(*) TOTAL,
SUM(CASE WHEN HIREDATE BETWEEN '1980/01/01' AND '1980/12/31' THEN '1' ELSE '0' END)"1980",
SUM(CASE WHEN HIREDATE BETWEEN '1981/01/01' AND '1981/12/31' THEN '1' ELSE '0' END)"1981",
SUM(CASE WHEN HIREDATE BETWEEN '1982/01/01' AND '1982/12/31' THEN '1' ELSE '0' END)"1982",
SUM(CASE WHEN HIREDATE BETWEEN '1983/01/01' AND '1983/12/31' THEN '1' ELSE '0' END)"1983"
FROM EMP;

SELECT
COUNT(*) TOTAL,
SUM(CASE WHEN EXTRACT (YEAR FROM HIREDATE) = '1980' THEN '1' ELSE '0' END)"1980",
SUM(CASE WHEN EXTRACT (YEAR FROM HIREDATE) = '1981' THEN '1' ELSE '0' END)"1981",
SUM(CASE WHEN EXTRACT (YEAR FROM HIREDATE) = '1982' THEN '1' ELSE '0' END)"1982",
SUM(CASE WHEN EXTRACT (YEAR FROM HIREDATE) = '1983' THEN '1' ELSE '0' END)"1983"
FROM EMP;
/*
6. EMP ���̺��� �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.(case,sum, EXTRACT)

    TOTAL      1980      1981      1982      1983

--------- --------- --------- --------- ---------

       12         1        10         1         0
 */

SELECT * FROM EMP;

SELECT
JOB "JOB",
SUM(CASE WHEN DEPTNO = 10 THEN SAL ELSE 0 END)"DEPTHNO 10",
SUM(CASE WHEN DEPTNO = 20 THEN SAL ELSE 0 END)"DEPTHNO 10",
SUM(CASE WHEN DEPTNO = 30 THEN SAL ELSE 0 END)"DEPTHNO 10",
SUM(SAL)"TOTAL"
FROM EMP
GROUP BY JOB;
 
/*
7. EMP ���̺��� �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.(case,sum)

JOB         Deptno 10    Deptno 20     Deptno 30     Total

---------   ---------    ---------     ---------     ---------

CLERK            1300         1900           950          4150

SALESMAN                                    5600          5600

PRESIDENT	 5000                                     5000

MANAGER	         2450         2975          2850          8275

ANALYST	                      6000                        6000
*/


 
