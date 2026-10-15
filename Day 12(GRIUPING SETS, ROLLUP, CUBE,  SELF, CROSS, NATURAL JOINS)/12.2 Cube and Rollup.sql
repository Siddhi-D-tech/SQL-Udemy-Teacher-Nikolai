/*
SYNTAX
GROUP BY
ROLLUP(col1,col2,col3)

Same as 

SYNTAX
GROUP BY
GROUPING SETS(
		(col1,col2,col3),
		(col1,col2),
		(col1),
		()
	)

Hierarchy is created. col1 is highest in heirarchy
So in rollup order really matters

If we have natural hierarchy(Date, one month only in one quarter), we can use the ROLLUP.
*/

SELECT 
'Q' || TO_CHAR(payment_date, 'Q') as quarter,
EXTRACT(month FROM payment_date) as month,
DATE(payment_date),
SUM(amount)
FROM payment
GROUP BY
ROLLUP(
		'Q' || TO_CHAR(payment_date, 'Q'),
		EXTRACT(month FROM payment_date),
		DATE(payment_date)
	)
ORDER BY 1,2,3

/*
Write a query that calculates a booking amount rollup for the heirarchy of 
of quarter, month, and week in month, and day
*/

SELECT 
'Q' || TO_CHAR(book_date, 'Q') as quarter,
EXTRACT(month FROM book_date) as month,
TO_CHAR(book_date,'w') as week_in_month,
DATE(book_date),
SUM(total_amount)
FROM bookings
GROUP BY
ROLLUP(
		'Q' || TO_CHAR(book_date, 'Q'),
		EXTRACT(month FROM book_date),
		TO_CHAR(book_date,'w'),
		DATE(book_date)
	)
ORDER BY 1,2,3,4

/*CUBE
SYNTAX
GROUP BY
CUBE (col1,col2,col3)

We get all possible combinations of grouping sets

Such as 

GROUP BY
GROUPING SETS(
		(col1,col2,col3),
		(col1,col2),
		(col1,col3),
		(col2,col3),
		(col1),
		(col2),
		(col3),
		()
	)

*/

SELECT
customer_id,
staff_id,
DATE(payment_date),
SUM(amount)
FROM payment
GROUP BY 
CUBE(customer_id,
		staff_id,
		DATE(payment_date)
	)
ORDER BY 1,2,3

SELECT
customer_id,
staff_id,
DATE(payment_date),
SUM(amount)
FROM payment
GROUP BY 
CUBE(customer_id,
		staff_id,
		DATE(payment_date)
	)
ORDER BY 1,2,3

/*
Write a query that returns all grouping sets in all combinations of customer_id, 
date and title with the aggregation of the payment amount.
*/

SELECT 
p.customer_id,
DATE(payment_date),
title,
SUM(amount) as total
FROM payment p
LEFT JOIN rental r
ON r.rental_id=p.rental_id
LEFT JOIN inventory i
ON i.inventory_id=r.inventory_id
LEFT JOIN film f
ON f.film_id=i.film_id
GROUP BY 
CUBE(
p.customer_id,
DATE(payment_date),
title
)
ORDER BY 1,2,3