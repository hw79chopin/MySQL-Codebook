-- 직각삼각형 출력
WITH LOOP_TABLE as (SELECT LEVEL AS NUM
						FROM DUAL
                        CONNECT BY LEVEL <= 8)
SELECT LPAD("*", num, "*") as STAR
	FROM LOOP_TABLE;