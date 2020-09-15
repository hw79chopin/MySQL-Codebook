-- 날짜 간 개월 수 출력하기 (Oracle: MONTHS_BETWEN, MySQL: DATEDIFF) 
-- 이름을 출력하고 입사한 날짜부터 오늘까지 총 몇 달을 근무했는지 출력하시오
SELECT ename, DATEDIFF(CURDATE(), hiredate)/30
	FROM emp;
    
-- 2018-10-01에서 오늘까지 총 일수를 출력하시오
SELECT DATEDIFF(CURDATE(), '2018-10-01')
	FROM dual;

