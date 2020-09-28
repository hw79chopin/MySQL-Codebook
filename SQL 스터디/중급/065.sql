-- 여러 테이블의 데이터를 조인해서 출력하기 (LEFT, RIFHT OUTER JOIN)
-- RIGHT OUTER으로 이름, 직업, 월급, 부서위치를 출력하시오
SELECT e.ename, e.job, e.sal, d.loc
	FROM emp e
		RIGHT OUTER JOIN dept d
		ON e.deptno = d.deptno;ㅌㅌㅌㅌㅌ
    