-- 비교 연산자 배우기
-- Q. 월급이 1200 이하인 사원들의 이름과 월급, 직업, 부서 번호를 출력하시오.
SELECT ename, sal, job, deptno
	FROM emp
    WHERE sal <=1200;