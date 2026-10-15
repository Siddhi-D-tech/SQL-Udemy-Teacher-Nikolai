/*
1. SELECT statement specifying the columns and aggregate functions
2. Use the GROUP BY GROUPING SETS clause For example:
(column1, column2) for grouping by both columns
3. FROM clause.
4. ORDER BY (optional)
*/

SELECT 
TO_CHAR(payment_date, 'Month') as month,
staff_id,
SUM(amount)
FROM payment
GROUP BY 
	GROUPING SETS (
	(staff_id),
	(month),
	(staff_id, month)
	);
/* Challenge
Write a query that returns the sum of the amount for each of the customers.(first name and last name)
and each staff_id. Also add the overall revenue per customer.
*/

SELECT first_name, last_name, staff_id, SUM(amount)
FROM customer c
LEFT JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY 
	GROUPING SETS(
	(first_name, last_name),
	(first_name, last_name,staff_id)
	)

/*
Additional Challenge
Write a query that calculates now share of the revenue that each of the staff ID makes per customer.
*/

SELECT first_name, last_name, staff_id, SUM(amount)
,ROUND((SUM(amount)/FIRST_VALUE(SUM(amount)) 
OVER(PARTITION BY first_name, last_name ORDER BY SUM(amount) DESC))*100,2)
as percentage
FROM customer c
LEFT JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY 
	GROUPING SETS(
	(first_name, last_name),
	(first_name, last_name,staff_id)
	)

