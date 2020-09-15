-- 컬럼 별칭을 사용하여 출력되는 컬럼명 변경하기
-- Q. 사원 테이블에서 사원번호, 이름, 월급을 출력하되 컬럼명을 '사원 번호', nm, "Salary"로 출력하시오
SELECT empno as '사원 번호', ename as nm ,sal as "Salary", sal/100 as "Normalized"
	FROM emp;
/* 
칼럼명 뒤에 as를 붙여주면 된다. 
위처럼 칼럼에 연산을 한 뒤 출력도 된다.*/