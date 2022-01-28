select * from tab; --코드 옆에서 ctrl + ENTER 치면 data가 아래에 나옴
select * from PERSONNEL;
select * from DIVISION;
select * from bonus;
select pno,pname,pay,dno from personnel;

--distinct 중복제외
select distinct job from personnel;

--정렬order by
ORDER BY pay ASC; --오름차순
SELECT pno, pname, pay FROM personnel ORDER by pname;

--ASC = ascending은 default 생략가능
select pno,pname,pay from personnel order by pname; --ORDER BY만 있으면 ASC 가 생략?(ASC 기능포함)
--정렬은 temp.dbf에 펼쳐놓고 정리

SELECT pno, pname, pay from personnel ORDER BY pay DESC; --내림차순

SELECT * from personnel order by startdate DESC;

--사원번호가 높은 순서대로 정렬하시오
--회사에서는 *별표 잘 안씀
--* 는 전체라는 뜻
--데이터양이 어마어마어마어마어마무시함 조심!!
--DB 터짐 퇴사각 
--특정 데이터 사용할때만!

SELECT * FROM personnel ORDER BY pno DESC;--이 코드 대신 아래 DESC PERSONNEL;사용

SELECT * FROM PERSONNEL;

DESC PERSONNEL;
DESCRIBE PERSONNEL;--이걸 줄여서 위의 코드와 같음.오라클은 10000을 넘지 못함

SELECT PNO, PNAME, PAY+1000 FROM PERSONNEL;--PAY+1000-> 파생컬럼: 급조된 컬럼(방금 만들어진 컬럼)
--SELECT PNO, PNAME, PAY+1000 AS 보 너 스 FROM PERSONNEL; ->오류남. 띄어쓰기 안하고
SELECT PNO, PNAME, PAY+1000 AS 보너스 FROM PERSONNEL;
--SELECT PNO, PNAME, PAY+1000 AS '보' '너' '스' FROM PERSONNEL;-> 안?
SELECT PNO, PNAME, PAY+1000 AS "보_너_스" FROM PERSONNEL;--띄어쓰기는 언더바 _사용함. 무조건 ""큰따옴표 사용.-as가 닉네임설정 가능하게 함.작은 따옴표 무조건 안?
SELECT PNO, PNAME, PAY+1000 보너스 FROM PERSONNEL;--AS 생략가능."" 큰따옴표도 생략가능.

SELECT PNO, PNAME, PAY, PAY+1000 보너스 FROM PERSONNEL ORDER BY 보너스; --ORDER BY는 *칭을 가져다 쓸수 있다
SELECT PNO, PNAME, PAY, PAY+1000 보너스 FROM PERSONNEL ORDER BY 4;--회사에서는 숫자 잘안씀. PNO, PNAME, PAY, PAY+1000의 4번째를 의미.

SELECT * FROM PESONNEL ORDER BY 4;--위 코드를 이와같이 가능.

SELECT DNO, PNO, PNAME FROM PERSONNEL ORDER BY DNO, PNO;

SELECT * FROM PERSONNEL ORDER BY DNO DESC PNO;
--부서번호 DNO는 오름차순, 사원번호 PNO는 내림차순 정렬
SELECT * FROM PERSONNEL ORDER BY DNO, PNO DESC;

SELECT * FROM PERSONNEL ORDER BY MANAGER ASC; --NULL이 맨 아래에 있을 수도 있기에 확인해야?-NULL찾는 명령어가 따로 있음
--TABLE 만들 때 절대 NULL을 만들지 말라함. NULL은 가장 큰값이다. 그러므로 DESC로 하면 바로 위에 뜸

--사원의 급여와 일년치 연봉(ANNUAL)을 구하시오
SELECT DNO, PNO, PNAME, PAY, (PAY*12) + NVL(BONUS, 0) ANNUAL_PAY FROM PERSONNEL; --BONUS가 NULL이므로 나머지 DATA가 NULL로 나옴
--NVL(BONUS, 0) -> 보너스가 있으면 그 보너스를 쓰는 것이고 아니면 0으로 표시해라.
--SELECT DNO, PNO, PNAME, PAY, NVL(BONUS, 0),(PAY*12) + BONUS ANNUAL_PAY FROM PERSONNEL;

SELECT PAY, PAY-500 FROM PERSONNEL;
SELECT PNAME || PNO FROM PERSONNEL; --컬럼의 값을 연결할 때 사용
SELECT PNAME || ' ' ||PNO FROM PERSONNEL; -- 문자는 ''작은 따옴표. 보기 좋게 띄어쓰기를 넣어보자
--컬럼에서 디비는 두개로 나뉘어서 각자 정보가 저장? ex) 사용자, 주소라고 하면 왼쪽 오른쪽 각각 저장되어 표로 보임

SELECT PNAME || ' ' ||PNO PNAME FROM PERSONNEL;--SELECT PNAME || ' ' ||PNO (AS)PNAME FROM PERSONNEL;

SELECT PNAME, PNO FROM PERSONNEL; -->컬럼.열(row) 제한

--WHERE 행 제한 조건문
SELECT * FROM PERSONNEL WHERE JOB = 'SALESMAN'; --소문자 salesman은 안? 오라클은 소문자가 대문자로 나옴/SQL은 소문자 가능
--연산자 : = , <. >. <=. >=
--오라클에서 <> : 같지않다

--급여가 1600인 사원 검색해라
SELECT * FROM PERSONNEL WHERE PAY = 1600;

--사원번호가 1116인 사원 검색
SELECT * FROM PERSONNEL WHERE PNO = 1116;

--사원의 급여가 2000 이하인 사원 검색
SELECT * FROM PERSONNEL WHERE PAY <= 2000;

--1990년 12월 17일에 입사한 사원
SELECT * FROM PERSONNEL WHERE STARTDATE = '1990/12/17';
SELECT * FROM PERSONNEL WHERE STARTDATE = '1990-12-17'; --가끔 적용안될 때도 있음
--날짜, 생년월일(안바뀌고 연산안하는 숫자는 문자로 표시해도 ?

--환경셋팅창보기
SELECT * FROM NLS_SESSION_PARAMETERS;
--RR/MM/DD -> 기본 OS의 날짜 형식

--업무가 CLERK인 사원
SELECT * FROM PERSONNEL WHERE JOB = 'CLERK';

--이름이 JAMES인 사원
SELECT * FROM PERSONNEL WHERE PNAME = 'JAMES';

--논리연산자
--AND, OR, NOT -> NOT은 !와 같다.
--AND는 조건이 두개가 같아야?

--EX) 부서번호가 10번이고 급여가 3000이상 사원
SELECT * FROM PERSONNEL WHERE DNO = 10 AND PAY >= 3000;

--직업이 SALESMAN이고 90년이후에 입사한 직원
SELECT * FROM PERSONNEL WHERE JOB = 'SALESMAN' AND STARTDATE >= '1991/1/1'; --또는 1990/12/31

--91년 9월에 입사한 직원
SELECT * FROM PERSONNEL WHERE STARTDATE >= '1991/9/1' AND STARTDATE <= '1991/9/30';

--OR
--부서번호가 10번이거나 급여가 3000이상인 사원검색
SELECT * FROM PERSONNEL WHERE DNO = 10 OR PAY >= 3000;

--직업이 MANAGER이거나 90년도 이전에 입사한 직원 검색
SELECT * FROM PERSONNEL WHERE JOB = 'MANAGER' OR STARTDATE < '1990/1/1';

--NOT(문자열 연산자)
--업무가 SALESMAN 이거나 CLERK인 직원
SELECT * FROM PERSONNEL WHERE JOB = 'SALESMAN' OR JOB = 'CLERK';
SELECT * FROM PERSONNEL WHERE JOB IN ('SALESMAN', 'CLERK'); --위 코드와 같은내용 (계속 OR를 쓰기 힘드니까)

--업무가 SALESMAN, CLERK이 아닌 지원을 찾으시오
SELECT * FROM PERSONNEL WHERE JOB <>'SALESMAN' AND JOB <>'CLERK';
SELECT * FROM PERSONNEL WHERE JOB NOT IN ('SALESMAN', 'CLERK'); -- NOT의 위치에 따라서 부정하는 내용이 다름

--급여가 1000에서 2000인 사원
SELECT * FROM PERSONNEL WHERE PAY >= 1000 AND PAY <= 2000;
SELECT * FROM PERSONNEL WHERE PAY BETWEEN 1000 AND 2000;--위 코드와 같음
 
