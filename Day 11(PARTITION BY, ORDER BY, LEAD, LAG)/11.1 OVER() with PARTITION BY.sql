/*
--Window Functions--
1. No of rows not affected
2. We have one aggregation column that is aggregated by a certain partition.
Easy to develop and very strong in terms of the performance.

SYNTAX
AGG(agg_column) OVER(PARTITION BY partition_column)

"(PARTITION BY partition_column)" that's what we call the Window
because we don't group the data really,but we just open up basically a Window of aggregation.

Usually the results will be also returned in the order of this column that we partition by.
*/

--The sum of the amount for each customers, but still, we want to see all of those individual payments.

SELECT *
, SUM(amount) OVER(PARTITION BY customer_id)
FROM payment

SELECT *
, COUNT(*) OVER(PARTITION BY customer_id,staff_id)
FROM payment

--We get is just the total count of our query.
SELECT *
, COUNT(*) OVER()
FROM payment

SELECT *
, ROUND(AVG(amount) OVER(),2)
FROM payment

SELECT f.film_id, title, length, name,
ROUND(AVG(length) OVER(PARTITION BY name),2)
FROM film f
LEFT JOIN film_category fc
ON f.film_id = fc.film_id
LEFT JOIN category c
ON c.category_id = fc.category_id
ORDER BY film_id

SELECT *,
COUNT(*) OVER(PARTITION BY customer_id,amount)
FROM payment
ORDER BY payment_id