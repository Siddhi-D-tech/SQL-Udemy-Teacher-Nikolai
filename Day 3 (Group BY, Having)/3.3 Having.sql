/*
Used to Filter Groupings by Aggregation 
Having can only be used in GROUP BY clause
Aggregate functions are not allowed in WHERE so we use Having
*/

SELECT 
customer_id
, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 200 ;

-- Challenge
SELECT customer_id
,DATE(payment_date)
, ROUND(AVG(amount),2)
, COUNT(*)
FROM payment
WHERE DATE(payment_date) IN ('2020-04-28','2020-04-29', '2020-04-30')
GROUP BY customer_id, DATE(payment_date)
HAVING COUNT(*) > 1
ORDER BY AVG(amount) DESC