SELECT * FROM PERSONNEL WHERE STARTDATE BETWEEN '1991/09/01' AND '1991/09/30';

--부서번호가 20과 30사이가 아닌 사원
SELECT * FROM PERSONNEL WHERE DNO NOT IN (20, 30);--20과 30을 찾아라
SELECT * FROM DIVISION;--부서번호 확인할수있는 TABLE

SELECT * FROM PERSONNEL WHERE DNO NOT BETWEEN 20 AND 30; --20부터 30까지 찾아라.위 코드와 다름

--91년 5월 1일부터 92년 2월 24일 사이에 입사한 사원이 아닌 직원 찾아라
SELECT * FROM PERSONNEL WHERE STARTDATE NOT BETWEEN '1992/5/1' AND '1992/2/24';

--이름이 A로 시작되는 사원정보 찾으시오
SELECT * FROM PERSONNEL WHERE PNAME LIKE 'A%';
--LIKE 뒤에 어떤 문자가 와도 좋아.
--LIKE로 무언가로 시작하는 단어 찾을때 사용
--여기선 A%. 자바에서 A*.
--*********무조건  %는 LIKE를 써야된다*********

--사원번호가 111_인 사원 --> 여기서 언더바_는 자릿수이다 _언더바 뒤에 어떠한 문자가 와도 좋다는 의미. 여기서 자릿수 4자리
--날짜와 문자는 꼭 작은 따옴표 해야?

--''안에 들어가는 것이 문자이기때문에 어떠한 문자가 오든 상관없음
SELECT * FROM PERSONNEL WHERE PNO LIKE '111_'; --언더바 뒤에 반드시 한 자리수가 온다
SELECT * FROM PERSONNEL WHERE PNO LIKE '111%';--%뒤에 무한 자릿수 가능
SELECT * FROM PERSONNEL WHERE PNO LIKE '1__1';--전제 4자리면서 가운데는 두자리.

--90년도에 입사한 사원
SELECT * FROM PERSONNEL WHERE STARTDATE LIKE '90%'; --다른 나라는 연도를 뒤에 쓰기 때문에 %90. %를 앞에 붙인다.
--1900년도 미만은 컴퓨터가 인식안함

SELECT * FROM PERSONNEL WHERE REGEXP_LIKE(PNO, '11[^2]');--정규화 표현식. ^는 아니라는 의미
--위와 같은 경우는 112가 나오면 안되지만 1112에서 111이고 112 3자리씩 따져볼 수 있지만, 둘 중에 하나라도 참이면 나옴.
 
--1로 시작하고 뒤에 1 또는 2
SELECT * FROM PERSONNEL WHERE REGEXP_LIKE(PNO, '1[1, 2]');--자릿수는 마음대로임.

--이메일에서 정규화 표현식 해보자 - 아이디 추출하기
SELECT REGEXP_SUBSTR('NAY@GMAIL.COM', '[^@]+') 아이디 FROM DUAL; --한번만 나옴

SELECT REGEXP_SUBSTR('NAY@GMAIL.COM', '[^@]+') 아이디 FROM DIVISION; --DIVISION 갯수만큼 파생데이타(가상 데이타) 출력?

SELECT * FROM DUAL; -- DUMMY에 X로 출력되는데 아무 의미 없는 데이타..?

--MS-SQL은 문법만 써도 그냥 나옴.오라클에서만 FROM을 꼭 써줘야?
SELECT 100+300 FROM PERSONNEL; --부서 갯수만큼 출력
SELECT 100+300 FROM DUAL;--DUAL은 오라클에만 있다

--아까 했던 NULL에 대해 공부해보자
-- 아까도 말햇듯이 NULL값은 넣지말라고 했음
SELECT MANAGER FROM PERSONNEL WHERE MANAGER = NULL; --실행안?. NULL 찾은 것이 아님. 앞에 숫자가 아예 안들어있음. =는 문자를 찾기 때문에 여기서 NULL이라는 문자를 찾기에 안?
SELECT MANAGER FROM PERSONNEL WHERE MANAGER = 'NULL'; --실행안?

SELECT MANAGER FROM PERSONNEL WHERE MANAGER IS NULL;
--MS-SQL은 =기호로 사용해서 NULL을 찾을 수 있다

SELECT MANAGER FROM PERSONNEL WHERE MANAGER IS NOT NULL;
--_______________________________________________________________

--우선순위 매길 수 있음
--업무가 'Manager'이고 급여가 1500이상인 사원 또는 업무가
--A AND B OR C -> AND가 먼저 연산 후 OR가 연산??
--'SALESMAN' 인 사원의 정보를 찾으시오

SELECT * FROM PERSONNEL WHERE (JOB = 'MANAGER' AND PAY >= 1500) OR JOB = 'SALESMAN';
--가로를 묶어준 것 부터 연산

--업무가 'PRESIDENT' 또는 'SALESMAN'이고 급여가 1500이상 사원 정보
SELECT * FROM PERSONNEL WHERE (JOB = 'PRESIDENT' OR JOB = 'SALESMAN') AND PAY >= 1500;
SELECT * FROM PERSONNEL WHERE JOB IN ('PRESIDENT', 'SALESMAN') AND PAY >= 1500;

--ORACLE FUNCTION 오라클 함수
--대표적인 숫자함수 : ROUND(반올림)
SELECT ROUND (45.275, 1) FROM DUAL;--45.3
SELECT ROUND (45.275, -1) FROM DUAL;--50

--자릿값
--  1  2  3  4 . 5 6 7
-- -4 -3 -2 -1 0 1 2 3 음수는 표시해라

SELECT PNO, PNAME, PAY, ROUND(PAY, -2) FROM PERSONNEL;

--TRUNC(절삭 - 자르기)
SELECT TRUNC(45.245, 2) FROM DUAL; --45.24
SELECT TRUNC(45.245, -1) FROM DUAL;--40

SELECT PNO, PNAME, PAY, TRUNC(PAY, -2) FROM PERSONNEL;

--CEIL/FLOOR (올림/내림) : 정수에서만 반환. 소수점 안??
SELECT CEIL(461.21) FROM DUAL; --462
SELECT FLOOR(461.91) FROM DUAL; --461

--MOD : 나머지 구하기
SELECT MOD(10, 3) FROM DUAL; --1

--ABS : 절대값. 무조건 양수 만들어줌(잘 안쓰이는듯)
SELECT ABS(-123)FROM DUAL;--123
--실제로 가로()안에 컬럼을 쓰고 DUAL 대신 TABLE을 쓰면 ??

--SIGN(양수 1, 음수 -1, 0은 0)
SELECT SIGN(100), SIGN(-100), SIGN(0) FROM DUAL; --> 1 -1 0

--지수
SELECT POWER(2, 4) FROM DUAL; --16

--제곱근
SELECT SQRT(9) FROM DUAL; --3

--문자함수
--UPPER : 소문자 -> 대문자로 변환
SELECT UPPER('ORacle') FROM DUAL; --ORACLE
--LOWER : 대문자 -> 소문자로 변환
SELECT LOWER('ORacle') FROM DUAL; --oracle

SELECT DNO, DNAME FROM DIVISION WHERE DNAME = UPPER('sales');

--위 코드와 같아보이지만 위 코드보다 아래 코드가 더 느리다.
--느린 이유는 DNAME에서 LOWER로 소문자로 다 변환해서
--sales와 비교해서 데이터를 가져오기 때문에 느림
SELECT DNO, DNAME FROM DIVISION WHERE LOWER(DNAME) = 'sales';--섞어쓰면 안나옴
--SYSTEM 튜닝 --시스템적인 것 메모리 등 좋은것 쓰면 빨라짐
--SQL 튜닝 --튜닝처럼 바꿔줌

--INITCAP :첫글자만 대문자
SELECT INITCAP ('korea fighting') FROM DUAL;

--CONCAT
SELECT PNAME || DNO FROM PERSONNEL;
SELECT CONCAT(PNAME, DNO) FROM PERSONNEL;

--LENGTH: 공백포함 개수
SELECT LENGTH('KOREA FIGHTING') FROM DUAL; --14

