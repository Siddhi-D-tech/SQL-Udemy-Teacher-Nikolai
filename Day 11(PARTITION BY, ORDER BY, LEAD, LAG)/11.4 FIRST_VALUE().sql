/*
We define what value we want to see.And we can specify our partition and our ordering.
The FIRST_VALUE() is a window function that returns the first value in an ordered set of values.
*/

SELECT name, country, COUNT(*),
FIRST_VALUE(COUNT(*)) OVER (PARTITION BY country ORDER BY COUNT(*) DESC) rank
FROM customer_list cl
LEFT JOIN payment p
ON cl.id = p.customer_id
GROUP BY name, country

SELECT name, country, COUNT(*),
FIRST_VALUE(COUNT(*)) OVER (PARTITION BY country ORDER BY COUNT(*) ASC) rank
, COUNT(*) - FIRST_VALUE(COUNT(*)) OVER (PARTITION BY country ORDER BY COUNT(*) ASC)
FROM customer_list cl
LEFT JOIN payment p
ON cl.id = p.customer_id
GROUP BY name, country