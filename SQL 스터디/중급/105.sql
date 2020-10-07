-- 데이터의 품질 높이기 (UNIQUE)
-- Q. UNIQUE 제약을 ID 칼럼에 주세요
CREATE TABLE emp
	(empno INT UNIQUE,
    ename VARCHAR(20));
    
-- 기존 테이블에 UNIQUE 제약 추가
ALTER TABLE 테이블명
	ADD CONSTRAINT 칼럼이름 UNIQUE (칼럼이름);