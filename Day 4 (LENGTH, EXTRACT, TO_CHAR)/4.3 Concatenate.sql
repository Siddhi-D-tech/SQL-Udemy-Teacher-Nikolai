SELECT 
LEFT(first_name,1) || '.' || LEFT(last_name,1) || '.' AS initials
,first_name
,last_name
FROM customer;

SELECT 
-- LEFT(email,1) || '***@sakilacustomer.org'
LEFT(email,1) || '***' || RIGHT(email, 19)
, email
FROM customer