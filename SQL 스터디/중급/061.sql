-- 여러 테이블을 조인해서 출력하기 (SELF JOIN)
-- Q. emp테이블에서 자기 자신의 테이블과 조인하여 직업이 SALESMAN인 사람의 이름, 직업, 관리자 이름, 관리자의 직업을 출력하시오
SELECT e1.ename, e1.job, e2.ename, e2.job
	FROM emp e1
		JOIN emp e2
        ON e1.mgr = e2.empno
	WHERE e1.job = "SALESMAN";
    
SELECT e1.ename, e1.job, e2.ename, e2.job
	FROM emp e1, emp e2
    WHERE e1.mgr = e2.empno AND e1.job = "SALESMAN";