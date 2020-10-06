-- 서브 쿼리를 사용하여 데이터 수정하기
-- Q. 적입이 SALESMAN인 사원들의 월급을 ALLEN의 월급으로 변경하시오
UPDATE emp
SET sal = (SELECT sal
			FROM emp
			WHERE ename = "ALLEN")
WHERE job = "SALESMAN";