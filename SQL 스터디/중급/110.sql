-- WITH절 사용하기 2 (SUBQUERY FACTORING: WITH절의 쿼리 결과를 임시 테이블로 생성하는 것)
-- Q. 직업별 토탈 값의 평균값에 3000을 더한 값보다 더 큰 부서 번호별 토탈 월급들을 출력하시오
WITH emp_sumsal AS (SELECT job, SUM(sal) as Total
						FROM emp
                        GROUP BY job),
	dept_sumsal AS (SELECT deptno, SUM(sal) as Total
						FROM emp
                        GROUP BY deptno
                        HAVING SUM(sal) > (SELECT AVG(Total) + 3000
												FROM emp_sumsal))

SELECT deptno, Total
	FROM dept_sumsal;
-- 이렇게 테이블을 부르는 건 subquery에서는 불가능하다.