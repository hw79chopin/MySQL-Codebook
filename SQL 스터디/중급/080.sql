-- 데이터 삭제하기 (DELETE, TRUNCATE, DROP)
-- Q. 사원 테이블에서 SCOTT의 행 데이터를 삭제하시오
DELETE FROM emp
	WHERE ename = 'SCOTT';
    
-- Q. emp 데이터를 모두 지우고 테이블 구조만 남기시오
TRUNCATE TABLE emp;

-- Q. 테이블 전체를 삭제하시오
DROP TABLE emp;