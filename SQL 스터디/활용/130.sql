-- Q.우리나라 대학등록금이 가장 높은 학교는?
-- 데이터 다운 받고
SELECT *
	FROM ( 
			SELECT UNIVERSITY, TUITION_FEE,
				RANK() OVER (ORDER BY TTUITION_FEE DESC NULLS LAST) 순위
                FROM UNIVERSITY_FEE)
	WHERE 순위 = 1;x