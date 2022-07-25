-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT last_name, COUNT(last_name)
FROM actor
WHERE last_name LIKE 'Wahlberg'
GROUP BY last_name;

-- 2 actors. 
-- WHY? Wahlberg it's a Swedish Royal Family name and secretary 
--of the swedish king made a request how many Wahlbergs became an actors


-- 2. How many payments were made between $3.99 and $5.99?
SELECT COUNT(amount) as payments
FROM payment
WHERE amount >= 3.99 and amount <= 5.99;

-- 5602 payments. 
-- WHY? Store needs to calculate $0.01 fee per transaction 
--between $3.99 and $5.99. 5602 * $0.01 = $56.02;


--3. What film does the store have the most of? (search in inventory)
SELECT film_id, COUNT(film_id) as films
FROM inventory
GROUP BY film_id
ORDER BY films DESC;

-- SEE RESULT
-- WHY? Check what film does the store have the most of

-- 4. How many customers have the last name ‘William’?
SELECT last_name, COUNT(last_name)
FROM customer
WHERE last_name LIKE 'William'
GROUP BY last_name;

-- 0 customers. 
-- WHY? Customer told the manager that he is a regular customer and want to
-- get a discound. But manager check customer's last name and found that he is
-- just a miser and lier. We have 'Williams'


-- 5. What store employee (get the id) sold the most rentals?
SELECT staff_id, COUNT(rental_id) as count_rentals
FROM rental
GROUP BY staff_id
ORDER BY count_rentals DESC;

-- staff_id 1 
-- WHY? To determine 'Worker of the month' we need to check who sold the most.
-- staff_id 1 sold rentals 8040!


-- 6. How many different district names are there?
SELECT COUNT(DISTINCT district) as districts
FROM address;

-- 378 different district names
-- WHY? Store owner wants to present a free DVD to every customer and
-- he wants to know how many districts he needs to visit


-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;

SELECT film_id, title
FROM film
WHERE film_id = 508;

-- film_id 508 (Lambs Cincinatti) has the most actors in it (15)
-- WHY? Guinness World Records search for the film with the most actors in it.


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT last_name
FROM customer
WHERE store_id = 1 and last_name LIKE '%es';

SELECT COUNT(last_name), store_id
FROM customer
WHERE store_id = 1 and last_name LIKE '%es'
GROUP BY store_id;

-- In store_id 1 we have 13 customers with the last name ending with 'es'
-- WHY? In this week we have a promotion 'Regular customers with the last name
-- ending with 'es' receives 1 day free rental' we need to know how many 
-- invintations (postcards) we need to send


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above
-- 250 for customers with ids between 380 and 430? 
-- (use group by and having > 250)
SELECT amount, COUNT(rental_id)
FROM payment
WHERE customer_id >= 380 and customer_id <= 430
GROUP BY amount
HAVING COUNT(rental_id) > 250
ORDER BY amount DESC;

-- $4.99 - 281 rentals
-- $2.99 - 290 rentals
-- $0.99 - 269 rentals
-- WHY? We need to check the most popular rental price in
-- specific group of customers


-- 10. Within the film table, how many rating categories are there? And what rating has the most movies total?
SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating
ORDER BY COUNT(film_id) DESC;

-- 5 rating categories. PG-13 has the most movies total (223)
-- WHY? Homework


