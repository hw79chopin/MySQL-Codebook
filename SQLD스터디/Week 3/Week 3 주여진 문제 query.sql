SHOW databases;

USE practice;

/* Table들 만들어주기 */
CREATE TABLE payment (
 id INT NOT NULL,
 pay VARCHAR(10) NOT NULL,
 amount INT NOT NULL	
);

INSERT INTO payment VALUES 
(2, 'cash', 25000),
(4, 'cash', 25000),
(1, 'card', 42000),
(4, 'cash', 55000),
(4, 'card', 27000),
(3, 'card', 22000);

CREATE TABLE user (
 user_id INT NOT NULL,
 username VARCHAR(10) NOT NULL,
 sex VARCHAR(10) NOT NULL,
 age INT NOT NULL,
 register_date VARCHAR(20) NOT NULL,
 invited_by INT
);

INSERT INTO user (user_id, username, sex, age, register_date) VALUES
(1, 'weeeee', 'female', 30, '2014-02-14'),
(3, 'owee', 'male', 20, '2020-01-01');

INSERT INTO user (user_id, username, sex, age, register_date, invited_by) VALUES
(2, 'nee', 'male', 30, '2017-12-31',1),
(4, 'poaaa', 'male', 40, '2019-05-24',1),
(5, 'deeee', 'female', 10, '2020-03-21',3);

CREATE TABLE book_purchase (
book_id INT NOT NULL,
bokkname VARCHAR(20) NOT NULL,
purchaser INT NOT NULL,
dates DATE);

INSERT INTO book_purchase VALUES
(12, '한국경제사', 2, '2020-01-01'),
(13, '현대사회경제', 1, '2020-03-29'),
(10, '한국사', 2, '2020-04-30'),
(14, '페스트', 3, '2020-05-01'),
(18, '아배고파', 4, '2020-02-22'),
(11, '경제바로알기', 2, '2019-12-30'),
(12, '한국경제사', 2, '2020-03-11');

CREATE TABLE book_info (
book_id INT NOT NULL,
bookname VARCHAR(20) NOT NULL,
genre VARCHAR(20) NOT NULL,
price INT NOT NULL,
publication_date DATE);

INSERT INTO book_info VALUES
(10, '한국사', '역사', 25000, '2001-10-27'),
(11, '경제바로알기', '경제경영', 19000, '2007-05-04'),
(12, '한국경제사', '경제경영', 35000, '2019-09-27'),
(13, '현대사회경제', '경제경영', 42000, '2005-08-11'),
(14, '페스트', '고전', 12000, '2012-06-23');

/* 1번: 문제 구매 기록이 없는 유저 찾기. 유저의 id, 이름이 결과로 보이도록(힌트: user, payment 테이블 사용) */
SELECT user.user_id, user.username 
FROM user LEFT JOIN payment
ON user.user_id = payment.id
WHERE payment.id IS NULL;

/* 2번: 유저별 카드총사용금액, 현금총사용금액이 나타내세요. "유저id, 카드, 현금" 칼럼으로, id 순으로 나타내주세요 */
SELECT id, pay, sum(amount) FROM payment
GROUP BY id, pay
ORDER BY id asc;

/* 3번: 이달의 독서왕 찾기: 2020년 4월까지 책을 가장 많이(권수) 구매한 사용자의 id, 이름, 구매권수를 구매권수, id 순으로 나타내세요 */
SELECT * FROM book_purchase;

SELECT book_purchase.book_id, book_purchase.bokkname,book_purchase.dates, user.user_id, user.username FROM book_purchase
LEFT JOIN user
ON user.user_id = book_purchase.purchaser
WHERE DATE (dates) BETWEEN '2020-01-01' AND '2020-04-30';