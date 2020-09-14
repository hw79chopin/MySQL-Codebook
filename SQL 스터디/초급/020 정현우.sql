-- 특철자를 다른 철자로 변경하기 (REPLACE)
-- 이름과 월급을 출력하되, 월급을 출력할 때 숫자 0을 *로 출력하시오
SELECT ename, REPLACE(sal, 0, '*')
	FROM emp;
    
-- 이름과 월급을 출력하되, 월급의 숫자 0~3을 *로 출력하시오 (Oracle만 가능)
SELECT ename, REPLACE(sal, '[0-3]', '*')	
	FROM emp;

-- 이름의 가운데 글자를 *로 출력하시오
SELECT REPLACE(ename, SUBSTR(ename, 2, 1), '*')
	FROM emp;