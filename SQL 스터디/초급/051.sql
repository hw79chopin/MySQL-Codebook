-- 비율 출력하기 (RATIO_TO_REPORT) (Oracle만 가능)
-- Q. 부서 번호가 20번인 사원들의 사원번호, 이름, 월급을 출력하고, 20번 부서 내에서 사원의 월급 비율을 출력하시오.
SELECT empno, ename, sal, RATIO_TO_REPORT(sal) OVER () as 비율
	FROM emp
	WHERE deptno=20;
