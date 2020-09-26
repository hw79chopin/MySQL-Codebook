-- 집계 결과 출력하기 (GROUPING SETS)
-- Q. 부서번호, 직업, 부서번호 별 토탈 월급, 직업별 토탈 월급, 전체 토탈 월급을 출력하시오
SELECT deptno, job, sum(sal)
	FROM emp
    GROUP BY GROUPING SETS((deptno), (job), ());