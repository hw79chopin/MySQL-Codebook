-- 데이터를 위아래로 연결하기 (UNION)
-- Q. 부서 번호와 부서 번호별 토탈 월급을 출력하되, 맨 아래 행에 토탈 월급을 출력하시오
SELECT deptno, sum(sal)
	FROM emp
    GROUP BY deptno
UNION
SELECT null as deptno, sum(sal)
	FROM emp;

