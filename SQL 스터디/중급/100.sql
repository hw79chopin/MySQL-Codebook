-- 실수로 지운 데이터 복구하기 2 (Oracle: FLASHBACK)
-- Q. 사원 테이블을 5분 전으로 되돌리시오
-- Oracle version
ALTER TABLE emp ENABLE ROW MOVEMENT;

FLASHBACK TABLE emp TO TIMESTAMP (SYSTIMESTAMP - INTERVAL '5' MINUTE);