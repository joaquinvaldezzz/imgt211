CREATE DATABASE untitled;

USE untitled;

-- CREATE TABLE salesman
-- (
--   [salesman_id] INT,
--   [name] VARCHAR(256),
--   [city] VARCHAR(256),
--   [commision] FLOAT
-- );

USE untitled;

-- CREATE TABLE customer
-- (
--   [customer_id] INT,
--   [customer_name] VARCHAR(256),
--   [city] VARCHAR(256),
--   [grade] INT,
--   [salesman_id] INT
-- );

USE untitled;

-- CREATE TABLE orders
-- (
--   [order_no] INT,
--   [purch_amt] FLOAT,
--   [order_date] DATE,
--   [customer_id] INT,
--   [salesman_id] INT
-- );

INSERT INTO dbo.salesman
VALUES
  (5001, 'James Hoog', 'New York', 0.15),
  (5002, 'Nail Knite', 'Paris', 0.13),
  (5005, 'Pit Alex', 'London', 0.11),
  (5006, 'Mc Lyon', 'Paris', 0.14),
  (5003, 'Lauson Hen', '', 0.12),
  (5007, 'Paul Adam', 'Rome', 0.13);

-- Query 1
SELECT name, commision
FROM dbo.salesman;

INSERT INTO dbo.customer
VALUES
  (3002, 'Nick Rimando', 'New York', 100, 5001),
  (3005, 'Graham Zusi', 'California', 200, 5002),
  (3001, 'Brad Guzan', 'London', NULL, NULL),
  (3004, 'Fabian Johns', 'Paris', 300, 5006),
  (3007, 'Brad Davis', 'New York', 200, 5001),
  (3009, 'Geoff Camero', 'Berlin', 100, NULL),
  (3008, 'Julian Green', 'London', 300, 5002),
  (3001, 'Jory Altidor', 'Moncow', 200, 5007);

INSERT INTO dbo.orders
VAlUES
  (70001, 150.5, '2016-10-05', 3005, 5002),
  (70009, 270.65, '2016-09-10', 3001, NULL),
  (70002, 65.26, '2016-10-05', 3002, 5001),
  (70004, 110.5, '2016-08-17', 3009, NULL),
  (70007, 948.5, '2016-09-10', 3005, 5002),
  (70005, 2400.6, '2016-07-27', 3007, 5001),
  (70008, 5760, '2016-09-10', 3002, 5001),
  (70010, 1983.43, '2016-10-05', 3004, 5006),
  (70003, 2480.4, '2016-10-10', 3009, NULL),
  (70012, 250.45, '2016-06-27', 3008, 5002),
  (70011, 75.29, '2016-08-17', 3003, 5007);

-- Query 2
SELECT DISTINCT salesman_id
FROM dbo.orders;

-- Query 3
SELECT name, city
FROM dbo.salesman
WHERE city = 'Paris';

-- Query 4
SELECT *
from dbo.customer
WHERE grade = 200;

-- Query 5
SELECT order_no, order_date, purch_amt
FROM dbo.orders
WHERE salesman_id = 5001;

-- Query 12
SELECT *
FROM dbo.customer
WHERE city = 'New York' OR NOT grade > 100;

-- Query 13
SELECT salesman_id, name, city, commision
FROM dbo.salesman
WHERE (commision > 0.10 AND commision < 0.12);

-- Query 14
SELECT *
FROM dbo.customer
WHERE customer_name LIKE '%n';

-- Query 15
SELECT *
FROM dbo.salesman
WHERE name LIKE 'N__l%';

-- Query 16
SELECT *
FROM dbo.customer
WHERE grade IS NULL;

-- Query 17
SELECT SUM(purch_amt)
FROM dbo.orders;

-- Query 18
SELECT COUNT(DISTINCT salesman_id)
FROM dbo.orders;

-- Query 19
SELECT city, MAX(grade)
FROM dbo.customer
GROUP BY city;

-- Query 20
SELECT customer_id, MAX(purch_amt)
FROM dbo.orders
GROUP BY customer_id;

-- Query 21
SELECT customer_id, order_date, MAX(purch_amt)
FROM dbo.orders
GROUP BY customer_id, order_date;

-- Query 22
SELECT salesman_id, MAX(purch_amt)
FROM dbo.orders
WHERE order_date = '2012-08-17'
GROUP BY salesman_id;

