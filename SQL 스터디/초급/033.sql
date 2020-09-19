-- NULL값 대신 다른 데이터 출력하기 (Oracle: {NVL, NVL2}, MySQL: IFNULL)
-- Q. 이름과 커미션을 출력하되, 커미션이 NULL인 원들은 0으로 출력하시오
SELECT ename, IFNULL(comm, 0)
	FROM emp;
    
-- Q. 이름, 월급, 커미션, 월급+커미션을 출력하시오
SELECT ename, sal, IFNULL(comm, 0), sal+IFNULL(comm,0)
	FROM emp;