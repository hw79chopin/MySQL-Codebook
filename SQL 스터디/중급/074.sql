-- 서브 쿼리 사용하기 (EXISTS와 NOT EXISTS)
-- Q. 부서 테이블에 있는 부서번호 중에서 사원 테이블에 존재하는 부서 번호, 부서명, 부서 위치를 출력하시오
SELECT *
	FROM dept d
	WHERE EXISTS(SELECT *
                FROM emp e
                WHERE e.deptno = d.deptno);
