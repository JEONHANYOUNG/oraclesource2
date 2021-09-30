-- SQL 은 대소문자 구별은 안함(쿼리문)
-- 대소문자 구별은 비밀번호만 함
-- 문자열 표현할 때 홑따옴표 사용함

-- scott 계정에 존재하는 모든 테이블 조회
SELECT
    *
FROM
    tab;

-- 조회(Select) : 행 단위로 조회, 열 단위로 조회

-- emp 테이블의 내용을 전체조회
SELECT
    *
FROM
    emp;

-- emp 테이블의 empno, ename, job만 조회
SELECT
    empno,
    ename,
    job
FROM
    emp;

-- emp 테이블의 empno, deptno 조회
SELECT
    empno,
    deptno
FROM
    emp;


-- 중복 제거 후 조회 : distinct

SELECT DISTINCT
    deptno
FROM
    emp;

-- 별칭을 붙여서 조회 : AS(alais)
SELECT
    empno AS 사원번호
FROM
    emp;

SELECT
    ename           AS 사원명,
    job             AS "직 책",
    sal             AS 급여,
    comm            AS 추가수당,
    sal * 12 + comm AS 연봉
FROM
    emp;
    

-- 정렬 : ORDER BY 컬럼명 기준(오름차순(ASC),내림차순(DESC))

-- ename,sal 조회할 때 sal 내림차순으로 정렬
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal DESC;

-- 오름차순(생략가능-기본값)
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal ASC;

SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal;

-- EMP 테이블의 전체 내용을 조회하고, 단 사원번호 내림차순 정렬
SELECT
    *
FROM
    emp
ORDER BY
    empno DESC;
    
-- 전체 내용 조회(부서번호 오름차순, 급여 내림차순)
SELECT
    *
FROM
    emp
ORDER BY
    deptno ASC,
    sal DESC;

-- [문제] 조회할 테이블은 EMP 테이블이며 모든 열을 출력한다.
SELECT
    empno  AS employee_no,
    ename  AS employee_name,
    mgr    AS manager,
    sal    AS salary,
    comm   AS commission,
    deptno AS department_no,
    job,
    hiredate
FROM
    emp
ORDER BY
    deptno DESC,
    ename ASC;
    

-- 특정 조건을 기준으로 원하는 데이터를 조회 : WHERE  

-- 전체 데이터 조회, 단, 부서번호가 30번인 데이터 조회
SELECT
    *
FROM
    emp
WHERE
    deptno = 30;
    
-- 사원번호가 7782 번 조회    
SELECT
    *
FROM
    emp
WHERE
    empno = 7782;

-- 부서번호가 30번이고, 사원직책이 SALESMAN 인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN';

-- 사원번호가 7499이고, 부서번호가 30인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        empno = 7499
    AND deptno = 30;


-- 부서번호가 30이거나 사원직책이 CLERK인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    deptno = 30
    OR job = 'CLERK';


-- 연산자를 사용한 WHERE

-- 연봉이 36000 인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal * 12 = 36000;

-- 월급이 3000 보다 큰 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal > 3000;

-- 월급이 3000 이상인  사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal >= 3000;

-- 이름의 첫 글자가 F 이후인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename >= 'F';

-- 급여가 2500이상이고, 직업이 ANALYST인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        sal >= 2500
    AND job = 'ANALYST';

-- 직무가 SALESMAN 이거나, CLERK 이거나, MANAGER 인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    job = 'ANALYST'
    OR job = 'CLERK'
    OR job = 'MANAGER';

-- 등가비교연산자(같음  = ,  같지않음 =>  !=, <>, ^=)
SELECT
    *
FROM
    emp
WHERE
    sal != 3000;

SELECT
    *
FROM
    emp
WHERE
    sal <> 3000;

SELECT
    *
FROM
    emp
WHERE
    sal^= 3000;

SELECT
    *
FROM
    emp
WHERE
    NOT sal = 3000;


-- IN 

SELECT
    *
FROM
    emp
WHERE
    job IN ( 'ANALYST', 'CLERK', 'MANAGER' );

SELECT
    *
FROM
    emp
WHERE
    job NOT IN ( 'ANALYST', 'CLERK', 'MANAGER' );

-- 부서번호가 10,20번 사원 조회
SELECT
    *
FROM
    emp
WHERE
    deptno IN ( 10, 20 );


-- BETWEEN A AND B 

-- 급여가 2000 ~ 3000 사이인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        sal >= 2000
    AND sal <= 3000;

SELECT
    *
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;

-- 급여가 2000 ~ 3000 사이가 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal NOT BETWEEN 2000 AND 3000;

-- LIKE 연산자와 와일드 카드
-- 일부 문자열이 포함된 데이터 조회
-- 와일드카드 
-- ①  % : 길이와 상관없이 모든 문자 데이터를 의미
-- ②  _ : 어떤 값이든 상관없이 한 개의 문자 데이터를 의미


-- 사원명이 S로 시작하는 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'S%';

-- 사원명의 두번째 글자가 L인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_L%';

-- 사원명에 AM 문자가 포함되어 있는 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%AM%';

-- 사원명에 AM 문자가 포함되어 있지 않은 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename NOT LIKE '%AM%';

-- IS NULL 
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL;
-- NULL 은 0이 아니고 완전히 비어 있는 상태를 의미

-- MGR이 NULL 사원 조회
SELECT
    *
FROM
    emp
WHERE
    mgr IS NULL;

-- MGR이 NULL이 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    mgr IS NOT NULL;

-- 집합 연산자 : 합집합 - UNION, UNION ALL(중복값을 제거하지 않음), 
--               교집합 - INTERSECT
--               차집합 - MINUS


-- EMPNO,ENAME,SAL,DEPTNO 조회(부서번호가 10번이거나 20번인)
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 20;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION ALL
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    sal,
    job,
    deptno,
    sal
FROM
    emp
WHERE
    deptno = 20;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
MINUS
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
INTERSECT
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;


-- 오라클 함수

-- 내장함수 - 1) 문자함수

