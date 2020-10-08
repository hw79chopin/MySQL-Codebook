-- 1~10까지 숫자의 합
undefine p_n
ACCEPT p_n prompt '숫자에 대한 값 입력하셔: ';

SELECT SUM(LEVEL) as 합계
	FROM dual
    CONNECT BY LEVEL <=&p_n;
	
