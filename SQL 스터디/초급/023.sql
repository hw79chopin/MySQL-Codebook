-- 반올림해서 출력하기 (ROUND)
-- 876.567을 출력하되 소수점 두 번째 자리에서 반올림해서 출력하시오
SELECT ROUND(876.567, 1)
	FROM dual;
    
-- 십의 자리에서 반올림하기
SELECT ROUND(876.567, -2)
	FROM dual;
