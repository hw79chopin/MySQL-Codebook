-- 데이터의 품질 높이기 (CHECK)
-- Q. 사원 테이블을 생성하되, 월급이 0~6000 사이의 데이터만 입력되거나 수정될 수 있도록 제약을 거시오.
CREATE TABLE emp
	( empno INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ename VARCHAR(20) NOT NULL CHECK (ename BETWEEN 0 AND 6000));