-- Query 23
SELECT customer_id, order_date, MAX(purch_amt)
FROM dbo.orders
GROUP BY customer_id, order_date
HAVING MAX(purch_amt) > 2000.00;

-- Query 24
SELECT COUNT(*)
FROM dbo.orders
WHERE order_date = '2021-08-17';

-- ---

-- Query 1
SELECT customer.customer_name, salesman.name, salesman.city
FROM salesman, customer
WHERE salesman.city = customer.city;

-- Query 2
SELECT customer.customer_name, salesman.name
FROM customer, salesman
WHERE salesman.salesman_id = customer.salesman_id;

-- Query 3
SELECT order_no, customer_name, orders.customer_id, orders.salesman_id
FROM salesman, customer, orders
WHERE customer.city <> salesman.city
  AND orders.customer_id = customer.customer_id
  AND orders.salesman_id = salesman.salesman_id;

-- Query 4
SELECT *
FROM orders
WHERE salesman_id = (
	SELECT salesman_id
FROM salesman
WHERE name = 'Paul Adam'
	);

-- Query 5
SELECT *
FROM orders
WHERE purch_amt > (SELECT AVG(purch_amt)
FROM orders
WHERE order_date = '2012-10-10');

-- Query 6
SELECT *
FROM orders
WHERE salesman_id IN
	(SELECT salesman_id
FROM salesman
WHERE city ='Paris');

-- Query 7
SELECT order_no, purch_amt, order_date, salesman_id
FROM orders
WHERE salesman_id IN (
		SELECT salesman_id
FROM salesman
WHERE commision = (
		SELECT MAX(commision)
FROM salesman)
	);


-- Query 8
SELECT salesman_id, name
FROM salesman AS a
WHERE 1 <
	(SELECT COUNT(*)
FROM customer AS c
WHERE c.salesman_id = a.salesman_id);


-- Query 9
SELECT *
FROM salesman
WHERE salesman_id IN (
	SELECT DISTINCT salesman_id
FROM customer a
WHERE NOT EXISTS (
	SELECT *
FROM customer b
WHERE a.salesman_id = b.salesman_id
  AND a.customer_name <> b.customer_name));

-- Query 10
SELECT *
FROM Orders
WHERE purch_amt > ANY
	(SELECT purch_amt
FROM orders
WHERE order_date = '2012-09-10');

-- Query 11
SELECT *
FROM customer
WHERE grade > ALL
	(SELECT grade
FROM customer
WHERE city = 'NewYork');

------

CREATE TABLE nobel_win
(
  YEAR VARCHAR(50),
  SUBJECT VARCHAR(50),
  WINNER VARCHAR(50),
  COUNTRY VARCHAR(50),
  CATEGORY VARCHAR(50)
);

INSERT INTO nobel_win
VALUES
  (1970, 'Physics', 'Hannes Alfven', 'Sweden', 'Scientist'),
  (1970, 'Physics', 'Louis Neel', 'France', 'Scientist'),
  (1970, 'Chemistry', 'Luis Fedeico', 'Leloir', 'Scientist'),
  (1970, 'Physiology', 'Ulf von Eular', 'Sweden', 'Scientist'),
  (1970, 'Physiology', 'Bernard Katz', 'Germany', 'Scientist'),
  (1970, 'Literature', 'Aleksandr Solzhenitsyn', 'Russia', 'Linguist'),
  (1970, 'Economics', 'Paul Samuelson', 'USA', 'Economist'),
  (1970, 'Physiology', 'Julius Axelrod', 'USA', 'Scientist'),
  (1971, 'Physics', 'Dennis Gabor', 'Hungary', 'Scientist'),
  (1971, 'Chemistry', 'Gerhard Herzberg', 'Germany', 'Scientist'),
  (1971, 'Peace', 'Willy Brandt', 'Germany', 'Chancellor'),
  (1971, 'Literature', 'Pablo Neruda', 'Chile', 'Linguist'),
  (1971, 'Economics', 'Simon Kuznets', 'Russia', 'Economist'),
  (1978, 'Peace', 'Anwar al-Sadat', 'Egypt', 'President'),
  (1978, 'Peace', 'Menachem Begin', 'Israel', 'Prime Minister'),
  (1987, 'Chemistry', 'Donald J. Cram', 'USA', 'Scientist'),
  (1987, 'Chemistry', 'Jean-Marie Lehn', 'France', 'Scientist'),
  (1987, 'Physiology', 'Susumu Tonegawa', 'Japan', 'Scientist'),
  (1994, 'Economics', 'Reinhard Selten', 'Germany', 'Economist'),
  (1994, 'Peace', 'Yitzhak Rabin', 'Israel', 'Prime Minister'),
  (1987, 'Physics', 'Johannes Georg Bednorz', 'Germany', 'Scientist'),
  (1987, 'Literature', 'Joseph Brodsky', 'Russia', 'Linguist'),
  (1987, 'Economics', 'Robert Solow', 'USA', 'Economist'),
  (1994, 'Literature', 'Kenzaburo Oe', 'Japan', 'Linguist');

