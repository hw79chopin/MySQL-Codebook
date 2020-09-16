-- 특정 날짜가 있는 달의 마지막 날짜 출력하기 (LAST_DAY)
-- Q. 오늘 해당 달의 마지막 날짜가 어떻게 되는지 출력하시오
SELECT LAST_DAY(now());

-- Q. 오늘부터 마지막 날짜까지 남은 날을 출력하시오.
SELECT LAST_DAY(curdate()) - curdate();
