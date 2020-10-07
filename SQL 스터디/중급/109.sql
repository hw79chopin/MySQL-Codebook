-- WITH절 사용하기 1 (WITH ~ AS)
-- Q. WITH절을 이용해서 직업과 직업별 토탈 월급을 출력하되 직업별 토탈 월급들의 평균값보다 더 큰 값들만 출력하시오
WITH job_sumsal AS (SELECT job, SUM(sal) as 토탈
						FROM emp
                        GROUP BY job)

SELECT job, 토탈
	FROM job_sumsal
    WHERE 토탈 > (SELECT AVG(토탈)
					FROM job_sumsal);