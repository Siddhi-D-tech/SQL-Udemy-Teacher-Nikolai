/* GROUP BY
1. Used to 'GROUP' aggregation 'BY' specific column
2. if Aggregate function is there, every column must be in either '"'aggregate func' or the 'group by clause'
*/

SELECT 
customer_id
,SUM(amount)
FROM payment
WHERE customer_id < 3
GROUP BY customer_id
ORDER BY customer_id;

SELECT 
customer_id
,SUM(amount)
FROM payment
WHERE customer_id < 3
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

-- Challenges
SELECT COUNT(*),
staff_id
, SUM(amount)
FROM payment
WHERE amount != 0
GROUP BY staff_id

--GROUP by for multiple columns
-- Challenge
-- DATE FUNC : extract date from column
SELECT *
, DATE(payment_date)
FROM payment

SELECT SUM(amount)
, staff_id
FROM payment
GROUP BY staff_id
ORDER BY SUM(amount)
limit 1

SELECT staff_id
, DATE(payment_date)
, COUNT(*)
, SUM(amount)
FROM payment
WHERE amount != 0
GROUP BY staff_id, DATE(payment_date)
ORDER BY COUNT(*) DESC
limit 1

