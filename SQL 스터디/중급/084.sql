SELECT ename, sal, deptno
	FROM emp
    WHERE ename = "JONES"
    FOR UPDATE;
    
-- 이렇게 하면 조회하는 동안 다른 세션에서 데이터를 갱신하지 못하도록 막을 수 있다.