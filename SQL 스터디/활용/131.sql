-- Q.서울시 물가 중 가장 비싼 품목과 가격은?
-- 데이터 다운 받고
SELECT A_NAME as "상품", A_PRICE as "가격", M_NAME as "매장명"
	FROM PRICE
    WHERE A_PRICE = (SELECT MAX(A_PRICE) 
						FROM PRICE);