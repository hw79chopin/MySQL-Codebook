-- 논리 연산자 배우기 (AND, OR, NOT)
-- 직업이 SALESMAN이고 월급이 1200 이상인 사원들의 이름, 월급, 직업을 출력하시오
SELECT ename, sal, job
	FROM emp
    WHERE (job = 'SALESMAN') & (sal >= 1200);
-- Oracle에서는 ()를 안 씌워줘도 되지만, MySQL에서는 가로를 씌워주어야 한다.