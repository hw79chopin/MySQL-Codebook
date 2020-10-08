-- 구구단 2단 출력 (Oracle version)
WITH loop_table as (SELECT LEVEL as NUM
						FROM dual
						CONNECT BY LEVEL <= 9)
SELECT '2' || 'x' || NUM || '=' || 2*NUM AS "2단"
	FROM loop_table;
