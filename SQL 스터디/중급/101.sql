-- 실수로 지운 데이터 복구하기 3 (FLASHBACK DROP)
-- Q. DROP된 사원 테이블을 휴지통에서 복원하시오
-- Oracle version
FLASHBACK TABLE emp TO BEFORE DROP;

-- 휴지통에 있는지 확인하기
SELECT ORIGINAL_NAME, DROPTIME
	FROM USER_RECYCLEBIN;