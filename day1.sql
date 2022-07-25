-- Get All Recorders from query
SELECT *
FROM actor;

SELECT *
FROM film;

-- Limit out Results
SELECT *
FROM film
LIMIT 10;

-- Omits some results and limit
SELECT *
FROM film
LIMIT 10 OFFSET 5;

SELECT * FROM actor;

SELECT first_name, last_name
FROM actor;

-- Find actors that first name is Nick
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';

-- Find actors that last name is Wahlberg
SELECT first_name, last_name
FROM actor
WHERE last_name = 'Wahlberg';

-- Look at film with id 85
SELECT *
FROM film
WHERE film_id = 85;

-- Find actors that first name is Nick using LIKE
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Nick';

-- _ any 1 character and % 0 or more numbers characters

-- Where name start with a J
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J%';

-- Query name containing a 'y'
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE '%y%' or first_name LIKE 'Y%';

-- K names that 3 letters long
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__';

-- first names that start with 'K' end 'th'
-- and have at leastt 2 characters between 'k' an 'th'

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__%th';

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Kenneth' and last_name = 'Torn';

SELECT * FROM payment;

-- Comparision operators:
-- > < >= <= 
-- <> [not equals] or !=

-- Query the Payment tables customers wwo paid an amount greater than $2

SELECT customer_id, amount
FROM payment
WHERE amount > 2.00;

SELECT customer_id, amount
FROM payment
WHERE 2.00 < amount and amount < 4.99;

-- All payments less $2 and not equal 2.99
SELECT customer_id, amount
FROM payment
WHERE 3.00 > amount and amount <> 2.99;

-- Order by a column Ascending
SELECT customer_id, amount
FROM payment
WHERE amount >= 2.00
ORDER BY amount ASC;

-- Order by a column Descending
SELECT customer_id, amount
FROM payment
WHERE amount >= 2.00
ORDER BY amount DESC;

-- Order by a column Ascending
SELECT customer_id, amount
FROM payment
WHERE amount >= 2.00
ORDER BY customer_id ASC;

SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 2.00 AND 7.99;

-- HARD
-- SQL Aggregators SUM, AVG, COUNT, MIN, MAX

-- THe sum of all amount paid
SELECT SUM(amount), customer_id
FROM payment
WHERE amount > 5.99;

-- COUNT -- HOW MANY RECORDS
SELECT COUNT(amount)
FROM payment
WHERE amount > 5.99;

-- Get unique firs names (no dups)
SELECT DISTINCT first_name
FROM actor;

-- How many unique payment amount did we have
SELECT COUNT(DISTINCT amount)
FROM payment

-- Average payment amount
SELECT AVG(amount)
FROM payment

-- Min amount in payment
SELECT MIN(amount)
FROM payment
WHERE amount != 0;

-- Alias
-- Min amount in payment
SELECT MIN(amount) AS Min_Payment
FROM payment
WHERE amount != 0;

-- Alias
-- MAX amount in payment
SELECT MAX(amount) AS Max_Payment
FROM payment
WHERE amount != 0;

-- SELECT Max_Payment
-- FROM payment;

SELECT amount, COUNT(amount)
FROM payment
GROUP BY amount;

-- Query to display different customer_ids with the 
-- summed amounts for each customer_id
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount);

SELECT customer_id, SUM(amount) as soa
FROM payment
GROUP BY customer_id
ORDER BY soa DESC;

-- Display customer_id with the amounts for each customer_id
SELECT customer_id, amount
FROM payment
GROUP BY customer_id, amount
ORDER BY amount DESC;

SELECT customer_id, SUM(amount) as soa
FROM payment
WHERE customer_id > 187
GROUP BY customer_id
HAVING SUM(amount) > 71
ORDER BY soa DESC
LIMIT 20 OFFSET 5;


SELECT COUNT(customer_id), email
FROM customer
WHERE email LIKE '%bishop%'
GROUP BY email
HAVING COUNT(customer_id) > 5
ORDER BY email LIMIT 1;

