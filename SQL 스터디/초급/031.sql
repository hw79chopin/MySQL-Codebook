-- 날짜형으로 데이터 유형 변환하기 (Oracle: TO_DATE, MySQL: DATE_FORMAT)
-- Q. 81년 11월 17일에 입사한 사원의 이름, 입사일을 출력하시오.
SELECT ename, hiredate
	FROM emp
    WHERE hiredate= DATE_FORMAT('81-11-17', '%Y/%m/%d');