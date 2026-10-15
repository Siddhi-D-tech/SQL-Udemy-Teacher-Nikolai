SELECT * 
FROM rental;


SELECT count(*)
FROM rental
WHERE return_date is null;

SELECT payment_id, amount
FROM payment
WHERE amount <=2;