--               대소문자 변경
--               UPPER(문자열) : 괄호 안 문자를 모두 대문자로 변환
--               LOWER(문자열) : 괄호 안 문자를 모두 소문자로 변환
--               INITCAP(문자열) : 괄호 안 문자 중 첫글자만 대문자로 변환, 나머지는 소문자

SELECT
    ename,
    upper(ename),
    lower(ename),
    initcap(ename)
FROM
    emp;

-- ENAME이 SCOTT 인 찾기
SELECT
    *
FROM
    emp
WHERE
    lower(ename) = lower('scott');

SELECT
    *
FROM
    emp
WHERE
    lower(ename) LIKE lower('%scott%');


--               문자 길이 구하기
--               LENGTH(문자열) : 해당 문자열의 길이 돌려줌
--               LENGTHB(문자열) : 해당 문자열의 바이트수 돌려줌

SELECT
    ename,
    length(ename)
FROM
    emp;

-- 한글 한 자당 3BYTE 사용
-- DUAL : 데이터베이스 관리자가 소유한 테이블 / 임시 연산이나 함수의 결과 값 확인 용도
SELECT
    length('한글'),
    lengthb('한글')
FROM
    dual;

-- JOB 이 6글자 이상인 사원들 조회
SELECT
    *
FROM
    emp
WHERE
    length(job) >= 6;

--               문자열 일부를 추출하기
--               SUBSTR(문자열데이터,시작위치,추출길이)
--               SUBSTR(문자열데이터,시작위치)
SELECT
    job,
    substr(job, 1, 2),
    substr(job, 3, 2),
    substr(job, 5)
FROM
    emp;

-- EMP 테이블의 모든 사원 이름을 세 번째 글자부터 끝까지 출력하기
SELECT
    ename,
    substr(ename, 3)
FROM
    emp;


--               문자열 데이터 안에서 특정 문자를 찾기
--               INSTR(문자열,찾을 문자열,시작위치(옵션), 몇번째에 있는걸 찾을 것인지(옵션)) 

SELECT
    instr('HELLO, ORACLE!', 'L'),
    instr('HELLO, ORACLE!', 'L', 5),
    instr('HELLO, ORACLE!', 'L', 2, 2)
FROM
    dual;
    
-- 원본 문자열 : 이것이 Oracle이다. 이것도 오라클이다.
-- 찾을 문자열 : 이것

-- 제일 처음에 나오는 이것의 위치를 찾기
SELECT
    instr('이것이 Oracle이다. 이것도 오라클이다.', '이것')
FROM
    dual;

-- 시작위치를 3으로 지정한 후 나오는 이것의 위치 찾기
SELECT
    instr('이것이 Oracle이다. 이것도 오라클이다.', '이것', 3)
FROM
    dual;

-- 이것이 두번째로 나오는 위치 찾기
SELECT
    instr('이것이 Oracle이다. 이것도 오라클이다.', '이것', 1, 2)
FROM
    dual;


-- 사원 이름에 문자 S가 있는 사원 구하기
SELECT
    *
FROM
    emp
WHERE
    instr(ename, 'S') > 0;

SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%S%';


--               특정 문자를 다른 문자로 바꾸는 함수
--               REPLACE(문자열 데이터 또는 열이름,찾는문자,바꿀문자)

-- 010-1234-5678 => 010 1234 5678, 01012345678
SELECT
    '010-1234-5678'                    AS 원본,
    replace('010-1234-5678', '-', ' ') AS replace1,
    replace('010-1234-5678', '-')      AS replace2
FROM
    dual;
    

--               두 문자열 데이터를 합치는 함수
--               CONCAT(문자열1,문자열2)

-- EMPNO,ENAME 합쳐서 조회
SELECT
    empno,
    ename,
    concat(empno, ename)
FROM
    emp
WHERE
    ename = 'SCOTT';
    
-- 7788:SCOTT     
SELECT
    empno,
    ename,
    concat(empno, concat(':', ename))
FROM
    emp
WHERE
    ename = 'SCOTT';  
    
-- || : 문자열 데이터 연결 연산자

SELECT
    empno || ename,
    empno
    || ':'
    || ename
FROM
    emp
WHERE
    ename = 'SCOTT';
    
--  문자열 함수 : 공백제거(기본)
--                TRIM : 양쪽 공백 제거
--                LTRIM : 왼쪽 공백 제거
--                RTRIM : 오른쪽 공백 제거

SELECT
    '    이것이    ',
    TRIM('    이것이    ')
FROM
    dual;
    
    
    
-- TRIM(삭제옵션(선택), 삭제할 문자(선택), from 원본문자열)  
SELECT
    '['
    || TRIM('_' FROM '__Oracle__')
    || ']' AS trim,
    '['
    || TRIM(LEADING '_' FROM '__Oracle__')
    || ']' AS trim_leading,
    '['
    || TRIM(TRAILING '_' FROM '__Oracle__')
    || ']' AS trim_trailing,
    '['
    || TRIM(BOTH '_' FROM '__Oracle__')
    || ']' AS trim_both
FROM
    dual;
    
    
-- 숫자함수 : ROUND(숫자,반올림 위치(선택))
--            TRUNC(숫자,버림 위치(선택))
--            CEIL(숫자) : 입력된 숫자와 가장 가까운 큰 정수
--            FLOOR(숫자) : 입력된 숫자와 가장 가까운 작은 정수
--            MOD(숫자,나눌숫자) : 나머지 값

SELECT
    round(1234.5678)      AS round,
    round(1234.5678, 0)   AS round0,
    round(1234.5678, 1)   AS round1,
    round(1234.5678, 2)   AS round2,
    round(1234.5678, - 1) AS round_minus1,
    round(1234.5678, - 2) AS round_minus2
FROM
    dual;

SELECT
    trunc(1234.5678)      AS trunc,
    trunc(1234.5678, 0)   AS trunc0,
    trunc(1234.5678, 1)   AS trunc1,
    trunc(1234.5678, 2)   AS trunc2,
    trunc(1234.5678, - 1) AS trunc_minus1,
    trunc(1234.5678, - 2) AS trunc_minus2
