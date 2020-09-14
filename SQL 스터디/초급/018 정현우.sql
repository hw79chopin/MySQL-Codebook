-- 문자열의 길이 출력하기 (LENGTH)
-- 직원 이름을 출력하고 그 옆에 이름의 철자 개수를 출력하시오
SELECT ename, LENGTH(ename)
	FROM emp;
    
-- Oracle에서는 LENGTHB로 바이트 길이를 반환 받을 수도 있음
SELECT ename, LENGTHB(ename)
	FROM emp;