--SUBSTR
SELECT SUBSTR('ABCDEFG', 1, 3) FROM DUAL; --ABC
SELECT SUBSTR('ABCDEFG', 3, 2) FROM DUAL; --CD
SELECT SUBSTR('ABCDEFG', -3, 2) FROM DUAL; --EF -> -3은 뒤에서 3번째
SELECT SUBSTR('ABCDEFG',-4) FROM DUAL; --DEFG

--INSTR
SELECT INSTR('ABCDEF','C') FROM DUAL; --3

SELECT INSTR('AAAAAAA', 'A') FROM DUAL; --1
SELECT INSTR('AAAAAAA', 'a') FROM DUAL; --0

--RPAD/LPAD
SELECT RPAD(PNAME, 15, '*') FROM PERSONNEL;
SELECT LPAD(PNAME, 15, '*') FROM PERSONNEL;

--RTRIM:오른쪽에서 부터 지워라/LTRIM: 왼쪽에서 부터 지워라 (공백 지울 때 사용.보통 잘 사용 안하는듯)
SELECT RTRIM ('ABBBBB', 'B') FROM DUAL;
SELECT RTRIM ('A         ', '') FROM DUAL;

SELECT RTRIM('ABBABB', 'B') FROM DUAL;

--날짜함수
--SYSDATE((GETDATE())
SELECT SYSDATE FROM DUAL;

--날짜함수
SELECT SYSDATE FROM DUAL;

SELECT SYSDATE + 4 FROM DUAL; --날짜는 기본적으로 연산이 ?? 

SELECT STARTDATE -1, STARTDATE, STARTDATE +1 FROM PERSONNEL;

--KIM 사원이 오늘까지 근무한 년수 구하시오
SELECT PNAME, CEIL((SYSDATE - STARTDATE)/365) FROM PERSONNEL WHERE PNAME = 'KIM';
SELECT SYSDATE, STARTDATE, CEIL((SYSDATE - STARTDATE)/365) || '년' YEARS FROM PERSONNEL WHERE PNAME = 'KIM';

--ROUND
SELECT STARTDATE, ROUND(STARTDATE, 'YEAR') FROM PERSONNEL;

SELECT STARTDATE, ROUND(STARTDATE, 'MONTH') FROM PERSONNEL;

SELECT STARTDATE, ROUND(STARTDATE, 'DAY') FROM PERSONNEL;

--TRUNC
SELECT STARTDATE, TRUNC(STARTDATE, 'MONTH') FROM PERSONNEL;

--MONTHS_BETWEEN -달 수 구하기
SELECT ROUND (MONTHS_BETWEEN(SYSDATE, '1997/06/14')/12) YEAR FROM DUAL;

--LAST DAY
SELECT STARTDATE, LAST_DAY(STARTDATE) FROM PERSONNEL;

--NEXT DAY
SELECT NEXT_DAY(SYSDATE, '토요일') FROM DUAL;

--ADMONTHS
SELECT ADD_MONTHS(SYSDATE, 4) FROM DUAL;
SELECT ADD_MONTHS(SYSDATE, 24) FROM DUAL;

--변환함수
/*TO_CHAR(숫자나 날짜를 문자로 변경)
MM : 달수(10)
MON: 3문자 달 이름(MAR)
MONTH : 달의 전체이름 풀네임 (MARCH)
DD : 달의 날짜 수 (22)
D : 주의 일수(2)
DY : 3문자의 요일 이름 (MON)
DAY : 일의 풀네임. 전체이름 (화)
YYYY : 4자자리 연도
YY : 2자리 연도
RM : 로마식 달수
*/

SELECT SYSDATE, TO_CHAR(SYSDATE, 'D') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'DY') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'RM') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'MON') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'DAY') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;

SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD') + 10 FROM DUAL; --문자는 연산이 안??

SELECT SYSDATE, TO_CHAR(SYSDATE, 'DD-YYYY-MM') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'DD-YY-MM') FROM DUAL;

--시간형식
/*
HH, HH12 오후 1시
HH24 -> HOURS 13시
MI -> MINUTES
SS -> SECONDS
SSSSSS ->SECOND 자릿수
AM, PM = A.M, P.
*/

SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'AM HH:MI:SS') FROM DUAL;

--숫자형식
/*
9: 자릿수가 (9999-> 1218)
0: 자릿수가 비면 0으로 표시 (09999 -> 01234)
PR : 음수 (9999, PR -><1234>) .잘안쓰임
, : 천자릿수 (9,999 -> 1,000)
*/

SELECT TO_CHAR(12506, '$099,999.99') FROM DUAL;

--서수
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

SELECT TO_NUMBER('ABC') FROM DUAL; --숫자가 아니여서 실행안??

--NVL
SELECT BONUS, NVL(BONUS, 0)FROM PERSONNEL;

SELECT MANAGER FROM PERSONNEL;

DESC PERSONNEL;

SELECT MANAGER, NVL(TO_CHAR (MANAGER), 'NON MANAGER') FROM PERSONNEL; --실제로는 잘 안쓰이는듯

--DECODE: 한번에 처리 JAVA의 IF처럼~
--각 사원 급여 부서번호가 10인 경우 10%,  부서번호가 20인 경우 20%, 나머지 부서는 30% 증가

SELECT PNAME, BONUS, DNO, PAY, DECODE(DNO, 10, PAY*1.1, 20, PAY*1.2, PAY*1.3) 인상분 FROM PERSONNEL;

--급여가 3500 이상인 경우에는 GRADE를 'GOOD' 을 미만인 경우에는 'POOR' 출력
SELECT PNAME, BONUS, DNO, PAY, DECODE(SIGN(PAY - 3500), 1, 'GOOD', 0, 'SOSO', 'POOR')GRADE FROM PERSONNEL;
SELECT PNAME, BONUS, DNO, PAY, DECODE(GRADE SIGN(PAY - 3500), 1, 'GOOD', 'POOR') FROM PERSONNEL;--실행안??

--SIGN(양수 1, 음수 -1, 0은 0)
SELECT SIGN(100), SIGN(-100), SIGN(0) FROM DUAL; --> 1 -1 0

--그룹함수 : COUNT
SELECT COUNT(*) FROM PERSONNEL; --무조건 데이터를 하나만 보여준다=하나만 출력

--급여가 3000이상인 사원의 수
SELECT COUNT(*) FROM PERSONNEL WHERE PAY >= 3000; --무조건 결과 1개 출력이므로 누군지 PNAME 알 수 없음

SELECT COUNT(MANAGER) FROM PERSONNEL;-- NULL값 때문에 하나 빠짐
SELECT COUNT(BONUS) FROM PERSONNEL; -- NULL값 제외 3

--AVG
SELECT AVG(PAY) FROM PERSONNEL;

--SUM:합계
SELECT SUM(PAY) FROM PERSONNEL; --총합계

--MAX/MIN
SELECT MAX(PAY), MIN(PAY) FROM PERSONNEL;

--사원중 입사한지 가장 오래된 직원
SELECT MIN(STARTDATE) FROM PERSONNEL;


--입사한지 가장 오래된 사원과 신입사원과의 연차 차이
SELECT ROUND ((MAX(STARTDATE)- MIN(STARTDATE))/365) AS 년 FROM PERSONNEL;-------?

SELECT * FROM PERSONNEL;

--분석함수
--부서별 평균

--여러개의 데이타에서 하나씩만 보여주는 것이  DISTINCT
SELECT DISTINCT DNO, AVG(PAY) OVER(PARTITION BY DNO) FROM PERSONNEL;
SELECT DNO, AVG(PAY) OVER(PARTITION BY DNO) FROM PERSONNEL;

--OVER : 그 위에~ OVER(PARTITION BY DNO)-> (PARTITION BY DNO)안에서

--월급 1200을 받는 사람 순위
SELECT * FROM PERSONNEL ORDER BY PAY DESC;

SELECT RANK(1200) WITHIN GROUP(ORDER BY PAY DESC) FROM PERSONNEL;

-- WITHIN GROUP: ~그룹 안에서

SELECT PNAME, PAY, RANK() OVER(ORDER BY PAY DESC) "RANK" FROM PERSONNEL;
--RANK() OVER(ORDER BY 컬럼) 문법 외우기. 동일 순위인 경우 1,1,3, 형식으로 출력하지만
-- ROW_NUMBER() OVER() ** 중요  제일 많은 씀 ** 동일순위인 경우 1, 2, 3 형식으로 출력
-- DENSE_RANK() OVER()는 동일 순위인 경우 1,1,2 형식으로 출력
-- ROW_NUMBER() OVER()는 매우매우매우 중요한 함수이므로 반드시 알아 둘것 !!!!!!

