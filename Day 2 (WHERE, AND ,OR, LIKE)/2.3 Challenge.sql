SELECT *
FROM payment
WHERE (customer_id = 322
OR customer_id = 346
OR customer_id = 354)
AND (amount < 2
OR amount > 10
)
ORDER BY customer_id , amount DESC