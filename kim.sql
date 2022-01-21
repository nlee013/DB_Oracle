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
