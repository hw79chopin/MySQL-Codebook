/* constraints 쓰는 법 */
CREATE TABLE dept
(
    deptno VARCHAR(4) primary key,
    deptname VARCHAR(20)
);

/* CREATE TABLE 예시 */
CREATE TABLE emp
(
    empno int(10),
    ename VARCHAR(15), 
    sal int(10) default 0,
    deptno VARCHAR(4) NOT NULL,
    createdata int(10) default 2,
    CONSTRAINT emppk PRIMARY KEY(empno),
    CONSTRAINT deptfk FOREIGN KEY(deptno)    # deptfk 외래키 이름
                      REFERENCES dept(deptno)
                      ON DELETE CASCADE      # 참조하고 있는 테이블의 데이터가 삭제되면 자동으로 삭제되는 옵션
);

/* WITH 예시 */
WITH viewData AS
(SELECT * FROM emp
 UNION ALL
 SELECT * FROM emp
 )
SELECT * FROM viewData WHERE empno=1000;

/* DECODE 예시 */
SELECT DECODE(empno, 1000, 'TRUE', 'FALSE') FROM emp;

/* GROUP BY 예시 */
SELECT deptno, SUM(sal) FROM emp
WHERE empno BETWEEN 1000 AND 1003
GROUP BY deptno;

/* COUNT(*) */
SELECT COUNT(*) FROM emp;

/* HAVING 예시 */
SELECT deptno, SUM(sal)
FROM emp
GROUP BY deptno
HAVING SUM(sal) > 10000;

/* GROUP BY 예시 */
SELECT deptno, SUM(sal)
FROM emp
GROUP BY deptno;

/* IFNULL() 예시 */
SELECT IFNULL(SALARY, 0) FROM EMPLOYEE_SALARY # SALARY 값이 NULL 이면 0을, NULL 이 아니면 SALARY 값을 출력

/* NOT BETWEEN 예시 */
SELECT * FROM students WHERE height NOT BETWEEN 160 AND 180;

/* IN 예시 */
SELECT * FROM students WHERE name in ('기장우', '박성재');

/* wild card 예시1 */
SELECT * FROM students
WHERE name LIKE '정%';  # '정'씨 모두 찾기

/* wild card 예시2 */
SELECT * FROM students
WHERE name LIKE '%우';   # '우'로 끝나는 사람 찾기

/* wild card 예시3 */
SELECT * FROM students
WHERE ename LIKE '%현%'   # 중간에 '현'이 있는 모든 데이터 조회

/* wild card 예시4 */
SELECT * FROM students
WHERE enmae LIKE '정현_'   # '정현'뒤에 하나의 글자만 더 있는 것을 조회

/* Alias 사용 예시 */
SELECT full_family_name AS 'name' FROM student m
WHERE m.score = 100;

/* GRANT문 예시1 */
GRANT SELECT, INSERT, UPDATE, DELETE
ON emp
TO user-name;

/* DROP DATABASE 예시 */
DROP DATABASE hyun;

/* DROP TABLE 예시 */
DROP TABLE test

/* TRUNCATE 예시 */
TRUNCATE TABLE test;

/* DELETE 예시 */
DELETE FROM test
WHERE id =1;

/* UPDATE 예시 */
UPDATE test
SET col1 = 1, col2=1.0, col3='test'
WHERE id =1

/* INSERT INTO SELECT 예시  */
INSERT INTO test2 SELCT * FROM test;

/* INSERT 예시 */
INSERT INTO test
VALUE(1, 123, 1.1, "Test");

SELECT * FROM test;

/* DROP VIEW */
DROP VIEW testView 

/* ALTER VIEW */
ALTER VIEW testView As
SELECT Col1, Col2, Col3
FROM test;

/* CREATE VIEW 예시 */
CREATE VIEW testView AS
SELECT Col1, Col2
FROM test;

SELECT * FROM testView;

/* DROP INDEX 예시1 */
ALTER TABLE test
DROP INDEX Col3Idx;

