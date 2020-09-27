-- 출력되는 행 제한하기 (Oracle: ROWNUM, MySQL: LIMIT)
-- Q. 사원 테이블에서 사원번호, 이름, 직업, 월급을 상단 5개의 행만 출력하시오.
SELECT empno, ename, job, sal	
	FROM emp
    LIMIT 5;