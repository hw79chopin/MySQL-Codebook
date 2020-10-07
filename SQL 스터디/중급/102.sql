-- 실수로 지운 데이터 복구하기 (FLASHBACK VERSION QUERY)
-- Q. 사원 테이블의 데이터가 과거 특정 시점부터 지금까지 어떻게 변경되어 왔는지 이력정보를 출력하시오
-- Oracle version
SELECT ename, sal, versions_starttime, versions_endtime, versions_operation
	FROM emp
    VERSIONS BETWEEN TIMESTAMP
		TO_TIMESTAMP('2019-06-30 08:20:00', 'RRRR-MM-DD HH24:MI:SS')
        AND MAXVALUE
	WHERE ename="KING"
    ORDER BY versions_starttime;