-- 데이터 분석 함수로 바로 전 행과 다음 행 출력하기 (LAG, LEAD)
-- Q. 사원번호, 이름, 월급을 출력하고 그 옆에 바로 전 행의 월급을, 그 옆에는 바로 다음 행의 월급을 출력하시오
SELECT empno, ename, sal,
	LAG(sal, 1) over (ORDER BY sal ASC) as "전행",
    LEAD(sal, 1) over (ORDER BY sal ASC) as "다음 행"
	FROM emp;
    
-- Q. 직업이 ANALYST 또는 MANAGER인 사원들의 사원번호, 이름, 입사일, 바로 전 입사한 사원의 입일, 바로 다음에 입사한 사원의 입사일을 출력하시오
SELECT empno, ename, job, hiredate,
	LAG(hiredate, 1) over (ORDER BY hiredate ASC) as "전 입사일",
    LEAD(hiredate, 1) over (ORDER BY hiredate ASC) as "다음 행"
    FROM emp
    WHERE job in ("ANALYST", "MANAGER");
    
-- Q. 부서번호, 사원번호, 이름, 입일, 바로 전에 입사한 사원의 입사일을 출력하고, 그 다음에 입사한 사원의 입일을 출력하되 부서 변호별로 구분해서 출력하시오
SELECT empno, ename, deptno, job, hiredate,
	LAG(hiredate, 1) over (PARTITION BY deptno ORDER BY hiredate ASC) as "전 입사일",
    LEAD(hiredate, 1) over (PARTITION BY deptno ORDER BY hiredate ASC) as "다음 행"
    FROM emp;