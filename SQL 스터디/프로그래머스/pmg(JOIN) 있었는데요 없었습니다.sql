-- Q. 보호시작일보다 입ㅑㅇ일이 더 빠른 동물의 아이디와 이름을 조회하는 SQL문을 작성하시오.
SELECT i.ANIMAL_ID, i.NAME  
    FROM ANIMAL_INS i
        LEFT JOIN ANIMAL_OUTS o
        ON o.ANIMAL_ID = i.ANIMAL_ID
    WHERE i.DATETIME > o.DATETIME
    ORDER BY i.DATETIME;