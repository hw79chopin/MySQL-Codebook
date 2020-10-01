-- 서브 쿼리 사용하기 2 (다중 행 서브쿼리)
-- Q. 직업이 SALESMAN인 사원들과 같은 월급을 받는 사원들의 이름과 월급을 출력하시오
SELECT ename, sal
	FROM emp
	WHERE sal in (SELECT sal
					FROM emp
					WHERE job = "SALESMAN");	
