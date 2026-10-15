/*
Every single row evaluated independently
Correlated Subqueries does not work independently
*/

-- Show only those payments that have the highest amount per customer
SELECT *
FROM payment p1
WHERE amount = (SELECT MAX(amount)
				FROM payment p2
				WHERE p1.customer_id = p2.customer_id)
ORDER BY customer_id;


/* Show those movie titles, their associated film_id and replacement_cost
with the lowest replacement_cost for every single rating category,
so you should also include the rating itself.
*/
SELECT film_id, title, replacement_cost, rating
FROM film f1
WHERE replacement_cost = 
(SELECT MIN(replacement_cost) FROM film f2 WHERE f1.rating = f2.rating)
ORDER BY film_id

/*
Show only those movie titles their associated film_id, and the length
that have the highest length in their category.
you should show the rating itself.
*/

SELECT film_id, title, length, rating
FROM film f1
WHERE length = (SELECT MAX(length) FROM film f2 WHERE f1.rating = f2.rating )
