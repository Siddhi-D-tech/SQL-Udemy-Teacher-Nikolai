/*
In postgre sql we can only use a subquery in the from clause if it is named with an alias
*/

--Find out the average lifetime spend per customer

SELECT ROUND(AVG(total_amount),2) avg_lifetime_spent
FROM 
(SELECT customer_id, SUM(amount) total_amount
FROM payment
GROUP BY customer_id) subquery

--Challenge
--Find out what is the average total amount spent per day

SELECT ROUND(AVG(amt_per_day),2)
FROM
(SELECT DATE(payment_date) pd,SUM(amount) amt_per_day
FROM payment
GROUP BY pd) subquery
