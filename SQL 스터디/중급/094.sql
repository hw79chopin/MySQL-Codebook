-- 임시 테이블 생성하기 (CREATE TEMPORARY TABLE)
-- Q. 사원번호, 이름, 월급을 저장할 수 있는 테이블을 생성하는 COMMIT할 때까지만 데이터를 저장할 수 있도록 생성하기
CREATE TEMPORARY TABLE emp37
	( empno INT,
    ename VARCHAR(20),
    sal FLOAT);
-- ON COMMIT DELETE ROWS가 default다.

USE sqlStudy;

INSERT INTO emp37
	VALUES (203, "Hyun", 3000);
    
SELECT * FROM emp37;

COMMIT;

SELECT * FROM emp37;