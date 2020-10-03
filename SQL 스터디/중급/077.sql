-- SELECT절의 서브 쿼리
-- Q. 직업이 SALESMAN인 사원들의 이름, 월급을 출력하되, 직업이 SALESMAN인 사원들의 최대 월급, 최소 월급도 같이 출력하시오
SELECT ename, sal, (SELECT MAX(sal) FROM emp) max, (SELECT MIN(sal) FROM emp) min
	FROM emp;