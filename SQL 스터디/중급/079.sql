-- 데이터 수정하기 (UPDATE)
-- Q.SCOTT의 월급을 3200으로 수정하시오
UPDATE emp
	SET sal = 3200
    WHERE ename = "SCOTT";
    
-- Q.SCOTT의 월급은 3300, comm은 200으로 수정하시오
UPDATE emp
	SET sal = 3300, comm = 200
    WHERE ename = "SCOTT";
    
-- Q. SCOTT의 월급을 KING의 월급과 같게 수정하시오
UPDATE emp
	SET sal = (SELECT s.sal FROM (SELECT sal FROM emp WHERE ename='KING') s)
    WHERE ename="SCOTT";

SELECT * FROM emp;