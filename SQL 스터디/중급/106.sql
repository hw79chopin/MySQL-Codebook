-- 데이터의 품질 높이기 3 (NOT NULL)
-- Q. NOT NULL 제약을 사용하여 테이블을 만드시오
CREATE TABLE emp
	( empno INT PRIMARY KEY,
      ename VARCHAR(20) NOT NULL);