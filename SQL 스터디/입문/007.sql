-- WHERE절 배우기 (숫자 데이터 검색)
-- Q. 월급이 3,000인 사원들의 이름, 월급, 직업을 출력하시오
SELECT ename, sal as 월급, job as 직업
	FROM emp
	WHERE sal >= 3000;