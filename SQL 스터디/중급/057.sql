-- 출력되는 행 제한하기 (Simple Top-n Queries)
-- Q. 월급이 높은 사원순으로 사원번호, 이름, 직업, 월급을 4개의 행으로 제한해서 출력하시오
SELECT empno, ename, job, sal
	FROM emp
    ORDER BY sal DESC
    LIMIT 4;