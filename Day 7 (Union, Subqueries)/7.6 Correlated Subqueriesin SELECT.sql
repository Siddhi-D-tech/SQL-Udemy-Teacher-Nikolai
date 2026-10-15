/*
Correlated Subqueries can not be used in FROM but in WHERE/SELECT
*/

--Show maximum amount for every customer

SELECT *,
(SELECT MAX(amount) FROM payment p2 WHERE p2.customer_id = p1.customer_id) max_amount
FROM payment p1
ORDER BY customer_id

/*
Show all of the payments, plus the total amount for every customer.
and also the number of payments of that each customer
*/

SELECT *,
(SELECT SUM(amount)FROM payment p2 WHERE p1.customer_id = p2.customer_id ) sum_amount
,(SELECT COUNT(*) FROM payment p2 WHERE p1.customer_id = p2.customer_id) count_payments
FROM payment p1
ORDER BY customer_id

/*
Show only those films with the highest replacement cost in their rating category.
plus the average replacement cost in their rating category
*/

SELECT film_id, title, rating, replacement_cost
, (SELECT ROUND(AVG(replacement_cost),2) FROM film f2 WHERE f2.rating = f1.rating) avg_replacement_cost
FROM film f1
WHERE replacement_cost =
(SELECT MAX(replacement_cost) FROM film f3 WHERE f3.rating = f1.rating)

/*
Show only those payments with the highest payment amount for each customer's first name
include the payment_id of that same payment.

how would you solve this if you would not need to see the payment_id?
*/

SELECT first_name, payment_id, amount
FROM payment p
INNER JOIN customer c
ON p.customer_id = c.customer_id
WHERE amount = (SELECT MAX(amount) FROM payment p2 WHERE p2.customer_id = p.customer_id)


--how would you solve this if you would not need to see the payment_id?
SELECT first_name, MAX(amount)
FROM payment p
INNER JOIN customer c
ON p.customer_id = c.customer_id
GROUP BY first_name
