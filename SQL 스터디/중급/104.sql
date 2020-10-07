-- 데이터의 품질 높이기 1 (PRIMARY KEY)
-- Q. deptno 컬럼에 PRIMARY KEY 제약을 걸어 dept2를 생성하시오
CREATE TABLE dept2
	( deptno INT PRIMARY KEY,
    dname VARCHAR(20),
    loc VARCHAR(20));
-- Primary key 제약에 걸리면 중복된 데이터와 NULL 값을 입력할 수 없다.

-- 기존에 있는 테이블에 primary key 추가하기
ALTER TABLE 테이블명
	ADD PRIMARY KEY (칼럼명);
