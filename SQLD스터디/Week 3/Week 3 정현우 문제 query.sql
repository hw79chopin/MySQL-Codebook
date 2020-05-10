SHOW DATABASES;

USE practice;

SHOW TABLES;

SELECT * FROM customers;

SELECT * FROM orderdetails;

SELECT * FROM products;

SELECT * FROM payments;

/* 문제 1번 */
SELECT country, count(country) FROM customers
GROUP BY country
ORDER BY count(country) desc;

/* 문제 2번 */
ALTER TABLE orderdetails ADD totalAmout Float;
ALTER TABLE orderdetails CHANGE totalAmout totalAmount Float;   /* 칼럼 이름 바꾸기 */

SET SQL_SAFE_UPDATES = 0;   /* SAFE MODE 끄기 */
UPDATE orderdetails SET totalAmount = quantityOrdered * priceEach; /* 새로운 칼럼 만들어주기 */

SELECT productCode, sum(totalAmount) FROM orderdetails 
GROUP BY productCode
ORDER BY sum(totalAmount) desc;

/* 문제 3번 */
SELECT payments.customerNumber, sum(payments.amount),customers.contactFirstName,customers.country  FROM payments
INNER JOIN customers ON customers.customerNumber = payments.customerNumber
GROUP BY payments.customerNumber
ORDER BY sum(payments.amount) DESC LIMIT 5;

/* 문제 4번 */
SELECT orderdetails.productCode,
 sum(orderdetails.quantityOrdered) as total,
 (SELECT productDescription 
 FROM products 
 WHERE products.productCode = orderdetails.productCode) as description FROM orderdetails
INNER JOIN products ON products.productCode = orderdetails.productCode
GROUP BY productCode
ORDER BY sum(quantityOrdered) DESC LIMIT 10;

/* 문제 5번 */
SELECT orderdetails.productCode,
 sum(orderdetails.quantityOrdered) as total,
 (SELECT quantityInStock
 FROM products 
 WHERE products.productCode = orderdetails.productCode) as stock FROM orderdetails
INNER JOIN products ON products.productCode = orderdetails.productCode
GROUP BY productCode
ORDER BY total asc LIMIT 20;
