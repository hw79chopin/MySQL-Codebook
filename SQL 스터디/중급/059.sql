-- 여러 테이블의 데이터를 조인해서 출력하기 (NON EQUI JOIN)
-- Q. emp, salgrade를 조인하여 이름, 월급, 급여 등급을 출력하시오
SELECT e.ename, e.sal, s.grade
	FROM emp e, salgrade s
	WHERE e.sal BETWEEN s.losal and s.hisal;
    
