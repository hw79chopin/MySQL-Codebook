-- 대소문자 변환 함수 배우기 (UPPER, LOWER, INITCAP)
-- 사원 테이블의 이름을 출력하되 첫 번째 칼럼은 대문자, 두 번째 칼럼은 소문자, 세 번째 칼럼 첫 번째 철자만 대문자로 출력하시오
-- MySQL에서는 INITCAP 함수가 없다.
SELECT UPPER(ename), LOWER(job), hiredate FROM emp;
