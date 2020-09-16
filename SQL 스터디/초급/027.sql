-- 개월 수 더한 날짜 출력하기 (Oracle: ADD_MONTHS, MySQL: DATE_ADD)
-- Q. 오늘로부터 100달 뒤의 날짜는 어떻게 되는지 출력하시오
SELECT DATE_ADD(now(), INTERVAL 100 MONTH)
	FROM dual;
    
-- Q. 오늘로부터 100일 뒤의 날짜를 출력하시오
SELECT DATE_ADD(now(), INTERVAL 100 DAY)
	FROM dual;
