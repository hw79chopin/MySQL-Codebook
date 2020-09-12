-- 중복된 데이터를 제거해서 출력하기 (MySQL: DISTINCT,Oracle: UNIQUE)
-- Q. 사원 테이블에서 직업을 출력하되 중복된 데이터를 제외하고 출력하시오.
SELECT DISTINCT job FROM emp;