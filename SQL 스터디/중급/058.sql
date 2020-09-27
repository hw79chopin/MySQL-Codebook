-- 여러 테이블의 데이터를 조인해서 출력하기 (EQUI JOIN)
-- Q. emp 테이블과 dept 테이블을 조인하여 이름과 부서위치를 출력하시오
SELECT emp.ename, dept.loc
	FROM emp, dept
    WHERE emp.deptno = dept.deptno;
    
-- Q. emp, dept을 조인해서 직업이 ANALYST인 사람의 이름과 부서위치를 출력하시오
SELECT e.ename, e.job, d.loc
	FROM emp e, dept d
    WHERE e.deptno = d.deptno AND e.job = "ANALYST";