--GROUP BY 다중값 반환 쿼리
SELECT PNAME FROM PERSONNEL;

SELECT * FROM PERSONNEL WHERE PAY = 1600; --다중값 반환 쿼리(여러개)

SELECT COUNT(*) FROM PERSONNEL; --단일값 반환 쿼리(하나)

--단일값과 다중값을 같이 사용불가

SELECT PNAME, MIN(STARTDATE) FROM PERSONNEL; --X

SELECT MIN(STARTDATE) FROM PERSONNEL;
--하위쿼리
SELECT PNAME, STARTDATE FROM PERSONNEL WHERE STARTDATE = (SELECT MIN(STARTDATE) FROM PERSONNEL);
--위 코드가 이와 같은 결과인 것.
--SELECT PNAME, STARTDATE FROM PERSONNEL WHERE STARTDATE = '1989-01-10 00:00:00';

--부서별 평균 급여
--(종류)별로 구할 때는 GROUP BY 사용
SELECT DNO, AVG(PAY) FROM PERSONNEL GROUP BY DNO;

SELECT STARTDATE,
EXTRACT(YEAR FROM STARTDATE) 년,
EXTRACT(MONTH FROM STARTDATE) 월,
EXTRACT(DAY FROM STARTDATE) 일 
FROM PERSONNEL;

--각 부서의 평균 급여가 전체 평균 급여(2972.5)보다 크면 GOOD 아니면 POOR
SELECT ROUND(AVG(PAY)) FROM PERSONNEL;

SELECT DNO,AVG(PAY),
DECODE (SIGN (AVG(PAY) - (SELECT AVG(PAY) FROM PERSONNEL)),
1, 'GOOD', 'POOR') AS GRADE
FROM PERSONNEL GROUP BY DNO HAVING DNO = 20;
--SELECT 조건문 WHERE 사용
--GROUP BY 조건문 HAVING 사용

------2021.01.25.화-------------

SELECT * FROM PERSONNEL;
--SELF JOIN을 사용 할 때는 MANAGER 번호가 1001이고
--SALESMAN 번호가 1116일때 SALESMAN의 MANAGER가 누구인지
--이러한 정보를 찾을 때 사용
--표 두개를 합쳐서 출력하는 방법

--SELF JOIN :같은 테이블에서 비교
SELECT * FROM PERSONNEL;

SELECT A.PNAME 직원, B.PNAME 관리자 --원래 한글로 안씀
FROM PERSONNEL A, PERSONNEL B
WHERE A.MANAGER = B.PNO;--여기 manager는 1001같은 번호

--NON EQUI JOIN : 특정 범위 값 내에서 내가 원하는 데이터를 찾을 때.오라클에서만.
SELECT * FROM PERSONNEL;
SELECT * FROM PAYGRADE;

SELECT PNAME, PAY, GRADE
FROM PERSONNEL, PAYGRADE
WHERE PAY BETWEEN LOWPAY AND HIGHPAY;

--기타(OPERATION)
--:JOIN문은 아니지만 두개의 테이블에서 연관 데이터를 가져오는 것은 같음

/*
A = [1, 2, 5, 6] B = [1, 2, 4]

A UNION ALL B = [1, 2, 5, 6, 1, 2, 4] --중복
A UION B = [1, 2, 4, 5, 6] --중복 빼고 다 나옴
A MINUS B = [5, 6] --A에서 B를 빼서 4는 안나옴
B MINUS A = [4]
A INTERSECT B = [1, 2] -공통된 부분만 나옴.교집합
*/

--UNION/ALL
SELECT * FROM PERSONNEL
UNION ALL
SELECT * FROM PERSONNEL; --똑같은 데이터도 다 같이 출력

SELECT * FROM PERSONNEL
UNION
SELECT * FROM PERSONNEL; --중복되지 않은 데이터만 출력

--그럼 이걸 언제 사용할까?
--LEE 파일에서 확인해보자

--MINUS
SELECT DNO FROM DIVISION --10, 20, 30, 40
MINUS 
SELECT DNO FROM PERSONNEL;--10, 20, 30
--결과: 40

SELECT DNO FROM DIVISION --10, 20, 30, 40
INTERSECT 
SELECT DNO FROM PERSONNEL;--10, 20, 30
--결과: 10, 20, 30(교집합)

--------------------------------------------------------------
--PAIR WISE

--EX) 이름이 홍길동이고 직업이 산적인 사람을 데이터에서 찾고 싶다
--두개를 비교한다
--MS-SQL에서는 상상할 수 없음!! = 없다는 이야기

--비교하는 컬럼을 쌍으로 묶은 후 비교
SELECT * FROM PERSONNEL;

SELECT PNAME, DNO, PAY, BONUS FROM PERSONNEL
WHERE(PAY, BONUS) IN(SELECT PAY, BONUS FROM PERSONNEL
WHERE DNO = 30);

--여기서 -1사용한 것은 0과 비교하기 위해서 잠깐 쓴 것일뿐
SELECT PNAME, DNO, PAY, NVL(BONUS, -1) FROM PERSONNEL
WHERE(PAY, NVL(BONUS, -1)) IN(SELECT PAY, BONUS FROM PERSONNEL
WHERE DNO = 30);

SELECT PAY, BONUS FROM PERSONNEL WHERE DNO = 30;

SELECT PNAME, DNO, PAY, NVL(BONUS, -1) FROM PERSONNEL
WHERE (PAY = 1600 AND BONUS = 500) OR (PAY = 1450 AND BONUS = 300)
OR (PAY = 1200 AND BONUS = 0) OR (PAY = 3550 AND BONUS IS NULL);

---------2021.01.26.수-----------------------------------------------

--dml(data manipulation language)
--insert데이터 삽입, update수정, delete삭제

--crud

SELECT * FROM division;
desc division;--not null 반드시 값을 넣어야?

INSERT into division values(50, 'operation', '031-111-2222', 'DAEGU');
DELETE division values(50, 'operation', '031-111-2222', 'daegu');
INSERT INTO DIVISION (DNO) VALUES(60);
INSERT INTO DIVISON (DNAME, POSITION) VALUES ('ACCOUNT', 'DAEJUN');--실행안?
--DNO는 NOT NULL이므로 값을 무조건 넣어야되는데 위 코드에는 안들어가서 실행안?

INSERT INTO PERSONNEL (PNO, PNAME, PAY, DNO)
VALUES (7711, 'YOUNG', 4000, 20);

SELECT*FROM PERSONNEL;
DESC PERSONNEL;
--ERROR: UNIQUE CONSTRAINTS ->똑같은 값이 (이미)들어가있다 라는 오류 
--암시적

--명시적

INSERT INTO DIVISION VALUES (70, 'PLANNING', '010-5777-7890', NULL);
INSERT INTO DIVISION VALUES (70, 'PLANNING', '010-5777-7890', '');

SELECT * FROM DIVISION;
UPDATE DIVISION SET DNAME = 'OPERATION', POSITION = 'DAEGU' WHERE DNO = 50;


INSERT INTO PERSONNEL (PNO, PNAME, JOB, STARTDATE, DNO)
VALUES (1300, 'CHO', 'SALESMAN', SYSDATE, 10);

SELECT*FROM PERSONNEL;

SELECT STARTDATE, TO_CHAR(STARTDATE, 'YYYY-MM-DD') NALJJA FROM PERSONNEL;

---치환변수---오라클에만.
SELECT PNO, PNAME, JOB, STARTDATE, DNO
FROM PERSONNEL
WHERE DNO = 30;--끝에 있는 값을 변수로 바꿀 수 있음

SELECT PNO, PNAME, JOB, STARTDATE, DNO
FROM PERSONNEL
WHERE DNO =& DIV_DNO;--&을 써줘야 치환변수다.
--현재 위 코드는 여기서 실행안되어서 일반 CMD 창 열기
/*
CREATE TABLE MANAGER --매니저 테이블 만들어라
AS 					 --어떻게?
	SELECT * FROM PERSONNEL-- 퍼스널에서 가져온 형태로 테이블 만들어라
	WHERE 1=2; --1=2는 거짓 조건이므로 데이터를 안가져오고 테이블
				 형태만 복사되어서 만들어짐
*/
SELECT * FROM MANAGER;
DESC MANAGER;