SELECT *
FROM nobel_win

------

-- 1.
SELECT name, commision
FROM salesman;

-- 2.
SELECT DISTINCT salesman_id
FROM orders;

-- 3.
SELECT name, city
FROM salesman
WHERE City = 'Paris';

-- 4.
SELECT *
FROM customer
WHERE grade = 200;

-- 5.
SELECT order_no, order_date, purch_amt
FROM
  orders
WHERE salesman_id = 5001;

-- 6.
SELECT winner
FROM nobel_win
WHERE year = 1971 AND subject = 'Literature';

-- 7.
SELECT *
FROM nobel_win
WHERE winner LIKE 'Louis%';

-- 8.
  SELECT *
  FROM nobel_win
  WHERE subject = 'Physics' AND year = 1970
UNION
  SELECT *
  FROM nobel_win
  WHERE subject = 'Economics' AND year = 1971;

-- 9.
SELECT *
FROM nobel_win
WHERE year = 1970 AND subject NOT IN ('Physiology', 'Economics');

-- 10.
SELECT *
FROM nobel_win
WHERE subject NOT LIKE 'P%'
ORDER BY year DESC, winner;

-- 11.
SELECT pro_name, pro_price
FROM item_mast
WHERE pro_price = (SELECT MIN(pro_price)
FROM item_mast);

-- 12.
SELECT *
FROM customer
WHERE city = 'New York' OR NOT grade > 100;

-- 13.
SELECT *
FROM salesman
WHERE commision BETWEEN 0.12 AND 0.14;

-- 14.
SELECT *
FROM salesman
WHERE name LIKE '%__n';

-- 15.
SELECT *
FROM salesman
WHERE name LIKE 'N__l%';

-- 16.
SELECT *
FROM customer
WHERE grade IS NULL;

-- 17.
SELECT SUM(purch_amt)
FROM
  orders;

-- 18.
SELECT COUNT(DISTINCT salesman_id)
FROM
  orders;

-- 19.
SELECT city, MAX(grade)
FROM customer
GROUP BY city;

-- 20.
SELECT customer_id, MAX(purch_amt)
FROM
  orders
GROUP BY customer_id;

-- 21.
SELECT customer_id, order_date, MAX(purch_amt)
FROM
  orders
GROUP BY customer_id, order_date;

-- 22.
SELECT salesman_id, MAX(purch_amt)
FROM
  orders
WHERE order_date = '2012-08-17'
GROUP BY salesman_id;

-- 23.
SELECT customer_id, order_date, MAX(purch_amt)
FROM
  orders
GROUP BY customer_id, order_date
HAVING MAX
(purch_amt) > 2000.00;

CREATE TABLE item_mast
(
  [pro_id] INT PRIMARY KEY NOT NULL,
  [pro_name] CHAR(64) NOT NULL,
  [pro_price] SMALLMONEY,
  [pro_com] INT
)

INSERT INTO [item_mast]
  ([pro_id], [pro_name], [pro_price], [pro_com])
VALUES
  (101, 'Mother Board', 3200.00, 15)
GO

INSERT INTO [item_mast]
  ([pro_id], [pro_name], [pro_price], [pro_com])
VALUES
  (102, 'Key Board', 450.00, 16),
  (103, 'ZIP Drive', 250.00, 14),
  (104, 'Speaker', 550.00, 16),
  (105, 'Monitor', 5000.00, 11),
  (106, 'DVD Drive', 900.00, 12),
  (107, 'CD Drice', 800.00, 12),
  (108, 'Printer', 2600.00, 13),
  (109, 'Refill cartridge', 350.00, 13)
GO

INSERT INTO [item_mast]
  ([pro_id], [pro_name], [pro_price], [pro_com])
VALUES
  (110, 'Mosue', 250.00, 12)
GO

SELECT *
FROM item_mast