FROM
    dual;

SELECT
    ceil(3.14),
    floor(3.14),
    ceil(- 3.14),
    floor(- 3.14)
FROM
    dual;

SELECT
    mod(15, 6),
    mod(10, 2),
    mod(11, 2)
FROM
    dual;
    
-- 날짜함수
-- SYSDATE : 오라클 데이터베이스 서버가 설치된 os의 현재 날짜와 시간
-- ADD_MONTHS : 몇 개월 이후 날짜를 구하는 함수

SELECT
    sysdate     AS now,
    sysdate - 1 AS yesterday,
    sysdate + 1 AS tomorrow
FROM
    dual;

SELECT
    sysdate,
    add_months(sysdate, 3)
FROM
    dual;


-- 입사 20주년이 되는 날짜 조회
SELECT
    ename,
    hiredate,
    add_months(hiredate, 240)
FROM
    emp;
    
-- 현재 날짜를 기준으로 입사 40년 미만인 사원 조회

SELECT
    ename,
    hiredate
FROM
    emp
WHERE
    add_months(hiredate, 480) > sysdate;





-- MONTHS_BETWEEN : 두 날짜 간의 개월 수 차이 구하기
SELECT
    empno,
    ename,
    hiredate,
    sysdate,
    MONTHS_BETWEEN(SYSDATE,hiredate) as month1,
    MONTHS_BETWEEN(hiredate,SYSDATE) as month2,
    trunc(MONTHS_BETWEEN(SYSDATE,hiredate)) as month3
FROM
    emp;
    
-- next_day(날짜,요일문자)
-- last_day(날짜)

select sysdate,next_day(sysdate,'월요일'),last_day(sysdate)
from dual;

-- 형변환 함수
-- TO_CHAR() : 숫자 또는 날짜 데이터를 문자 데이터로 변환
-- TO_NUMBER() : 문자 데이터를 숫자 데이터로 변환
-- TO_DATE() : 문자 데이터를 날짜 데이터로 변환
SELECT SYSDATE,TO_CHAR(SYSDATE,'YYYY/MM/DD') AS 현재날짜 FROM DUAL;

SELECT SYSDATE,TO_CHAR(SYSDATE,'MM') AS 현재월 FROM DUAL;
SELECT SYSDATE,TO_CHAR(SYSDATE,'MON') AS 현재월 FROM DUAL;

SELECT SYSDATE,TO_CHAR(SYSDATE,'HH:MI:SS') AS 현재시간 FROM DUAL;
SELECT SYSDATE,TO_CHAR(SYSDATE,'HH12:MI:SS AM') AS 현재시간 FROM DUAL;
SELECT SYSDATE,TO_CHAR(SYSDATE,'HH24:MI:SS') AS 현재시간 FROM DUAL;

-- L(Locale) : 지역화폐단위를 붙여서 출력
-- 9, 0 : 숫자의 한 자리를 의미함(9는 빈자리를 채우지 않음, 0 빈자리를 채우는 개념)
SELECT SAL,
       TO_CHAR(SAL,'$999,999') AS SAL_$,
       TO_CHAR(SAL,'$000,000') AS SAL_$2,
       TO_CHAR(SAL,'L999,999') AS SAL_L 
FROM emp;

SELECT TO_NUMBER('1,300','999,999')
FROM DUAL;

SELECT TO_DATE('2021-09-12','YYYY-MM-DD') AS TODATE1,
       TO_DATE('20210912','YYYY-MM-DD') AS TODATE2
FROM DUAL;

-- 날짜 데이터는 연산이 가능함
-- 1981-06-01 이후 입사자

SELECT *
FROM EMP
WHERE hiredate > TO_DATE('1981/06/01','YYYY-MM-DD');


-- 널처리 함수
-- NVL(데이터,널이면 반환할 값)
select empno, ename, sal,comm, sal+comm
from emp;

select empno, ename, sal,comm, sal+comm, nvl(comm,0), sal+nvl(comm,0)
from emp;

-- NVL2(데이터,널이 아닐경우 반환할 값,널이면 반환할 값)
select empno, ename, sal,comm, NVL2(COMM,'O','X'), NVL2(COMM, SAL*12+COMM, SAL*12)
from emp;
    

select * from emp where empno=7369


