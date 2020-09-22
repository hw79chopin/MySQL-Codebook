-- 데이터 분석 함수로 데이터를 가로로 출력하기 (Oracle:ISTAGG, MySQL: GROUP_CONCAT)
-- Q. 부서 번호를 출력하고, 부서 번호 옆에 해당 부서에 속한 사원들의 이름과 월급을 가로로 출력하시오
SELECT deptno, GROUP_CONCAT(CONCAT(ename,'(', sal, ')') SEPARATOR ', ')
	FROM emp
    GROUP BY deptno;