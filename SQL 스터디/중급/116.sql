-- 사각형 출력하기
undefined p_n1
undefined p_n2
ACCEPT p_n1 prompt '가로 숫자를 입력하세요~';
ACCEPT p_n2 prompt '세로 숫자를 입력하세요~';

WITH LOOP_TABLE as (SELECT LEVEL as NUM
						FROM dual
                        CONNECT BY LEVEL <= &p_n2)
SELECT LPAD("*", &p_n1, "*") as STAR
	FROM LOOP_TABLE;