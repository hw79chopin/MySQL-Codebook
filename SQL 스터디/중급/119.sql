-- 1부터 10까지 짝수만 출력
undefine p_n
ACCEPT p_n prompt '숫자에 대한 값 입력:';

SELECT LISTAGG(LEVEL, ', ') as 짝수
	FROM DUAL
    WHERE MOD(LEVEL, 2) = 0
    CONNECT BY LEVEL <= &p_n;

