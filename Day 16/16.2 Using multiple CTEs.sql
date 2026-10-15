
WITH cte1 AS(
	-- First CTE query
	SELECT column1, column2, ..
	FROM table_name
	WHERE condition
),
cte2 AS(
	-- Second CTE query, which can reference cte1
	SELECT column1, column2, ..
	FROM cte1
	WHERE condition
)
--Final query that uses defined ctes
SELECT column1, column2, ..
FROM cte_name
WHERE condition

/*
Objective:
Identify customers who have spent more 
than the average amount on rentals
and list of films they have rented.
*/

WITH customer_spendings AS
(
SELECT c.customer_id, first_name, last_name, SUM(amount) AS total_spent
FROM customer c
LEFT JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id, first_name, last_name
),
high_spending_customers AS
(
SELECT cs.customer_id, cs.first_name, cs.last_name, cs.total_spent
FROM customer_spendings cs
WHERE cs.total_spent > (SELECT AVG(total_spent) FROM customer_spendings)
)

SELECT hsc.customer_id, hsc.first_name, hsc.last_name, hsc.total_spent,
f.film_id,
f.title
FROM high_spending_customers hsc
LEFT JOIN rental r 
ON r.customer_id = hsc.customer_id
LEFT JOIN inventory i
ON i.inventory_id = r.inventory_id
LEFT JOIN film f
ON f.film_id = i.film_id

/*
Challenge:
1.Create a CTE to calculate the total rental count and total rental amount for each customer.
2.Create a CTE to calculate the average rental count across all customers.
3.Create a CTE to identify customers who have rented more than the average number 
of films (high-rental customers).
4.List the details of the films rented by these high-rental customers.
Write your SQL query (one query) to achieve the above objectives.
*/

WITH customer_totals AS
(
	SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_amount
	,COUNT(r.rental_id) AS rental_count 
	FROM customer c
	JOIN rental r ON c.customer_id = r.customer_id
	JOIN payment p ON c.customer_id = p.customer_id AND p.rental_id = r.rental_id
	GROUP BY c.customer_id, c.first_name, c.last_name
),
average_rental_count AS 
(
    SELECT AVG(rental_count) AS avg_rental_count
    FROM customer_totals
),
high_rental_customers AS
(
	SELECT ct.customer_id, ct.first_name, ct.last_name,ct.rental_count, ct.total_amount
	FROM customer_totals ct
    JOIN average_rental_count arc 
	ON ct.rental_count > arc.avg_rental_count
)
SELECT hrc.customer_id, hrc.first_name, hrc.last_name, hrc.rental_count, hrc.total_amount, f.film_id, f.title
FROM high_rental_customers hrc
JOIN rental r ON hrc.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id;
