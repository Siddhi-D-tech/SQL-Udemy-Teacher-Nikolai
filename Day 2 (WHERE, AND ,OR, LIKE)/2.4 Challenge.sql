SELECT count(*)
FROM payment
WHERE (payment_date BETWEEN '2020-01-26' AND '2020-01-28') 
AND
(amount BETWEEN 1.99 AND 3.99)

