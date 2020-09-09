-- 연결 연산자 사용하기 (||)
-- 오라클은 ||지만 MySQL에서는 CONCAT()를 사용해야 함
-- 연결 연산자를 이용하면 컬럼과 컬럼을 서로 연결해서 출력할 수 있다.
SELECT * FROM emp;
SELECT ename || '의 월급은' || sal || '입니다' as 월급정보 FROM emp;    -- oracal
SELECT CONCAT(ename, '의 월급은', sal, '입니다') as 월급정보 FROM emp;  -- MySQL