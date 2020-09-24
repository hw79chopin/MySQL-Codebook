-- 집계 결과 출력하기 (ROLLUP) (MySQL에서는 WITH ROLLUP)
-- Q 부번호, 직업과 직업별 토탈 월급을 출력하되, 중간중간마다 부서의 토탈 월급을 출력하시오
SELECT deptno, job, sum(sal)
	FROM emp
    GROUP BY deptno, job
    WITH ROLLUP;