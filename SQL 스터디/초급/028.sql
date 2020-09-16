-- 특정 날짜 뒤에 오는 요일 날짜 출력하기 (NEXT_DAY, oracle에만 내장함수 있음)
-- Q. 오늘부터 바로 돌라올 월요일의 날짜가 어떻게 되는지 출력하시오.
SELECT NEXT_DAY('2019/05/22', '월요일')
	FROM dual;
    
-- Q. 오늘부터 앞으로 돌아올 화요일 날짜를 출력하시오
SELECT NEXT_DAY(SYSDATE, '화요일')
	FROM dual;
    
-- Q. 오늘부터 100달 뒤에 돌아오는 화요일 날짜를 출력하시오
SELECT NEXT_DAY(ADD_MONTHS('2019/05/22', 100), '화요일')
	FROM dual;
