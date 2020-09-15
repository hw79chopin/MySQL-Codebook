-- 숫자를 버리고 출력하기 (TRUNC)
-- 876.567을 출력하되 소수점 두 번째 자리인 6과 그 이후 숫자를 모두 버리고 출력하시오 (Oracle-TRUNC, MySQL-TRUNCATE)
SELECT TRUNCATE(876.567, 1)	
	FROM dual;