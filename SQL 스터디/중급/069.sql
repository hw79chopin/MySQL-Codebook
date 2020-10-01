-- 데이터의 교집합을 출력하기 (Oracle: INTERSECT)
-- Q. 부서 번호 10번, 20번 사원들을 출력하는 쿼리와, 부서번호 20번, 30번을 출력하는 쿼리의 교집합을 출력하시오
SELECT e1.ename, e1.sal, e1.job, e1.deptno
	FROM (SELECT emp.ename, emp.sal, emp.job, emp.deptno
					FROM emp
					WHERE deptno in (10,20)) e1
	INNER JOIN (SELECT emp.ename, emp.sal, emp.job, emp.deptno
					FROM emp
					WHERE deptno in (20,30)) e2
	ON e1.deptno = e2.deptno;

