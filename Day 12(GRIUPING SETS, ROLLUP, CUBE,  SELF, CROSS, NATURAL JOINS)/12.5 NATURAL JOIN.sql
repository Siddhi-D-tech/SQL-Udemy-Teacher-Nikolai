/*
In a NATURAL JOIN,
columns for the JOIN will be automatically determined by the same column names.

SYNTAX

SELECT *
FROM payment
NATURAL LEFT JOIN customer

If there are more than one column with same name, then both columns are used for join.
It can sometimes cause some problems.

*/

SELECT *
FROM payment
NATURAL INNER JOIN customer

SELECT 
first_name, last_name,
SUM(amount)
FROM payment
NATURAL INNER JOIN customer
GROUP BY first_name, last_name
