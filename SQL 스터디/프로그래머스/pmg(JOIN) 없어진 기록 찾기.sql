-- Q. 입양을 간 기록은 있는데, 보호소에 들어온 기록이 없는 동물의 ID와 이름을 ID 순으로 조회하는 SQL문을 작성해주세요.
SELECT o.ANIMAL_ID, o.NAME
    FROM ANIMAL_OUTS AS o
        LEFT JOIN ANIMAL_INS AS i
        ON o.ANIMAL_ID = i.ANIMAL_ID
    WHERE i.ANIMAL_ID IS NULL
    ORDER BY o.ANIMAL_ID;