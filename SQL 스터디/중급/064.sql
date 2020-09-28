-- 여러 테이블의 데이터를 조인해서 출력하기 (NATURAL JOIN)
-- Q. NATURAL JOIN 방법으로 직업이 SALESMAN인 사람의 이름, 직업, 월급과 부서위치를 출력하시오
SELECT e.ename, e.job, e.sal, d.loc
	FROM emp e NATURAL JOIN dept d
    WHERE e.job = "SALESMAN";