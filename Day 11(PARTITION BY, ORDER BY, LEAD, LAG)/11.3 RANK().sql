/*
RANK() - If 10 of ROWS that have the same length then next one will get 11th rank
DENSE_RANK() - If 10 of ROWS that have the same length then next one will get 2nd rank

We can not use window functions in the WHERE filtering. Because the WHERE filtering takes place
before the window function will be evaluated.
But this is the reason why if we want to filter by the window functions we need to use a subquery
*/

SELECT title, name, length
, RANK() OVER(ORDER BY length)
FROM film f LEFT JOIN film_category fc
ON f.film_id = fc.film_id
LEFT JOIN category c
ON c.category_id = fc.category_id

--DENSE_RANK()
SELECT title, name, length
, DENSE_RANK() OVER(ORDER BY length)
FROM film f LEFT JOIN film_category fc
ON f.film_id = fc.film_id
LEFT JOIN category c
ON c.category_id = fc.category_id

--PARTITION BY()
-- In each partition the ranking starts again from 1
SELECT * FROM 
(SELECT title, name, length
, DENSE_RANK() OVER(PARTITION BY name ORDER BY length) rank
FROM film f LEFT JOIN film_category fc
ON f.film_id = fc.film_id
LEFT JOIN category c
ON c.category_id = fc.category_id ) a
WHERE rank = 1

/*
Write a query that returns the customer's name, the country and how many payments those customers have.
For that, you should use the existing view customer_list.
Afterwards, create a ranking of the top customers with the most sales for each country,
Filter the results to only the top three customers per country
*/ 

SELECT name, country, COUNT(*)
FROM customer_list cl
LEFT JOIN payment p
ON cl.id = p.customer_id
GROUP BY name, country

SELECT *
FROM 
(SELECT name, country, COUNT(*),
DENSE_RANK() OVER (PARTITION BY country ORDER BY COUNT(*) DESC) rank
FROM customer_list cl
LEFT JOIN payment p
ON cl.id = p.customer_id
GROUP BY name, country)
WHERE rank in (1,2,3)