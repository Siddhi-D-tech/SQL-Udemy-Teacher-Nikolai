/* 
FOR INNER JOIN
While joining multiple tablestable order does not matter

FOR LEFT/RIGHT JOIN
Order of the table matters
*/

SELECT *
FROM tickets;


SELECT *
FROM flights;

SELECT *
FROM boarding_passes;

SELECT t.ticket_no, passenger_name, f.scheduled_departure
FROM tickets AS t
INNER JOIN ticket_flights AS tf
ON t.ticket_no = tf.ticket_no
INNER JOIN flights AS f
ON tf.flight_id = f.flight_id;

-- Challenge
SELECT *
FROM city;

SELECT *
FROM customer;

SELECT *
FROM country;

SELECT *
FROM address;

SELECT first_name, last_name, email, co.country
FROM customer c
LEFT JOIN address a
ON c.address_id = a.address_id
LEFT JOIN city ct
ON a.city_id = ct.city_id
LEFT JOIN country co
ON co.country_id = ct.country_id
WHERE co.country = 'Brazil';

SELECT *
FROM bookings;

SELECT *
FROM tickets;

/*Which passenger (passenger_name) has spent most amount in their bookings (total_amount)?*/
SELECT passenger_name
, SUM(total_amount)
FROM bookings b
INNER JOIN tickets t
ON b.book_ref = t.book_ref
GROUP BY passenger_name
ORDER BY SUM(total_amount) DESC
LIMIT 1;

/* Which fare_condition has ALEKSANDR IVANOV used the most? */
SELECT *
FROM seats;

SELECT * 
FROM boarding_passes;

SELECT fare_conditions, count(*)
FROM bookings b
INNER JOIN tickets t
ON b.book_ref = t.book_ref
AND passenger_name = 'ALEKSANDR IVANOV'
INNER JOIN boarding_passes bp
ON t.ticket_no = bp.ticket_no
INNER JOIN seats s
ON s.seat_no = bp.seat_no
GROUP BY fare_conditions
ORDER BY fare_conditions DESC
LIMIT 1;


/*Which title has GEORGE LINTON rented the most often?*/

SELECT *
FROM customer;

SELECT *
FROM rental;

SELECT * 
FROM inventory;

SELECT *
FROM film;

SELECT first_name, last_name, title, count(*)
FROM customer cu
INNER JOIN rental r
ON cu.customer_id = r.customer_id
INNER JOIN inventory i 
ON i.inventory_id = r.inventory_id
INNER JOIN film f
ON f.film_id = i.film_id
WHERE first_name = 'GEORGE' AND last_name ='LINTON'
GROUP BY first_name, last_name, title
ORDER BY 4 desc
limit 1;
