-- 실수로 지운 데이터 복구하기 5 (FLASHBACK TRANSACTION QUERY)
-- Q. 사원 테이블의 데이터를 5분 전으로 되돌리기 위한 DML문을 출력하시오
SELECT undo_sql
	FROM flashback_transaction_query
    WHERE table_owner = 'SCOTT' AND table_name = 'EMP'
    AND commit_scn between 9457390 AND 9457397
    ORDER BY start_timestamp DESC;
