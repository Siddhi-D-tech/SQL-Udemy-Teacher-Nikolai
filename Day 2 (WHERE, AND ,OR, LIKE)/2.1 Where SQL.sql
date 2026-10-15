-- SELECT column1, column2
-- FROM table1
-- WHERE condition

SELECT *
FROM payment
WHERE amount = 0

SELECT *
FROM customer
WHERE last_name = 'ADAM'

SELECT count(*)
FROM payment
WHERE amount = 0

SELECT *
FROM payment 
WHERE amount <= 10.99
ORDER BY amount DESC

SELECT * 
FROM payment
WHERE amount != 10.99;

-- != same as <>

SELECT * 
FROM payment
WHERE amount <> 10.99;

SELECT first_name, last_name
FROM customer
WHERE first_name is not null;



