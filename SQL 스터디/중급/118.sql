-- 1부터 10까지 숫자의 
undefine p_n
ACCEPT p_n prompt '숫자에 대한 값 입력: '

SELECT ROUND(EXP(SUM(LN(LEVEL)))) 곱
	FROM DUAL
    CONNECT BY LEVEL<=&p_n;
