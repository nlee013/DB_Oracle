
SELECT * FROM TAB;
SELECT * FROM EMP;--부서
SELECT* FROM DEPT;
SELECT * FROM SALGRADE;

--2. EMP 테이블에서 급여가 3000이상인 사원의 정보를 사원번호,이름,담당업무,급여를 출력하는 SELECT 문장을 작성하시오.
SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE SAL >= 3000;

--3. EMP 테이블에서 사원번호가 7782인 사원의 이름과 부서번호를 출력하는 SELECT 문장을 작성하시오.

SELECT ENAME, DEPTNO FROM EMP WHERE EMPNO = 7782;

--4. EMP 테이블에서 입사일이 February 20, 1981과 May 1, 1981 사이에 입사한 사원의 이름,업무,입사일을 출력하는 SELECT 문장을 작성하시오. 단 입사일 순으로 출력하시오.
SELECT ENAME, JOB, HIREDATE FROM EMP WHERE HIREDATE BETWEEN '81-02-20' AND '81-05-01';

--5. EMP 테이블에서 부서번호가 10,20인 사원의 모든 정보를 출력하는 SELECT 문장을 작성하시오. 단 이름순으로 정렬하여라.
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM EMP WHERE DEPTNO IN(20, 30) ORDER BY ENAME;
 
--6. EMP 테이블에서 급여가 1500이상이고 부서번호가 10,30인 사원의 이름과 급여를 출력하는 SELECT 문장을 작성하여라. 단 HEADING을 Employee과 Monthly Salary로 출력하여라.
SELECT ENAME AS "Employee", SAL "Monthly Salary" FROM EMP WHERE SAL >= 1500 AND DEPTNO IN (10, 30);
 
--7. EMP 테이블에서 1982년에 입사한 사원의 모든 정보를 출력하는 SELECT 문을 작성하여라.
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM EMP WHERE HIREDATE >= '82-01-01';
 
--8. EMP 테이블에서 COMM에 NULL이 아닌 사원의 모든 정보를 출력하는 SELECT 문을 작성하여라.
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM EMP WHERE COMM IS NOT NULL;
 
--9. EMP 테이블에서 보너스가 급여보다 10%가 많은 모든 종업원에 대하여 이름,급여,보너스를 출력하는 SELECT 문을 작성하여라.
SELECT ENAME, SAL, COMM FROM EMP WHERE COMM >= SAL*1.1;
 
--10. EMP 테이블에서 업무가 Clerk이거나 Analyst이고 급여가 1000,3000,5000이 아닌 모든 사원의 정보를 출력하는 SELECT 문을 작성하여라.
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM EMP WHERE JOB IN('CLERK', 'ANALYST') AND SAL NOT IN(1000, 3000, 5000);
 
--11. EMP 테이블에서 이름에 L이 두 개가 있고  부서가 30이거나 또는 관리자가 7782인 사원의 모든 정보를 출력하는 SELECT 문을 작성하여라.
SELECT * FROM EMP WHERE REGEXP_COUNT (ENAME,'L') = 2 AND (MGR = 7782 OR DEPTNO = 30);
SELECT * FROM EMP WHERE ENAME LIKE '%L%L%' AND (MGR = 7782 OR DEPTNO = 30);

--------------2021.01.25.화-----------------------------

--1. 현재 날짜를 출력하고 열 레이블은 Current Date로 출력하는 SELECT 문장을 기술하시오.

SELECT CURRENT_DATE FROM DUAL;

--2. EMP 테이블에서 현재 급여에 15%가 증가된 급여를 사원번호,이름,업무,급여,증가된 급여(New Salary),증가액(Increase)를 출력하는 SELECT 문장을 기술하시오.
SELECT * FROM EMP;
SELECT EMPNO, ENAME, JOB, SAL AS "New Salary", SAL*1.15 AS "Increase" from emp;

--3. EMP 테이블에서 이름,입사일,입사일로부터 6개월 후 돌아오는 월요일 구하여 출력하는 SELECT 문장을 기술하시오.
select ename, hiredate, NEXT_DAY(ADD_MONTHS(hiredate,6),'월요일') from emp;

--4. EMP 테이블에서 이름,입사일, 입사일로부터 현재까지의 월 수,급여, 입사일부터 현재까지의 급여의 총계를 출력하는 SELECT 문장을 기술하시오.
SELECT ename, hiredate,ceil((SYSDATE - hiredate)/365*12), sal, floor(sal * (SYSDATE - hiredate)/365*12) from emp;

