SELECT 
LEFT(email,POSITION('@' IN email)-1)
, email
FROM customer;

SELECT
LEFT(email, POSITION(last_name IN email)-2) as first_name_in_email
FROM customer;

--CHALLENGE
SELECT 
email, last_name
FROM customer;

SELECT 
last_name || ',' || LEFT(email, POSITION(last_name IN email)-2)
FROM customer;

SELECT
last_name || ',' || LEFT(email,POSITION('.' IN email)-1)
FROM customer
