-- 종류, 이름, 성별 및 중성화 여부를 아이디 순으로 조회하되 이름이 NULL이면 'No name'을 출력하시오
SELECT ANIMAL_TYPE, IFNULL(NAME, 'No name'), SEX_UPON_INTAKE
    FROM ANIMAL_INS;