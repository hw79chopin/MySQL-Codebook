-- 서브 쿼리를 사용하여 데이터 입력하기
-- Q. EMP 테이블의 구조를 복제한 EMP2 테이블에 부서 번호가 10번인 사원들의 사원 번호, 이름, 월급, 부서 번호를 한 번에 입력하시오
CREATE TABLE emp2 ( 
	empno                int  NOT NULL  AUTO_INCREMENT,
	ename                varchar(20)    ,
	job      			 varchar(20),
	mgr                  smallint    ,
	hiredate             date    ,
	sal                  numeric(7,2)    ,
	comm                 numeric(7,2)    ,
	deptno               int    ,
	CONSTRAINT pk_emp PRIMARY KEY ( empno )
 ) engine=InnoDB;
 
 INSERT INTO emp2(empno, ename, sal, deptno)
	SELECT empno, ename, sal, deptno
			FROM emp
            WHERE deptno = 10;

SELECT * FROM emp2;