SELECT 
LENGTH(email)
,LOWER(email) as lower_email
,email
FROM customer
WHERE LENGTH(email)<30;

-- CHALLENGE

SELECT
LOWER(first_name),
LOWER(last_name),
email
FROM customer
WHERE LENGTH(first_name) > 10 OR LENGTH(last_name) > 10;