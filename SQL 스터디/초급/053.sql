-- 집계 결과 출력하기 (CUBE)
-- Q. 직업, 직업별 토탈 월급을 출력하되, 첫 번째 행에 토탈 월급을 출력하시오
SELECT job, sum(sal)
	FROM emp
    GROUP BY CUBE(job, sal);