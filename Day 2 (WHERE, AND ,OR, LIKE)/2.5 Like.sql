-- Used to filter by matching agaist a pattern
-- '-' any single character
-- '%' any sequence of characters, % includes nothing as well

SELECT *
FROM actor
WHERE first_name LIKE 'A%';
-- LIKE is for % is case sensitive

SELECT *
FROM actor
WHERE first_name ILIKE 'a%';
-- ILIKE if not case sensitive

SELECT * 
FROM actor
WHERE first_name LIKE '%a%';
-- all first name cotaining a

SELECT *
FROM actor
WHERE first_name LIKE '_A%';
-- Any character in the begining but second character needs to be 'A' and it the end it can be anything 

SELECT *
FROM actor 
WHERE first_name NOT LIKE '%A%';

SELECT *
FROM film
WHERE description LIKE '%Drama%'
AND title LIKE 'T%';