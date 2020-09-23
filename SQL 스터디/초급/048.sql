-- COLUMN을 ROW로 출력하기 (PIVOT)
-- Q. 부서번호, 부서 번호별 토탈 월급을 Pivot문을 사용하여 가로로 출력하시오
SELECT *
	FROM (SELECT deptno, sal from emp)
    PIVOT (sum(sal) for deptno in (10,20,30));