-- DECODE 함수
-- DECODE([데이터, 검사 대상이 될 열 또는 데이터],
--        [조건1],[데이터가 조건 1과 일치할 때 반환할 결과],
--        [조건2],[데이터가 조건 2와 일치할 때 반환할 결과],
--        .....
--        [위 조건들 중에서 일치한 경우가 없을 때 반환할 결과]

-- job 에 따라 급여의 비율 설정
SELECT
    empno, 
    ename, 
    job, 
    sal, 
    decode(job,'MANAGER',sal*1.1,'SALESMAN',sal*1.05,
            'ANALYST',sal,sal*1.03) AS upsal
FROM
    emp;

-- CASE : DECODE 문으로 작성할 수 있는 것들은 모두 변환 가능
--        = 의 의미로 사용되지만 다른 조건도 가능하다
SELECT 
    empno, 
    ename, 
    job, 
    sal, 
    CASE job
        WHEN 'MANAGER' THEN sal*1.1
        WHEN 'SALESMAN' THEN sal*1.05
        WHEN 'ANALYST' THEN sal
        ELSE sal*1.03 
    END AS upsal
FROM
    emp;

-- COMM 이 널이면 '해당사항 없음', 0이면 '수당없음', 0보다 크면 '수당 : 2500' 출력
SELECT EMPNO, ENAME, COMM,
                   CASE
                        WHEN COMM IS NULL THEN '해당사항 없음'
                        WHEN COMM = 0 THEN '수당없음'
                        WHEN COMM > 0 THEN '수당 : '|| COMM
                   END AS COMM_TEXT FROM EMP;

-- [실습] EMP 테이블에서 사원들의 월 평균 근무일수는 21.5일이다. 
-- 하루 근무 시간을 8시간으로 보았을 때 사원들의 
-- 하루 급여(DAY_PAY)와 시급(TIME_PAY)를 계산하여 결과를 출력한다.
-- 단, 하루 급여는 소수점 셋째 자리에서 버리고, 시급은 두 번째 소수점에서 반올림하시오.

-- 하루 급여 = 월급 / 21.5 (소수점 셋째자리까지 버림)
-- 시급 = 하루 급여 / 8 (소수점 둘째자리에서 반올림)
SELECT EMPNO, ENAME, SAL, 
    TRUNC(SAL/ 21.5,2) AS DAY_PAY, 
    ROUND(SAL/21.5/8,1) AS TIME_PAY
FROM EMP;
    
-- [실습2] EMP 테이블에서 사원들은 입사일(HIREDATE)을 기준으로 3개월이 지난 후
-- 첫 월요일에 정직원이 된다. 
-- 사원들이 정직원이 되는 날짜(R_JOB)를 YYYY-MM-DD 형식으로 아래와 같이 출력하시오. 
-- 단, 추가수당(COMM)이 없는 사원의 추가 수당은 N/A로 출력하시오.

SELECT comm, nvl(comm,0) FROM emp;
SELECT comm, nvl(comm,'0') FROM emp;

SELECT comm, nvl(comm,'N/A') FROM emp;
SELECT comm, nvl(TO_CHAR(comm),'N/A') FROM emp;

SELECT EMPNO, ENAME, HIREDATE, 
    next_day(add_months(HIREDATE,3),'월요일') as R_JOB,
    nvl(TO_CHAR(comm),'N/A') AS COMM   
FROM EMP;

-- [실습3] EMP 테이블의 모든 사원을 대상으로 직속 상관의 사원 번호(MGR)를 
-- 다음과 같은 조건을 기준으로 변환해서 CHG_MGR 열에 출력하시오.
-- 직속상관의 사원 번호가 존재하지 않을 경우 : 0000
-- 직속상관의 사원 번호 앞 두자리가 75일 경우 : 5555
-- 직속상관의 사원 번호 앞 두자리가 76일 경우 : 6666
-- 직속상관의 사원 번호 앞 두자리가 77일 경우 : 7777
-- 직속상관의 사원 번호 앞 두자리가 78일 경우 : 8888
-- 그 외 직속 상관 사원 번호의 경우 : 본래 직속 상관의 사원번호 그대로 출력

SELECT EMPNO, ENAME, MGR,
                DECODE(SUBSTR(TO_CHAR(MGR),1,2), 
                        null,'0000',
                        '75','5555',
                        '76','6666',
                        '77','7777',
                        '78','8888',
                        SUBSTR(TO_CHAR(MGR),1)) AS CHG_MGR    
FROM EMP;

SELECT EMPNO, ENAME, MGR,
                CASE
                    WHEN MGR IS null THEN '0000',
                    WHEN (SUBSTR(TO_CHAR(MGR),1,2)='75' THEN '5555'  --  WHEN MGR LIKE '75%' THEN '5555'                 
                    WHEN (SUBSTR(TO_CHAR(MGR),1,2)='76' THEN '6666'  --  WHEN MGR LIKE '76%' THEN '6666'
                    WHEN (SUBSTR(TO_CHAR(MGR),1,2)='77' THEN '7777'  --  WHEN MGR LIKE '77%' THEN '7777'
                    WHEN (SUBSTR(TO_CHAR(MGR),1,2)='78' THEN '8888'  --  WHEN MGR LIKE '78%' THEN '8888'
                    ELSE TO_CHAR(MGR)
                END AS CHG_MGR    
FROM EMP;


-- 다중행 함수 : SUM(), COUNT(), MAX(), MIN(), AVG()

SELECT SUM(SAL) FROM EMP;

-- SELECT SUM(SAL), ENAME FROM EMP; -- 단일 그룹의 그룹 함수가 아닙니다

-- EMP 테이블의 데이터 개수 조회
SELECT COUNT(*) FROM EMP;

SELECT COUNT(EMPNO) FROM EMP;

SELECT COUNT(SAL) FROM EMP;

SELECT COUNT(DISTINCT SAL) FROM EMP;

-- 부서번호가 10번인 사원의 최대 급여
SELECT MAX(SAL) FROM EMP WHERE DEPTNO=10;
-- 부서번호가 10번인 사원의 최대 급여 
SELECT MIN(SAL) FROM EMP WHERE DEPTNO=10;


-- 부서번호가 20번인 사원 중에서 제일 오래된 입사일 조회
SELECT MIN(HIREDATE) FROM EMP WHERE DEPTNO=20;

-- 부서번호가 30번인 사원들의 평균 급여 조회
SELECT AVG(SAL) FROM EMP WHERE DEPTNO=30;

SELECT AVG(DISTINCT SAL) FROM EMP WHERE DEPTNO=30;

-- GROUP BY 그룹화할 열 지정(여러개 지정 가능)

-- 부서별 급여의 합 조회
SELECT SUM(SAL),DEPTNO 
FROM EMP 
GROUP BY DEPTNO
ORDER BY DEPTNO;

-- 부서별 급여 평균 조회
SELECT AVG(SAL),DEPTNO 
FROM EMP 
GROUP BY DEPTNO
ORDER BY DEPTNO;

-- 부서별, 직무별 급여 평균 조회
SELECT AVG(SAL),DEPTNO, job 
FROM EMP 
GROUP BY DEPTNO, job
ORDER BY DEPTNO, job;

-- GROUP BY ~ HAVING 조건식

-- 부서별, 직무별 급여 평균 조회(단, 급여의 평균이 2000 이상)

-- SELECT DEPTNO, JOB, AVG(SAL)
-- FROM emp
-- WHERE AVG(SAL) >= 2000 -- 그룹 함수는 허가되지 않습니다
-- GROUP BY DEPTNO, JOB
-- ORDER BY DEPTNO, JOB;

SELECT DEPTNO, JOB, AVG(SAL)
FROM emp
GROUP BY DEPTNO, JOB HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

SELECT DEPTNO, JOB, AVG(SAL)
FROM emp
WHERE SAL <= 3000 -- ① 출력 대상이 되는 행 제한
GROUP BY DEPTNO, JOB HAVING AVG(SAL) >= 2000 -- ② 그룹화한 행 제한
ORDER BY DEPTNO, JOB;

-- [실습1] EMP 테이블을 이용하여 
-- 부서번호(DEPTNO), 평균급여(AVG_SAL), 최고급여(MAX_SAL), 최저급여(MIN_SAL), 사원수(CNT)를 출력한다. 
-- 단, 평균 급여를 출력할 때 소수점을 제외하고 각 부서번호별로 출력하는 SQL 문을 작성하시오.
SELECT DEPTNO,FLOOR(AVG(SAL)) AS AVG_SAL, MAX(SAL)MAX_SAL,MIN(SAL) MIN_SAL,COUNT(*)
FROM emp 
GROUP BY DEPTNO;

-- [실습2] 같은 직책에 종사하는 사원이 3명 이상인 직책과 인원수를 출력하는 SQL문을 작성하시오.
SELECT JOB, COUNT(*)
FROM emp
GROUP BY JOB HAVING COUNT(JOB)>= 3;

-- [실습3] 사원들의 입사연도(HIRE_YEAR)를 기준으로 부서별로 몇 명이 입사했는지 
-- 출력하는 SQL문 작성하시오.
SELECT TO_CHAR(HIREDATE,'YYYY') AS HIRE_YEAR, DEPTNO, COUNT(*) AS CNT
FROM emp
GROUP BY TO_CHAR(HIREDATE,'YYYY'), DEPTNO
ORDER BY HIRE_YEAR DESC, DEPTNO ASC;

-- 데이터 삽입, 삭제, 수정 : 결과는 실행된 행의 갯수로 넘어옴

-- 실습용 테이블 생성
create table dept_temp as select * from dept;

SELECT * FROM dept_temp;

-- insert : 데이터 삽입
-- insert into 테이블명(필드명....) values(값1, 값2....)
-- insert into 테이블명 values(값1, 값2....)

insert into dept_temp(deptno,dname,loc) values(50, 'DATABASE', 'SEOUL');
insert into dept_temp values(60, 'NETWORK', 'BUSAN');

insert into dept_temp values('NETWORK', 'BUSAN', 70); -- ORA-01722: 수치가 부적합합니다
insert into dept_temp(dname,loc,deptno) values('NETWORK', 'BUSAN', 70); -- 필드명의 순서는 상관없다

-- 이 열에 대해 지정된 전체 자릿수보다 큰 값이 허용됩니다.
-- insert into dept_temp(deptno,dname,loc) values(500, 'DATABASE', 'SEOUL');

-- NULL 삽입하는 방법(테이블 생성 시 널이 가능하도록 열이 설정되어 있는 경우만 사용 가능)
insert into dept_temp(deptno,dname) values(90, 'DATABASE');
insert into dept_temp(deptno,dname, LOC) values(91, 'WEB', NULL);
insert into dept_temp(deptno,dname, LOC) values(92, 'MOBILE', '');


COMMIT; -- insert를 사용하면 마지막으로 commit를 작성해야함 


-- 실습용 테이블 생성
-- 테이블 구조는 복사하되, 데이터는 복사하고 싶지 않을 때
create table emp_temp as select * from emp where 1<>1;

select * from emp_temp;

desc emp_temp;
-- (empno,ename,job,mgr,hiredate,sal,comm,deptno)
insert into emp_temp
values(1111,'홍길동','manager',null,'2021-09-27',4000,null,10);

insert into emp_temp
values(2222,'성춘향','analyst',null,'2021/09/27',5000,null,10);

insert into emp_temp
values(3333,'박보검','analyst',null,sysdate,5000,null,10);

select * from emp_temp;

desc emp_temp;

commit;

-- UPDATE : 수정
-- UPDATE 테이블 명 SET 변경할 열 = 변경할 값, 변경할 열 = 변경할 값...
-- UPDATE 테이블 명 SET 변경할 열 = 변경할 값, 변경할 열 = 변경할 값... WHERE 수정할 조건

SELECT * FROM dept_temp;

UPDATE dept_temp 
SET LOC = 'SEOUL'
WHERE DEPTNO = 90;

UPDATE dept_temp 
SET LOC = 'BUSAN'
WHERE DEPTNO = 91;

COMMIT;

SELECT * FROM emp_temp;

-- SAL 이 4000이하인 사원만 추가 수당을 50으로 변경
UPDATE emp_temp
SET COMM = 50
WHERE SAL <= 4000; 

COMMIT;

UPDATE emp_temp
SET COMM = 6500;
where empno = 1111;

UPDATE EMP_TEMP
set sal = 1500
where empno = 7369;

ROLLBACK;

-- DELETE : 삭제
-- DELETE 테이블 이름 WHERE 삭제할 데이터 조건
-- DELETE FROM(선택사항) 테이블 이름 WHERE 삭제할 데이터 조건

create table emp_temp2 as select * from emp;
SELECT * FROM EMP_TEMP2;

-- JOB이 MANAGER인 사원 삭제
DELETE emp_temp2
WHERE JOB = 'MANAGER';

-- 전체 사원 삭제
DELETE emp_temp2;



ROLLBACK; -- 되돌리는 것

-- 조인

SELECT count(*) FROM emp;
SELECT count(*) FROM dept;

-- 카테시안 조인 : 나올 수 있는 모든 조합(14행 * 4행 = 56행)
SELECT * 
FROM emp, dept;

-- 내부조인(inner 조인, 교집합)
-- 등가조인 : 일치하는 데이터 추출
-- 비등가 조인 : 특정 범위에 있는 데이터 추출


SELECT * 
FROM emp, dept
where emp.deptno = dept.deptno;

-- 00918. 00000 -  "column ambiguously defined" : 열의 정의가 애매합니다. (deptno가 모호해서 문제 발생)
SELECT empno, ename, emp.deptno, dname 
FROM emp, dept
where emp.deptno = dept.deptno;

SELECT empno, ename, emp.deptno, dname 
FROM emp, dept
where emp.deptno = dept.deptno
order by dname;


-- 테이블 별칭 설정
SELECT empno, ename, e.deptno, dname 
FROM emp e, dept d
where e.deptno = d.deptno
order by dname;


-- sal 3000 이상인 사원들의 사번, 이름, 부서번호, 부서명, 급여
select empno,ename,d.deptno,dname,sal
from emp e, dept d
where e.deptno = d.deptno and sal >= 3000;

-- 급여가 2500 이하이고, 사원번호가 9999 이하인 사번,이름,급여,부서명,부서위치
SELECT empno,ename,sal,dname,loc
FROM emp e, dept d
where e.deptno = d.deptno and sal <= 2500 and empno <= 9999;

-- emp 테이블의 급여가 salgrade 특정 범위에 속하면 grade 값 조회
SELECT * FROM salgrade;  
SELECT * FROM emp;

SELECT *
FROM emp e, salgrade s
where e.sal BETWEEN s.losal and s.hisal;


-- 자체 조인(셀프 조인) : 본인 테이블과 조인
SELECT * FROM emp;

SELECT e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
FROM emp e1, emp e2
where e1.mgr = e2.empno;

-- 외부 조인(outer join, 개념이 상이하다, 반대쪽으로 조인)
-- 왼쪽 외부 조인 (left outer join, 두 개를 조인하려고 하지만 안되는 것들이 있는데 왼쪽 기준으로 뽑는거)
SELECT e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
FROM emp e1, emp e2
where e1.mgr = e2.empno(+);

-- 오른쪽 외부 조인 (right outer join, 두 개를 조인하려고 하지만 안되는 것들이 있는데 오른쪽 기준으로 뽑는거)
SELECT e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
FROM emp e1, emp e2
where e1.mgr(+) = e2.empno;

-- 양쪽 외부 조인(+ 기호는 제공안함)
-- outer-join된 테이블은 1개만 지정할 수 있습니다
-- SELECT e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
-- FROM emp e1, emp e2
-- where e1.mgr(+) = e2.empno(+);


-- 모든 데이터 베이스에서 사용가능한 표준 조인 구문

-- join~on 
SELECT empno, ename, emp.deptno, dname 
FROM emp join dept on emp.deptno = dept.deptno
order by dname;

SELECT empno, ename, d.deptno, dname ,sal
FROM emp e join dept d on e.deptno = d.deptno
WHERE SAL >= 3000;


SELECT empno, ename, d.deptno, dname ,sal
FROM emp e join dept d on e.deptno = d.deptno
where sal <= 2500 and empno <= 9999;


SELECT *
FROM emp e join salgrade s 
on e.sal BETWEEN s.losal and s.hisal;

-- outer 표준 구문(일치하지 않는 거 뽑아오는 거)
SELECT e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
FROM emp e1 left outer join emp e2 on e1.mgr = e2.empno;

SELECT e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
FROM emp e1 right outer join emp e2 on e1.mgr = e2.empno;

SELECT e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
FROM emp e1 full outer join emp e2 on e1.mgr = e2.empno;


-- [실습1] 급여가 2000초과인 사원들의 부서 정보, 사원 정보를
-- 아래와 같이 출력하는 SQL 문을 작성하시오.
-- deptno, dname, empno, ename, sal
SELECT d.deptno, dname, empno, ename, sal
FROM dept d, emp e 
Where d.deptno = e.deptno and sal > 2000 order by d.deptno;

-- join on 구문
SELECT d.deptno, dname, empno, ename, sal
FROM dept d join emp e on d.deptno = e.deptno 
where sal > 2000;


-- [실습2] 각 부서별 평균 급여, 최대 급여, 최소 급여, 사원수를 출력하는 SQL문을 작성하시오.
SELECT d.deptno, dname, floor(avg(sal)) as avg_sal, MAX(sal) max_sal, min(SAL) min_sal ,count(*) cnt
FROM emp e, dept d
where e.deptno = d.deptno
group by d.deptno, dname;


SELECT d.deptno, dname, floor(avg(sal)) as avg_sal, MAX(sal) max_sal, min(SAL) min_sal ,count(*) cnt
FROM emp e join dept d on e.deptno = d.deptno
group by d.deptno, dname;


-- [실습3] 모든 부서정보와 사원 정보를 아래와 같이 부서번호, 사원이름 순으로 정렬하여 
--  출력하는 SQL문을 작성하시오.
SELECT d.deptno, dname, empno, ename, job, sal
FROM dept d,emp e 
where d.deptno = e.deptno(+);

SELECT d.deptno, dname, empno, ename, job, sal
FROM dept d left outer join emp e on e.deptno = d.deptno
order by d.deptno, e.empno;

-- 세 개 테이블 조인
SELECT * 
FROM emp e1,emp e2,emp e3
where e1.empno =e2.empno and e2.empno = e3.empno;

SELECT * 
FROM emp e1 join emp e2 on e1.empno = e2.empno
            join emp e3 on e2.empno = e3.empno;   
            

-- [실습4] 모든 부서정보와 사원 정보, 급여등급 정보, 
--  각 사원의 직속 상관의 정보 부서번호, 사원번호 순으로 정렬하여 출력하는 SQL문을 작성하시오.

-- emp e1 테이블과 dept 테이블 조인 => dept 테이블 기준(dept 테이블 내용 모두 출력)
SELECT * 
FROM emp e1, dept d1
where e1.deptno(+) = d1.deptno;

-- 첫번째 연결 결과와 salgrade 조인
SELECT * 
FROM emp e1, dept d1, salgrade s1
where e1.deptno(+) = d1.deptno and e1.sal between s1.losal(+) and s1.hisal(+);

-- 두번째 결과의 mgr과 emp e2 테이블의 empno 과 조인
SELECT 
    d.deptno,
    dname,
    e1.empno,
    e1.ename,
    e1.mgr,
    e1.sal,
    losal,
    hisal,
    grade,
    e2.empno as mgr_empno,
    e2.ename as mgr_ename
FROM 
    emp e1, 
    dept d, 
    salgrade s, 
    emp e2
where 
    e1.deptno(+) = d.deptno
  and e1.sal BETWEEN s.losal(+) and s.hisal(+)
  and e1.mgr = e2.empno(+)
order by d.deptno, e1.ename;



SELECT 
    d.deptno,
    dname,
    e1.empno,
    e1.ename,
    e1.mgr,
    e1.sal,
    losal,
    hisal,
    grade,
    e2.empno as mgr_empno,
    e2.ename as mgr_ename
FROM 
    emp e1 right outer join dept d on e1.deptno = d.deptno
           left outer join salgrade s on e1.sal BETWEEN s.losal and s.hisal
           left outer join emp e2 on e1.mgr = e2.empno
order by d.deptno, e1.ename;
exit;

-- 서브쿼리 : sql문을 실행하는데 필요한 데이터를 추가로 조회하기 위해 sql문
--          내부에서 사용하는 select 문을 말함
--          연산자와 같은 비교 또는 조회 대상의 오른쪽에 놓여서 괄호로 묶여서 사용
--          서브쿼리의 select 절에 명시한 열은 메인쿼리의 비교 대상과 같은 자료형과 
--          같은 개수로 지정

-- JONES 사원의 급여보다 높은 급여를 받는 사원 조회

-- JONES 사원의 급여 조회
select sal FROM emp where ename ='JONES'; -- 2975
-- 2975보다 큰 사원 조회
SELECT * FROM EMP WHERE sal > 2975;

-- 단일행 서브쿼리
-- 서브쿼리의 결과가 단 하나의 행으로 나온 상황
-- >, >=, =, <=, <>, ^=, !=


SELECT * FROM EMP WHERE sal > (SELECT sal FROM emp where ename= 'JONES');

-- ALLEN 사원의 추가 수당보다 많은 추가수당을 받는 사원 조회
SELECT * FROM emp where comm > (select comm from emp where ename = 'ALLEN');

-- WARD 사원의 입사일보다 빨리 입사한 사원 목록 조회(연도는 가장 최근이 큰거이므로 반대 개념)
SELECT * FROM emp WHERE hiredate < (SELECT hiredate FROM emp where ename = 'WARD');

-- 20번 부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는 사원정보(사원번호,사원명
-- 직업,급여)와 소속부서정보(부서번호,부서명,부서위치)를 조회
SELECT empno,ename,job,sal,d.deptno,dname,loc
FROM emp e, dept d
where e.deptno = d.deptno and d.deptno = 20 and e.sal > (SELECT AVG(SAL) FROM EMP);


-- 다중행 서브쿼리
-- 서브쿼리 실행결과가 여러 개로 나오는 걸 의미
-- IN : 메인 쿼리의 데이터가 서브쿼리의 결과 중 하나라도 일치하면 true
-- ANY(SOME) : 메인쿼리의 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 true
-- ALL : 메인쿼리의 조건식을 서브쿼리의 결과 모두가 만족하면 true
-- EXISTS : 서브 쿼리의 결과가 존재하면(행 1개 이상 존재하면) true

-- 부서별 최고 급여와 같은 사원 조회

-- 단일 행 하위 질의에 2개 이상의 행이 리턴되었습니다.
--SELECT * 
--FROM EMP
--WHERE SAL > (SELECT MAX(Sal) FROM emp GROUP by deptno);

SELECT * 
FROM EMP
WHERE SAL IN (SELECT MAX(Sal) FROM emp GROUP by deptno);

-- ANY(SOME)
SELECT * 
FROM EMP
WHERE SAL = ANY (SELECT MAX(Sal) FROM emp GROUP by deptno);

-- 30번 부서 사원들의 최고 급여보다 적은 사원 조회
SELECT * 
FROM EMP
WHERE SAL < ANY (SELECT MAX(Sal) FROM emp where deptno = 30);


SELECT * 
FROM EMP
WHERE SAL < ANY (SELECT SAL FROM emp where deptno = 30);

-- 30번 부서 사원들의 최저 급여보다 많은 사원 조회
SELECT * 
FROM EMP
WHERE SAL > ANY (SELECT SAL FROM emp where deptno = 30);


-- ALL
-- 30번 부서 사원들의 급여보다 적은 사원 조회
SELECT * 
FROM EMP
WHERE SAL < ALL (SELECT SAL FROM emp where deptno = 30);

SELECT * 
FROM EMP
WHERE SAL > ALL (SELECT SAL FROM emp where deptno = 30);

-- EXISTS
SELECT * FROM EMP WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO=10);

SELECT * FROM EMP WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO=50);

-- 문제] 전체 사원 중 ALLEN과 같은 직책인 사원들의 사원정보,부서정보 출력하기
-- ENAME,EMPNO,SAL,DEPTNO,DNAME 출력
SELECT ENAME,EMPNO,job,SAL,D.DEPTNO,D.DNAME
FROM EMP e, dept d
WHERE e.deptno = d.deptno and E.JOB
IN (SELECT JOB FROM emp WHERE ENAME ='ALLEN');  


-- 문제] 전체 사원의 평균 급여보다 높은 급여를 받는 사원들의 사원정보,부서정보,급여등급 
-- 출력하기(급여가 많은 순으로 정렬하되 급여가 같은 경우에는 사원번호를 오름차순으로 정렬)
SELECT ENAME,EMPNO,job,SAL,D.DEPTNO,D.DNAME,S.GRADE
FROM EMP e, dept d, SALGRADE s
WHERE e.deptno = d.deptno and E.SAL BETWEEN S.LOSAL AND S.HISAL 
    AND E.SAL > (SELECT AVG(SAL) FROM emp) 
    ORDER BY E.SAL DESC, E.EMPNO ASC;


-- 비교할 열이 여러 개인 다중열 서브쿼리

SELECT * 
FROM EMP
WHERE (deptno,SAL) IN (SELECT deptno,MAX(Sal) FROM emp GROUP by deptno);

-- FROM 서브쿼리 (인라인 뷰)
SELECT EMPNO,ENAME,D.DEPTNO,DNAME,LOC
FROM (SELECT * FROM EMP WHERE DEPTNO=10) E10, (SELECT * FROM DEPT) D
WHERE E10.DEPTNO = D.DEPTNO;


-- INSERT 사용하는 서브쿼리
-- VALUES 절은 사용하지 않음
-- 데이터가 추가되는 테이블의 열 개수와 서브쿼리의 열 개수가 일치해야 한다.
-- 데이터가 추가되는 테이블의 자료형과 서브쿼리의 자료형이 일치해야 한다.


-- EMP 테이블에서 SALGRADE 테이블을 참조하여 급여 등급이 1인 사원만을 EMP_TEMP에 추가하기

SELECT * 
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE =1;

INSERT INTO EMP_TEMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
SELECT E.EMPNO,E.ENAME,E.JOB,E.MGR,E.HIREDATE,E.SAL,E.COMM,E.DEPTNO
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE =1;


-- UPDATE 서브쿼리
SELECT * FROM dept_temp;

-- 40번 부서의 부서 이름과 지역 수정(DEPT 테이블의 DEPTNO= 30인 지역명, 부서명 추출)

SELECT DNAME, LOC
FROM DEPT
WHERE DEPTNO=30;

UPDATE DEPT_TEMP
SET (DNAME,LOC) = (SELECT DNAME,LOC FROM DEPT WHERE DEPTNO=30)
WHERE DEPTNO = 40;

UPDATE DEPT_TEMP
SET LOC= 'SEOUL'
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT_TEMP WHERE DNAME = 'ACCOUNTING');


