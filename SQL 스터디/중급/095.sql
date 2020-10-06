-- 복잡한 쿼리를 단순하기 하기 1 (VIEW)
-- Q. 직업이 SALESMAN인 사원들의 사원번호, 이름, 월급, 직업, 부서번호를 출력하는 VIEW를 생성해보시오
CREATE VIEW emp_view
AS
SELECT empno, ename, sal, job, deptno
	FROM emp
    WHERE job = 'SALESMAN';
-- VIEW를 바꾸면 본체도 바뀐다.