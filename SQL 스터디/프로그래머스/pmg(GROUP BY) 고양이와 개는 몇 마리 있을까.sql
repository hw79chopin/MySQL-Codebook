-- Q. 동물 보호소에 들어온 개와 고양이가 각각 몇 마리인지 조회하시오
SELECT ANIMAL_TYPE, COUNT(ANIMAL_TYPE) count
    FROM ANIMAL_INS
    GROUP BY ANIMAL_TYPE
    ORDER BY ANIMAL_TYPE asc;
