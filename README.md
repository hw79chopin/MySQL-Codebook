<h1 align="center"><strong>🔎 MySQL Codebook</strong></h3>

`#MySQL` `#Oracle`

# 🚦 1. 소개
- 나의 MySQL codebook이다.
- 밑에 있는 markdown 내용은 MySQL에서 쓰는 query들에 대한 개념들
- 'MySQL query.sql'은 위에서 설명한 개념들에 대한 각 예시 query문들을 모았음.
- [mac에서 MySQL 설치하기](https://whitepaek.tistory.com/16)

---

# 🚦 2. SQL query 개념모음 (<이기적 SQL 개발자> 참조, Oracle base)
## 2-1) 기본 SQL문 
- SHOW DATABASES;: DB조회하기
- CREATE DATABASE 데이터베이스명;: DB 만들기
- USE 데이터베이스명;: DB 선택하기
- SHOW 테이블명 STATUS: 테이블의 상태를 보여줌 
- DESCRIBE 테이블명: 테이블 schema, 열 조회하기

## 2-2) DDL(Data Definition Language)
- RDB의 구조를 정의하는 언어
- CREATE, ALTER, DROP 등등

> CREATE
- CREATE TABLE 테이블명 ( 칼럼명 칼럼특성 데이터타입 특징);
  - default, not null 등의 타입을 넣을 수 있음
- CREATE VIEW 뷰이름 AS SELECT * FROM 테이블명;: 뷰(view) 생성하기. 뷰란? 테이블로부터 유도된 가상의 테이블

> ALTER
- ALTER TABLE 테이블명 RENAME TO 새테이블명;: 테이블명 변경하기
- ALTER TABLE 테이블명 ADD (새칼럼명 데이터타입 특징);: 칼럼 추가하기
- ALTER TABLE 테이블명 MODIFY (컬럼명 데이터타입 특징);: 칼럼 변경하기
- ALTER TABLE 테이블명 DROP COLUMN 칼럼명;: 칼럼 삭제하기
- ALTER TABLE 테이블명 RENAME COLUMN 칼럼명 TO 새칼럼명;: 칼럼 이름 바꾸기

> DROP
- DROP TABLE 테이블명;: 테이블 삭제하기
- DROP TABLE 테이블명 CASCADE CONSTRAINT;: 테이블 삭제하기. 참조된 제약사항도 모두 삭제
- DROP TABLE 테이블명 CASCADE CONSTRAINT;: 참조된 제약사항도 모두 삭제하기
- DROP VIEW 뷰이름;: 뷰 삭제하기

> DELETE
- DELETE FROM 테이블명 WHERE 조건 = 조건;

## 2-3) DML(Data Manipulation Language)
- 테이블에서 데이터를 입력, 수정, 삭제, 조회함
- INSERT, UPDATE

> INSERT
- INSERT INTO 테이블명 (칼럼명1, 칼럼명2) VALUES (값1, 값2);: 칼럼에 데이터 입력하기, 칼럼명은 생략할 수 있다. 저장하기 위해서는 commit해야 됨.
- INSERT INTO 테이블1 SELECT * FROM 테이블2;: 테이블2의 모든 데이터를 테이블1에 넣는다.
<br>

> ALTER
- ALTER TABLE 테이블명 NOLOGGING;: 로그파일의 기록을 남기지 않아 입력 시 성능을 향상시키는 방법!
- UPDATE 테이블명 SET 컬럼명&조건 WHERE 조건;: 입력된 데이터의 값을 수정하기 위함, 조건 미입력 시 모든 데이터가 수정됨
<br>

> UPDATE
- UPDATE 테이블명  
  SET 칼럼1=값1, 칼럼2=값2  
  WHERE 칼럼3=값3

> DELETE
- DELETE FROM 테이블명 WHERE 칼럼명&조건: 원하는 조건을 검색해서 행을 삭제. 조건 미입력 시 모든 데이터 삭제
- DELETE FROM 테이블명;: 테이블의 모든 데이터를 삭제. 용량이 감소하지는 않음
- TRUNCATE TABLE 테이블명;: 테이블의 모든 데이터를 삭제함. `용량이 초기화`됨
<br>

> SELECT
- SELECT 칼럼명 FROM 테이블명 LIMIT 숫자;: 조회를 제한할 수 있다.
- SELECT 칼럼명1, 칼럼명2 FROM 테이블명 WHERE 조건;: 데이터 조회. 원하는 칼럼 선택하기 (*)

>> ORDER BY
- SELECT 칼럼명 FROM 테이블명 ORDER BY 칼럼명1 ASC, 칼럼명2 DESC;: 정렬할 때 사용, ORDER BY의 default는 ASC이다.
- SELECT DISTINCT 칼럼명 FROM 테이블명 ORDER BY 칼럼명;: `중복된 데이터를 한 번만 조회`함

>> Alias
- SELECT 칼럼명 AS "줄인이름" FROM 테이블명 테이블약칭 WHERE 조건;: Alias 사용방법

>> WHERE
- SELECT 칼럼명 FROM 테이블명 WHERE 조건1 `AND` 조건2;: 복수 조건 이용하기
- SELECT 칼럼명 FROM 테이블명 WHERE 조건1 `OR` 조건2;: 복수 조건 이용하기

>> `LIKE`: wild card 사용하기
- SELECT 칼럼명 FROM 테이블명 WHERE 조건1 LIKE '%';: 와일드카드 사용하기. 모든 것을 탐색
- SELECT 칼럼명 FROM 테이블명 WHERE 조건1 LIKE '_';: 와일드카드 사용하기. 글자 단위로 탐색

>> BETWEEN
- SELECT 칼럼명 FROM 테이블명 WHERE 칼럼명 BETWEEN 조건1 AND 조건2;: BETWEEN문 사용하기
- SELECT 칼럼명 FROM 테이블명 WHERE 칼럼명 NOT BETWEEN 조건;: `NOT BETWEEN`문 사용하기

>> IN
- SELECT 칼럼명 FROM 테이블명 WHERE 칼럼명 IN (조건1, 조건2);: IN문 싸용하기

>> IS NULL
- SELECT 칼럼명 FROM 테이블명 WHERE 칼럼명 IS NULL;: 칼럼 속에서 null값 조회하기
- SELECT 칼럼명 FROM 테이블명 WHERE 칼럼명 IS NOT NULL;: 칼럼 속에서 null값 아닌 거 조회하기
- SELECT IFNULL(칼럼명, 값) FROM 테이블명;: null값 처리하기

> GROUP
>> GROUP BY
- 소규모 행을 그룹화하여 합계, 평균, 최대값, 최소값 등을 계산
- HAVING구에 조건문을 사용함
- ORDER BY로 정렬할 수 있다.

>> `HAVING`
- GROUP BY에 조건절을 사용하기 위해 HAVING을 사용해야 함.

> DECODE
- IF문으로 구현. 조건이 참이면 A, 거짓이면 B를 반환
- DECODE(칼럼, 조건, A, B)

> CASE
- 조건문 사용!
- CASE  
  WHEN 조건1 THEN 결과1  
  WHEN 조건2 THEN 결과2  
  WHEN 조건3 THEN 결과3  
  ELSE 결과4  
  END

> ROWNUM
- 조회되는 행 수를 제한할 때 사용

> ROWID
- Orcale DB 내에서 데이터를 구분할 수 있는 유일한 값

> WITH
- 서브쿼리를 사용해서 임시 테이블이나 뷰처럼 사용할 수 있는 구문

> 집계함수 종류
- COUNT(), COUNT(*)은 NULL 값을 포함한 모든 행수를 계산
- SUM()
- AVG()
- MAX(), MIN()
- STDDEV()
- VARIAN()

> SELECT문 실행순서
- `FROM => WHERE => GROUP BY => HAVING => SELECT => ORDER BY`

> 형변환
- TO_NUMBER(문자열)
- TO_CHAR
- TO_DATE(문자열, 포맷)

> 내장형 함수
- ACSII(문자): 문자, 숫자를 ACSII 코드 값으로 변환함
- CHAR(ACSII코드값): ACSII 코드 값을 문자로 변환
- SUBSTR(문자열,m,n): 문자열에서 m번째 위치부터 n개를 자른다.
- CONCAT(문자열1, 문자열2): 결합하기!
- LOWER(문자열): 소문자 변환
- UPPER(문자열): 대문자 변환
- LEN(문자열): 길이 반환
- LTRIM(문자열, 지정문자): 왼쪽에 지정된 문자를 삭제, 없으면 공백 삭제
- RTRIM(문자열, 지정문자): 오른쪽에 지정된 문자를 삭제, 없으면 공백 삭제
- `TRIM(문자열, 지정문자)`: 양쪽에 지정된 문자를 삭제, 없으면 공백 삭제
- ABS(숫자): 절대값 반환
- SIGN(숫자): 양수, 음수, 0을 구별
- MOD(숫자1, 숫자2): 나머지 계산, %
- CEIL(숫자), CEILING(숫자): 올림
- FLOOR(숫자): 내림
- ROUND(숫자, m): 소수점 m 자리에서 반올림
- TRUNC(숫자, m): 소수점 m 자리에서 절삭
- LENGTH( ): 전달받은 문자열의 길이를 반환
- CONCAT( ): 전달받은 문자열을 모두 결합하여 하나의 문자열로 반환
- LOCATE( ): 문자열 내에서 찾는 문자열이 처음으로 나타나는 위치를 찾아서 해당 위치를 반환. 찾는 문자열이 존재하지 않으면 0을 반환. MySQL은 문자열의 시작 index를 1부터 계산
- LEFT( ): 문자열의 왼쪽부터 지정한 개수만큼의 문자를 반환
- RIGHT( ): 문자열의 오른쪽부터 지정한 개수만큼의 문자를 반환
- REPLACE( ): 문자열에서 특정 문자열을 대체 문자열로 교체
- FORMAT( ): 숫자 타입의 데이터를 세 자리마다 쉼표를 사용하는 형식으로 변한. 반환되는 데이터는 str, 두 번째 인수는 반올림할 소수 부분의 자릿수
- SQRT( ): 양의 제곱근
- POW( ): 첫 번째 인수로는 밑수, 두 번째 인수로는 지수를 전달하여 거듭제곱 계산
- EXP( ): 인수로 지수를 전달받아, e의 거듭제곱을 계산
- LOG( ): 자연로그 값을 계산
- SIN( ): 사인값 반환
- COS( ): 코사인값 반환
- TAN( ): 탄젠트값 반환
- ABS(X): 절대값을 반환
- RAND( ): 0.0보다 크거나 같고 1보다 작은 하나의 실수를 무작위로 생성
- NOW( ): 현재 날짜와 시간을 반환 
- CURDATE( ): 현재 날짜를 반환
- CURTIME( ): 현재 시간을 반환
- DATE( ): 전달받은 값에 해당하는 날짜 정보를 반환
- MONTH( ): 월에 해당하는 값을 반환
- DAY( ): 일에 해당하는 값을 반환
- HOUR( ): 시간에 해당하는 값을 반환
- MINUTE( ): 분에 해당하는 값을 반환
- SECOND( ): 초에 해당하는 값을 반환
- MONTHNAME( ): 월 이름을 반환
- DAYNAME( ): 요일 이름을 반환
- DAYOFWEEK( ): 해당 주에서 몇 번째 날인지를 반환
- DAYOFMONTH( ): 해당 월에서 몇 번째 날인지를 반환
- DAYOFYEAR( ): 해당 연도에서 몇 번째 날인지를 반환
- DATE_FORMAT( ): 전달받은 형식에 맞춰 날짜, 시간 정보를 문자열로 반환


## 2-4) DCL(Data Control Language)
- 사용자에게 권한을 부여하거나 회수한다.

> GRANT
- DB 사용자에게 권한을 부여
- 권한 종류로는 SELECT, INSERT, UPDATE, DELETE, REFERENCES, ALTER, INDEX, ALL가 있다.
- WITH GRANT OPTION, WITH ADMIN OPTION도 부여가능
- GRANT 권한 ON 테이블명 TO user;

> REVOKE
- 권한을 회수
- REVOKE 권한 ON 테이블명 FROM user;


## 2-5) TCL(Transaction Control Language)
- 트랜잭션을 제어하는 명령어

> COMMIT
- 변경한 데이터를 DB에 반영
- 변경 전 데이터는 잃어버림

> ROLLBACK
- 데이터에 대한 변경 사용을 모두 취소하고 트랜잭션을 종료
- rollback;

> SAVEPOINT
- 트랜잭션을 작게 분할하여 관리
- 지정된 위치까지만 트랜잭션을 ROLLBACK할 수 있음
- savepoint 이름;
- rollback to savepoint이름;

## 2-6) 고급 SQL

> JOIN
- SELECT 칼럼명 FROM 테이블1, 테이블2 WHERE 조건;: 테이블 합치기
- SELECT 칼럼명 FROM 테이블1  
  INNER JOIN  
  테이블2 ON 조건;: Inner join 하기. join문에 조건 및 정렬가능

> INTERSECT
- SELECT 칼럼명 FROM 테이블명 WHERE 조건  
  INTERSECT  
  SELECT 칼럼명 FROM 테이블명 WHERE 조건;: 교집합을 조회한다.

> LEFT, RIGHT, CROSS JOIN
- 정확하게 일치하지 않는 것을 조인하는 것.
- (+)=로 OUTER JOIN을 할 수 있음
- SELECT 칼럼명 FROM 테이블1 LEFT OUTER JOIN 테이블2 ON 조건;: LEFT OUTER JOIN
- SELECT 칼럼명 FROM 테이블1 RIGHT OUTER JOIN 테이블2 ON 조건;: RIGHT OUTER JOIN 
- SELECT 칼럼명 FROM 테이블1 CROSS JOIN 테이블2;: CROSS JOIN하기

> UNION
- UNION 연산은 두 개의 테이블을 하나로 합치는 것이다. `테이블 칼럼 수, 형식이 모두 일치해야 함`
- `중복된 데이터`는 알아서 `제거`함
- SELECT 칼럼명 FROM 테이블1  
  UNION  
  SELECT 칼럼명 FROM 테이블2;: 이게 기본 method

> UNION ALL
- `중복을 제거하거나 정렬을 하지 않음`
- SELECT 칼럼명 FROM 테이블1  
  UNION ALL  
  SELECT 칼럼명 FROM 테이블2;

> MINUS
- 차집합을 만드는 방법으로 먼저 쓴 SELECT문에 있고 뒤 SELECT문에 없는 것을 조회
- SELECT 칼럼명 FROM 테이블1  
  MINUS  
  SELECT 칼럼명 FROM 테이블2;

> Subquery
- SELECT문 속에 SELECT문이 있는 SQL문.
- 단일 행 subquery: 하나의 행만 반환하는 서브쿼리
- 다중 행 subquery: 여러 개의 행을 반환하는 subquery. IN, ANY, ALL, EXISTS 등 다중 행 비교연산자를 사용해야 함.

>> IN
  - subquery 결과 중 하나만 동일하면 참(OR조건)

>> ALL
  - 메인쿼리와 서브쿼리의 결과가 모두 동일하면 참

>> EXISTS
  - Subquery로 어떤 데이터 존재 여부를 확인하기

>> Scale Subquery
  - 반드시 한 행과 한 칼럼만 반환하는 서브쿼리
  - 여러 행이 반환되면 오류가 발생함

>> Correlated Subquery
  - Subquery 내에서 Main Query 내의 칼럼을 사용하는 것
  
> Inline view
- FROM문에 SELECT문을 사용한 것

> Group
>> Rollup
  - GROUP BY의 칼럼에 대해서 Subtotal을 만들어줌

>> GROUPING
  - ROLLUP, CUBE, GROUPING SETS에서 생성되는 합계 값을 구분하기 위한 함수
  
>> GROUPING SETS
  - GROUP BY에 나오는 칼럼 순서와 관계없이 다양한 소계를 만들 수 있음
  - 칼럼의 순서와 관계없이 개별적으로 모두 처리함

> CUBE
- 제시한 칼럼에 대해서 결합 가능한 모든 집계를 계산한다.

> Window
- WINDOW 함수는 행과 행 간의 관계를 정의하기 위해서 제공되는 함수

>> RANK 관련
>>> RANK
  - 특정항목 및 파티션에 대해서 순위를 계산

>>> DENSE_RANK
  - 동일한 순위를 하나의 건수로 계산함.

>>> ROW_NUMBER
  - 동일한 순위에 대해서 고유의 순위를 부여함.

>> 연산관련
>>> SUM
  - 파티션 별로 합계를 계산

>>> AVG
  - 파티션 별로 평균을 계산

>>> COUNT
  - 파티션 별로 행 수를 계산

>>> MAX, MIN
  - 파티션 별로 최대값, 최소값을 계산

>> 행 순서 관련
>>> FIRST_VALUE
- 파티션에서 가장 처음에 나오는 값을 구함. MIN 함수와 같은 결과

>>> LAST_VALUE
- 파티션에서 가장 나중에 나오는 값을 구함. MAX 함수와 같은 결과

>>> LAG
- 이전 행을 가지고 온다.

>>> LEAD
- 윈도우에서 특정 위치의 행을 가지고 옴
- 기본값은 1

>> 비율 관련 함수
>>> CUME_DIST
- 파티션 전체 건수에서 현재 행보다 작거나 같은 건수에 대한 누적 백분율 조회

>>> PERCENT_RANK
- 파티션에서 제일 먼저 나온 것을 0, 제일 늦게 나온 것을 1로 하여 값이 아닌 행의 순서별 백분율을 조회

>>> NTILE
- 파티션별로 전체 건수를 ARGUMENT 값으로 N등분한 결과를 조회

>>> RATIO_TO_REPORT
- 파티션 내에 전체 SUM에 대한 행 별 칼럼 값의 백분율을 소수점까지 조회함.


> Table Partition
- partition은 대용량의 테이블을 여러 개의 데이터 파일에 분리해서 저장하는 것
- 종류로는 range partition, list partition, hash partition이 있다.

---

## 🚦 3. Optimizer
- Optimizer란 SQL의 실행 계획을 수립하고 SQL을 실행하는 데이터베이스 관리 시스템의 소프트웨어

> PLAN_TABLE
- DESC PLAN_TABLE;: 실행계획을 조회

---

## 🚦 4. 기타
### MySQL database 접속이 계속 안 될 때
- MySQL을 Terminal로 접속한 다음에   
$ ALTER user 'root'@'localhost' identified with mysql_native_password BY '비밀번호'  
- 이 명령을 입력하면 된다.  


<h3 align="center"><strong>끗! 🙌</strong></h3>
