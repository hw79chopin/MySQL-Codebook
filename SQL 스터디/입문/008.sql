-- WHERE절 배우기 (문자와 날짜 검색)
SELECT * 
	FROM emp
    WHERE ename = 'SCOTT';
    
SELECT * 
	FROM emp
    WHERE hiredate = '81/11/17';

-- 날짜 형식 조회하기 (Oracle)
SELECT *
	FROM NLS_SESSION_PARAMETERS
    WHERE PARAMETER = 'NLS_DATE_FORMAT';

-- 정해진 날짜 형식에 따라 데이터 조회하기 (MySQL)    
SELECT date_format(hiredate, '%Y-%m')
	FROM emp
    WHERE ename = 'SCOTT';
    
