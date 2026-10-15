/*
What are CTEs/WITH clause/Temporary Result Set?
A CTE is a temporary result set that you can reference within your query. 
CTEs make your SQL queries more readable and easier to manage, 
especially when dealing with complex joins and subqueries.

Here’s why CTEs are useful:

Improves Readability: 
They help break down complex queries into simpler, more understandable parts.

Reusability: 
You can reference the CTE multiple times within the same query, 
which avoids repetition of the same subquery.

Modularity: 
They allow for a modular approach to building queries, making it easier to debug and maintain.

Recursive Queries: CTEs support recursion, enabling you to write queries 
that deal with hierarchical or tree-structured data.
*/

--1)General Syntax

WITH cte_name AS(
	-- CTE query
	SELECT column1, column2, ..
	FROM table_name
	WHERE condition
)

SELECT column1, column2, ..
FROM cte_name
WHERE condition

--2) Query without CTE
SELECT film_id, title, rental_count
FROM (
	SELECT f.film_id, f.title, COUNT(r.rental_id) AS rental_count
	FROM film f
	JOIN inventory i ON f.film_id = i.film_id
	JOIN rental r ON r.inventory_id = i.inventory_id
	GROUP BY f.film_id, f.title
)AS film_rentals
WHERE rental_count > 30;

--Create CTE then following query

WITH subquery AS
(
SELECT f.film_id, f.title, COUNT(r.rental_id) AS rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON r.inventory_id = i.inventory_id
GROUP BY f.film_id, f.title
)
SELECT film_id, title, rental_count
FROM subquery AS film_rentals
WHERE rental_count > 30;

--More examples
SELECT film_id, title, rental_duration
FROM (
	SELECT f.film_id, f.title, AVG(r.return_date - r.rental_date) AS rental_duration
	FROM film f
	JOIN inventory i ON f.film_id = i.film_id
	JOIN rental r ON r.inventory_id = i.inventory_id
	GROUP BY f.film_id, f.title
)AS film_rentals
WHERE rental_duration > (
	SELECT AVG(rental_duration)
	FROM (
		SELECT AVG(r.return_date - r.rental_date) AS rental_duration
		FROM film f 
		JOIN inventory i ON f.film_id = i.film_id
		JOIN rental r ON r.inventory_id = i.inventory_id
		GROUP BY f.film_id		
		) AS subquery	
);

--WITH CTE
WITH rental_duration_cte AS
(
SELECT f.film_id, f.title, AVG(r.return_date - r.rental_date) AS rental_duration
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON r.inventory_id = i.inventory_id
GROUP BY f.film_id, f.title
)

SELECT film_id, title, rental_duration
FROM rental_duration_cte
WHERE rental_duration > (
	SELECT AVG(rental_duration)
	FROM rental_duration_cte);


/*
Challenge 1: Using a Simple CTE

Objective:
Calculate the total rental count and total rental amount for each customer, 
and list customers who have rented more than the average number of films.

Context:
In the DVD rental business, we need to understand customer behavior by calculating 
how many movies each customer has rented and how much they have spent. We will then 
identify customers who rent movies more frequently than the average customer.

Setup:
The DVD rental database already includes the following tables:
customer,rental,payment
*/

SELECT * FROM customer

SELECT * FROM payment

SELECT * FROM rental

WITH customer_rental_cte AS
(
SELECT c.customer_id, first_name, last_name, SUM(amount) AS total_amount, COUNT(*) AS rental_count
FROM customer c
LEFT JOIN rental r
ON c.customer_id = r.customer_id
LEFT JOIN payment p
ON c.customer_id = p.customer_id AND p.rental_id = r.rental_id
GROUP BY c.customer_id, first_name, last_name
)

SELECT customer_id, first_name, last_name, rental_count, total_amount
FROM customer_rental_cte
WHERE rental_count > (SELECT AVG(rental_count) FROM customer_rental_cte);


