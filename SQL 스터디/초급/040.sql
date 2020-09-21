-- 건수 출력하기 (COUNT)
-- Q. 사원 테이블 전체 사원수를 출력하시오
SELECT COUNT(empno)
	FROM emp;

-- Q. 커미션 칼럼의 Null 값 아닌 값들을 출력하시오
SELECT COUNT(comm)
	FROM emp;
    
-- Q. 사원 테이블 전체 Null 값 포함한 행의 개수를 출력하시오
SELECT COUNT(*)
	FROM emp;

