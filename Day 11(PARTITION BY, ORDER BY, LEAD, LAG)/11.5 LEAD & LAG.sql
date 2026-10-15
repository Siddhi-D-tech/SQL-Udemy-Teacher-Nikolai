/*
LEAD() - It gives us the next value from our partition and ordering.
	   null if there is no next value

LAG() -  It gives us the previous value from our partition and ordering.
	   null if there is no previous value
*/

SELECT name, country, COUNT(*),
LEAD(COUNT(*)) OVER (PARTITION BY country ORDER BY COUNT(*) ASC) rank
FROM customer_list cl
LEFT JOIN payment p
ON cl.id = p.customer_id
GROUP BY name, country;

SELECT name, country, COUNT(*),
LAG(COUNT(*)) OVER (PARTITION BY country ORDER BY COUNT(*) ASC) rank
, LAG(COUNT(*)) OVER (PARTITION BY country ORDER BY COUNT(*) ASC) - COUNT(*)
FROM customer_list cl
LEFT JOIN payment p
ON cl.id = p.customer_id
GROUP BY name, country;

/* Write a query that returns the revenue of the day,
and also the revenue of the previous day
and also the difference from the previous day to the current day.
Afterwards,calculate also the percentage growth compared to the previous day.
*/

SELECT SUM(amount), DATE(payment_date) as day,
LAG(SUM(amount)) OVER (ORDER BY DATE(payment_date)) previous_day,
SUM(amount) - LAG(SUM(amount)) OVER (ORDER BY DATE(payment_date)) difference,
ROUND((SUM(amount) - LAG(SUM(amount)) OVER (ORDER BY DATE(payment_date)))
/
(LAG(SUM(amount)) OVER (ORDER BY DATE(payment_date))) * 100, 2) as percentage_growth
FROM payment
GROUP BY DATE(payment_date)
ORDER BY DATE(payment_date)