-- DELETE 서브쿼리

SELECT * FROM EMP_TEMP;

-- 급여 등급이 3등급이고 30번 부서인 사원들만 삭제
DELETE EMP_TEMP
WHERE EMPNO IN (SELECT EMPNO
                FROM EMP_TEMP E, SALGRADE S
                WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE=3 AND DEPTNO=30);


--[실습1] 실습을 위하여 기존 테이블을 이용하여 테이블을 생성한다.
--① EMP 테이블의 내용을 이용하여 EXAM_EMP 생성
create table exam_emp as select * from emp;

--② DEPT 테이블의 내용을 이용하여 EXAM_DEPT 생성
create table exam_dept as select * from dept;

--③ SALGRADE 테이블의 내용을 이용하여 EXAM_SALGRADE 생성
create table exam_salgrade as select * from salgrade;
SELECT 
    * FROM exam_emp;
-- EXAM_EMP 테이블 작성
insert into exam_emp 
values(7201,'TEST_USER1','manager',7788,'2016-01-02',4500,null,50);
insert into exam_emp 
values(7202,'TEST_USER2','CLERK',7201,'2016-02-21',1800,null,50);
insert into exam_emp 
values(7203,'TEST_USER3','ANALYST',7201,'2016-04-11',3400,null,60);
insert into exam_emp 
values(7204,'TEST_USER4','SALESMAN',7201,'2016-05-31',2700,300,60);
insert into exam_emp 
values(7205,'TEST_USER5','CLERK',7201,'2016-07-20',2600,null,70);
insert into exam_emp 
values(7206,'TEST_USER6','CLERK',7201,'2016-09-08',2600,null,70);
insert into exam_emp 
values(7207,'TEST_USER7','LECTURER',7201,'2016-10-28',2300,null,80);
insert into exam_emp 
values(7208,'TEST_USER8','STUDENT',7201,'2018-03-09',1200,null,80);

