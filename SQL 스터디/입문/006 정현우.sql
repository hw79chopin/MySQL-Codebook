-- 데이터를 정렬해서 출력하기 (ORDER BY)
-- asc: 오름차순, desc: 내림차순
SELECT ename, sal 
	FROM emp 
	ORDER BY sal asc;
    
SELECT ename, sal as 월급
	FROM emp
    ORDER BY 월급 desc;
    
-- 칼럼을 여러 개 기준으로 정렬할 수 있다.
SELECT ename, deptno, sal
	FROM emp
    ORDER BY deptno asc, sal desc;
    
-- 칼럼 이름 대신 순서를 적어줄 수 있다.
SELECT ename, deptno, sal
	FROM emp
    ORDER BY 2 asc, 3 asc;
