-- 문자형으로 데이터 유형 변환하기 (oracle: TO_CHAR, MySQL: FORMAT)
-- 이름이 SCOTT인 사원의 이름, 입사 요일을 출력하고, 월급 천 단위에 콤마(,)를 붙여서 출력하시오
SELECT ename, DAYOFWEEK(hiredate), FORMAT(sal, 0)
	FROM emp;