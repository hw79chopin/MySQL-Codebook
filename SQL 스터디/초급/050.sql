-- 누적 데이터 출력하기 (SUM OVER)
-- Q. 직업이 ANALYST, MANAGER인 사원의 사원번호, 이름, 월급, 월급의 누적치를 출력하시오.
SELECT empno, ename, sal,
	SUM(SAL) OVER (ORDER BY empno ROWS
					BETWEEN UNBOUNDED PRECEDING
					AND CURRENT ROW) 누적치
	FROM emp
    WHERE job in ("ANAYLST", "MANAGER");

-- MySQL ver
SELECT empno, ename, sal, (@csum := @csum + sal) as cumulative_sal
	FROM emp
	WHERE job in ("ANALYST", "MANAGER");