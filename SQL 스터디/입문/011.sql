-- 비교연산자 배우기 (BETWEEN AND)
-- Q. 월급이 1,000에서 3,000 사이인 사원들의 이름과 월급을 출력하시오
SELECT ename, sal
	FROM emp
    WHERE sal BETWEEN 1000 AND 3000;
    
SELECT ename, sal
	FROM emp
    WHERE (sal >= 1000 AND sal <= 3000);

-- Q. 월급이 1,000에서 3,000 사이가 아닌 사원들의 이름과 월급을 조회하시오
SELECT ename, sal
	FROM emp
    WHERE sal NOT BETWEEN 1000 AND 3000;

-- Q. 1982년에 입사한 사원들의 이름과 입사일을 조회하시오
SELECT ename, hiredate
	FROM emp
    WHERE hiredate BETWEEN '1982/01/01' AND '1982/12/31';

