SELECT *
FROM customer
WHERE customer_id IN (123, 212, 323, 243, 353, 432);
--WOrk as if OR 

SELECT *
FROM customer
WHERE first_name IN ('LYNDIA', 'MATHEW'); 

SELECT *
FROM customer
WHERE first_name NOT IN ('LYNDA', 'MATHEW'); 