-- 002. 테이블에서 모든 column 출력하기
-- Q.사원 테이블에서 모든 column을 출력하시오
SELECT * FROM emp;

SELECT emp.*, ename FROM emp;		/* 특정 칼럼을 마지막에 또 출력하는 방법 */