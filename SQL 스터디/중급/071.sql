-- 서브 쿼리 사용하기 1 (단일행 서브쿼리)
-- Q. Jones보다 더 많은 월급을 받는 사원들의 이름, 월급을 출력하시오
SELECT ename, sal
	FROM emp
    WHERE sal > (SELECT sal
					FROM emp
					WHERE ename = "JONES")
	ORDER BY sal DESC;
