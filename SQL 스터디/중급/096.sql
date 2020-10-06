-- 복잡한 쿼리를 단순하게 하기 2 (VIEW)
-- Q. 부서번호와 부서 번호별 평균 월급을 출력하는 VIEW를 생성하시오
CREATE VIEW emp_view
AS
SELECT deptno, avg(sal)
	FROM emp
    GROUP BY deptno;

SELECT * FROM emp_view;

-- GROUP 함수를 쿼리하는 복합 뷰는 수정이 되지 않는다.