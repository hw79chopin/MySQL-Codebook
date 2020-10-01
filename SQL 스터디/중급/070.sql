-- 데이터의 차이를 출력하기 (Oracle: MINUS)
-- Q. 부서번호 10번, 20번을 출력하는 쿼리와 부서번호 20번, 30번을 출력하는 쿼리의 결과 차이를 출력하시오
SELECT DISTINCT e1.ename, e1.sal, e1.job, e1.deptno
	FROM (SELECT emp.ename, emp.sal, emp.job, emp.deptno
					FROM emp
					WHERE deptno in (10,20)) e1
	WHERE e1.deptno NOT IN (SELECT e2.deptno
								FROM emp e2
								WHERE deptno in (20,30));

