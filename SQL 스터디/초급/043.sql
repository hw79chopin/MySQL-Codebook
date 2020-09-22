-- 데이터 분석 함수로 등급 출력하기 (NTILE)
-- Q. 이름과 월급, 직업, 월급의 등급을 출력하시오. 월급의 등급은 4등급으로 출력하시오
SELECT ename, job, sal, 
	NTILE(4) OVER (
		ORDER BY sal) as 등급
    FROM emp; 
    
SELECT * FROM emp;
    