select ename,hiredate,ceil(months_between(sysdate,hiredate)) as 월수,
sal, floor(months_between(sysdate,hiredate)*sal) as 급여총계 from emp;
--5. EMP 테이블에서 다음의 결과가 출력되도록 작성하시오.
--Dream Salary
------------------------------------------------------------
--3배 차이
--KING earns $5,000.00 monthly but wants $15,000.00
--BLAKE earns $2,850.00 monthly but wants $8,550.00
--CLARK earns $2,450.00 monthly but wants $7,350.00
--. . . . . . . . . .
--14 rows selected
SELECT ENAME  ||' earns '|| TO_CHAR(sal, '$99,999.99') ||' monthly but wants '|| TO_CHAR(SAL*3, '$999,999.99')  as "Dream Salary" FROM EMP;

--6. EMP 테이블에서 모든 사원의 이름과 급여(15자리로 출력 좌측의 빈곳은 “*”로 대치)를 출력하는 SELECT 문장을 기술하시오.
SELECT ename, lpad(sal, 15, '*') from emp;

--7. EMP 테이블에서 모든 사원의 정보를 이름,업무,입사일,입사한 요일을 출력하는 SELECT 문장을 기술하시오.
SELECT ename, job, hiredate, TO_CHAR(hiredate, 'day') as 요일 from emp; 

--8. EMP 테이블에서 이름의 길이가 6자 이상인 사원의 정보를 이름,이름의 글자수,업무를 출력하는 SELECT 문장을 기술하시오.
select * from emp where LENGTH(ename) >= 6 ;

--9. EMP 테이블에서 모든 사원의 정보를 이름,업무,급여,보너스,급여+보너스를 출력하는 SELECT 문장을 기술하시오.
SELECT ename, job, sal, nvl(comm, 0) as bonus, (sal+nvl(comm, 0)) as "Pay+Bonus" from emp;

---------2021.01.26.수-----------------------
--1. EMP 테이블에서 인원수,최대 급여,최소 급여,급여의 합을 계산하여 출력하는 SELECT 문장을 작성하여라.
SELECT * FROM EMP;

SELECT COUNT(*) INWON, (MAX)SAL, (MIN)SAL, SUM(SAL) FROM EMP; 

--2. EMP 테이블에서 각 업무별로 최대 급여,최소 급여,급여의 합을 출력하는 SELECT 문장을 작성하여라.

 SELECT MAX(SAL) "MAX", MIN(SAL) "MIN", SUM(SAL) "SUM" FROM EMP GROUP BY JOB;

--3. EMP 테이블에서 업무별 인원수를 구하여 출력하는 SELECT 문장을 작성하여라.

 SELECT JOB, COUNT(*) INWON FROM EMP GROUP BY JOB;

--4. EMP 테이블에서 최고 급여와 최소 급여의 차이는 얼마인가 출력하는 SELECT 문장을 작성하여라.

 SELECT MAX(SAL) "MAX", MIN(SAL) "MIN", MAX(SAL) - MIN(SAL) "차액" FROM EMP;

--5. EMP 테이블에서 아래의 결과를 출력하는 SELECT 문장을 작성하여라.(group by)

SELECT TO_CHAR(HIREDATE, 'YY') H_YEAR, COUNT(*), MIN(SAL), MAX(SAL), AVG(SAL), SUM(SAL) FROM EMP GROUP BY HIREDATE;
--H_YEAR  COUNT(*)  MIN(SAL)  MAX(SAL)  AVG(SAL)  SUM(SAL)

------ --------- --------- --------- --------- ---------
/*
    81       10       950      5000    2282.5	  22825

    82        1      1300      1300      1300      1300

    80        1       800       800       800       800
 

5번 6번 풀 때
 SELECT 
CASE 컬럼명                         
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
6. EMP 테이블에서 아래의 결과를 출력하는 SELECT 문장을 작성하여라.(case,sum, EXTRACT)

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
7. EMP 테이블에서 아래의 결과를 출력하는 SELECT 문장을 작성하여라.(case,sum)

JOB         Deptno 10    Deptno 20     Deptno 30     Total

---------   ---------    ---------     ---------     ---------

CLERK            1300         1900           950          4150

SALESMAN                                    5600          5600

PRESIDENT	 5000                                     5000

MANAGER	         2450         2975          2850          8275

ANALYST	                      6000                        6000
*/

----------2021.01.27.목------------

--1. EMP 테이블에서 모든 사원에 대한 이름,부서번호,부서명을 출력하는 SELECT 문장을 작성하여라.

