/*
A subquery is basically a query within a query

Subqueries must be enclosed within those parentheses.
*/

SELECT AVG(amount)
FROM payment;

SELECT *
FROM payment
WHERE amount > 4.2006673312979002;

/*instead of using this fixed value */

SELECT *
FROM payment
WHERE amount > (SELECT AVG(amount) FROM payment);


SELECT *
FROM payment
WHERE customer_id = (SELECT customer_id FROM customer 
					WHERE first_name = 'ADAM');

SELECT *
FROM payment
WHERE customer_id IN (SELECT customer_id FROM customer 
					WHERE first_name LIKE 'A%');

-- Challenge
SELECT film_id,title
FROM film
WHERE length > ( SELECT AVG(length) FROM film);

SELECT *
FROM inventory;

SELECT film_id
FROM inventory
WHERE store_id = 2
GROUP BY film_id
HAVING COUNT(*) > 3;

SELECT film_id, title
FROM film
WHERE film_id IN (SELECT film_id
				FROM inventory
				WHERE store_id = 2
				GROUP BY film_id
				HAVING COUNT(*) > 3);

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (SELECT customer_id 
					FROM payment
					WHERE DATE(payment_date) = '2020-01-25');


--  All of the first names and email that have spent more than $30 in total

SELECT first_name, email
FROM customer
WHERE customer_id IN (SELECT customer_id
					FROM payment
					GROUP BY customer_id
					HAVING SUM(amount) > 30);


SELECT address_id
FROM address
WHERE district = 'California'

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (SELECT customer_id
					FROM payment
					GROUP BY customer_id
					HAVING SUM(amount) > 100)
	AND address_id IN (SELECT address_id
					FROM address
					WHERE district = 'California')  ;


