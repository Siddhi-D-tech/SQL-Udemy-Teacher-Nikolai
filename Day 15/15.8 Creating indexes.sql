/*
SYNTAX
CREATE INDEX index_name
ON table_name [USING method]
	(
	column_name
	[,...]
	);
*/

SELECT * FROM payment

SELECT 
(SELECT AVG(amount)
FROM payment p2
WHERE p2.rental_id = p1.rental_id)
FROM payment p1

CREATE INDEX index_rental_id_payment
ON payment
(rental_id)

DROP INDEX index_rental_id_payment