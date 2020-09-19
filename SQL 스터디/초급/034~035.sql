-- IF문을 SQ로 구현하기 (Oracle: DECODE, MySQL: IF, case)
-- Q. 이름, 부서번호를 출력하되 부서번호가 10일때는 300, 20일때는 400으로 출력하고 나머지는 0으로 출력하시오
SELECT ename, deptno, 
	CASE
	WHEN (deptno = 10) then 300 
    WHEN (deptno = 20) then 400 
    else 0 
    end as bonus
	FROM emp;

-- Q. 사원번호가 짝수인지 홀수인지 출력하시오.
SELECT empno, 
	CASE 
    WHEN (MOD(empno, 2) = 1) then '홀수'
    WHEN (MOD(empno, 2) = 0) then '짝수'
    end as '홀짝'
    FROM emp;


-- Q. 이름, 직업, 보너스를 출력하되 직업이 salesman이면 5000, 나머지는 2000을 출력하시오.
SELECT ename, job,
	CASE
    WHEN (job ="SALESMAN") then 5000
    else 2000
    end as bonus
	FROM emp;
    
-- Q. 이름, 직업, 커미션, 보너스를 출력하되 커미션이 null이면 500, 아니면 0을 출력하시오
SELECT ename, job, comm,
	CASE
    WHEN (comm is null) then 500
    else 0 end as bonus
	FROM emp;

