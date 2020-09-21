-- 토탈값 출력하기 (SUM)
-- Q. 부서 번호와 부서 번호별 토탈 월급을 출력하시오
SELECT deptno, SUM(sal)
	FROM emp
    GROUP BY deptno;
    
-- Q. 직업, 직업별 토탈 월급을 출력하되 월급이 높은 것부터 출력하시오
SELECT job, SUM(sal)
	FROM emp
    GROUP BY job
    ORDER BY SUM(sal) DESC;
    
-- Q. 직업, 직업별 토탈 월급을 출력하되 직업별 토탈 월급이 4000 이상인 것만 출력하시오
SELECT job, SUM(sal)
	FROM emp
    GROUP BY job
    HAVING SUM(sal)>4000;
    
-- Q. 직업, 직업별 토탈 월급을 출력하되 직업에서 SALESMAN은 제외하고, 직업별 토탈 월급이 4000 이상인 사원들만 출력하시오
SELECT job, SUM(sal)
	FROM emp
    WHERE job != "SALESMAN" 
    GROUP BY job
    HAVING SUM(sal) > 4000;


