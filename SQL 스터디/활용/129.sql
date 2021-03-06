-- Q.절도가 많이 발생하는 요일은 언제인가?
-- 데이터 다운 받고서
CREATE TABLE CRIME_DAY_UNPVIOT
AS
SELECT * 
	FROM CRIME_DAY
    UNPIVOT (CNT FOR DAT_CNT IN (SUN_CNT, MON_CNT, TUE_CNT, WED_CNT, THU_CNT, FRI_CNT, SAT_CNT));
    
-- 제일 많이 일어나는 요일 뽑기
SELECT *
	FROM (
			SELECT DAY_CNT, CNT, RANK() OVER (ORDER BY CNT DESC) RANK
				FROM CRIME_DAY_UNPIVOT
                WHERE TRIM(CRIME_TYPE) = '절도')
	WHERE RNK = 1;
