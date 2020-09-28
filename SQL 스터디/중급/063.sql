-- 여러 테이블의 데이터를 조인해서 출력하기 (USING 절)
-- Q. USING 절을 용해서 SALESMAN이 직업인 사람의 이름, 직업, 월급, 부서위치를 출력하시오
SELECT e.ename, e.job, e.sal, d.loc
	FROM emp e JOIN dept d
		USING (deptno)			-- USING은 column 이름이 같은 때 사용 가능
	WHERE e.job ="SALESMAN";  