SELECT * FROM SALESMAN;
SELECT * FROM BUSEO;
--아직은 SAVE 작업을 워드를 안해서 원래 데이터만 복사해서
--내가 수정한 테이블로 나오지 않고 원본 테이블 형식 나옴

SELECT * FROM DIVISION;

COMMIT;--SAVE

SELECT * FROM SAWON;

SELECT * FROM TAB;

--SUB-QUERY
SELECT * FROM MANAGER;
DESC MANAGER;

SELECT * FROM PERSONNEL WHERE JOB = 'MANAGER';

--SELECT한 결과를 특정 데이터에 집어넣는 것
INSERT INTO MANAGER(PNO, PNAME, PAY, STARTDATE)
SELECT PNO, PNAME, PAY, STARTDATE FROM PERSONNEL
WHERE JOB = 'MANAGER';

SELECT * FROM MANAGER;


--업무가 SALEMAN인 사원의 모든 정보를 SALESMAN TABLE로 복사

SELECT * FROM SALESMAN;

INSERT INTO SALESMAN
SELECT * FROM PERSONNEL
WHERE JOB = 'SALESMAN';

COMMIT;--밑에 AUTO COMMIT 기능이 있다.

--UPDATE
--사원번호가 1111인 사원의 부서를 30으로 수정
SELECT* FROM PERSONNEL WHERE PNO = 1111;
UPDATE PERSONNEL SET DNO = 30--여기까지 하면 모든 데이터가 DNO가 다 30으로 바뀜
WHERE PNO = 1111;

UPDATE PERSONNEL SET JOB = 'SALESMAN', MANAGER = 1111,
STARTDATE = SYSDATE, BONUS = 200 WHERE PNO = 7711;

SELECT * FROM PERSONNEL;

COMMIT;--반드시 수정 후 SAVE하기

SELECT * FROM SAWON;

UPDATE SAWON SET DNO = 20;

ROLLBACK; 

--SUB-QUERY로 수정

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
AND DNAME = 'SALES';--오라클에서 안?. MS-SQL에서는 ?

COMMIT;

--DELETE
--사원번호가 1300인 사원 삭제

SELECT * FROM PERSONNEL WHERE PNO = 1300;

DELETE FROM PERSONNEL WHERE PNO = 1300;
--FROM은 오라클, MS-SQL 둘다 생략 가능

SELECT * FROM SAWON;

DELETE SAWON;

ROLLBACK;

COMMIT;
--부서명이 BUSAN인 부서의 부서번호를 찾아 그 부서에 해당하는 직원 삭제

SELECT * FROM PERSONNEL
WHERE DNO = (SELECT DNO FROM DIVISION WHERE POSITION = 'BUSAN');

DELETE PERSONNEL
WHERE DNO = (SELECT DNO FROM DIVISION WHERE POSITION = 'BUSAN');

COMMIT;

--DML 문장 실행시 오류남
--INSERT ERROR

SELECT* FROM PERSONNEL;
DESC PERSONNEL;

INSERT INTO PERSONNEL (PNO, PNAME, DNO) VALUES(1300, 'SONG', 99);--X
--unique constraint 제약조건 때문에 현재는 오류남
--PK (PRIMARY KEY) = 절대 중복값 허용x. NULL 허용 X. 반드시 값 입력.
--TABLE당 1개의 COLUMN 생성가능. 다른 컬럼에는 못넣음. 1개의 컬럼만 가능

SELECT * FROM USER_CONSTRAINTS;--제약조건만 저장한 테이블

--UPDATE ERROR
SELECT * FROM DIVISION;
SELECT * FROM PERSONNEL;
--PERSONNEL_DNO_FK - FOREIGN KEY

UPDATE PERSONNEL SET DNO = 90;--DNO에 90없으므로 제약조건 ERROR.

--DELETE ERROR
DELETE DIVISION WHERE DNO = 30;--고아 데이터
--PERSONNEL과 DIVISION에서 동시에 사용하고 있는 데이터를 삭제하려고 해서
--ERROR남

COMMIT;

--TRANSACTION LOG
--EX) A계좌에서 B계좌로 5000원 송금
/*
1. A계좌 있는지 여부 확인
2. A계좌 잔액 확인(10000원)
3. A계좌에서 5000원 차감 (잔액 5000원 기록)
4. B계좌 확인
5. B계좌로 5000원 송금 --여기서 끊어지면 
6. B계좌 잔액 확인(6000원)
7. B계좌 5000원 증감(잔액 11000원)
8. 작업 끝 --COMMIT;
*/
 
 --UNDO1.LOG
-- 3초전 마다 LOG파일 사용안해도 저장함
--INSERT, UPDATE, DELETE 명령 중 실행 되었을 때 TRANSATION 시작
--데이터를 잘 들어가면 COMMIT, 수정해야되면 ROLLBACK으로 하고 COMMIT
--3개가 들어갔을 때만 TRANSATION

--TRANSACTION LOCK

--2022-09-10 FLIGHT TICKET 구매

--TCL(TRANSACTION CONTROL LANGUAGE)
--COMMIT, ROLLBACK, SAVEPOINT = CHECKPOINT



--AUTO COMMIT-
--DDL(CREATE, ALTER, DROP, RENAME)->무조건 AUTO COMMIT
--DCL(GRANT, REVOKE) GRANT 권한 주기. REVOKE 권한 취소

SELECT * FROM TAB;
SELECT * FROM DIVISION;

--DDL(CREATE, ALTER, DROP, RENAME)
--OBJECT : TABLE, INDEX, SYNONYM, SEQUENCE, VIEW

--TABLE : DATA TYPE이 먼저 있어야?
/*
CHAR : 문자(고정길이)
VARCHAR2 : 문자(가변길이)
VARCHAR -없어지고 지금은 VARCHAR2를 씀
NUMBER(P, S) : 숫자
DATE : 날짜(고정 길이)
LONG : 문자(가변 길이, 2GB) --잘안씀
*/

/*
5자리 공간에 4자리만 입력 했을 경우

CHAR(5) - 남은 1자리 공간이 그대로 있어 필요없는 공간 낭비 상태.
		- 데이터 처리 속도 빠름.(읽는 속도 빠름)
		- 이름, 우편번호 처럼 사이즈가 정해진 데이터 일 때 사용
		
VARCHAR(5) - 남은 1자리가 메모리OS에 반환시켜서 남지 않고
필요할 때 다시 달라고 해서 사용가능(불필요한 공간 낭비 안함)
		   - 각각의 데이터가 저장된 공간의 사이즈가 정해져 있지 않아
		   HEADER 읽고 데이터를 읽기 때문에 속도 느림.
		   - 주소같은 데이터 일 때 사용
		   - A A A A A B AB출력시 빈 메모리에 B로 추가하지만 
		   번거롭기에 '단편화' 작업 필요
*/

SELECT * FROM PERSONNEL WHERE PNO = 1111;
--일반적으로 PNO를 CHAR로 만듦 -> 읽는 소리 빨라서

CREATE TABLE BUSEO1--항상 ()가로로 시작함
(DNO NUMBER(2), --99까지만 들어감 2자리수라서
DNAME VARCHAR(14),
ZIPCODE CHAR(7));

SELECT * FROM BUSEO1;
DESC BUSEO1;

INSERT INTO BUSEO1 VALUES(10, 'AAA', '123-123');

INSERT INTO BUSEO1 VALUES(20, 'BBB', '222-333');

/*
1.영문자 시작(30자)
2.영문자,숫자 사용가능(공백허용안함)
3.특수문자는 _,$,#만 사용가능
4.이름은 중복허용안함
5.컬럼명이 틀려야함
6.예약어 사용못함-여기서 쓰는 문법 안? SELECT, VALUES같은 걸로 이름 못씀

--사용가능한 이름
Sawon,P_NO,Division10,Name_Rule--시작은 영문자

--사용불가능한 이름
10division, $sal, p-no, Alter--시작은 영문자, ALTER 예약어

*/

CREATE TABLE CUSTOM
(ID CHAR(5) PRIMARY KEY,
PWD CHAR(3),
NAME CHAR(6),
ADDR VARCHAR2(50),
ZIP CHAR(5),
BIRTH DATE,
JUMIN CHAR(14),
AGE NUMBER,--숫자를 안쓰면 쓰고 싶은 만큼= 무한
TEL CHAR (14));

