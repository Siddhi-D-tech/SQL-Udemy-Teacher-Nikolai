-- Intervals are not tied to calender date

SELECT 
CURRENT_TIMESTAMP
,CURRENT_TIMESTAMP - rental_date
,EXTRACT(day from return_date - rental_date)
FROM rental;

--Challenge
SELECT
customer_id
,return_date - rental_date
FROM rental
WHERE customer_id = 35;

SELECT
customer_id
,AVG(return_date - rental_date) as rental_duration
FROM rental
GROUP BY customer_id
ORDER BY rental_duration DESC