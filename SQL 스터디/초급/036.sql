-- 최대값 출력하기 (MAX)
-- Q. 사원 테이블에서 최대 월급을 출력하시오
SELECT MAX(SAL)
	FROM EMP;
    
-- Q. 직업이 SALESMAN인 사원들 중 최대 월급을 출력하시오.
SELECT job, MAX(SAL)
	FROM emp
    WHERE job="SALESMAN"
    GROUP BY job;
    
-- Q. 부서 번호와 부서 번호별 최대 월급을 출력하시오
SELECT deptno, MAX(sal)
	FROM emp
    GROUP BY deptno;
