SHOW databases;

/* 기본 DB세팅 */
CREATE DATABASE week2;

USE week2;

/* 1번 문제*/
DROP TABLE airbnb;
CREATE TABLE airbnb (
	house_id INT ,
    house_name VARCHAR(200),
    host_id INT,
    host_name VARCHAR(200),
    neighbourhood VARCHAR(200),
    latitude VARCHAR(200),
    longtitude VARCHAR(200),
    room_type VARCHAR(50),
    price INT,
    minimum_nights INT,
    number_of_reviews INT,
    reviews_per_month VARCHAR(200),
    calculated_host_listings_count INT,
    availability_365 INT
);
SELECT * FROM airbnb;

/* 2번 문제*/
SHOW GLOBAL VARIABLES LIKE 'local_infile';

LOAD DATA LOCAL INFILE '/Users/junghyunwoo/혀누에-의한-혀누를-위한-혀누의/공부공부공부공부/대학 이후/대학 관련/연세대학교/학회관련/Ybigta/We are Team Design/2020-1/스터디/SQL/Week 2/listings_summary.csv' 
INTO TABLE airbnb 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

/* 3번 문제 */
ALTER TABLE airbnb RENAME COLUMN neighbourhood TO neighborhood;

/* 4번 문제 */
SELECT house_id, neighborhood FROM Airbnb
WHERE neighborhood IN (‘Manhattan’, ‘Brooklyn’);

/* 5번 문제 */
/* 풀이1 */
SELECT * FROM members WHERE name IN
  ( 
    SELECT USERNAME FROM members
    GROUP BY USERNAME 
    HAVING COUNT(*)>1
  );

/* 풀이2 */
SELECT host_name, COUNT(*) FROM airbnb
GROUP BY host_name
ORDER BY host_name ASC;

