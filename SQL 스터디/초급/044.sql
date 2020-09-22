-- 데이터 분석 함수로 순위의 비율 출력하기(CUME_DIST)
-- Q. 이름, 월급, 월급의 순위 비율을 출력하시오
SELECT ename, sal,
	CUME_DIST() OVER (ORDER BY sal) cum_dist_level
    FROM emp;
    
-- Q. 이름, 월급, 직업, 월급의 순위 비율을 출력하되 직업을 기준으로 partition 하시오.
SELECT ename, sal, job,
	CUME_DIST() OVER (PARTITION BY job ORDER BY sal) cum_dist_level
    FROM emp;