DESC CUSTOM;

INSERT INTO CUSTOM
VALUES('A001', '123', 'SUZI', '서울', '12345','94-10-10', '941010-2123456', 29, '010-1234-5656');

SELECT * FROM CUSTOM;

INSERT INTO CUSTOM
VALUES(NULL, '123', 'INNA', '서울', '12345','94-10-10', '941010-2123456', 29, '010-1234-5656');

INSERT INTO CUSTOM
VALUES('A001', '123', 'INA', '서울', '12345',SYSDATE, '941010-2123456', 29, '010-1234-5656');

DROP TABLE CUSTOM;

SELECT * FROM USER_CONSTRAINTS;--DICTIONARY
--PK 이름 회사마다 다르고 내가 직접 지정할 수 있고
--오라클 보고 만들라고 할 수도 있음.
--DIVISION_DNO_PK PRIMARY KEY 이런식으로 만들고
--이름_PK 형식으로 만들어주면 보기 쉽다

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
AGE NUMBER,--숫자를 안쓰면 쓰고 싶은 만큼= 무한
TEL CHAR (14));

DESC CUSTOM;
COMMIT;

---------2021.01.27.목---------------------------------

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

--PERSONNEL 테이블에서 12월달에 입사한 직원들의 데이터를 MON12이란 테이블로 복사


CREATE TABLE MON12
AS
SELECT * FROM PERSONNEL WHERE TO_CHAR(STARTDATE, 'MM') = '12';

--CREATE TABLE MON13
--AS
--SELECT * FROM PERSONNEL WHERE EXTRACT (MONTH FROM STARTDATE) = 12;


SELECT * FROM MON12;

DROP TABLE MON13 PURGE;--영구삭제

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

--부서번호가 10인 부서의 총급여 정보를 DIV10 테이블로 만드시오

SELECT * FROM PERSONNEL;
CREATE TABLE DIV10
AS
SELECT DNO, SUM(PAY) SUM_PAY FROM PERSONNEL
GROUP BY DNO
HAVING DNO = 10;--부서번호가 10번만이라는 조건이 있어서 HAVING사용

SELECT * FROM DIV10;

 SELECT * FROM PERSONNEL;
 CREATE TABLE SAWON1
 AS
 SELECT * FROM PERSONNEL
 WHERE 0 = 1; --거짓 조건 입력->데이타 출력X.테이블만 복사?
 
 SELECT * FROM SAWON1;
 
 DESC PERSONNEL;
 --NOT NULL은 PRIMARAY KEY때문에 만들어짐
 --PK : NULL X, 중복 X. 테이블 1개에만.
 
 DESC SAWON1;--PK는 복사 안되어서 따로 만들어줘야?
 
 --CREATE는 OBJECT 만들 때 사용
 
 SELECT * FROM SALESMAN1;
 DESC SALESMAN1;
 
-- COLUMN 추가
ALTER TABLE SALESMAN1
ADD (DNO NUMBER(2)); --컬럼추가.
--컬럼 바꾸기 ALTER(SQL서버 = 시퀄서버)/MODIFY(오라클)

SELECT * FROM SALESMAN1;

--기획->기능검사->DB 짜기

ALTER TABLE SALESMAN1
ADD(JUMIN CHAR(14), ZIP CHAR(7));--2개 이상은 꼭 ()묶기

SELECT * FROM SALESMAN1;
--L TABLE 최악임. 이것 저것 추가 해서 모양이 L 이라고 하는데
--이런거 만들지 말자..제발

ALTER TABLE SALESMAN1
ADD BIGI VARCHAR2(10) DEFAULT('AA');--DEFAULT(SYSDATE)도 가능
--DEFAULT는 아무값도 주지 않앗을 때 NULL대신 주어진 단어 넣는다.

ALTER TABLE SALESMAN1
ADD (MARRIAGE CHAR(8) CONSTRAINT SALESMAN1_MARRIAGE_CK
CHECK (MARRIAGE IN ('SINGLE', 'MARRIED')));

SELECT * FROM SALESMAN1;

INSERT INTO SALESMAN1 VALUES(111, 'CHO', 'SALESMAN', 2000, 10,
'11111', '123-123', 'BB', 'SINGLE');

INSERT INTO SALESMAN1 VALUES(222, 'CHO', 'SALESMAN', 2000, 10,
'11111', '123-123', 'BB', 'SOLO');

SELECT * FROM USER_CONSTRAINTS;

---MS- NOT NULL 제약조건 아님
--오라클은 DEFAULT 

--PK 꼭 기억. 무조건 만들어야?

--무결성이 깨졌다
--UK(UNIQUE KEY): 중복값 X
--NULL값->오라클은 계속 사용./MS-SQL은 1번만 사용가능

--NOT NULL = NN
--FOREIGN KEY: 외부참조 키.
--주의 : 참조되는 컬럼과 참조하는 컬럼 명 둘다 같아야?.
--VALUES(4)이면 둘다 이거여야?

--관계형 데이터 베이스 = 표로 데이터 만든 것
--정규화? 테이블을 쪼개는 것. 1개->2개, 2->3개
--역정규화 : 테이블을 쪼갰다가 다시 붙이는 것

DESC SALESMAN1;

ALTER TABLE SALESMAN1
ADD CONSTRAINT SALESMAN1_PNO_PK PRIMARY KEY(PNO);
--제약조건을 추가.PK를.PNO에다가 만들거야

SELECT * FROM USER_CONSTRAINTS;
SELECT * FROM SALESMAN1;

SELECT * FROM MANAGER1;

--MANAGER1 테이블에 COMM 컬럼을 NUMBER(5)로 추가

SELECT * FROM MANAGER1;

ALTER TABLE MANAGER1
ADD COMM NUMBER(5);

--MANAGER1 테이블에 PNO 컬럼에 PK를 추가
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
--이미 들어가 있는 데이터의 가장 큰 사이즈 값으로만 줄일 수 있다.
--EX)JOHNSON 글자 수가 7글자이므로 7로 줄일수 있다

ALTER TABLE MANAGER1
MODIFY PNAME VARCHAR2 (7);

----DROP(컬럼, 제약조건)

SELECT * FROM USER_CONSTRAINTS;

ALTER TABLE MANAGER1
DROP CONSTRAINT MANAGER1_PNO_PK;

ALTER TABLE SALESMAN1
DROP CONSTRAINT SALESMAN1_PNO_PK;

--PRIMARAY KEY는 1개이므로
--아래처럼 지울 수 있다.
ALTER TABLE SALEMAN1
DROP PRIMARY KEY;

--this unique/primary key is referenced by some foreign keys
--참조하고 있어서 에러남
--참조할 수 있는 키는 PK이거나 UK.
ALTER TABLE DIVISION
DROP PRIMARY KEY;

SELECT * FROM USER_CONSTRAINTS;

ALTER TABLE DIVISION
DROP PRIMARY KEY CASCADE;--강제 삭제. PK, FK 둘다 지워짐

SELECT * FROM SALESMAN1;
DESC SALESMAN1;

ALTER TABLE SALESMAN1
DROP COLUMN MARRIAGE;


--SET UNUSED
--비활성화 = FLAG를 꽂아놨다
ALTER TABLE SALESMAN1
SET UNUSED COLUMN DNO;
--삭제되어진 것처럼 만들어둠
--일반 사용자가 접근 불가능

--SELECT * FROM DBA_UNUSED_COL_TABS;-DICTIONARY와 같음

SELECT * FROM SALESMAN1;

--UNUSED DATA 진짜 삭제
--FLAG를 DROP 한 것이다
 ALTER TABLE SALESMAN1
 DROP UNUSED COLUMNS;
 
-- ALTER 일때 ADD, MODIFY, DROP 사용

SELECT * FROM TAB;
 
DROP TABLE MANAGER1;

--휴지통 안 들여다보기
SELECT * FROM RECYCLEBIN;

SELECT OBJECT_NAME, ORIGINAL_NAME, DROPTIME FROM RECYCLEBIN;

--복원
FLASHBACK TABLE MANAGER1 TO BEFORE DROP;
FLASHBACK TABLE "BIN$kttMXXmtQD+3yIhZNTcXlA==$0" TO BEFORE DROP;
--아래와 빨간글씨 다른 이유는 복원했다가 다시 지웠기 때문.
SELECT * FROM "BIN$FQHN0CDkSOqCOxHoICut+w==$0";

