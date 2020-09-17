-- 동물 보호소에 들어온 모든 동물의 이름, 보호시작일을 조회하되 ANIMAL_ID 역순으로 ㅜㄹ력하시오
SELECT NAME, DATETIME
    FROM ANIMAL_INS
    ORDER BY ANIMAL_ID desc;