--[실습3] EXAM_EMP에 속한 사원 중 50번 부서에서 근무하는 사원들의 
-- 평균 급여보다 많은 급여를 받고 있는 사원들을 70번 부서로 옮기는 SQL 문 작성하기
UPDATE EXAM_EMP
SET DEPTNO = 70
WHERE SAL > (SELECT AVG(SAL) FROM EXAM_EMP WHERE DEPTNO=50);


--[실습4] EXAM_EMP에 속한 사원 중 60번 부서의 사원 중에서 
-- 입사일이 가장 빠른 사원보다 늦게 입사한 사원의 급여를 10% 인상하고 80번 부서로 옮기는 SQL 문 작성하기
UPDATE EXAM_EMP 
SET SAL = SAL * 1.1, DEPTNO =80
WHERE HIREDATE > (SELECT MIN(hiredate) FROM EXAM_EMP Where deptno =60);


--[실습5] EXAM_EMP에 속한 사원 중, 급여 등급이 5인 사원을 삭제하는 SQL문을 작성하기
DELETE FROM EXAM_EMP
WHERE EMPNO IN (SELECT EMPNO
                FROM EXAM_EMP, SALGRADE S
                WHERE SAL BETWEEN LOSAL AND HISAL AND GRADE = 5);

COMMIT;

-- 트랜잭션
-- 하나의 단위로 데이터를 처리, 더이상 분할 할 수 없는 최소 수행 단위

CREATE TABLE DEPT_TCL AS SELECT * FROM DEPT;

SELECT * FROM DEPT_TCL;

-- 트랜잭션과 관련있는 명령어 실행
INSERT INTO DEPT_TCL VALUES(50, 'DATABASE','SEOUL');

UPDATE DEPT_TCL SET LOC ='BUSAN' WHERE DEPTNO = 40;

DELETE FROM DEPT_TCL WHERE DNAME= 'RESEARCH';

--------

-- 수행된 명령 취소
rollback;


-- 수행된 명령 최종 반영
commit;

SELECT * FROM DEPT_TCL;

-- 세션 : 어떤 활동을 위한 시간이나 기간
--       데이터베이스 접속을 시작으로 여러 데이터베이스에서 관련 작업을 수행한 후 
--       접속을 종료하기까지 전체 기간

DELETE FROM DEPT_TCL WHERE DEPTNO=50;

SELECT * FROM DEPT_TCL; 

commit;    

UPDATE DEPT_TCL
SET LOC='SEOUL'
WHERE DEPTNO = 30;

commit;
