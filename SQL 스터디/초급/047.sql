-- COLUMN을 ROW로 출력하기(Oracle만 가능)
-- Q. 부서번호, 부서번호별 토탈 월급을 출력하되, 가로로 출력하시오
SELECT deptno, SUM(sal)
    FROM emp
    GROUP BY deptno;
    
    
SELECT * FROM emp;