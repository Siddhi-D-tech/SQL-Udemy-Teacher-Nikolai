SELECT
RIGHT(first_name,2),
first_name
FROM customer;

SELECT
LEFT(first_name,2),
first_name
FROM customer;

--EXTRACT second letter from first name

SELECT 
RIGHT(LEFT(first_name, 2),1)
,first_name
FROM customer;

-- Challenge
SELECT
email
, RIGHT(email, 5)
FROM customer;

-- extract . from email

SELECT 
email,
LEFT(RIGHT(email,4),1)
FROM customer