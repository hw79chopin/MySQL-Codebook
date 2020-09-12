-- WHERE절 배우기 (문자와 날짜 검색)
-- Q. 이름이 SCOTT인 사원의 모든 칼럼을 출력하시오.
SELECT * 
	FROM emp
    WHERE ename = 'SCOTT';
    
-- Q. 1981년 11월 17일에 입사한 사원의 정보를 모두 출력하시오.
SELECT * 
	FROM emp
    WHERE hiredate = '81/11/17';

-- 날짜 형식 조회하기 (Oracle)
SELECT *
	FROM NLS_SESSION_PARAMETERS
    WHERE PARAMETER = 'NLS_DATE_FORMAT';

-- 정해진 날짜 형식에 따라 데이터 조회하기 (MySQL)    
-- Q. SCOTT 사원이 입사한 연도와 달을 출력하시오 
SELECT date_format(hiredate, '%Y-%m')
	FROM emp
    WHERE ename = 'SCOTT';
    
