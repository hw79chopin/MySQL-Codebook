-- 최대 공약수
ACCEPT p_n1 prompt '첫 번째 숫자를 입력하세요:';
ACCEPT p_n2 prompt '두 번째 숫자를 입력하세요:';

WITH NUM_D AS (SELECT &p_n1 as NUM1, &p_n2 as NUM2
					FROM DUAL)
SELECT MAX(LEVEL) AS '최대 공약수'
	FROM NUM_D
    WHERE MOD(NUM1, LEVEL) = 0
    AND MOD(NUM2, LEVEL) = 0
    CONNECT BY LEVEL <= NUM2;