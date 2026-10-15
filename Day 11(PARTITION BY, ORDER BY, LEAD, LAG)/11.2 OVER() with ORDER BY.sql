/*
The behaviour of OVER() with ORDER BY that step by step all of the previous values will be added up.
OVER() with ORDER BY
*/

SELECT *,
SUM(amount) OVER (ORDER BY payment_date) 
FROM payment;

SELECT * ,
SUM(amount) OVER(PARTITION BY customer_id)
FROM payment;

SELECT *,
SUM(amount) OVER(PARTITION BY customer_id ORDER BY payment_id)
FROM payment;


--W can order by 2 columns as well
SELECT *,
SUM(amount) OVER(PARTITION BY customer_id ORDER BY payment_date, payment_id)
FROM payment;


SELECT *,
SUM(amount) OVER(PARTITION BY customer_id ORDER BY payment_date, payment_id DESC)
FROM payment;

/*Challenge
Write a query that returns the running total of how late the flights are
(actual_arrival - the scheduled arrival) ordered by the flight_id
and including departure airport.
And as a second query, calculate the same running total but now partitioned by the departure airport.
*/
SELECT flight_id, departure_airport, 
SUM(actual_departure-scheduled_departure) OVER (ORDER BY flight_id)
FROM flights

SELECT flight_id, departure_airport, 
SUM(actual_departure-scheduled_departure) 
OVER (PARTITION BY departure_airport 
		ORDER BY flight_id, departure_airport)
FROM flights

