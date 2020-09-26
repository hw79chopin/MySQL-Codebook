-- 출력 결과 넘버링 하기 (ROW_NUMBER)
SELECT empno, ename, sal, RANK() OVER (ORDER BY sal DESC) Rank,
	DENSE_RANK()  OVER (ORDER BY sal DESC) DENSE_RANK,
	ROW_NUMBER() OVER (ORDER BY sal DESC) 번호
	FROM emp
    WHERE deptno = 20;
    