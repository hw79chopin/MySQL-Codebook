-- Row를 column으로 출력하기 (UNPIVOT)
-- Q. UNPIVOT을 사용하여 컬럼을 로우로 출력하시오 (Oracle에서만 가능)
SELECT *
	FROM emp
    UNPIVOT ( 건수 for 아이템 in (BICYCLE, CAMERA, NOTEBOOK));