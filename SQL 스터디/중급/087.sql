-- 서브 쿼리를 사용하여 데이터 삭제하기
-- Q. SCOTT보다 월급이 많은 사원들을 삭제하시오
DELETE
	FROM emp
    WHERE sal > (SELECT sal
					FROM emp
                    WHERE ename = "SCOTT");
				
-- Q. 월급이 해당 사원이 속한 부서번호의 평균 월급보다 크면 삭제하시오.
DELETE FROM emp e1
	WHERE sal > (SELECT avg(sal)
					FROM emp e2
                    WHERE e1.deptno = e2.deptno);