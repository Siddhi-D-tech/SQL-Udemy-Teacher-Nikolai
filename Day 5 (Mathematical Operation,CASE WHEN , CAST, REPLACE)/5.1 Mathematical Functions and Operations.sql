/*
Usual operations - +,-,*,\, %(modulo), ^(exponentiation)
Functions
absolute value:  abs(x) abs(-7) 7
round(x,d) : round x to d decimals 
ceiling(x) : round up to integer ceiling(4.3543) 5
floor(x) : round down to integer floor(4.3543) 4
*/

SELECT 
film_id,
rental_rate as old_rental_rate
,ROUND(rental_rate*1.1,2) as new_rental_date
From film;


SELECT 
film_id,
rental_rate as old_rental_rate
,CEILING(rental_rate*1.1)-0.01 as new_rental_date
From film;

--Challenge
SELECT film_id
, ROUND(rental_rate/replacement_cost*100,2) as rental_rate_percentage
FROM film
WHERE rental_rate/replacement_cost*100 < 4 
ORDER BY 2 ASC;