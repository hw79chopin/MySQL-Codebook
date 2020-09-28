-- 여러 테이블의 데이터를 조인해서 출력하기 (ON절)
-- Q. 직업이 SALESMAN인 사람의 이름, 직업, 월급, 부서 위치를 출력하시오
SELECT e.ename, e.job, e.sal, d.loc
	FROM emp e 
		JOIN dept d
        ON e.deptno = d.deptno
	WHERE e.job = "SALESMAN";
	