SHOW INDEX FROM test;

/* DROP INDEX 예시2: 이렇게 해도 됨 */
DROP INDEX Col2Idx ON test;

SHOW INDEX FROM test;

/* FULLTEXT INDEX */
ALTER TABLE test
ADD FULLTEXT Col3Idx(col3);

SHOW INDEX FROM test;

/* CREATE UNIQUE */
CREATE UNIQUE INDEX Col2Idx
ON test(col2);

SHOW INDEX FROM test;

/* SHOW INDEX */
SHOW INDEX FROM test;

/* CREATE INDEX */
CREATE INDEX Col1Idx
ON test (col1)

/* ALTER TABLE, DROP */
ALTER TABLE test2
DROP col4;

/* ALTER TABLE MODIFY */
ALTER TABLE test2
MODIFY col4 VARCHAR(20) NULL;

/* ALTER TABLE */
ALTER TABLE test2
ADD col4 INT NULL;

/* CREATE TABLE */
CREATE TABLE test2 (
    id INT NOT NULL PRIMARY KEY,
    col1 INT NULL,
    col2 FLOAT NULL,
    col3 VARCHAR(45) NU
）

/* CREATE DATABASE */
CREATE DATABASE hyun;

USE hyun;

/* CREATE TABLE AS SELECT */
CREATE TABLE city2 AS SELECT * FROM city;

/* DATE_FORMAT() */
SELECT
DATE_FORMAT(NOW(), %D %y %a %d %m %n %j)

/* DAYOFWEEK(), DAYOFMONTH(), DAYOFYEAR() */
SELECT
NOW(),
DAYOFWEEK(NOW());

/* MONTHNAME(), DAYNAME() */
SELECT
NOW(),
MONTHNAME(NOW()),
DAYNAME(NOW())

/* DATE(), MONTH(), DAY(), HOUR(), MINUTE(), SECOND() */
SELECT
NOW(),
DATE(NOW()),
MONTH(NOW()),
DAY(NOW()),
HOUR(NOW()),
MINUTE(NOW()),
SECOND(NOW())


/* ABS(), RAND() */
SELECT ABS(-3), RAND(), ROUND(RAND()*100, 0);

/* SQRT( ), POW(), EXP(), LOG() */
SELECT SQRT(4), POW(2,3), EXP(3), LOG(3)

/* FLORR(), CEIL(), ROUND() */
SELECT FLOOR(10.95), CEIL(10.95), ROUND(10.95)

/* format */
SELECT FORMAT(123123123123.123123123, 3);

/* TRIM() */
SELECT TRIM('                     MySQL         ');
TRIM(LEADING '#' FROM '###MySQL###').
TRIM(TRAILING '#' FROM'###MySQL###');

/* REPLACE() */
SELECT REPLACE('MSSQL', 'MS', 'MY');

/* LOWER(), UPPER() */
SELECT
LOWER('mYSQL ISA CDLSLDKCM ALSCKMDLS CLSMDCKL KLC')
UPPER('mYSQL ISA CDLSLDKCM ALSCKMDLS CLSMDCKL KLC')

/* LEFT(), RIGHT() */
SELECT
LEFT('mYSQL ISA CDLSLDKCM ALSCKMDLS CLSMDCKL KLC', 5)
RIGHT('mYSQL ISA CDLSLDKCM ALSCKMDLS CLSMDCKL KLC', 6)

/* LOCATE() */
SELECT LOCATE('abc', 'abcdkcslkdfkladf')

/* concat 예시 */
SELECT CONCAT('My', 'sql OP'，'ENG')

/* LENGTH() */
SELECT LENGTH('alskdjf')

/* JOIN 예시 */
/* citry, country, countrylanguage 테이블 3개를 join 하기 */
SELECT *
FROM city
JOIN country ON city.CountryCode = country.Code
JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode

/* JOIN */
SELECT *
FROM city
JOIN country ON city.CountryCode = country.Code

/* ROLLUP */
SELECT CountryCode, Name SUM(Population)
FROM city
GROUP BY CountryCode, Name WITH ROLLUP

/* having */
SELECT CoutnryCode, MAX(Populiation)
FROM city
GROUP BY CountryCode
HAVING MAX(Population) > 8000000

/* city에서 population의 평균 구하기 */
SELECT ag(Population)
FROM city

/* groupby as */
SELECT CountryCode, avg(Population) AS 'Average'
FROM city
GROUP BY CountryCode

/* groupby */
SELECT CountryCode, Max(Population)
FROM city
GROUP BY CountryCode

/*  Limit 상위 10개만 보기 */
SELECT *
FROM city
ORDER BY Population DESC
LIMIT 10

/* distinct */
SELECT DISTINCT CountryCode
FROM city;

/* 국가 면적 크기로 내림차순하기 */
SELECT *
FROM country
ORDER BY SurfaceArea DESC;

/* 한국에 있는 도시들 인구수로 내림차순하기 */
SELECT *
FROM city
WHERE CountryCode = 'KOR'
ORDER BY Population DESC

/* order by decending order */
SELECT *
FROM city
ORDER BY Population DESC

/* ascending order */
SELECT *
FROM city
ORDER BY Population 

/* multiple order by */
SELECT *
FROM city
ORDER BY CountryCode ASC, Population DESC

/* Sub query ANY */
SELECT *
FROM city
WHERE Population > ANY ( select Population
                        FROM city
                        WHERE District = 'New York')

/* Sub query */
SELECT *
FROM city
WHERE CountryCode = ( SELECT CountryCode
                     FROM city
                     WHERE Name = 'Seoul');

/* select 예시 */
SELECT * FROM city;    /* city의 전체 row를 보여줘라 */
SELECT Name FROM city;
SELECT Name, Population FROM city;

/* select where 예시 */
SELECT *
FROM city
WHERE Population > 8000000

/* 이렇게 해도 됨 */
SELECT * FROM city WEHRE Population > 8000000

/* select, where, 관계연산자 예시1 */
SELECT *
FROM city
WHERE Population < 8000000
AND Population > 70000000

/* 예시2 */
SELECT *
FROM city
WHERE CountryCode = 'KOR'
AND Population >= 1000000

/* select, in 예시 */
SELECT *
FROM city
WHERE name IN('Seoul', 'New York', 'Tokyo')

/* select, like 예시1 */
WHERE *
FROM city
WHERE CountryCode LIKE 'KO_'

/* 예시2 */
SELECT *
FROM city
WHERE CountryCode LIKE 'Tel %'

/* PERCENT_RANK 예시 */
SELECT deptno, enmae, sal,
  PERCENT_RANK() OVER(PARTITION BY deptno
                      ORDER BY sal desc) AS percent_sal
                      FROM emp;

/* LAG 예시 */
SELECT deptno, ename, sal,
  LAG(sal) OVER(ORDER BY sal desc) AS pre_sal
FROM emp;

/* LEAD 예시 */
SELECT deptno, enmae, sal,
  LEAD(sal, 2) OVER(ORDER BY sal DESC) AS pre_sal
FROM emp;

/* FIRST_VALUE 예시 */
SELECT deptno, enmae, sal,
  FIRST_VALUE(ename) OVER (PARTITION BY deptno
                           ORDER BY sal DESC ROWS UNBOUNDED PRECEDING) AS epth_a FROM emp;

/* SUM 함수 예시 */
SELECT ename, sal,
  SUM(sal) OVER (PARTITION BY mgr) sum_mgr
FROM emp;

/* RANK 예시1 */
SELECT ename, sal,
  RANK() OVER (ORDER BY sal DESC) all_rank, /* sal로 등수를 계산하고 내림차순으로 조회 
  RANK() OVER (PARTITION BY job ORDER BY sal 
               DESC) job_rank /* job으로 파티션을 만들고 job별 순위를 조회
FROM emp;

/* DENSE_RANK 예시1 */
SELECT ename, sal,
  RANK() OVER (ORDER BY sal DESC) all_rank,
  DENSE_RANK() OVER (ORDER BY sal DESC) DENSE_RAN
FROM emp;

/* WINDOW 예시1 */
SELECT empno, enmae, sal,
SUM(sal) OVER( ORDER BY sal
              ROWS BETWEEN UNBOUNDED PRECEDING /* 첫 번째 행부터 현재 행까지의 합계를 구한다
              AND UNBOUNDED FOLLING) totsal
              FROM emp;

/* WINDOW 예시2 */
SELECT empno, enmae, sal,
SUM(sal) OVER( ORDER BY sal
              ROWS BETWEEN CURRENT ROW /* 현재 행부터 마지막 행까지의 합계
              AND UNBOUNDED FOLLING) totsal
              FROM emp;

/* CUBE 예시 */
SELECT deptno, job, SUM(sal)
FROM emp
GROUP BY CUBE(deptno, job);

/* GROUPING SETS 예시 */
SELECT deptno, job, SUM(sal)
FROM emp
GROUP BY GRORUPING SETS(deptno, job);

/* GROUPING 예시1 */
SELECT deptno, GROUPING(deptno),
job, GROUPING(job), SUM(sal)
FROM emp
GROUP BY ROLLUP(deptno)

/* GROUPING 예시2 */
SELECT deptno, 
DECODE(GROUPING(deptno), 1, '전체합계'), tot, job,
DECODE(GROUPING(job), 1, '부서합계') t_dept,
SUM(sal)
FROM emp
GROUP BY ROLLUP(deptno)

/* ROLLUP 예시1 */
SELECT DECODE(deptno, NULL, '전체합계', deptno),
SUM(sal)
FROM emp
GROUP BY ROLLUP (deptno);

/* ROLLUP 예시2 */
SELECT deptno, job, SUM(sal)
FROM emp
GROUP BY ROLLUP (deptno, job);

/* Correlated Subquery */
FROM emp a
WHERE a.deptno = 
( SELECT deptno FROm dept b
 WHERE b.deptno = a.deptno );

/* Scala Subquery */
SELECT ename AS "이름"
sal AS "급여" (
    SELECT AVG(sal)
    FROM emp) AS "평균급여"
    FROM emp
    WHERE empno=1000;

/* EXISTS */
SELECT ename, dname, sal
FROM emp, dept
WHERE emp.deptno=dept.deptno
AND EXISTS (SELECT 1 FROM emp
            WHERE sal > 2000);

/* ALL 예시 */
SELECt *
FROM emp
WHERE deptno <= ALL (20, 30);

/* IN 예시 */
SELECT ename, dname, sal
FROM emp, dept
WHERE emp.deptno = dept.deptno
AND emp, empno
IN (SELECT empno FROM emp
    WHERE sal > 2000); /* 급여(SAL)가 2000원 이상인 사원번호를 조회한 후에 EMP, EMPNO를 조회한다.

/* Subquery 예시 */
SELECT *
FROM emp
WHERE deptno = (
    SELECT deptno FROM dept 
    WHERE deptno = 10 
);

/* Inline View 예시 */
SELECT *
FROM (SELECT rownum num,enmae FROM emp) a
WHERE num < 5;

/* OUTER JOIN 예시 */
SELECT * FROM dept, emp
WHERE emp.deptno (+)= dept.deptno;

/* INNER JOIN 예시1 */
SELECT * FROM emp 
INNER JOIN dept
ON emp.deptno = dept.deptno;

/* INNER JOIN 예시2 */
SELECT * FROM emp, dept
WHERE emp.deptno = dept.deptno
AND emp.ename = LIKE '임%'
ORDER BY ename;

/* JOIN 예시 1 */
SELECT gg._id, gg.name, s.title
FROM girl_group AS gg 
JOIN song AS s
ON s._id = gg.hit_song_id;

/* JOIN 예시 2 */
SELECT * FROM emp, dept
WHERE emp.deptno = dept.deptno;