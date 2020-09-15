-- 특정 철자를 N개 만큼 채우기 (LPAD, RPAD)
-- 이름과 월급을 출력하되 월급 컬럼의 자릿수를 10자리로 하고, 월급을 출력하고 남은 나머지 자리에 *를 채워서 출력하시오
SELECT ename, LPAD(sal, 10, '*')
	FROM emp;
    
SELECT ename, RPAD(sal, 10, '*')
	FROM emp;
    
-- SQL로 시각화할 때 많이 쓰인다.
-- 이름과 월급을 출력하되 월급 100을 @로 출력하시오
SELECT ename, sal, LPAD('@', round(sal/100), '@') as bar
	FROM emp;