DROP TABLE SALESMAN1 PURGE;

PURGE RECYCLEBIN;--휴지통 비우기 = 영구삭제

--TRUNCATE/DELTE
--DROP은 TABLE 지우기

SELECT * FROM PERSONNEL;

DELETE PERSONNEL; --DATA 지우기

ROLLBACK;--INSERT, UPDATE, DELETE 일때만 사용.

-----------------------------------------------------

TRUNCATE TABLE PERSONNEL;--바로 완전히 삭제하는 것!!!

SELECT * FROM PERSONNEL;

ROLLBACK;

--RENAME
SELECT * FROM TAB;
--TAB은 기본정보만 보여줌
--TABS는 DB 관리자가 주로 사용함

SELECT * FROM PAY3000;

--TABLE 이름 바꾸기
RENAME PAY3000 TO HIGHPAY;

SELECT * FROM HIGHPAY;

--DCL(DATA CONTROL LANGUAGE) : GRANT, REVOKE
/*
GRANT: USER/ OBJECT에 권한 부여 시 사용
REVOKE : USER/ OBJECT에 권한 회수 시 사용
*/

--계정만들 때 - ERROR나면 권한이 아직없어서
--SYSTEM 가서 kim에게 권한주기
CREATE USER TEST--ID
IDENTIFIED BY TEST--PW
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;


--권한을 뺏어왔기 때문에 에러남
CREATE USER SUZI--ID
IDENTIFIED BY SUZI--PW
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

SELECT * FROM DBA_USERS;
--SELECT * FROM USERS_USERS;--앞에 USERS는 일반 사용자 열람가능해서
--여기서 가능하지만 위에 DBA_USERS;는 SYSTEM에서만 가능하다.

--OBJECT 권한

GRANT SELECT ON PERSONNEL TO SUZI;

--주부 TEST?
GRANT SELECT, INSERT, DELETE ON DIVISION TO SUZI;

SELECT * FROM PERSONNEL;

COMMIT;

--무슨 권한을 어떤 사용자에게 줬는지 알 수 있음
SELECT * FROM USER_TAB_PRIVS_MADE;

--모든 사용자가 KIM의 DIVISION을 선택 가능하게 할 수 있음
GRANT SELECT ON KIM.DIVISION TO PUBLIC;

-------------------------------------------------------------

--OBJECT 권한 PUBLIC 회수하기

REVOKE SELECT ON DIVISION FROM PUBLIC;

--SUZI한테 권한 회수

REVOKE SELECT ON PERSONNEL FROM SUZI;

REVOKE SELECT, INSERT, DELETE ON DIVISION FROM SUZI;

SELECT * FROM USER_TAB_PRIVS_MADE;

REVOKE INSERT, DELETE ON PERSONNEL FROM SUZI;

CREATE ROLE MANAGER;--여기서는 에러남.SYSTEM으로 가자

SELECT * FROM ROLE_SYS_PRIVS
WHERE ROLE IN ('CONNECT', 'RESOURCE');

SELECT * FROM ROLE_SYS_PRIVS
WHERE ROLE ='CONNECT'OR ROLE = 'RESOURCE';

------2021.01.28.금----------
--복습
/*
제약조건(무결성)
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

--COLUMN LEVEL로 제약을 줌

--회사에서 아래 형식 선호함!!!!!!!!!!!!
CREATE TABLE ORDERS
(NO NUMBER(4), SNO NUMBER(4), --NO NUMBER(4)를 참조
NAME VARCHAR2(10),
COUNT NUMBER(7),
CONSTRAINT OREDRS_NO_PK PRIMARY KEY(NO));--TABLE LEVEL 형식이라고 부름

/*
CREATE TABLE ORDERS
(NO NUMBER(4), SNO NUMBER(4),
NAME VARCHAR2(10),
COUNT NUMBER(7),
CONSTRAINT OREDRS_NO_PK PRIMARY KEY(NO), 추가가능);
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
--ORDERS의 NUMBER을 참조하게 만들 예정.
--ORDERS와 CATALOGS와 같은 데이터 형태여야?

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

DELETE ORDERS WHERE NO = 20;--X.child record found-참조하는 데이터 발견.

DELETE CUSTOMER WHERE NO = 20;

DELETE CATALOGS WHERE NO = 20;

SELECT * FROM CATALOGS;

COMMIT;

SELECT * FROM ORDERS;

--UNIQUE
--ORACLE : NULL 허용
--MS -SQL : 1번만 허용

SELECT * FROM ORDERS;
DESC ORDERS;

--SNO에 UNIQUE를 넣어보자(필요한 것을 별도로 넣어주기도함)

ALTER TABLE ORDERS
ADD CONSTRAINT ORDERS_SNO_PK UNIQUE(SNO);

SELECT * FROM ORDERS;

INSERT INTO ORDERS VALUES(40, '', 'DDD', 44);--NULL은 허용함
INSERT INTO ORDERS VALUES(50, '', 'EEE', 55);
INSERT INTO ORDERS VALUES(60, '333', 'FFF', 66);--X.중복 허용X
--unique constraint (KIM.ORDERS_SNO_PK) violated


--CHECK
SELECT * FROM ORDERS;
ALTER TABLE ORDERS
ADD CONSTRAINT ORDERS_SNO_CK CHECK(SNO BETWEEN 100 AND 500);

INSERT INTO ORDERS VALUES(60, '501', 'FFF', 66);--X.범위벗어남

--CHECK 조건을 사용한 NOT NULL -ALTER사용
ALTER TABLE ORDERS
ADD CONSTRAINT ORDERS_NAME_NN CHECK (NAME IS NOT NULL);
DESC ORDERS;

SELECT * FROM USER_CONSTRAINTS;

--NOT NULL--확인해보면 CONSTRAINT_TYPE = C = CHECK이다
CREATE TABLE TEST1
(NO NUMBER(4) CONSTRAINT TEST1_NO_NN NOT NULL);

--제약조건은 추가,삭제만 가능.변경 XID
ALTER TABLE TEST1
DROP CONSTRAINT TEST1_NO NN;

ALTER TABLE ORDERS
DROP CONSTRAINT ORDERS_NO_PK;--X.FK가 있기에 안지워진다
--지우려면(영구 삭제)

--DICTIONARY
SELECT COUNT(*) FROM DICTIONARY;--804. 이 정도로 많은데 SYSTEM은 더 많아유
SELECT * FROM DICTIONARY;--우리가 사용하는 정보 저장하는 곳이 여기.
SELECT * FROM USER_CONSTRAINTS; --제약정보 저장하는 DICTIONARY

/*
USER_: USER 소유의 OBJECT 정보
ALL_ : USER에게 ACCESS가 허용된 OBJECT 정보(ALL은 USER가 포함된것)
DBA_ : DBA 권한을 가진 USER가 ACCESS 할 수 있는 정보.
       한마디로 관리자기에 다 볼 수 있음(열람가능)
V$   : SERVER의 성능에 관한 정보
*/

SELECT * FROM V$VERSION;--ORACLE VERSION나옴

SELECT * FROM ALL_CONSTRAINTS;--ALL은 제약조건이 큰 것. 끝자리 S붙이기
SELECT * FROM ALL_CONS_COLUMNS WHERE TABLE_NAME = 'ORDERS';
--ORDERS에 어떤 TABLE에 어떤 COLUMN에 어떤 제약이 있는지 확인가능

SELECT * FROM DBA_CONS_COLUMNS;--X.table or view does not exist--DBA만 가능.
SELECT * FROM USER_TABLES;
SELECT* FROM USER_SYS_PRIVS;

--VIEW----왜 사용해??? --보안!!!!!!!!!
--가상 테이블

SELECT * FROM PERSONNEL WHERE DNO = 10;

CREATE VIEW PER10_V
AS
SELECT * FROM PERSONNEL WHERE DNO = 10;

--SYSTEM 에서 권한 주기
-- GRANT CREATE VIEW TO kim; 권한을 안줘서 위에서 아까 error났던 것.

SELECT * FROM USER_VIEWS;

SELECT * FROM PER10_V;

--INLINE VIEW 실제 보이는 테이블. JOIN으로 (SELECT 어쩌구)A, (SELECT 어쩌구)B

SELECT * FROM PER10_V WHERE PNO = 1111;

