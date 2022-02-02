
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

----------2021.01.27.��------------

--1. EMP ���̺��� ��� ����� ���� �̸�,�μ���ȣ,�μ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.

SELECT * FROM EMP;

SELECT  EMPNO, ENAME, DEPTNO FROM EMP;

--2. EMP ���̺��� NEW YORK���� �ٹ��ϰ� �ִ� ����� ���Ͽ� �̸�,����,�޿�,�μ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT * FROM DEPT;
--����� PK ã��.DEPTNO
SELECT ENAME, JOB, SAL, A.DEPTNO FROM EMP A, DEPT B WHERE A.DEPTNO = B. DEPTNO AND B.LOC = 'NEW YORK';

--3. EMP ���̺��� ���ʽ��� �޴� ����� ���Ͽ� �̸�,�μ���,��ġ�� ����ϴ� SELECT ������ �ۼ��Ͽ���.

SELECT * FROM EMP WHERE COMM IS NOT NULL;
SELECT ENAME, A.DEPTNO, COMM, LOC FROM EMP A, DEPT B WHERE COMM > 0;


--4. EMP ���̺��� �̸� �� L�ڰ� �ִ� ����� ���Ͽ� �̸�,����,�μ���,��ġ�� ����ϴ� SELECT ������ �ۼ��Ͽ���.

SELECT ENAME, A.DEPTNO, LOC FROM EMP A, DEPT B WHERE A.DEPTNO = B.DEPTNO AND A.ENAME LIKE '%L%';

--5. �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.(�����ڰ� ���� King�� �����Ͽ� ��� ����� ���)-SELF JOIN
SELECT * FROM EMP;
SELECT A.ENAME "Employee", A.EMPNO "Emp#", B.ENAME "Manager", B.EMPNO "Mgr#" FROM EMP A, EMP B
WHERE A.MGR = B.EMPNO(+) ORDER BY B.ENAME DESC, A.ENAME;
--Employee        Emp# Manager         Mgr#
--
------------ --------- ---------- ---------
--
--KING            7839
--
--BLAKE           7698 KING            7839
--
--CLARK           7782 KING            7839
--. . . . . . . . . .
--14 rows selected.
--SELECT A.*
--FROM 
--6. EMP ���̺��� �׵��� ������ ���� ���� �Ի��� ����� ���Ͽ� �̸�,�Ի���,������ �̸�, ������ �Ի����� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT * FROM EMP;

SELECT A.ENAME SALESMAN, A.HIREDATE, B.ENAME MANAGER, B.HIREDATE FROM EMP A, EMP B
WHERE A.MGR = B.EMPNO AND A.HIREDATE < B.HIREDATE;
--TO_CHAR(HIREDATE,'YY-MM-DD') = 'SALESMAN', TO_CHAR(HIREDATE,'YY-MM-DD') = 'MANAGER';

--7. EMP ���̺��� ����� �޿��� ����� �޿� �縸ŭ ��*���� ����ϴ� SELECT ������ �ۼ��Ͽ���. �� ��*���� 100�� �ǹ��Ѵ�.-LPAD
--
--Employee and their salary
--
-------------------------------------------------------------------
--
--KING      **************************************************
--
--BLAKE     ****************************
--
--CLARK     ************************
--
--JONES     *****************************
--
--MARTIN    ************
--
--ALLEN     ****************
--
--TURNER    ***************
--
--. . . . . . . . . .
--
--14 rows selected.

SELECT ENAME||'   '|| LPAD(' ', SAL/100 + 1,'*') AS "Employee and their story" FROM EMP;
SELECT ENAME||'   '|| LPAD('*', SAL/100,'*') AS "Employee and their story" FROM EMP;
 
SELECT * FROM EMP;

----------2021.01.28.��-----------
--1. EMP ���̺��� Blake�� ���� �μ��� �ִ� ��� ����� �̸��� �Ի����ڸ� ����ϴ� SELECT���� �ۼ��Ͻÿ�.

SELECT * FROM EMP;
SELECT ENAME, HIREDATE FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'BLAKE');

--2. EMP ���̺��� ��� �޿� �̻��� �޴� ��� �������� ���ؼ� ������ ��ȣ�� �̸��� ����ϴ� SELECT���� �ۼ��Ͻÿ�. �� �޿��� ���� ������ ����Ͽ���.

SELECT ENAME, EMPNO FROM EMP WHERE SAL > (SELECT AVG(SAL) FROM EMP);

--3. EMP ���̺��� �̸��� ��T���� �ִ� ����� �ٹ��ϴ� �μ����� �ٹ��ϴ� ��� �������� ���� ��� ��ȣ,�̸�,�޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�. �� �����ȣ ������ ����Ͽ���.
SELECT EMPNO, ENAME, SAL FROM EMP WHERE ENAME LIKE '%T%' ORDER BY EMPNO;

--4. EMP ���̺��� �μ� ��ġ�� Dallas�� ��� �������� ���� �̸�,����,�޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�.
SELECT * FROM DEPT;

SELECT ENAME, JOB, SAL, A.DEPTNO FROM EMP A, DEPT B WHERE A.DEPTNO = B. DEPTNO AND B.LOC = 'DALLAS';

