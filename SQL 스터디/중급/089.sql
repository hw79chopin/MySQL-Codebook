-- 계층형 질의문으로 서열을 주고 데이터 출력하기 1 (Oracle에서만 가능)
-- Q. 계층형 질의문을 이용하여 사원 이름, 월급, 직업을 출력되 사ㅝㄴ들간의 서열을 같이 출력하시오
SELECT rpad(' ', level*3) || ename as employee, level, sal, job
	FROM emp
    START WITH ename="KING"
    CONNECT BY prior empno = mgr;