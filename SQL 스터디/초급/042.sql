-- 데이터 분석 함수로 순위 출력하기 (Orcale: DENSE_RANK, MySQL: 직접 구현)
-- Q.직업이 ANALYST, MANAGER인 사원들의 이름, 직업, 월급, 월급의 순위를 출력하되 순위 1위인 사원이 2명이 있을 경우 다음 순위는 2위로 출력하시오
SELECT ename, job, sal, RANK() over (ORDER BY sal DESC) AS RANK<
	DENSK_RANK() over (ORDER BY sal DESC) AS DENSE_RANK
    FROM emp
    WHERE job in ("ANAYLST", "MANAGER");
