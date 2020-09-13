-- 비교 연산자 배우기 (IN)
-- 직업이 SALESMAN, ANALYST, MANAGER인 사원들의 이름, 월급, 직업을 출력하시오
SELECT ename, sal, job
	FROM emp
    WHERE job IN ('SALESMAN', 'ANALYST', 'MANAGER');
    
-- 직업이 SALESMAN, ANALYST, MANAGER가 아닌 사원들의 이름, 월급, 직업을 출력하시오
SELECT ename, sal, job
	FROM emp
    WHERE job NOT IN ('SALESMAN', 'ANALYST', 'MANAGER');