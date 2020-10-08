-- 구구단 1단 ~ 9단 출력 (Oracle version)
WITH loop_table AS (SELECT LEVEL AS NUM
						FROM DUAL
                        CONNECT BY LEVEL <= 9),
	gugu_table AS (SELECT LEVEL +1 AS GUGU
						FROM DUAL
                        CONNECT BY LEVEL <= 8)
	SELECT TO_CHAR(A.NUM) || 'X' || TO_CHAR(B.GUGU) || '=' ||
			TO_CHAR(B.GUGU * A.NUM) as 구구단
	FROM loop_table a, gugu_table b;