--5. EMP ���̺��� King���� �����ϴ� ��� ����� �̸��� �޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�.
SELECT * FROM EMP;
SELECT EMPNO FROM EMP WHERE ENAME = 'KING'; --7839
SELECT ENAME, SAL FROM EMP WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'KING');

--6. EMP ���̺��� SALES�μ� ����� �̸�,������ ����ϴ� SELECT���� �ۼ��Ͻÿ�.
SELECT ENAME, JOB FROM EMP A, DEPT B WHERE A.DEPTNO = B.DEPTNO AND B.DNAME = 'SALES';
SELECT ENAME, JOB FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES');

--7. EMP ���̺��� ������ �μ� 30�� ���� ���޺��� ���� ����� ����ϴ� SELECT���� �ۼ��Ͻÿ�.
SELECT MIN(SAL) FROM EMP WHERE DEPTNO = '30';
SELECT * FROM EMP WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO = '30');
 
--8. EMP ���̺��� �μ� 10���� �μ� 30�� ����� ���� ������ �ð� �ִ� ����� �̸��� ������ ����ϴ� SELECT���� �ۼ��Ͻÿ�.
SELECT ENAME, JOB FROM EMP WHERE JOB IN (SELECT JOB FROM EMP WHERE DEPTNO = '10') AND DEPTNO = '30';

--9. EMP ���̺��� FORD�� ������ ���޵� ���� ����� ��� ������ ����ϴ� SELECT���� �ۼ��Ͻÿ�.

SELECT * FROM EMP WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'FORD') AND SAL = (SELECT SAL FROM EMP WHERE ENAME = 'FORD');

--10. EMP ���̺��� ������ JONES�� ���ų� ������ FORD�̻��� ����� ������ �̸�,����,�μ���ȣ,�޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�.
-- �� ������, ������ ���� ������ ����Ͽ���.
SELECT ENAME, JOB, DEPTNO, SAL FROM EMP WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'JONES') OR SAL = (SELECT SAL FROM EMP WHERE ENAME = 'FORD');

--11. EMP ���̺��� SCOTT �Ǵ� WARD�� ������ ���� ����� ������ �̸�,����,�޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�.
SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT ENAME, JOB, SAL FROM EMP WHERE SAL IN (SELECT SAL FROM EMP WHERE ENAME IN ('SCOTT', 'WARD'));

--12. EMP ���̺��� CHICAGO���� �ٹ��ϴ� ����� ���� ������ �ϴ� ����� �̸�,������ ����ϴ� SELECT���� �ۼ��Ͻÿ�.
SELECT ENAME, JOB FROM EMP WHERE JOB IN (SELECT JOB FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'CHICAGO'));
SELECT DISTINCT JOB FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'CHICAGO');

--13. EMP ���̺��� �μ����� ������ ��� ���޺��� ���� ����� �μ���ȣ,�̸�,�޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�.
SELECT DEPTNO, ENAME, SAL FROM EMP A, DEPT B WHERE SAL > AVG(SAL) GROUP BY B.DNAME;
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO;

SELECT A.DEPTNO, ENAME, SAL FROM EMP A, (SELECT DEPTNO, AVG(SAL)"AVG" FROM EMP GROUP BY DEPTNO) B WHERE A.DEPTNO = B.DEPTNO(+) AND SAL > "AVG";

--14. EMP ���̺��� �������� ������ ��� ���޺��� ���� ����� �μ���ȣ,�̸�,�޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�.
SELECT DEPTNO, ENAME, SAL FROM EMP;
SELECT JOB, AVG(SAL)"AVG" FROM EMP GROUP BY JOB;

SELECT DEPTNO, ENAME, SAL FROM EMP A,
(SELECT JOB, AVG(SAL)"AVG" FROM EMP GROUP BY JOB)B WHERE A.JOB = B.JOB(+) AND SAL < "AVG";

--15. EMP ���̺��� ��� �Ѹ� �̻����κ��� ���� ���� �� �ִ� ����� ����,�̸�,�����ȣ,�μ���ȣ�� ����ϴ� SELECT���� �ۼ��Ͻÿ�.
SELECT DISTINCT MGR FROM EMP WHERE MGR IS NOT NULL;

SELECT JOB, ENAME, EMPNO, DEPTNO FROM EMP
WHERE EMPNO IN(SELECT DISTINCT MGR FROM EMP WHERE MGR IS NOT NULL);

SELECT DISTINCT B.JOB, B.ENAME, B.EMPNO, B.DEPTNO FROM EMP A JOIN EMP B
ON A.MGR IS NOT NULL AND A.MGR = B.EMPNO;

SELECT DISTINCT B.JOB, B.ENAME, B.EMPNO, B.DEPTNO FROM EMP A, EMP B
WHERE A.MGR IS NOT NULL AND A.MGR = B.EMPNO;

--16. EMP ���̺��� ���� ����� �����ȣ,�̸�,����,�μ���ȣ�� ����ϴ� SELECT���� �ۼ��Ͻÿ�.
SELECT * FROM EMP ORDER BY HIREDATE;

SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP);

SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP
WHERE EMPNO NOT IN (SELECT DISTINCT MGR FROM EMP WHERE MGR IS NOT NULL);