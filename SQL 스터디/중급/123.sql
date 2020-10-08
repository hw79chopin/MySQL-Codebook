-- 피타고라스의 정리
ACCEPT num1 prompt '밑변의 길이를 입력하세요:';
ACCEPT num2 prompt '높이를 입력하세요:';
ACCEPT num3 prompt '빗변의 길이를 입력하세요:';

SELECT CASE WHEN
	( POWER(&NUM1, 2) + POWER(&NUM2,2) ) = POWER(&NUM3, 2)
		THEN '직각삼각형입니다'
		ELSE '직각삼각형 아닙니다.'	
		END AS '피타고라스의 정리'
	FROM DUAL;