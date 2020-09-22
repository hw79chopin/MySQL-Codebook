-- 데이터 분석 함수로 순위 출력하기 (Oracle: RANK, MySQL: 직접 구현)
-- Q. 직업이 ANALYST, MANAGER인 사원들의 이름, 직업, 월급, 월급의 순위를 출력하시오
SELECT ename, job, sal
	FROM emp
    WHERE job in ('ANAYLST', 'MANAGER')
    ORDER BY sal desc;