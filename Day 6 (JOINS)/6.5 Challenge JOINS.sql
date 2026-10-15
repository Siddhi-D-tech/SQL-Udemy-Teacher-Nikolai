SELECT * 
FROM customer;

SELECT * 
FROM address;

SELECT first_name, last_name, phone, a.district 
FROM customer AS c
LEFT JOIN address AS a
ON c.address_id = a.address_id
WHERE district = 'Texas'
ORDER BY customer_id;

SELECT a.address_id, a.address
FROM customer AS c
RIGHT JOIN address AS a
ON c.address_id = a.address_id
WHERE customer_id is null
ORDER BY address_id;