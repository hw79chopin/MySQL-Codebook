-- 피라미르 형으로 삼각형 출력하기
WITH LOOP_TABLE as (SELECT LEVEL AS NUM
						FROM DUAL
						CONNECT BY LEVEL <= 8)
SELECT LPAD(' ', 10-num, ' ') || LPAD("*", num, "*") as 'TRIANGLE'
	FROM LOOP_TABLE;