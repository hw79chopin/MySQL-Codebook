-- 산술 연산자 배우기 (*, /, +, -)
-- null값 처리 함수 (MySQL: IFNULL, Oracle: NVL)
-- Q. 연봉이 36,000 이상인 사원들의 이름과 연봉을 출력하시오.
SELECT ename, sal*12 as 연봉
	FROM emp
    WHERE sal*12 >= 36000;

-- Q. 부서번호가 10번인 사원들의 이름, 월급, 커미션, 월급 + 커미션을 출력하시오.
SELECT * FROM emp;
SELECT sal + IFNULL(comm, 0) as 봐라
	FROM emp
    WHERE ename="SMITH";
    
SELECT ename, sal, IFNULL(comm, 0), sal + IFNULL(comm,0)
	FROM emp
    WHERE deptno=10;