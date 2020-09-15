-- 비교 연산자 배우기 (IS NULL)
-- 커미션이 NULL인 사원들의 이름과 커미션을 출력하시오.
SELECT ename, comm
	FROM emp
    WHERE comm IS NULL;