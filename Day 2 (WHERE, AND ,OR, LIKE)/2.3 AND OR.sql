-- SELECT *
-- FROM table1
-- WHERE cond1
-- AND cond2

SELECT *
FROM payment
WHERE amount = 10.99
AND customer_id = 426;

SELECT * 
FROM payment
WHERE amount = 10.99
OR customer_id = 426;

SELECT *
FROM payment 
WHERE amount = 10.99
OR amount = 9.99;

SELECT *
FROM payment 
WHERE amount = 10.99
OR amount = 9.99
AND customer_id = 426;

-- Executed as follows,AND condition executed first, AND has higher precedence than OR. This means conditions connected by AND are evaluated first
SELECT *
FROM payment 
WHERE amount = 10.99
OR (amount = 9.99
AND customer_id = 426);


SELECT *
FROM payment
WHERE (amount = 10.99 
OR amount = 9.99)
AND customer_id = 426;