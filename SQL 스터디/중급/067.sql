-- 여러 테이블의 데이터를 조인해서 출력하기 (UNION ALL)
-- Q. 부서번호, 부서번호별 토탈 월급을 출력하되, 맨 아래쪽에 토탈 월급을 출력하시오.
SELECT deptno, sum(sal)
	FROM emp
    GROUP BY deptno
UNION
SELECT null as deptno, sum(sal)
	FROM emp;