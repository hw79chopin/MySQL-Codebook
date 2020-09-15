-- 비교 연산자 배우기 (LIKE)
-- Q. 이름이 S로 시작하는 사원들의 이름과 월급을 출력하시오
SELECT ename, sal
	FROM emp
    WHERE ename LIKE "S%";

-- Q. 이름이 T로 끝나는 사원들의 이름을 출력하시오
SELECT ename
	FROM emp
    WHERE ename LIKE "%T";
    
-- Q. 이름에 A가 들어간 모든 사원의 이름을 출력하시오
SELECT ename
	FROM emp
    WHERE ename LIKE "%A%";