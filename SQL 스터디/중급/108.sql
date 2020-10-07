-- 데이터의 품질 높이기 5 (FOREIGN KEY)
-- Q. 사원 테이블의 부서 번호에 데이터를 입력할 때, 부서 테이블에 존재하는 부서번호만 입력될 수 있도록 제약을 만드시오
CREATE TABLE dept7
	(deptno INT PRIMARY KEY,
    dname VARCHAR(20),
    loc VARCHAR(20));
    
CREATE TABLE emp7
	(empno INT PRIMARY KEY,
    ename VARCHAR(20),
    sal FLOAT,
    deptnum INT,
    FOREIGN KEY (deptnum)
		REFERENCES dept7(deptno) ON UPDATE CASCADE);

-- FOREIGN KEY 없애는 방법
ALTER TABLE `table_name` DROP FOREIGN KEY `id_name_fk`;