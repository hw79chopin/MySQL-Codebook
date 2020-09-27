-- 여러 테이블의 데이터를 조인해서 출력하기 (OUTER JOIN)
-- Q. emp, dept 테이블을 조인하여 이름, 부서 위치를 출력하되 BOSTON도 같이 출력되게 하시오.
SELECT * FROM emp;
SELECT * FROM dept;
SELECT e.ename, d.loc
	FROM emp as e 
		RIGHT OUTER JOIN dept as d
		ON e.deptno = d.deptno;