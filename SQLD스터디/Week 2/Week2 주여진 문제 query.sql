USE design;
SHOW tables;
SELECT * FROM members;

INSERT INTO members VALUES (8, 'hyunjin', 26, 'expelled');

/* 3번 문제 */
/* 풀이 1 */
SELECT id, amount FROM payment
ORDER BY amount DESC
LIMIT 1;

/* 풀이 2 */
SELECT id, amount FROM payment
WHERE amount = (SELECT MAX(amount) FROM members);

/* 4번 문제 */
SELECT book_id, bookname, purchaser FROM book_purchase
WHERE bookname LIKE '%경제%';

/* 5번 문제 */
/* testscore Table 만들었음 */
CREATE TABLE testscore (
score INT(5) );

SELECT * FROM testscore;

INSERT INTO testscore VALUES (3), (10), (7), (2), (6), (4), (8);

SELECT
	*,
    CASE
		WHEN score IN ('10', '9', '8','7')
		THEN 'A'
		WHEN score IN ('6','5','4')
		THEN 'B'
		WHEN score IN ('3','2', '1')
		THEN 'C'
		ELSE 'F'
	END AS grade,
    score
FROM testscore;
