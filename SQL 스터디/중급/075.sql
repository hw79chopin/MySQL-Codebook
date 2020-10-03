-- HAVING절의 서브 쿼리
-- Q. 직업, 직업별 토탈 월급을 출력하되, 직업이 SALESMAN인 사원들의 토탈 월급보다 더 큰 값들만 출력하시오
SELECT job, SUM(sal)
	FROM emp
    GROUP BY job
    HAVING SUM(sal) > (SELECT SUM(sal)
						FROM emp
                        WHERE job = "SALESMAN");
    