SELECT * FROM EMP;

SELECT  EMPNO, ENAME, DEPTNO FROM EMP;

--2. EMP 테이블에서 NEW YORK에서 근무하고 있는 사원에 대하여 이름,업무,급여,부서명을 출력하는 SELECT 문장을 작성하여라.
SELECT * FROM DEPT;
--공통된 PK 찾기.DEPTNO
SELECT ENAME, JOB, SAL, A.DEPTNO FROM EMP A, DEPT B WHERE A.DEPTNO = B. DEPTNO AND B.LOC = 'NEW YORK';

--3. EMP 테이블에서 보너스를 받는 사원에 대하여 이름,부서명,위치를 출력하는 SELECT 문장을 작성하여라.

SELECT * FROM EMP WHERE COMM IS NOT NULL;
SELECT ENAME, A.DEPTNO, COMM, LOC FROM EMP A, DEPT B WHERE COMM > 0;


--4. EMP 테이블에서 이름 중 L자가 있는 사원에 대하여 이름,업무,부서명,위치를 출력하는 SELECT 문장을 작성하여라.

SELECT ENAME, A.DEPTNO, LOC FROM EMP A, DEPT B WHERE A.DEPTNO = B.DEPTNO AND A.ENAME LIKE '%L%';

--5. 아래의 결과를 출력하는 SELECT 문장을 작성하여라.(관리자가 없는 King을 포함하여 모든 사원을 출력)-SELF JOIN
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
--6. EMP 테이블에서 그들의 관리자 보다 먼저 입사한 사원에 대하여 이름,입사일,관리자 이름, 관리자 입사일을 출력하는 SELECT 문장을 작성하여라.
SELECT * FROM EMP;

SELECT A.ENAME SALESMAN, A.HIREDATE, B.ENAME MANAGER, B.HIREDATE FROM EMP A, EMP B
WHERE A.MGR = B.EMPNO AND A.HIREDATE < B.HIREDATE;
--TO_CHAR(HIREDATE,'YY-MM-DD') = 'SALESMAN', TO_CHAR(HIREDATE,'YY-MM-DD') = 'MANAGER';

--7. EMP 테이블에서 사원의 급여와 사원의 급여 양만큼 “*”를 출력하는 SELECT 문장을 작성하여라. 단 “*”는 100을 의미한다.-LPAD
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

----------2021.01.28.금-----------
--1. EMP 테이블에서 Blake와 같은 부서에 있는 모든 사원의 이름과 입사일자를 출력하는 SELECT문을 작성하시오.

SELECT * FROM EMP;
SELECT ENAME, HIREDATE FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'BLAKE');

--2. EMP 테이블에서 평균 급여 이상을 받는 모든 종업원에 대해서 종업원 번호와 이름을 출력하는 SELECT문을 작성하시오. 단 급여가 많은 순으로 출력하여라.

SELECT ENAME, EMPNO FROM EMP WHERE SAL > (SELECT AVG(SAL) FROM EMP);

--3. EMP 테이블에서 이름에 “T”가 있는 사원이 근무하는 부서에서 근무하는 모든 종업원에 대해 사원 번호,이름,급여를 출력하는 SELECT문을 작성하시오. 단 사원번호 순으로 출력하여라.
SELECT EMPNO, ENAME, SAL FROM EMP WHERE ENAME LIKE '%T%' ORDER BY EMPNO;

--4. EMP 테이블에서 부서 위치가 Dallas인 모든 종업원에 대해 이름,업무,급여를 출력하는 SELECT문을 작성하시오.
SELECT * FROM DEPT;

SELECT ENAME, JOB, SAL, A.DEPTNO FROM EMP A, DEPT B WHERE A.DEPTNO = B. DEPTNO AND B.LOC = 'DALLAS';

--5. EMP 테이블에서 King에게 보고하는 모든 사원의 이름과 급여를 출력하는 SELECT문을 작성하시오.
SELECT * FROM EMP;
SELECT EMPNO FROM EMP WHERE ENAME = 'KING'; --7839
SELECT ENAME, SAL FROM EMP WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'KING');

--6. EMP 테이블에서 SALES부서 사원의 이름,업무를 출력하는 SELECT문을 작성하시오.
SELECT ENAME, JOB FROM EMP A, DEPT B WHERE A.DEPTNO = B.DEPTNO AND B.DNAME = 'SALES';
SELECT ENAME, JOB FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES');

