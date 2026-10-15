/* CAST function is used to change the data type of the value

CAST (value/column AS data type)
Sometimes the whitespaces needs to replace to cast the value
*/

SELECT 
COALESCE(CAST(actual_arrival - scheduled_arrival AS VARCHAR), 'Not Arrived')
FROM flights;

SELECT
COALESCE(LENGTH(CAST(actual_arrival AS VARCHAR)),0)
FROM flights;


---Challenge
SELECT 
rental_date
, COALESCE(CAST(return_date AS VARCHAR), 'not returned yet')
FROM rental
ORDER BY rental_date DESC;