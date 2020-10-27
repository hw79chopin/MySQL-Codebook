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