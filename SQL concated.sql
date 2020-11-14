-- 001. 테이블에서 특정 column 선택하기 
-- Q. 사원테이블에서 사원번호, 이름, 월급을 출력하시오
SELECT empno, ename, sal FROM emp;

-- 002. 테이블에서 모든 column 출력하기
-- Q.사원 테이블에서 모든 column을 출력하시오
SELECT * FROM emp;

SELECT emp.*, ename FROM emp;		/* 특정 칼럼을 마지막에 또 출력하는 방법 */

-- 컬럼 별칭을 사용하여 출력되는 컬럼명 변경하기
-- Q. 사원 테이블에서 사원번호, 이름, 월급을 출력하되 컬럼명을 '사원 번호', nm, "Salary"로 출력하시오
SELECT empno as '사원 번호', ename as nm ,sal as "Salary", sal/100 as "Normalized"
	FROM emp;
/* 
칼럼명 뒤에 as를 붙여주면 된다. 
위처럼 칼럼에 연산을 한 뒤 출력도 된다.*/

-- 연결 연산자 사용하기 (||)
-- 오라클은 ||지만 MySQL에서는 CONCAT()를 사용해야 함
-- 연결 연산자를 이용하면 컬럼과 컬럼을 서로 연결해서 출력할 수 있다.
-- Q. 사원 테이블의 이름과 월급을 서로 붙여서 출력하시오
SELECT * FROM emp;
SELECT ename || '의 월급은' || sal || '입니다' as 월급정보 FROM emp;    -- oracal
SELECT CONCAT(ename, '의 월급은', sal, '입니다') as 월급정보 FROM emp;  -- MySQL

-- 중복된 데이터를 제거해서 출력하기 (MySQL: DISTINCT,Oracle: UNIQUE)
-- Q. 사원 테이블에서 직업을 출력하되 중복된 데이터를 제외하고 출력하시오.
SELECT DISTINCT job FROM emp;

-- 데이터를 정렬해서 출력하기 (ORDER BY)
-- asc: 오름차순, desc: 내림차순
-- Q. 이름과 월급을 출력하되 월급이 낮은 사원부터 출력하시오.
SELECT ename, sal 
	FROM emp 
	ORDER BY sal asc;

-- Q. 이름과 월급을 출력하되 월급이 높은 사원부터 출력하시오.
SELECT ename, sal as 월급
	FROM emp
    ORDER BY 월급 desc;
    
-- 칼럼을 여러 개 기준으로 정렬할 수 있다.
-- Q. 이름, 부서 번호, 월급을 출력하되 부서 번호는 낮은 순, 월급은 높은 사원부터 출력하시오.
SELECT ename, deptno, sal
	FROM emp
    ORDER BY deptno asc, sal desc;
    
-- 칼럼 이름 대신 순서를 적어줄 수 있다.
SELECT ename, deptno, sal
	FROM emp
    ORDER BY 2 asc, 3 asc;


-- WHERE절 배우기 (숫자 데이터 검색)
-- Q. 월급이 3,000인 사원들의 이름, 월급, 직업을 출력하시오
SELECT ename, sal as 월급, job as 직업
	FROM emp
	WHERE sal >= 3000;

-- WHERE절 배우기 (문자와 날짜 검색)
-- Q. 이름이 SCOTT인 사원의 모든 칼럼을 출력하시오.
SELECT * 
	FROM emp
    WHERE ename = 'SCOTT';
    
-- Q. 1981년 11월 17일에 입사한 사원의 정보를 모두 출력하시오.
SELECT * 
	FROM emp
    WHERE hiredate = '81/11/17';

-- 날짜 형식 조회하기 (Oracle)
SELECT *
	FROM NLS_SESSION_PARAMETERS
    WHERE PARAMETER = 'NLS_DATE_FORMAT';

-- 정해진 날짜 형식에 따라 데이터 조회하기 (MySQL)    
-- Q. SCOTT 사원이 입사한 연도와 달을 출력하시오 
SELECT date_format(hiredate, '%Y-%m')
	FROM emp
    WHERE ename = 'SCOTT';
    


-- 산술 연산자 배우기 (*, /, +, -)
-- null값 처리 함수 (MySQL: IFNULL, Oracle: NVL)
-- Q. 연봉이 36,000 이상인 사원들의 이름과 연봉을 출력하시오.
SELECT ename, sal*12 as 연봉
	FROM emp
    WHERE sal*12 >= 36000;

-- Q. 부서번호가 10번인 사원들의 이름, 월급, 커미션, 월급 + 커미션을 출력하시오.
SELECT * FROM emp;
SELECT sal + IFNULL(comm, 0) as 봐라
	FROM emp
    WHERE ename="SMITH";
    
SELECT ename, sal, IFNULL(comm, 0), sal + IFNULL(comm,0)
	FROM emp
    WHERE deptno=10;

-- 비교 연산자 배우기
-- Q. 월급이 1200 이하인 사원들의 이름과 월급, 직업, 부서 번호를 출력하시오.
SELECT ename, sal, job, deptno
	FROM emp
    WHERE sal <=1200;

-- 비교연산자 배우기 (BETWEEN AND)
-- Q. 월급이 1,000에서 3,000 사이인 사원들의 이름과 월급을 출력하시오
SELECT ename, sal
	FROM emp
    WHERE sal BETWEEN 1000 AND 3000;
    
SELECT ename, sal
	FROM emp
    WHERE (sal >= 1000 AND sal <= 3000);

-- Q. 월급이 1,000에서 3,000 사이가 아닌 사원들의 이름과 월급을 조회하시오
SELECT ename, sal
	FROM emp
    WHERE sal NOT BETWEEN 1000 AND 3000;

-- Q. 1982년에 입사한 사원들의 이름과 입사일을 조회하시오
SELECT ename, hiredate
	FROM emp
    WHERE hiredate BETWEEN '1982/01/01' AND '1982/12/31';



-- 비교 연산자 배우기 (LIKE)
-- Q. 이름이 S로 시작하는 사원들의 이름과 월급을 출력하시오
SELECT ename, sal
	FROM emp
    WHERE ename LIKE "S%";

-- Q. 이름이 T로 끝나는 사원들의 이름을 출력하시오
SELECT ename
	FROM emp
    WHERE ename LIKE "%T";
    
-- Q. 이름에 A가 들어간 모든 사원의 이름을 출력하시오
SELECT ename
	FROM emp
    WHERE ename LIKE "%A%";

-- 비교 연산자 배우기 (IS NULL)
-- 커미션이 NULL인 사원들의 이름과 커미션을 출력하시오.
SELECT ename, comm
	FROM emp
    WHERE comm IS NULL;

-- 비교 연산자 배우기 (IN)
-- 직업이 SALESMAN, ANALYST, MANAGER인 사원들의 이름, 월급, 직업을 출력하시오
SELECT ename, sal, job
	FROM emp
    WHERE job IN ('SALESMAN', 'ANALYST', 'MANAGER');
    
-- 직업이 SALESMAN, ANALYST, MANAGER가 아닌 사원들의 이름, 월급, 직업을 출력하시오
SELECT ename, sal, job
	FROM emp
    WHERE job NOT IN ('SALESMAN', 'ANALYST', 'MANAGER');

-- 논리 연산자 배우기 (AND, OR, NOT)
-- 직업이 SALESMAN이고 월급이 1200 이상인 사원들의 이름, 월급, 직업을 출력하시오
SELECT ename, sal, job
	FROM emp
    WHERE (job = 'SALESMAN') & (sal >= 1200);
-- Oracle에서는 ()를 안 씌워줘도 되지만, MySQL에서는 가로를 씌워주어야 한다.

SHOW DATABASES;

CREATE DATABASE sqlStudy;        /* DB 생성하기 */

USE sqlStudy;		/* DB 선택 */

SHOW TABLES;     /* DB 내 테이블을 보여줌 */

/* Create emp, dept table */
CREATE TABLE dept ( 
	deptno               int  NOT NULL  AUTO_INCREMENT,
	dname                varchar(20)    ,
	loc                  varchar(20)    ,
	CONSTRAINT pk_dept PRIMARY KEY ( deptno )
 ) engine=InnoDB;

