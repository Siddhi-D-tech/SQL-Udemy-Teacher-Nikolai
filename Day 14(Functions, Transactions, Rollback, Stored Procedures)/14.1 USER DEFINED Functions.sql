/*
Extend functionality 
Custom calculations
1. We use
SQL
standard to use PL/pgSQL(Extended version of SQL)
These are safe languages

2. We can also use 
sandbox languages like Python or C
These are called unsafe languages, because we need to have access to external resources.
And this allows to bypass some securities.

SYNTAX
CREATE FUNCTION <function_name> (param1, param2,...)
	RETURNS return_datatype
	LANGUAGE plpgsql [sql|c|..]
AS
$$
DECLARE 
<variable declaration>;
BEGIN
<function definition>;
END;
$$

Note : Add semi colon after each command
	   Function name is the name of column that is returned
*/

CREATE FUNCTION first_func(c1 INT, c2 INT)
	RETURN INT
	LANGUAGE plpgsql
AS
$$
DECLARE
c3 INT;
BEGIN 
SELECT c1+c2+3
INTO c3;
RETURN c3;
END;
$$

/*
Create a function that is counting the number of films that are within a 
specific range for the rental rate.

If you want to change the logic or body of a function 
but keep the same name and parameters, you can use CREATE OR REPLACE, 
*/
CREATE OR REPLACE FUNCTION count_rr(min_r decimal(4,2), max_r decimal(4,2))
RETURNS INT 
LANGUAGE plpgsql
AS
$$
DECLARE 
movie_count INT;
BEGIN
SELECT COUNT(*)
INTO movie_count
FROM film
WHERE rental_rate BETWEEN min_r AND max_r;
RETURN movie_count;
END;
$$

SELECT count_rr(0,6)

/*
Challenge
Create a function that expects the customer's first name
and return the total amount of payments this customer has made.
*/
SELECT * FROM payment

CREATE OR REPLACE FUNCTION name_search(first_n VARCHAR(20), last_n VARCHAR(20))
RETURNS decimal(10,2)
LANGUAGE plpgsql
AS $$
DECLARE 
	total_amount decimal(10,2);
BEGIN
	SELECT SUM(amount)
	INTO total_amount
	FROM payment p
	LEFT JOIN customer c
		ON p.customer_id = c.customer_id
	WHERE c.first_name = first_n  
	 AND c.last_name = last_n; 
	RETURN total_amount;
END;
$$

SELECT name_search('AMY', 'LOPEZ');


SELECT first_name,
last_name,
name_search(first_name,last_name)
FROM customer