CREATE VIEW PER20_V
AS
SELECT PNO, PNAME, MANAGER, PAY, DNO FROM PERSONNEL;

--각 부서별 평균
SELECT * FROM PER20_V;
CREATE VIEW PER_AVG
AS
SELECT DNO, AVG(PAY) 평균, SUM(PAY) 합계
FROM PERSONNEL
GROUP BY DNO;

SELECT * FROM PER_AVG;

SELECT * FROM PER_AVG WHERE DNO = 10;
SELECT * FROM PER_AVG; WHEN 합계 > 8000;

INSERT INTO PER20_V VALUES (1234, 'JJJ', 1001, 2000, 20);

SELECT * FROM PERSONNEL;

UPDATE PER20_V SET PNAME = 'AAA' WHEN PNO = 1234;

DELETE PER20_V WHERE PNO = 1234;

--이렇게 UPDATE, INSERT, DELETE가 되는 경우는 SIMPLE VIEW.
--SIMPLE VIEW : 하나의 테이블에서 만든 VIEW를 말함.
--                UPDATE, INSERT, DELETE가능
--JOIN문으로 만든 VIEW를 COMPLETE VIEW라고 함.
--2개 이상 JOIN으로 만든 VIEW도 있지만
--2개이상의 테이블을 JOIN해서 만든 VIEW는 UPDATE, INSERT, DELETE 불가능.

SELECT * FROM PERSONNEL;

--PK를 빼고 VIEW 만든 경우
CREATE VIEW PER
AS
SELECT PNAME, JOB, PAY FROM PERSONNEL;

DROP VIEW PER;

SELECT * FROM PER;	--X.입력이 안?

INSERT INTO PER VALUES ('BBB', 'ACCOUNT', 3000);--X NULL있어서
	
SELECT * FROM PER_AVG;

INSERT INTO PER_AVG VALUES(40, 1234, 5000);--X
--데이터가 없는 상태에서 넣으려고 해서 안?
--40번의 데이터가 아닌 실제 데이터가 들어가야?

--수정
CREATE -> ALTER; --VIEW에서는 ALTER 안?

SELECT * FROM USER_VIEWS;

SELECT * FROM PER20_V;

--수정하기 : CREATE OR REPLACE 꼭 둘다 써야?
CREATE OR REPLACE VIEW PER20_V --VIEW는 가상.
(번호, 이름, 직업, 부서번호)
AS
SELECT PNO, PNAME, JOB, DNO FROM PERSONNEL
WHERE DNO = 20;

SELECT * FROM PER20_V;

--삭제
DROP VIEW PER_AVG;

SELECT * FROM PER_AVG;


--COMPLEX VIEW
--JOIN문으로 만든 VIEW
--INSERT, UPDATE, DELETE 불가

CREATE TABLE 고객정보
(고객번호 CHAR(10), 이름 CHAR(10));

CREATE TABLE 회사정보
(고객번호 CHAR(10), 회사명 CHAR(10));

INSERT INTO 고객정보 VALUES ('A001', '홍길동');
INSERT INTO 고객정보 VALUES ('A002', '이순신');
INSERT INTO 회사정보 VALUES ('A001', 'LG');
INSERT INTO 회사정보 VALUES ('A002', 'KAKAO');
DELETE 회사정보 WHERE (이름 = '홍길동' , 회사명 = 'KAKAO');
COMMIT;

SELECT * FROM 고객정보;
SELECT * FROM 회사정보;

CREATE OR REPLACE VIEW 정보
AS
SELECT K.고객번호, 이름, 회사명
FROM 고객정보 K, 회사정보 H
WHERE K.고객번호 = H.고객번호;

SELECT * FROM 정보;

INSERT INTO 정보 VALUES ('A003', '배수지', 'SAMSUNG'); --X

UPDATE 정보 SET 이름 = '배수지' WHERE 고객번호 = 'A001'; --X


---TOP-N
--가장 최근에 입사한 5명의 사원의 이름과 입사날짜 출력
SELECT * FROM PERSONNEL;

SELECT --ROWNUM, 
PNAME, STARTDATE FROM (SELECT * FROM PERSONNEL ORDER BY STARTDATE DESC)
WHERE ROWNUM <= 5;

--테이블 출력시 왼쪽에 보이는 숫자는 고유번호!!
--일련번호. ROWNUM
SELECT ROWNUM, PNAME FROM PERSONNEL;--일련번호

SELECT ROWNUM, PNAME, STARTDATE FROM PERSONNEL--ROWNUM과 고유번호가 서로 같지않음
ORDER BY STARTDATE DESC;

SELECT
ROWNUM, PNAME, STARTDATE FROM (SELECT PNAME, STARTDATE FROM PERSONNEL
ORDER BY STARTDATE DESC);

--범위값 구하기(3~6)--한번 더 묶어줘야?

SELECT ROWNUM, PNAME, STARTDATE FROM
(SELECT ROWNUM, PNAME, STARTDATE FROM
(SELECT PNAME, STARTDATE FROM PERSONNEL ORDER BY STARTDATE DESC))
WHERE ROWNUM >= 3 AND ROWNUM <= 6;--X

SELECT RNUM, PNAME, STARTDATE FROM
(SELECT ROWNUM RNUM, PNAME, STARTDATE FROM
(SELECT PNAME, STARTDATE FROM PERSONNEL ORDER BY STARTDATE DESC))
WHERE RNUM >= 4 AND RNUM <= 5;

--게시판 만들 때 GAP 있는 고유번호의 데이터 가져올때 범위값 사용하는 듯
--나중에 웹 배울때 또 알려주실 예정

--MS-SQL
SELECT TOP 5 PNAME, STARTDATE FROM PERSONNEL ORDER BY STARTDATE DESC;
--상위 5%만 가져와
SELECT TOP 5 PERCENT PNAME, STARTDATE FROM PERSONNEL ORDER BY STARTDATE DESC;


--SYNONYM(동의어)-OBJECT :별칭 만들기
CREATE SYNONYM INSA FOR PERSONNEL;--X

CREATE OR REPLACE SYNONYM INSA FOR KIM.PERSONNEL;

SELECT* FROM INSA;
SELECT * FROM KIM.PERSONNEL;--위 옆 결과가 똑같음.

SELECT * FROM PERSONNEL;

SELECT ROWID, PNAME FROM PERSONNEL;
--AAAE7pAAEAAAAH3AAA(ROWID) 안에 ROW NUMBER 포함.
SELECT * FROM PERSONNEL WHERE PNO = 1111;

CREATE INDEX PER_PAY_IDX
ON PERSONNEL(PAY);

SELECT * FROM USER_INDEXES;
--PK를 만드는 순간 PK와 똑같은 INDEX를 만든다.
--CLUSTERED MS 정렬 OR NON-CLUSTERED 정렬X

CREATE TABLE AAA
(ID NUMBER CONSTRAINT AAA_ID_IDX PRIMARY KEY,
NAME CHAR(10));

SELECT * FROM USER_CONSTRAINTS;
SELECT * FROM USER_INDEXES;

--SEQUENCE(일련번호) : 고유번호/고유값을 넣을 때 사용(숫자 표시)
/*

CREATE SEQUENCE DIV_NO
INCREMENT BY 1
START WITH 1
MAXVALUE 100 || NOMAXVALUE<-계속 늘어나라
CYCLE || NOCYCLE
CACHE 20 || NOCACHE
*/

CREATE SEQUENCE PER_PNO
START WITH 90
INCREMENT BY 1 --증가값
MAXVALUE 99
NOCYCLE
NOCACHE;

SELECT*FROM USER_SEQUENCES;

--NEXTVALUE : SEQUENCE의 사용할 번호(SEQUENCE이름.NEXTVAL)
--CURRVAL   : SEQUENCE의   현재 번호(SEQUENCE이름.CURRVAL)

SELECT PER_PNO.NEXTVAL FROM DUAL;

INSERT INTO DIVISION (DNO, DNAME, POSITION)
VALUES (PER_PNO.NEXTVAL, 'DEV', 'KOREA');

SELECT* FROM DIVISION;

SELECT PER_PNO.CURRVAL FROM DUAL;
--수정:ALTER
ALTER SEQUENCE PER_PNO
INCREMENT BY 1
MAXVALUE 999
CACHE 10
NOCYCLE;

SELECT * FROM USER_SEQUENCES;
