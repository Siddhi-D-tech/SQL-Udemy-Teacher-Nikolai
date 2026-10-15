/*
Execution Plan:
Steps and order of steps to execute a query

Query Optimizer:
Find the best way to execute the query
*/

SELECT * FROM payment

SELECT 
(SELECT AVG(amount)
FROM payment p2
WHERE p2.rental_id = p1.rental_id)
FROM payment p1

CREATE INDEX index_rental_id_payment
ON payment
(rental_id)

DROP INDEX index_rental_id_payment

SELECT rental_id FROM payment
WHERE rental_id BETWEEN 1 and 22

SELECT * FROM
payment p LEFT JOIN customer c
ON p.customer_id = c.customer_id
WHERE p.customer_id BETWEEN 4 and 50
ORDER BY 1
limit 100