CREATE TABLE emp ( 
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

CREATE INDEX idx_emp ON emp ( deptno );
ALTER TABLE emp ADD CONSTRAINT fk_emp_dept FOREIGN KEY ( deptno ) REFERENCES dept( deptno ) ON DELETE NO ACTION ON UPDATE NO ACTION;

insert into dept values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept values(20, 'RESEARCH', 'DALLAS');
insert into dept values(30, 'SALES', 'CHICAGO');
insert into dept values(40, 'OPERATIONS', 'BOSTON');
  
insert into emp values( 7839, 'KING', 'PRESIDENT', null, STR_TO_DATE ('17-11-1981','%d-%m-%Y'), 5000, null, 10);
insert into emp values( 7698, 'BLAKE', 'MANAGER', 7839, STR_TO_DATE('1-5-1981','%d-%m-%Y'), 2850, null, 30);
insert into emp values( 7782, 'CLARK', 'MANAGER', 7839, STR_TO_DATE('9-6-1981','%d-%m-%Y'), 2450, null, 10);
insert into emp values( 7566, 'JONES', 'MANAGER', 7839, STR_TO_DATE('2-4-1981','%d-%m-%Y'), 2975, null, 20);
insert into emp values( 7788, 'SCOTT', 'ANALYST', 7566, DATE_ADD(STR_TO_DATE('13-7-1987','%d-%m-%Y'),INTERVAL -85 DAY)  , 3000, null, 20);
insert into emp values( 7902, 'FORD', 'ANALYST', 7566, STR_TO_DATE('3-12-1981','%d-%m-%Y'), 3000, null, 20);
insert into emp values( 7369, 'SMITH', 'CLERK', 7902, STR_TO_DATE('17-12-1980','%d-%m-%Y'), 800, null, 20);
insert into emp values( 7499, 'ALLEN', 'SALESMAN', 7698, STR_TO_DATE('20-2-1981','%d-%m-%Y'), 1600, 300, 30);
insert into emp values( 7521, 'WARD', 'SALESMAN', 7698, STR_TO_DATE('22-2-1981','%d-%m-%Y'), 1250, 500, 30);
insert into emp values( 7654, 'MARTIN', 'SALESMAN', 7698, STR_TO_DATE('28-09-1981','%d-%m-%Y'), 1250, 1400, 30);
insert into emp values( 7844, 'TURNER', 'SALESMAN', 7698, STR_TO_DATE('8-9-1981','%d-%m-%Y'), 1500, 0, 30);
insert into emp values( 7876, 'ADAMS', 'CLERK', 7788, DATE_ADD(STR_TO_DATE('13-7-1987', '%d-%m-%Y'),INTERVAL -51 DAY), 1100, null, 20);
insert into emp values( 7900, 'JAMES', 'CLERK', 7698, STR_TO_DATE('3-12-1981','%d-%m-%Y'), 950, null, 30);
insert into emp values( 7934, 'MILLER', 'CLERK', 7782, STR_TO_DATE('23-1-1982','%d-%m-%Y'), 1300, null, 10);
  
SELECT * FROM emp;
SELECT * FROM dept;



-- 출력되는 행 제한하기 (Oracle: ROWNUM, MySQL: LIMIT)
-- Q. 사원 테이블에서 사원번호, 이름, 직업, 월급을 상단 5개의 행만 출력하시오.
SELECT empno, ename, job, sal	
	FROM emp
    LIMIT 5;

-- 출력되는 행 제한하기 (Simple Top-n Queries)
-- Q. 월급이 높은 사원순으로 사원번호, 이름, 직업, 월급을 4개의 행으로 제한해서 출력하시오
SELECT empno, ename, job, sal
	FROM emp
    ORDER BY sal DESC
    LIMIT 4;

-- 여러 테이블의 데이터를 조인해서 출력하기 (EQUI JOIN)
-- Q. emp 테이블과 dept 테이블을 조인하여 이름과 부서위치를 출력하시오
SELECT emp.ename, dept.loc
	FROM emp, dept
    WHERE emp.deptno = dept.deptno;
    
-- Q. emp, dept을 조인해서 직업이 ANALYST인 사람의 이름과 부서위치를 출력하시오
SELECT e.ename, e.job, d.loc
	FROM emp e, dept d
    WHERE e.deptno = d.deptno AND e.job = "ANALYST";


-- 여러 테이블의 데이터를 조인해서 출력하기 (NON EQUI JOIN)
-- Q. emp, salgrade를 조인하여 이름, 월급, 급여 등급을 출력하시오
SELECT e.ename, e.sal, s.grade
	FROM emp e, salgrade s
	WHERE e.sal BETWEEN s.losal and s.hisal;
    


-- 여러 테이블의 데이터를 조인해서 출력하기 (OUTER JOIN)
-- Q. emp, dept 테이블을 조인하여 이름, 부서 위치를 출력하되 BOSTON도 같이 출력되게 하시오.
SELECT * FROM emp;
SELECT * FROM dept;
SELECT e.ename, d.loc
	FROM emp as e 
		RIGHT OUTER JOIN dept as d
		ON e.deptno = d.deptno;

-- 여러 테이블을 조인해서 출력하기 (SELF JOIN)
-- Q. emp테이블에서 자기 자신의 테이블과 조인하여 직업이 SALESMAN인 사람의 이름, 직업, 관리자 이름, 관리자의 직업을 출력하시오
SELECT e1.ename, e1.job, e2.ename, e2.job
	FROM emp e1
		JOIN emp e2
        ON e1.mgr = e2.empno
	WHERE e1.job = "SALESMAN";
    
SELECT e1.ename, e1.job, e2.ename, e2.job
	FROM emp e1, emp e2
    WHERE e1.mgr = e2.empno AND e1.job = "SALESMAN";

-- 여러 테이블의 데이터를 조인해서 출력하기 (ON절)
-- Q. 직업이 SALESMAN인 사람의 이름, 직업, 월급, 부서 위치를 출력하시오
SELECT e.ename, e.job, e.sal, d.loc
	FROM emp e 
		JOIN dept d
        ON e.deptno = d.deptno
	WHERE e.job = "SALESMAN";
	

-- 여러 테이블의 데이터를 조인해서 출력하기 (USING 절)
-- Q. USING 절을 용해서 SALESMAN이 직업인 사람의 이름, 직업, 월급, 부서위치를 출력하시오
SELECT e.ename, e.job, e.sal, d.loc
	FROM emp e JOIN dept d
		USING (deptno)			-- USING은 column 이름이 같은 때 사용 가능
	WHERE e.job ="SALESMAN";  

-- 여러 테이블의 데이터를 조인해서 출력하기 (NATURAL JOIN)
-- Q. NATURAL JOIN 방법으로 직업이 SALESMAN인 사람의 이름, 직업, 월급과 부서위치를 출력하시오
SELECT e.ename, e.job, e.sal, d.loc
	FROM emp e NATURAL JOIN dept d
    WHERE e.job = "SALESMAN";

-- 여러 테이블의 데이터를 조인해서 출력하기 (LEFT, RIFHT OUTER JOIN)
-- RIGHT OUTER으로 이름, 직업, 월급, 부서위치를 출력하시오
SELECT e.ename, e.job, e.sal, d.loc
	FROM emp e
		RIGHT OUTER JOIN dept d
		ON e.deptno = d.deptno;ㅌㅌㅌㅌㅌ
    

-- 여러 테이블의 데이터를 조인해서 출력하기 (FULL OUTER JOIN)
-- Q. FULL OUTER JOIN으로 이름, 직업, 월급, 부서 위치를 출력하시오
SELECT e.ename, e.job, e.sal, d.loc
	FROM emp e LEFT JOIN dept d
    ON e.deptno = d.deptno
    UNION
SELECT e.ename, e.job, e.sal, d.loc
	FROM emp e RIGHT JOIN dept d
    ON e.deptno = d.deptno;
    

-- 여러 테이블의 데이터를 조인해서 출력하기 (UNION ALL)
-- Q. 부서번호, 부서번호별 토탈 월급을 출력하되, 맨 아래쪽에 토탈 월급을 출력하시오.
SELECT deptno, sum(sal)
	FROM emp
    GROUP BY deptno
UNION
SELECT null as deptno, sum(sal)
	FROM emp;

-- 데이터를 위아래로 연결하기 (UNION)
-- Q. 부서 번호와 부서 번호별 토탈 월급을 출력하되, 맨 아래 행에 토탈 월급을 출력하시오
SELECT deptno, sum(sal)
	FROM emp
    GROUP BY deptno
UNION
SELECT null as deptno, sum(sal)
	FROM emp;



-- 데이터의 교집합을 출력하기 (Oracle: INTERSECT)
-- Q. 부서 번호 10번, 20번 사원들을 출력하는 쿼리와, 부서번호 20번, 30번을 출력하는 쿼리의 교집합을 출력하시오
SELECT e1.ename, e1.sal, e1.job, e1.deptno
	FROM (SELECT emp.ename, emp.sal, emp.job, emp.deptno
					FROM emp
					WHERE deptno in (10,20)) e1
	INNER JOIN (SELECT emp.ename, emp.sal, emp.job, emp.deptno
					FROM emp
					WHERE deptno in (20,30)) e2
	ON e1.deptno = e2.deptno;



-- 데이터의 차이를 출력하기 (Oracle: MINUS)
-- Q. 부서번호 10번, 20번을 출력하는 쿼리와 부서번호 20번, 30번을 출력하는 쿼리의 결과 차이를 출력하시오
SELECT DISTINCT e1.ename, e1.sal, e1.job, e1.deptno
	FROM (SELECT emp.ename, emp.sal, emp.job, emp.deptno
					FROM emp
					WHERE deptno in (10,20)) e1
	WHERE e1.deptno NOT IN (SELECT e2.deptno
								FROM emp e2
								WHERE deptno in (20,30));



-- 서브 쿼리 사용하기 1 (단일행 서브쿼리)
-- Q. Jones보다 더 많은 월급을 받는 사원들의 이름, 월급을 출력하시오
SELECT ename, sal
	FROM emp
    WHERE sal > (SELECT sal
					FROM emp
					WHERE ename = "JONES")
	ORDER BY sal DESC;


-- 서브 쿼리 사용하기 2 (다중 행 서브쿼리)
-- Q. 직업이 SALESMAN인 사원들과 같은 월급을 받는 사원들의 이름과 월급을 출력하시오
SELECT ename, sal
	FROM emp
	WHERE sal in (SELECT sal
					FROM emp
					WHERE job = "SALESMAN");	


-- 서브 쿼리 사용하기 3 (NOT IN)
-- Q. 관리자가 아닌 사원들의 이름, 월급, 직업을 출력하시오
SELECT ename, sal, job
	FROM emp
    WHERE empno NOT IN (SELECT mgr
							FROM emp
                            WHERE mgr IS NOT NULL);


-- 서브 쿼리 사용하기 (EXISTS와 NOT EXISTS)
-- Q. 부서 테이블에 있는 부서번호 중에서 사원 테이블에 존재하는 부서 번호, 부서명, 부서 위치를 출력하시오
SELECT *
	FROM dept d
	WHERE EXISTS(SELECT *
                FROM emp e
                WHERE e.deptno = d.deptno);


-- HAVING절의 서브 쿼리
-- Q. 직업, 직업별 토탈 월급을 출력하되, 직업이 SALESMAN인 사원들의 토탈 월급보다 더 큰 값들만 출력하시오
SELECT job, SUM(sal)
	FROM emp
    GROUP BY job
    HAVING SUM(sal) > (SELECT SUM(sal)
						FROM emp
                        WHERE job = "SALESMAN");
    





-- FROM절의 서브쿼리
-- Q. 이름과 월급과 순위를 출력하되, 순위가 1위인 사원만 출력하시오
SELECT v.ename, v.sal, v.순위
	FROM (SELECT ename, sal, rank() over (order by sal desc) 순위
			FROM emp) v
	WHERE v.순위 = 1;

-- SELECT절의 서브 쿼리
-- Q. 직업이 SALESMAN인 사원들의 이름, 월급을 출력하되, 직업이 SALESMAN인 사원들의 최대 월급, 최소 월급도 같이 출력하시오
SELECT ename, sal, (SELECT MAX(sal) FROM emp) max, (SELECT MIN(sal) FROM emp) min
	FROM emp;

-- 데이터 입력하기 (INSERT)
-- Q. 사원 테이블에 사원번호 2812, 사원 이름 JACK, 월급 3500, 입사일 2019년 6월 5일, 직업 ANALYST를 추가하시오
INSERT INTO emp (empno, ename, sal, hiredate, job)
	VALUES(2812, 'JACK', 3500, '2019-06-05', 'ANALYST');

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

-- 데이터 삭제하기 (DELETE, TRUNCATE, DROP)
-- Q. 사원 테이블에서 SCOTT의 행 데이터를 삭제하시오
DELETE FROM emp
	WHERE ename = 'SCOTT';
    
-- Q. emp 데이터를 모두 지우고 테이블 구조만 남기시오
TRUNCATE TABLE emp;

-- Q. 테이블 전체를 삭제하시오
DROP TABLE emp;

-- 데이터 저장 및 취소하기 (COMMIT, ROLLBACK)
-- COMMIT: 이전에 수행했던 DML 작업들을 DB에 영구히 반영하는 TCL 명령어이다. 
-- ROLLBACK: 이전 COMMIT 명령어 이후 DML문을 취소하는 TCL 명령어다.

-- 데이터 입력, 수정, 삭제 한번에 하기 (Oracle: MERGE INTO)
-- Q. 사원 테이블에 부서위치 컬럼을 추가하고, 부서 테이블을 이용하여 해당 사원의 부서 위치로 값이 갱신되도록 해보겠습니다. 만약 부서 테이블에는 존재하는 부서인데 사원 테이블에 없는 부서 번호라면 새롭게 사원 테이블에 입력되도록 하시오.
MERGE INTO emp e
	USING dept d
    ON (e.deptno = d.deptno)
    WHEN MATCHED THEN
    UPDATE set e.loc = d.loc
    WHEN NOT MATCHED THEN
    INSERT (e.empno, e.deptno, e.loc) VALUES (1111, d.deptno, d.loc);

-- 한 터미널 창에서 UPDATE를 수행하면 COMMIT을 하기 전까지 다른 터미널에서 변경을 할 수가 없다.

SELECT ename, sal, deptno
	FROM emp
    WHERE ename = "JONES"
    FOR UPDATE;
    
-- 이렇게 하면 조회하는 동안 다른 세션에서 데이터를 갱신하지 못하도록 막을 수 있다.

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

-- 서브 쿼리를 사용하여 데이터 수정하기
-- Q. 적입이 SALESMAN인 사원들의 월급을 ALLEN의 월급으로 변경하시오
UPDATE emp
SET sal = (SELECT sal
			FROM emp
			WHERE ename = "ALLEN")
WHERE job = "SALESMAN";

-- 서브 쿼리를 사용하여 데이터 삭제하기
-- Q. SCOTT보다 월급이 많은 사원들을 삭제하시오
DELETE
	FROM emp
    WHERE sal > (SELECT sal
					FROM emp
                    WHERE ename = "SCOTT");
				
-- Q. 월급이 해당 사원이 속한 부서번호의 평균 월급보다 크면 삭제하시오.
DELETE FROM emp e1
	WHERE sal > (SELECT avg(sal)
					FROM emp e2
                    WHERE e1.deptno = e2.deptno);

-- 서브 쿼리를 사용하여 데이터 합치기
-- Q. 부서 테이블에 숫자형으로 SUMSAL을 추가합니다. 
-- 그리고 사원 테이블을 이용하여 SUMSAL 칼럼의 데이터를 부서 테이블의 부서 번호별 토탈 월급으로 갱신하시오.
ALTER TABLE dept ADD SUMSAL INT;

-- 밑에는 Oracle에서만 가능
MERGE INTO dept d
USING (SELECT deptno, sum(sal) sumsal
		FROM emp
        GROUP BY deptno) v
ON (d.deptno = v.deptno)
WHEN MATCHED THEN
UPDATE set d.sumsal = v.sumsal;


-- 계층형 질의문으로 서열을 주고 데이터 출력하기 1 (Oracle에서만 가능)
-- Q. 계층형 질의문을 이용하여 사원 이름, 월급, 직업을 출력되 사ㅝㄴ들간의 서열을 같이 출력하시오
SELECT rpad(' ', level*3) || ename as employee, level, sal, job
	FROM emp
    START WITH ename="KING"
    CONNECT BY prior empno = mgr;

-- 일반 테이블 생성하기 (CREATE TABLE)
-- Q.사원 번호, 이름, 월급, 입사일을 저장할 수 있는 테이블을 생성하시오
CREATE TABLE emp1
	(empno INT(10),
	ename VARCHAR(10),
    sal	FLOAT(10,2),
    HIREDATE DATE);


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

-- 복잡한 쿼리를 단순하기 하기 1 (VIEW)
-- Q. 직업이 SALESMAN인 사원들의 사원번호, 이름, 월급, 직업, 부서번호를 출력하는 VIEW를 생성해보시오
CREATE VIEW emp_view
AS
SELECT empno, ename, sal, job, deptno
	FROM emp
    WHERE job = 'SALESMAN';
-- VIEW를 바꾸면 본체도 바뀐다.

-- 복잡한 쿼리를 단순하게 하기 2 (VIEW)
-- Q. 부서번호와 부서 번호별 평균 월급을 출력하는 VIEW를 생성하시오
CREATE VIEW emp_view
AS
SELECT deptno, avg(sal)
	FROM emp
    GROUP BY deptno;

SELECT * FROM emp_view;

-- GROUP 함수를 쿼리하는 복합 뷰는 수정이 되지 않는다.

-- 데이터 검색 속도를 높이기 (INDEX)
-- Q. 월급을 조회할 때 검색 속도를 높이기 위해 월급에 인덱스를 생성하시오
CREATE INDEX emp_sal
	ON EMP(sal);
    
-- Index는 테이블에서 데이터를 검색할 때 검색 속도를 높이기 위해 사용하는 데이터베이스 object
-- Index를 설정해주면 테이블을 모두 스캔하지 않고 검색할 데이터만 바로 스캔한다.

-- 절대로 중복되지 않는 번호 만들기(Oracle: SEQUENE)
-- Q. 숫자 1번부터 100번까지 출력하는 시퀀스를 생성하시오
/* seq_mysql 테이블 생성 */
CREATE TABLE seq_mysql(
id INT NOT NULL,
seq_name VARCHAR(50) NOT NULL
);

/* 생성된 펑션 삭제 */
DROP FUNCTION IF EXISTS get_seq;

/* Auto_increment 적용 */
DELIMITER $$
CREATE FUNCTION get_seq (p_seq_name VARCHAR(45))
RETURNS INT READS SQL DATA
BEGIN
DECLARE RESULT_ID INT;
UPDATE seq_mysql SET id = LAST_INSERT_ID(id+1)
WHERE seq_name = p_seq_name;
SET RESULT_ID = (SELECT LAST_INSERT_ID());
RETURN RESULT_ID;
END $$
DELIMITER ;

/* 시퀀스 생성 */
INSERT INTO seq_mysql
VALUES (0, 'boardSeq');

/* 시퀀스 삽입 */
get_seq('boardSeq')

-- 실수로 지운 데이터 복구하기 1 (FLASHBACK QUERY)
-- Q. 사원 테이블의 5분 전 KING 데이터를 검색해보시오
-- Oracle version
SELECT ename, sal
	FROM emp
    AS OF TIMESTAMP (SYSTIMESTAMP - INTERVAL '5' MINUTE)
    WHERE ENAME='KING';
    
-- MySQL version
SELECT *
	FROM emp
    WHERE > DATE_FORMAT(DATE_ADD(now(), INTERVAL 5 MINUTE), '%Y-%m-%d');


-- 실수로 지운 데이터 복구하기 2 (Oracle: FLASHBACK)
-- Q. 사원 테이블을 5분 전으로 되돌리시오
-- Oracle version
ALTER TABLE emp ENABLE ROW MOVEMENT;

FLASHBACK TABLE emp TO TIMESTAMP (SYSTIMESTAMP - INTERVAL '5' MINUTE);

-- 실수로 지운 데이터 복구하기 3 (FLASHBACK DROP)
-- Q. DROP된 사원 테이블을 휴지통에서 복원하시오
-- Oracle version
FLASHBACK TABLE emp TO BEFORE DROP;

-- 휴지통에 있는지 확인하기
SELECT ORIGINAL_NAME, DROPTIME
	FROM USER_RECYCLEBIN;

-- 실수로 지운 데이터 복구하기 (FLASHBACK VERSION QUERY)
-- Q. 사원 테이블의 데이터가 과거 특정 시점부터 지금까지 어떻게 변경되어 왔는지 이력정보를 출력하시오
-- Oracle version
SELECT ename, sal, versions_starttime, versions_endtime, versions_operation
	FROM emp
    VERSIONS BETWEEN TIMESTAMP
		TO_TIMESTAMP('2019-06-30 08:20:00', 'RRRR-MM-DD HH24:MI:SS')
        AND MAXVALUE
	WHERE ename="KING"
    ORDER BY versions_starttime;

-- 실수로 지운 데이터 복구하기 5 (FLASHBACK TRANSACTION QUERY)
-- Q. 사원 테이블의 데이터를 5분 전으로 되돌리기 위한 DML문을 출력하시오
SELECT undo_sql
	FROM flashback_transaction_query
    WHERE table_owner = 'SCOTT' AND table_name = 'EMP'
    AND commit_scn between 9457390 AND 9457397
    ORDER BY start_timestamp DESC;


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


-- 데이터의 품질 높이기 (UNIQUE)
-- Q. UNIQUE 제약을 ID 칼럼에 주세요
CREATE TABLE emp
	(empno INT UNIQUE,
    ename VARCHAR(20));
    
-- 기존 테이블에 UNIQUE 제약 추가
ALTER TABLE 테이블명
	ADD CONSTRAINT 칼럼이름 UNIQUE (칼럼이름);

-- 데이터의 품질 높이기 3 (NOT NULL)
-- Q. NOT NULL 제약을 사용하여 테이블을 만드시오
CREATE TABLE emp
	( empno INT PRIMARY KEY,
      ename VARCHAR(20) NOT NULL);

-- 데이터의 품질 높이기 (CHECK)
-- Q. 사원 테이블을 생성하되, 월급이 0~6000 사이의 데이터만 입력되거나 수정될 수 있도록 제약을 거시오.
CREATE TABLE emp
	( empno INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ename VARCHAR(20) NOT NULL CHECK (ename BETWEEN 0 AND 6000));

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

-- WITH절 사용하기 1 (WITH ~ AS)
-- Q. WITH절을 이용해서 직업과 직업별 토탈 월급을 출력하되 직업별 토탈 월급들의 평균값보다 더 큰 값들만 출력하시오
WITH job_sumsal AS (SELECT job, SUM(sal) as 토탈
						FROM emp
                        GROUP BY job)

SELECT job, 토탈
	FROM job_sumsal
    WHERE 토탈 > (SELECT AVG(토탈)
					FROM job_sumsal);

-- WITH절 사용하기 2 (SUBQUERY FACTORING: WITH절의 쿼리 결과를 임시 테이블로 생성하는 것)
-- Q. 직업별 토탈 값의 평균값에 3000을 더한 값보다 더 큰 부서 번호별 토탈 월급들을 출력하시오
WITH emp_sumsal AS (SELECT job, SUM(sal) as Total
						FROM emp
                        GROUP BY job),
	dept_sumsal AS (SELECT deptno, SUM(sal) as Total
						FROM emp
                        GROUP BY deptno
                        HAVING SUM(sal) > (SELECT AVG(Total) + 3000
												FROM emp_sumsal))

SELECT deptno, Total
	FROM dept_sumsal;
-- 이렇게 테이블을 부르는 건 subquery에서는 불가능하다.

-- 구구단 2단 출력 (Oracle version)
WITH loop_table as (SELECT LEVEL as NUM
						FROM dual
						CONNECT BY LEVEL <= 9)
SELECT '2' || 'x' || NUM || '=' || 2*NUM AS "2단"
	FROM loop_table;


-- 구구단 1단 ~ 9단 출력 (Oracle version)
WITH loop_table AS (SELECT LEVEL AS NUM
						FROM DUAL
                        CONNECT BY LEVEL <= 9),
	gugu_table AS (SELECT LEVEL +1 AS GUGU
						FROM DUAL
                        CONNECT BY LEVEL <= 8)
	SELECT TO_CHAR(A.NUM) || 'X' || TO_CHAR(B.GUGU) || '=' ||
			TO_CHAR(B.GUGU * A.NUM) as 구구단
	FROM loop_table a, gugu_table b;

-- 직각삼각형 출력
WITH LOOP_TABLE as (SELECT LEVEL AS NUM
						FROM DUAL
                        CONNECT BY LEVEL <= 8)
SELECT LPAD("*", num, "*") as STAR
	FROM LOOP_TABLE;

-- 피라미르 형으로 삼각형 출력하기
WITH LOOP_TABLE as (SELECT LEVEL AS NUM
						FROM DUAL
						CONNECT BY LEVEL <= 8)
SELECT LPAD(' ', 10-num, ' ') || LPAD("*", num, "*") as 'TRIANGLE'
	FROM LOOP_TABLE;

-- 마름모 출력하기
undefine p_num
ACCEPT p_num prompt '숫자 입력: '


SELECT lpad(' ', &p_num-level, ' ') || rpad("*", level, '*') as star
	FROM dual
    CONNECT by level < &p_num+1
UNION ALL
SELECT lpad(' ', level, ' ') || rpad("*", (&p_num)-level, '*') as star
	FROM dual
    CONNECT BY level < &p_num;

-- 사각형 출력하기
undefined p_n1
undefined p_n2
ACCEPT p_n1 prompt '가로 숫자를 입력하세요~';
ACCEPT p_n2 prompt '세로 숫자를 입력하세요~';

WITH LOOP_TABLE as (SELECT LEVEL as NUM
						FROM dual
                        CONNECT BY LEVEL <= &p_n2)
SELECT LPAD("*", &p_n1, "*") as STAR
	FROM LOOP_TABLE;

-- 1~10까지 숫자의 합
undefine p_n
ACCEPT p_n prompt '숫자에 대한 값 입력하셔: ';

SELECT SUM(LEVEL) as 합계
	FROM dual
    CONNECT BY LEVEL <=&p_n;
	


-- 1부터 10까지 숫자의 
undefine p_n
ACCEPT p_n prompt '숫자에 대한 값 입력: '

SELECT ROUND(EXP(SUM(LN(LEVEL)))) 곱
	FROM DUAL
    CONNECT BY LEVEL<=&p_n;


-- 1부터 10까지 짝수만 출력
undefine p_n
ACCEPT p_n prompt '숫자에 대한 값 입력:';

SELECT LISTAGG(LEVEL, ', ') as 짝수
	FROM DUAL
    WHERE MOD(LEVEL, 2) = 0
    CONNECT BY LEVEL <= &p_n;



-- 1부터 10까지 소수만 출력
undefine p_n
ACCEPT p_n prompt '숫자에 대한 값 입력:';

WITH LOOP_TABLE as (SELECT LEVEL AS num
						FROM dual
                        CONNECT BY LEVEL <= &p_n)
                        
SELECT L1.NUM as 소수
	FROM LOOP_TABLE L1, LOOP_TABLE L2
    WHERE MOD(L1.NUM, L2.NUM) = 0
    GROUP BY L1.NUM
    HAVING COUNT(L1.NUM) 2;

-- 최대 공약수
ACCEPT p_n1 prompt '첫 번째 숫자를 입력하세요:';
ACCEPT p_n2 prompt '두 번째 숫자를 입력하세요:';

WITH NUM_D AS (SELECT &p_n1 as NUM1, &p_n2 as NUM2
					FROM DUAL)
SELECT MAX(LEVEL) AS '최대 공약수'
	FROM NUM_D
    WHERE MOD(NUM1, LEVEL) = 0
    AND MOD(NUM2, LEVEL) = 0
    CONNECT BY LEVEL <= NUM2;

-- 최소 공배수
ACCEPT p_n1 prompt '첫 번째 숫자를 입력하세요:';
ACCEPT p_n2 prompt '두 번째 숫자를 입력하세요:';

WITH NUM_D AS (SELECT &P_N1 NUM1, &P_N2 NUM2
				FROM DUAL)

SELECT NUM1, NUM2,
			(NUM1/MAX(LEVEL))*(NUM2/MAX(LEVEL))*MAX(LEVEL) AS '최소 공배수'
	FROM NUM_D
    WHERE MOD(NUM1, LEVEL) = 0
    AND MOD(NUM2, LEVEL) = 0
    CONNECT BY LEVEL <= NUM2;

-- 피타고라스의 정리
ACCEPT num1 prompt '밑변의 길이를 입력하세요:';
ACCEPT num2 prompt '높이를 입력하세요:';
ACCEPT num3 prompt '빗변의 길이를 입력하세요:';

SELECT CASE WHEN
	( POWER(&NUM1, 2) + POWER(&NUM2,2) ) = POWER(&NUM3, 2)
		THEN '직각삼각형입니다'
		ELSE '직각삼각형 아닙니다.'	
		END AS '피타고라스의 정리'
	FROM DUAL;

-- 몬테카를로 알고리즘
SELECT SUM(CASE WHEN (POWER(NUM1, 2) + POWER(NUM2, 2)) <= 1 THEN 1
				ELSE 0 END) / 100000 * 4 as "원주율"
FROM (
			SELECT DBMS_RANDOM.VALUE(0,1) AS NUM1,
					DBMS_RANDOM.VALUE(0,1) AS NUM2
				FROM DUAL
                CONNECT BY LEVEL < 10000
		);

-- 오일러 상수 자연상수 구하기
WITH LOOP_TABLE AS (SELECT LEVEL AS NUM FROM DUAL
						CONNECT BY LEVEL <= 1000000 
						)

SELECT RESULT
	FROM (
			SELECT NUM, POWER((1 + 1/NUM) ,NUM) AS RESULT
					FROM LOOP_TABLE
			)
	WHERE NUM = 1000000;

-- 대소문자 변환 함수 배우기 (UPPER, LOWER, INITCAP)
-- 사원 테이블의 이름을 출력하되 첫 번째 칼럼은 대문자, 두 번째 칼럼은 소문자, 세 번째 칼럼 첫 번째 철자만 대문자로 출력하시오
-- MySQL에서는 INITCAP 함수가 없다.
SELECT UPPER(ename), LOWER(job), hiredate FROM emp;


-- 문자에서 특정 철자 추출하기 (SUBSTR)
-- 영어단어 SMITH에서 SMI만 잘라서 출력하시오
SELECT SUBSTR('SMITH', 1, 3) FROM DUAL;

SELECT SUBSTR('SMITH', 2, 4) FROM DUAL;

-- 문자열의 길이 출력하기 (LENGTH)
-- 직원 이름을 출력하고 그 옆에 이름의 철자 개수를 출력하시오
SELECT ename, LENGTH(ename)
	FROM emp;
    
-- Oracle에서는 LENGTHB로 바이트 길이를 반환 받을 수도 있음
SELECT ename, LENGTHB(ename)
	FROM emp;

-- 문자에서 특정 철자의 위치 출력하기 (INSTR)
-- 사원 이름 SMITH에서 알파벳 철자 M이 몇 번째 자리인지 출력하시오
SELECT INSTR('SMITH', 'M')
	FROM DUAL;

-- 특철자를 다른 철자로 변경하기 (REPLACE)
-- 이름과 월급을 출력하되, 월급을 출력할 때 숫자 0을 *로 출력하시오
SELECT ename, REPLACE(sal, 0, '*')
	FROM emp;
    
-- 이름과 월급을 출력하되, 월급의 숫자 0~3을 *로 출력하시오 (Oracle만 가능)
SELECT ename, REPLACE(sal, '[0-3]', '*')	
	FROM emp;

-- 이름의 가운데 글자를 *로 출력하시오
SELECT REPLACE(ename, SUBSTR(ename, 2, 1), '*')
	FROM emp;

-- 특정 철자를 N개 만큼 채우기 (LPAD, RPAD)
-- 이름과 월급을 출력하되 월급 컬럼의 자릿수를 10자리로 하고, 월급을 출력하고 남은 나머지 자리에 *를 채워서 출력하시오
SELECT ename, LPAD(sal, 10, '*')
	FROM emp;
    
SELECT ename, RPAD(sal, 10, '*')
	FROM emp;
    
-- SQL로 시각화할 때 많이 쓰인다.
-- 이름과 월급을 출력하되 월급 100을 @로 출력하시오
SELECT ename, sal, LPAD('@', round(sal/100), '@') as bar
	FROM emp;


-- 특정 철자 잘라내기 (TRIM, RTRIM, LTRIM)
-- 첫 번째 칼럼은 영어 단어 smith를 출력고, 두 번째 칼럼은 s만 잘라서 출렭하고, 세 번째 칼럼은 h를 잘라서 출력하고, 네 번째 칼럼은 SMITHS양쪽에 s를 잘라서 출력하오. (Oracle에서 가능)
SELECT 'smith', LTRIM('smith', 's'), RTRIM('smith', 'h'), TRIM('s' from 'smiths')
	FROM daul;

-- 사원 이름이 jack인 사원의 이름과 월급을 조회하시오
SELECT ename, sal
	FROM emp
    WHERE TRIM(ename)='SMITH';

-- 반올림해서 출력하기 (ROUND)
-- 876.567을 출력하되 소수점 두 번째 자리에서 반올림해서 출력하시오
SELECT ROUND(876.567, 1)
	FROM dual;
    
-- 십의 자리에서 반올림하기
SELECT ROUND(876.567, -2)
	FROM dual;


-- 숫자를 버리고 출력하기 (TRUNC)
-- 876.567을 출력하되 소수점 두 번째 자리인 6과 그 이후 숫자를 모두 버리고 출력하시오 (Oracle-TRUNC, MySQL-TRUNCATE)
SELECT TRUNCATE(876.567, 1)	
	FROM dual;

-- 나눈 나머지 값 출력하기 (MOD)
-- 숫자 10을 3으로 나눈 나머지값을 출력하시오
SELECT 10 % 3;

SELECT MOD(10,3);

SELECT 10 MOD 3;

-- 몫을 출력하기 (FLOOR)
-- 10을 3으로 나눈 몫을 출력하시오
SELECT FLOOR(10/3);



-- 날짜 간 개월 수 출력하기 (Oracle: MONTHS_BETWEN, MySQL: DATEDIFF) 
-- 이름을 출력하고 입사한 날짜부터 오늘까지 총 몇 달을 근무했는지 출력하시오
SELECT ename, DATEDIFF(CURDATE(), hiredate)/30
	FROM emp;
    
-- 2018-10-01에서 오늘까지 총 일수를 출력하시오
SELECT DATEDIFF(CURDATE(), '2018-10-01')
	FROM dual;



-- 개월 수 더한 날짜 출력하기 (Oracle: ADD_MONTHS, MySQL: DATE_ADD)
-- Q. 오늘로부터 100달 뒤의 날짜는 어떻게 되는지 출력하시오
SELECT DATE_ADD(now(), INTERVAL 100 MONTH)
	FROM dual;
    
-- Q. 오늘로부터 100일 뒤의 날짜를 출력하시오
SELECT DATE_ADD(now(), INTERVAL 100 DAY)
	FROM dual;


-- 특정 날짜 뒤에 오는 요일 날짜 출력하기 (NEXT_DAY, oracle에만 내장함수 있음)
-- Q. 오늘부터 바로 돌라올 월요일의 날짜가 어떻게 되는지 출력하시오.
SELECT NEXT_DAY('2019/05/22', '월요일')
	FROM dual;
    
-- Q. 오늘부터 앞으로 돌아올 화요일 날짜를 출력하시오
SELECT NEXT_DAY(SYSDATE, '화요일')
	FROM dual;
    
-- Q. 오늘부터 100달 뒤에 돌아오는 화요일 날짜를 출력하시오
SELECT NEXT_DAY(ADD_MONTHS('2019/05/22', 100), '화요일')
	FROM dual;


-- 특정 날짜가 있는 달의 마지막 날짜 출력하기 (LAST_DAY)
-- Q. 오늘 해당 달의 마지막 날짜가 어떻게 되는지 출력하시오
SELECT LAST_DAY(now());

-- Q. 오늘부터 마지막 날짜까지 남은 날을 출력하시오.
SELECT LAST_DAY(curdate()) - curdate();


-- 문자형으로 데이터 유형 변환하기 (oracle: TO_CHAR, MySQL: FORMAT)
-- 이름이 SCOTT인 사원의 이름, 입사 요일을 출력하고, 월급 천 단위에 콤마(,)를 붙여서 출력하시오
SELECT ename, DAYOFWEEK(hiredate), FORMAT(sal, 0)
	FROM emp;

-- 날짜형으로 데이터 유형 변환하기 (Oracle: TO_DATE, MySQL: DATE_FORMAT)
-- Q. 81년 11월 17일에 입사한 사원의 이름, 입사일을 출력하시오.
SELECT ename, hiredate
	FROM emp
    WHERE hiredate= DATE_FORMAT('81-11-17', '%Y/%m/%d');

-- NULL값 대신 다른 데이터 출력하기 (Oracle: {NVL, NVL2}, MySQL: IFNULL)
-- Q. 이름과 커미션을 출력하되, 커미션이 NULL인 원들은 0으로 출력하시오
SELECT ename, IFNULL(comm, 0)
	FROM emp;
    
-- Q. 이름, 월급, 커미션, 월급+커미션을 출력하시오
SELECT ename, sal, IFNULL(comm, 0), sal+IFNULL(comm,0)
	FROM emp;

-- IF문을 SQ로 구현하기 (Oracle: DECODE, MySQL: IF, case)
-- Q. 이름, 부서번호를 출력하되 부서번호가 10일때는 300, 20일때는 400으로 출력하고 나머지는 0으로 출력하시오
SELECT ename, deptno, 
	CASE
	WHEN (deptno = 10) then 300 
    WHEN (deptno = 20) then 400 
    else 0 
    end as bonus
	FROM emp;

-- Q. 사원번호가 짝수인지 홀수인지 출력하시오.
SELECT empno, 
	CASE 
    WHEN (MOD(empno, 2) = 1) then '홀수'
    WHEN (MOD(empno, 2) = 0) then '짝수'
    end as '홀짝'
    FROM emp;


-- Q. 이름, 직업, 보너스를 출력하되 직업이 salesman이면 5000, 나머지는 2000을 출력하시오.
SELECT ename, job,
	CASE
    WHEN (job ="SALESMAN") then 5000
    else 2000
    end as bonus
	FROM emp;
    
-- Q. 이름, 직업, 커미션, 보너스를 출력하되 커미션이 null이면 500, 아니면 0을 출력하시오
SELECT ename, job, comm,
	CASE
    WHEN (comm is null) then 500
    else 0 end as bonus
	FROM emp;



-- 최대값 출력하기 (MAX)
-- Q. 사원 테이블에서 최대 월급을 출력하시오
SELECT MAX(SAL)
	FROM EMP;
    
-- Q. 직업이 SALESMAN인 사원들 중 최대 월급을 출력하시오.
SELECT job, MAX(SAL)
	FROM emp
    WHERE job="SALESMAN"
    GROUP BY job;
    
-- Q. 부서 번호와 부서 번호별 최대 월급을 출력하시오
SELECT deptno, MAX(sal)
	FROM emp
    GROUP BY deptno;


-- 최소값 출력하기 (MIN)
-- Q. 직업이 SALESMAN인 사원들 중 최소 월급을 출력하시오
SELECT MIN(sal)
	FROM emp
	WHERE job="SALESMAN";

-- Q. 직업과 직업별 최소 월급을 출력하되, 최소 월급이 높은 것부터 출력하시오
SELECT job, MIN(sal)
	FROM emp
    GROUP BY job
    ORDER BY MIN(sal) DESC;
    
-- Q. 직업, 직업별 최소 월급을 출력하되, SALESMANS 직업을 제외하고 출력하고 월급이 높은 것부터 출력하시오
SELECT job, MIN(sal)
	FROM emp
    WHERE job != 'SALESMANS'
    GROUP BY job
    ORDER BY MIN(sal) DESC;xx



-- 평균값 출력하기
-- Q. 사원 테이블의 평균 월급을 출력하시오
SELECT AVG(sal)
	FROM emp;

-- 토탈값 출력하기 (SUM)
-- Q. 부서 번호와 부서 번호별 토탈 월급을 출력하시오
SELECT deptno, SUM(sal)
	FROM emp
    GROUP BY deptno;
    
-- Q. 직업, 직업별 토탈 월급을 출력하되 월급이 높은 것부터 출력하시오
SELECT job, SUM(sal)
	FROM emp
    GROUP BY job
    ORDER BY SUM(sal) DESC;
    
-- Q. 직업, 직업별 토탈 월급을 출력하되 직업별 토탈 월급이 4000 이상인 것만 출력하시오
SELECT job, SUM(sal)
	FROM emp
    GROUP BY job
    HAVING SUM(sal)>4000;
    
-- Q. 직업, 직업별 토탈 월급을 출력하되 직업에서 SALESMAN은 제외하고, 직업별 토탈 월급이 4000 이상인 사원들만 출력하시오
SELECT job, SUM(sal)
	FROM emp
    WHERE job != "SALESMAN" 
    GROUP BY job
    HAVING SUM(sal) > 4000;




-- 건수 출력하기 (COUNT)
-- Q. 사원 테이블 전체 사원수를 출력하시오
SELECT COUNT(empno)
	FROM emp;

-- Q. 커미션 칼럼의 Null 값 아닌 값들을 출력하시오
SELECT COUNT(comm)
	FROM emp;
    
-- Q. 사원 테이블 전체 Null 값 포함한 행의 개수를 출력하시오
SELECT COUNT(*)
	FROM emp;



-- 데이터 분석 함수로 순위 출력하기 (Oracle: RANK, MySQL: 직접 구현)
-- Q. 직업이 ANALYST, MANAGER인 사원들의 이름, 직업, 월급, 월급의 순위를 출력하시오
SELECT ename, job, sal
	FROM emp
    WHERE job in ('ANAYLST', 'MANAGER')
    ORDER BY sal desc;

-- 데이터 분석 함수로 순위 출력하기 (Orcale: DENSE_RANK, MySQL: 직접 구현)
-- Q.직업이 ANALYST, MANAGER인 사원들의 이름, 직업, 월급, 월급의 순위를 출력하되 순위 1위인 사원이 2명이 있을 경우 다음 순위는 2위로 출력하시오
SELECT ename, job, sal, RANK() over (ORDER BY sal DESC) AS RANK<
	DENSK_RANK() over (ORDER BY sal DESC) AS DENSE_RANK
    FROM emp
    WHERE job in ("ANAYLST", "MANAGER");


-- 데이터 분석 함수로 등급 출력하기 (NTILE)
-- Q. 이름과 월급, 직업, 월급의 등급을 출력하시오. 월급의 등급은 4등급으로 출력하시오
SELECT ename, job, sal, 
	NTILE(4) OVER (
		ORDER BY sal) as 등급
    FROM emp; 
    
SELECT * FROM emp;
    

-- 데이터 분석 함수로 순위의 비율 출력하기(CUME_DIST)
-- Q. 이름, 월급, 월급의 순위 비율을 출력하시오
SELECT ename, sal,
	CUME_DIST() OVER (ORDER BY sal) cum_dist_level
    FROM emp;
    
-- Q. 이름, 월급, 직업, 월급의 순위 비율을 출력하되 직업을 기준으로 partition 하시오.
SELECT ename, sal, job,
	CUME_DIST() OVER (PARTITION BY job ORDER BY sal) cum_dist_level
    FROM emp;

-- 데이터 분석 함수로 데이터를 가로로 출력하기 (Oracle:ISTAGG, MySQL: GROUP_CONCAT)
-- Q. 부서 번호를 출력하고, 부서 번호 옆에 해당 부서에 속한 사원들의 이름과 월급을 가로로 출력하시오
SELECT deptno, GROUP_CONCAT(CONCAT(ename,'(', sal, ')') SEPARATOR ', ')
	FROM emp
    GROUP BY deptno;

-- 데이터 분석 함수로 바로 전 행과 다음 행 출력하기 (LAG, LEAD)
-- Q. 사원번호, 이름, 월급을 출력하고 그 옆에 바로 전 행의 월급을, 그 옆에는 바로 다음 행의 월급을 출력하시오
SELECT empno, ename, sal,
	LAG(sal, 1) over (ORDER BY sal ASC) as "전행",
    LEAD(sal, 1) over (ORDER BY sal ASC) as "다음 행"
	FROM emp;
    
-- Q. 직업이 ANALYST 또는 MANAGER인 사원들의 사원번호, 이름, 입사일, 바로 전 입사한 사원의 입일, 바로 다음에 입사한 사원의 입사일을 출력하시오
SELECT empno, ename, job, hiredate,
	LAG(hiredate, 1) over (ORDER BY hiredate ASC) as "전 입사일",
    LEAD(hiredate, 1) over (ORDER BY hiredate ASC) as "다음 행"
    FROM emp
    WHERE job in ("ANALYST", "MANAGER");
    
-- Q. 부서번호, 사원번호, 이름, 입일, 바로 전에 입사한 사원의 입사일을 출력하고, 그 다음에 입사한 사원의 입일을 출력하되 부서 변호별로 구분해서 출력하시오
SELECT empno, ename, deptno, job, hiredate,
	LAG(hiredate, 1) over (PARTITION BY deptno ORDER BY hiredate ASC) as "전 입사일",
    LEAD(hiredate, 1) over (PARTITION BY deptno ORDER BY hiredate ASC) as "다음 행"
    FROM emp;

-- COLUMN을 ROW로 출력하기(Oracle만 가능)
-- Q. 부서번호, 부서번호별 토탈 월급을 출력하되, 가로로 출력하시오
SELECT deptno, SUM(sal)
    FROM emp
    GROUP BY deptno;
    
    
SELECT * FROM emp;

-- COLUMN을 ROW로 출력하기 (PIVOT)
-- Q. 부서번호, 부서 번호별 토탈 월급을 Pivot문을 사용하여 가로로 출력하시오
SELECT *
	FROM (SELECT deptno, sal from emp)
    PIVOT (sum(sal) for deptno in (10,20,30));

-- Row를 column으로 출력하기 (UNPIVOT)
-- Q. UNPIVOT을 사용하여 컬럼을 로우로 출력하시오 (Oracle에서만 가능)
SELECT *
	FROM emp
    UNPIVOT ( 건수 for 아이템 in (BICYCLE, CAMERA, NOTEBOOK));

-- 누적 데이터 출력하기 (SUM OVER)
-- Q. 직업이 ANALYST, MANAGER인 사원의 사원번호, 이름, 월급, 월급의 누적치를 출력하시오.
SELECT empno, ename, sal,
	SUM(SAL) OVER (ORDER BY empno ROWS
					BETWEEN UNBOUNDED PRECEDING
					AND CURRENT ROW) 누적치
	FROM emp
    WHERE job in ("ANAYLST", "MANAGER");

-- MySQL ver
SELECT empno, ename, sal, (@csum := @csum + sal) as cumulative_sal
	FROM emp
	WHERE job in ("ANALYST", "MANAGER");

-- 비율 출력하기 (RATIO_TO_REPORT) (Oracle만 가능)
-- Q. 부서 번호가 20번인 사원들의 사원번호, 이름, 월급을 출력하고, 20번 부서 내에서 사원의 월급 비율을 출력하시오.
SELECT empno, ename, sal, RATIO_TO_REPORT(sal) OVER () as 비율
	FROM emp
	WHERE deptno=20;


-- 집계 결과 출력하기 (ROLLUP) (MySQL에서는 WITH ROLLUP)
-- Q 부번호, 직업과 직업별 토탈 월급을 출력하되, 중간중간마다 부서의 토탈 월급을 출력하시오
SELECT deptno, job, sum(sal)
	FROM emp
    GROUP BY deptno, job
    WITH ROLLUP;

-- 집계 결과 출력하기 (CUBE)
-- Q. 직업, 직업별 토탈 월급을 출력하되, 첫 번째 행에 토탈 월급을 출력하시오
SELECT job, sum(sal)
	FROM emp
    GROUP BY CUBE(job, sal);

-- 집계 결과 출력하기 (GROUPING SETS)
-- Q. 부서번호, 직업, 부서번호 별 토탈 월급, 직업별 토탈 월급, 전체 토탈 월급을 출력하시오
SELECT deptno, job, sum(sal)
	FROM emp
    GROUP BY GROUPING SETS((deptno), (job), ());

-- 출력 결과 넘버링 하기 (ROW_NUMBER)
SELECT empno, ename, sal, RANK() OVER (ORDER BY sal DESC) Rank,
	DENSE_RANK()  OVER (ORDER BY sal DESC) DENSE_RANK,
	ROW_NUMBER() OVER (ORDER BY sal DESC) 번호
	FROM emp
    WHERE deptno = 20;
    

-- 동물 보호소에 들어온 모든 동물의 아이디와 이름을 ANIMAL_ID 순으로 조회하는 SQL문을 작성해주세요.
SELECT ANIMAL_ID, NAME
    FROM ANIMAL_INS
    ORDER BY ANIMAL_ID;

-- 동물 보호소에 들어온 모든 동물의 정보를 ANIMAL_ID 순으로 조회하시오.
SELECT *
    FROM ANIMAL_INS
    ORDER BY ANIMAL_ID asc;

-- 동물 보호소에 들어온 동물 중 아픈 동물1의 아이디와 이름을 조회하는 SQL 문을 작성해주세요. 이때 결과는 아이디 순으로 조회해주세요.
SELECT ANIMAL_ID, NAME
    FROM ANIMAL_INS
    WHERE INTAKE_CONDITION ="Sick";

-- 동물 보호소에 들어온 동물 중 젊은 동물1의 아이디와 이름을 조회하는 SQL 문을 작성해주세요. 이때 결과는 아이디 순으로 조회해주세요.
SELECT ANIMAL_ID, NAME
    FROM ANIMAL_INS
    WHERE INTAKE_CONDITION != 'Aged';

-- 동물 보호소에 들어온 모든 동물의 아이디와 이름, 보호 시작일을 이름 순으로 조하시오.
SELECT ANIMAL_ID, NAME, DATETIME
    FROM ANIMAL_INS
    ORDER BY NAME asc, DATETIME desc;

-- 동물 보호소에 들어온 모든 동물의 이름, 보호시작일을 조회하되 ANIMAL_ID 역순으로 ㅜㄹ력하시오
SELECT NAME, DATETIME
    FROM ANIMAL_INS
    ORDER BY ANIMAL_ID desc;

-- Q. 동물 보호소에 들어온 개와 고양이가 각각 몇 마리인지 조회하시오
SELECT ANIMAL_TYPE, COUNT(ANIMAL_TYPE) count
    FROM ANIMAL_INS
    GROUP BY ANIMAL_TYPE
    ORDER BY ANIMAL_TYPE asc;


-- 동물 보호소에 들어온 동물 이름 중 두 번 이상 쓰인 이름과 해당 이름이 쓰인 횟수를 조회하는 SQL문을 작성해주세요.
-- 이때 결과는 이름이 없는 동물은 집계에서 제외하며, 결과는 이름 순으로 조회해주세요.
SELECT NAME, COUNT(NAME)
    FROM ANIMAL_INS
    GROUP BY NAME
    HAVING COUNT(NAME) > 1
    ORDER BY NAME;

-- 보호소에서는 몇 시에 입양이 가장 활발하게 일어나는지 알아보려 합니다. 09:00부터 19:59까지, 각 시간대별로 입양이 몇 건이나 발생했는지 조회하는 SQL문을 작성해주세요. 이때 결과는 시간대 순으로 정렬해야 합니다.
SELECT HOUR(DATETIME) as hour, COUNT(HOUR(DATETIME))
    FROM ANIMAL_OUTS
    GROUP BY HOUR(DATETIME)
    HAVING hour BETWEEN 9 AND 19
    ORDER BY HOUR(DATETIME);

-- Q. 보호소에서는 몇 시에 입양이 가장 활발하게 일어나는지 알아보려 합니다. 0시부터 23시까지, 각 시간대별로 입양이 몇 건이나 발생했는지 조회하는 SQL문을 작성해주세요. 이때 결과는 시간대 순으로 정렬해야 합니다.
SET @hour := -1; -- 변수 선언

SELECT (@hour := @hour + 1) as HOUR,
(SELECT COUNT(*) FROM ANIMAL_OUTS WHERE HOUR(DATETIME) = @hour) as COUNT
FROM ANIMAL_OUTS
WHERE @hour < 23

-- 종류, 이름, 성별 및 중성화 여부를 아이디 순으로 조회하되 이름이 NULL이면 'No name'을 출력하시오
SELECT ANIMAL_TYPE, IFNULL(NAME, 'No name'), SEX_UPON_INTAKE
    FROM ANIMAL_INS;

-- 이름이 없는 채로 들어온 동물 ID를 조회하시오
SELECT ANIMAL_ID
    FROM ANIMAL_INS
    WHERE name IS NULL;

-- 이름이 있는 동물 ID를 조회하시오
SELECT ANIMAL_ID
    FROM ANIMAL_INS
    WHERE name IS NOT NULL;

-- Q. 보호소에서 중성화 수술을 거친 동물 정보를 알아보려 합니다. 보호소에 들어올 당시에는 중성화1되지 않았지만, 보호소를 나갈 당시에는 중성화된 동물의 아이디와 생물 종, 이름을 조회하는 아이디 순으로 조회하는 SQL 문을 작성해주세요
SELECT i.ANIMAL_ID, i.ANIMAL_TYPE, i.NAME
    FROM ANIMAL_INS i
        LEFT JOIN ANIMAL_OUTS o
        ON i.ANIMAL_ID = o.ANIMAL_ID
    WHERE (i.SEX_UPON_INTAKE LIKE 'INTACT%') AND (o.SEX_UPON_OUTCOME LIKE 'Spayed%' OR o.SEX_UPON_OUTCOME LIKE 'Neutered%')
    ORDER BY ANIMAL_ID;

-- Q. 입양을 간 기록은 있는데, 보호소에 들어온 기록이 없는 동물의 ID와 이름을 ID 순으로 조회하는 SQL문을 작성해주세요.
SELECT o.ANIMAL_ID, o.NAME
    FROM ANIMAL_OUTS AS o
        LEFT JOIN ANIMAL_INS AS i
        ON o.ANIMAL_ID = i.ANIMAL_ID
    WHERE i.ANIMAL_ID IS NULL
    ORDER BY o.ANIMAL_ID;

-- Q. 아직 입양을 못 간 동물 중, 가장 오래 보호소에 있었던 동물 3마리의 이름과 보호 시작일을 조회하는 SQL문을 작성해주세요. 이때 결과는 보호 시작일 순으로 조회해야 합니다.
SELECT i.NAME, i.DATETIME
    FROM ANIMAL_INS i
    WHERE NOT EXISTS (SELECT * 
                        FROM ANIMAL_OUTS o
                        WHERE o.ANIMAL_ID = i.ANIMAL_ID)
    ORDER BY i.DATETIME
    LIMIT 3;



-- Q. 보호시작일보다 입ㅑㅇ일이 더 빠른 동물의 아이디와 이름을 조회하는 SQL문을 작성하시오.
SELECT i.ANIMAL_ID, i.NAME  
    FROM ANIMAL_INS i
        LEFT JOIN ANIMAL_OUTS o
        ON o.ANIMAL_ID = i.ANIMAL_ID
    WHERE i.DATETIME > o.DATETIME
    ORDER BY i.DATETIME;

-- 동물 보호소에 가장 먼저 들어온 동물의 이름을 조회하시오.
SELECT NAME
    FROM ANIMAL_INS
    ORDER BY DATETIME asc
    LIMIT 1;

-- 동물 보호소에 동물이 몇 마리 들어왔는지 조회하시오
SELECT COUNT(*)
    FROM ANIMAL_INS;

-- 중복되는 이름을 제거하고 출력하시오
SELECT COUNT(DISTINCT NAME)
    FROM ANIMAL_INS;



-- 가장 먼저 들어온 동물은 언제 들어왔는 조회하시오.
SELECT MAX(DATETIME)
    FROM ANIMAL_INS;

-- 동물 보호소에 가장 먼저 들어온 동물은 언제 들어왔는지 조회하시오.
SELECT MIN(DATETIME)
    FROM ANIMAL_INS;

-- Q. ANIMAL_INS 테이블에 등록된 모든 레코드에 대해, 각 동물의 아이디와 이름, 들어온 날짜1를 조회하는 SQL문을 작성해주세요. 이때 결과는 아이디 순으로 조회해야 합니다.
SELECT ANIMAL_ID, NAME, date_format(DATETIME, '%Y-%m-%d') AS 날짜
    FROM ANIMAL_INS
    ORDER BY ANIMAL_ID;

-- Q. 동물 보호소에 들어온 동물 중 이름이 Lucy, Ella, Pickle, Rogan, Sabrina, Mitty인 동물의 아이디와 이름, 성별 및 중성화 여부를 조회하는 SQL 문을 작성해주세요.
SELECT DISTINCT ANIMAL_ID, NAME, SEX_UPON_INTAKE
    FROM ANIMAL_INS
    WHERE (NAME ='Ella') OR (NAME="Lucy")
        OR (NAME="Pickle") OR (NAME="Rogan")
        OR (NAME="Sabrina") OR (NAME="Mitty")
    ORDER BY ANIMAL_ID; 

-- Q. 입양을 간 동물 중, 보호 기간이 가장 길었던 동물 두 마리의 아이디와 이름을 조회하는 SQL문을 작성해주세요. 이때 결과는 보호 기간이 긴 순으로 조회해야 합니다.
SELECT o.ANIMAL_ID, o.NAME
    FROM ANIMAL_OUTS o
    LEFT JOIN ANIMAL_INS i
        ON i.ANIMAL_ID = o.ANIMAL_ID
    ORDER BY o.DATETIME - i.DATETIME DESC
    LIMIT 2;

-- Q. 동물 보호소에 들어온 동물 이름 중, 이름에 EL이 들어가는 개의 아이디와 이름을 조회하는 SQL문을 작성해주세요. 이때 결과는 이름 순으로 조회해주세요. 단, 이름의 대소문자는 구분하지 않습니다.
SELECT ANIMAL_ID, NAME
    FROM ANIMAL_INS
    WHERE (NAME LIKE "%el%") AND (ANIMAL_TYPE = "DOG")
    ORDER BY NAME;

-- Q. 보호소의 동물이 중성화되었는지 아닌지 파악하려 합니다. 중성화된 동물은 SEX_UPON_INTAKE 컬럼에 'Neutered' 또는 'Spayed'라는 단어가 들어있습니다. 동물의 아이디와 이름, 중성화 여부를 아이디 순으로 조회하는 SQL문을 작성해주세요. 이때 중성화가 되어있다면 'O', 아니라면 'X'라고 표시해주세요.
SELECT ANIMAL_ID, NAME, 
    CASE
        WHEN SEX_UPON_INTAKE LIKE "Neutered%"
        THEN 'O'
        WHEN SEX_UPON_INTAKE LIKE "Spayed%"
        THEN 'O'
        ELSE "X"
        END AS '중성화'
    FROM ANIMAL_INS;

-- Q.126. 엑셀 테이터를 DB에 로드하는 방법
-- 우선 테이블을 생성한다.
CREATE TABLE CANCER
(암종 VARCHAR(50),
질병코드 VARCHAR(50),
환자수 INT,
성별 VARCHAR(50),
조유병률 FLOAT,
생존률 FLOAT);

-- 그 뒤에 import 하면 된다.

-- Q.스티브 잡스 연설문에서 가장 많이 나오는 단어는?
CREATE TABLE speech
(SPEECH_TEXT VARCHAR(10000));

SET GLOBAL local_infile=1;

LOAD DATA LOCAL INFILE '/Users/junghyunwoo/Downloads/jobs.txt'
INTO TABLE speech
character set utf8;

-- 데이터건수 살펴보기
SELECT count(*) 
	FROM speech;

-- Q.스티브 잡스 연설문에는 긍정 단어가 얼마나 있을까?
CREATE TABLE POSITIVE (P_TEXT VARCHAR(2000));
CREATE TABLE NEGATIVE (N_TEXT VARCHAR(2000));

CREATE VIEW speech_view
AS
SELECT REGEXP_SUBSTR(lower(speech_text), '[^ ]+', 1, a) word
	FROM speech, (SELECT level a 
					FROM dual 
                    CONNECT BY level <= 52);

SELECT count(word) as 긍정단어
	FROM speech_view
	WHERE lower(word) IN ( SELECT lower(p_text FROM positive);

-- Q.절도가 많이 발생하는 요일은 언제인가?
-- 데이터 다운 받고서
CREATE TABLE CRIME_DAY_UNPVIOT
AS
SELECT * 
	FROM CRIME_DAY
    UNPIVOT (CNT FOR DAT_CNT IN (SUN_CNT, MON_CNT, TUE_CNT, WED_CNT, THU_CNT, FRI_CNT, SAT_CNT));
    
-- 제일 많이 일어나는 요일 뽑기
SELECT *
	FROM (
			SELECT DAY_CNT, CNT, RANK() OVER (ORDER BY CNT DESC) RANK
				FROM CRIME_DAY_UNPIVOT
                WHERE TRIM(CRIME_TYPE) = '절도')
	WHERE RNK = 1;


-- Q.우리나라 대학등록금이 가장 높은 학교는?
-- 데이터 다운 받고
SELECT *
	FROM ( 
			SELECT UNIVERSITY, TUITION_FEE,
				RANK() OVER (ORDER BY TTUITION_FEE DESC NULLS LAST) 순위
                FROM UNIVERSITY_FEE)
	WHERE 순위 = 1;x

-- Q.서울시 물가 중 가장 비싼 품목과 가격은?
-- 데이터 다운 받고
SELECT A_NAME as "상품", A_PRICE as "가격", M_NAME as "매장명"
	FROM PRICE
    WHERE A_PRICE = (SELECT MAX(A_PRICE) 
						FROM PRICE);