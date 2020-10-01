-- 서브 쿼리 사용하기 3 (NOT IN)
-- Q. 관리자가 아닌 사원들의 이름, 월급, 직업을 출력하시오
SELECT ename, sal, job
	FROM emp
    WHERE empno NOT IN (SELECT mgr
							FROM emp
                            WHERE mgr IS NOT NULL);
