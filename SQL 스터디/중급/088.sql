-- 서브 쿼리를 사용하여 데이터 합치기
-- Q. 부서 테이블에 숫자형으로 SUMSAL을 추가합니다. 
-- 그리고 사원 테이블을 이용하여 SUMSAL 칼럼의 데이터를 부서 테이블의 부서 번호별 토탈 월급으로 갱신하시오.
ALTER TABLE dept ADD SUMSAL INT;

-- 밑에는 Oracle에서만 가능
MERGE INTO dept d
USING (SELECT deptno, sum(sal) sumsal
		FROM emp
        GROUP BY deptno) v
ON (d.deptno = v.deptno)
WHEN MATCHED THEN
UPDATE set d.sumsal = v.sumsal;