--7. EMP 테이블에서 월급이 부서 30의 최저 월급보다 높은 사원을 출력하는 SELECT문을 작성하시오.
SELECT MIN(SAL) FROM EMP WHERE DEPTNO = '30';
SELECT * FROM EMP WHERE SAL > (SELECT MIN(SAL) FROM EMP WHERE DEPTNO = '30');
 
--8. EMP 테이블에서 부서 10에서 부서 30의 사원과 같은 업무를 맡고 있는 사원의 이름과 업무를 출력하는 SELECT문을 작성하시오.
SELECT ENAME, JOB FROM EMP WHERE JOB IN (SELECT JOB FROM EMP WHERE DEPTNO = '10') AND DEPTNO = '30';

--9. EMP 테이블에서 FORD와 업무도 월급도 같은 사원의 모든 정보를 출력하는 SELECT문을 작성하시오.

SELECT * FROM EMP WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'FORD') AND SAL = (SELECT SAL FROM EMP WHERE ENAME = 'FORD');

--10. EMP 테이블에서 업무가 JONES와 같거나 월급이 FORD이상인 사원의 정보를 이름,업무,부서번호,급여를 출력하는 SELECT문을 작성하시오.
-- 단 업무별, 월급이 많은 순으로 출력하여라.
SELECT ENAME, JOB, DEPTNO, SAL FROM EMP WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'JONES') OR SAL = (SELECT SAL FROM EMP WHERE ENAME = 'FORD');

--11. EMP 테이블에서 SCOTT 또는 WARD와 월급이 같은 사원의 정보를 이름,업무,급여를 출력하는 SELECT문을 작성하시오.
SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT ENAME, JOB, SAL FROM EMP WHERE SAL IN (SELECT SAL FROM EMP WHERE ENAME IN ('SCOTT', 'WARD'));

--12. EMP 테이블에서 CHICAGO에서 근무하는 사원과 같은 업무를 하는 사원의 이름,업무를 출력하는 SELECT문을 작성하시오.
SELECT ENAME, JOB FROM EMP WHERE JOB IN (SELECT JOB FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'CHICAGO'));
SELECT DISTINCT JOB FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'CHICAGO');

--13. EMP 테이블에서 부서별로 월급이 평균 월급보다 높은 사원을 부서번호,이름,급여를 출력하는 SELECT문을 작성하시오.
SELECT DEPTNO, ENAME, SAL FROM EMP A, DEPT B WHERE SAL > AVG(SAL) GROUP BY B.DNAME;
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO;

SELECT A.DEPTNO, ENAME, SAL FROM EMP A, (SELECT DEPTNO, AVG(SAL)"AVG" FROM EMP GROUP BY DEPTNO) B WHERE A.DEPTNO = B.DEPTNO(+) AND SAL > "AVG";

--14. EMP 테이블에서 업무별로 월급이 평균 월급보다 낮은 사원을 부서번호,이름,급여를 출력하는 SELECT문을 작성하시오.
SELECT DEPTNO, ENAME, SAL FROM EMP;
SELECT JOB, AVG(SAL)"AVG" FROM EMP GROUP BY JOB;

SELECT DEPTNO, ENAME, SAL FROM EMP A,
(SELECT JOB, AVG(SAL)"AVG" FROM EMP GROUP BY JOB)B WHERE A.JOB = B.JOB(+) AND SAL < "AVG";

--15. EMP 테이블에서 적어도 한명 이상으로부터 보고를 받을 수 있는 사원을 업무,이름,사원번호,부서번호를 출력하는 SELECT문을 작성하시오.
SELECT DISTINCT MGR FROM EMP WHERE MGR IS NOT NULL;

SELECT JOB, ENAME, EMPNO, DEPTNO FROM EMP
WHERE EMPNO IN(SELECT DISTINCT MGR FROM EMP WHERE MGR IS NOT NULL);

SELECT DISTINCT B.JOB, B.ENAME, B.EMPNO, B.DEPTNO FROM EMP A JOIN EMP B
ON A.MGR IS NOT NULL AND A.MGR = B.EMPNO;

SELECT DISTINCT B.JOB, B.ENAME, B.EMPNO, B.DEPTNO FROM EMP A, EMP B
WHERE A.MGR IS NOT NULL AND A.MGR = B.EMPNO;

--16. EMP 테이블에서 말단 사원의 사원번호,이름,업무,부서번호를 출력하는 SELECT문을 작성하시오.
SELECT * FROM EMP ORDER BY HIREDATE;

SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP);

SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP
WHERE EMPNO NOT IN (SELECT DISTINCT MGR FROM EMP WHERE MGR IS NOT NULL);