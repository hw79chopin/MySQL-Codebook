-- 최소값 출력하기 (MIN)
-- Q. 직업이 SALESMAN인 사원들 중 최소 월급을 출력하시오
SELECT MIN(sal)
	FROM emp
	WHERE job="SALESMAN";

-- Q. 직업과 직업별 최소 월급을 출력하되, 최소 월급이 높은 것부터 출력하시오
SELECT job, MIN(sal)
	FROM emp
    GROUP BY job
    ORDER BY MIN(sal) DESC;
    
-- Q. 직업, 직업별 최소 월급을 출력하되, SALESMANS 직업을 제외하고 출력하고 월급이 높은 것부터 출력하시오
SELECT job, MIN(sal)
	FROM emp
    WHERE job != 'SALESMANS'
    GROUP BY job
    ORDER BY MIN(sal) DESC;xx

