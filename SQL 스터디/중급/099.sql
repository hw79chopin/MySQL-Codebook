-- 실수로 지운 데이터 복구하기 1 (FLASHBACK QUERY)
-- Q. 사원 테이블의 5분 전 KING 데이터를 검색해보시오
-- Oracle version
SELECT ename, sal
	FROM emp
    AS OF TIMESTAMP (SYSTIMESTAMP - INTERVAL '5' MINUTE)
    WHERE ENAME='KING';
    
-- MySQL version
SELECT *
	FROM emp
    WHERE > DATE_FORMAT(DATE_ADD(now(), INTERVAL 5 MINUTE), '%Y-%m-%d');
