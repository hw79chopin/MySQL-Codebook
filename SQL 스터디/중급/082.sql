-- 데이터 입력, 수정, 삭제 한번에 하기 (Oracle: MERGE INTO)
-- Q. 사원 테이블에 부서위치 컬럼을 추가하고, 부서 테이블을 이용하여 해당 사원의 부서 위치로 값이 갱신되도록 해보겠습니다. 만약 부서 테이블에는 존재하는 부서인데 사원 테이블에 없는 부서 번호라면 새롭게 사원 테이블에 입력되도록 하시오.
MERGE INTO emp e
	USING dept d
    ON (e.deptno = d.deptno)
    WHEN MATCHED THEN
    UPDATE set e.loc = d.loc
    WHEN NOT MATCHED THEN
    INSERT (e.empno, e.deptno, e.loc) VALUES (1111, d.deptno, d.loc);