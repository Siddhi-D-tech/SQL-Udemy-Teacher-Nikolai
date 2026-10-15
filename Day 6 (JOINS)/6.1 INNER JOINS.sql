/*
Combine information from multiple tables in one query

1. Combine the two tables in one query
2. One common column - join column
3. "Only rows appear in both the tables" more specifically "only the rows where the 
value in the join column occurs in both tables"
4. If row occurs twice in join column then it also appeat twice in result column
5. Order of table does not matter in query

SELECT * FROM TableA
INNER JOIN TableB
ON TableA.col1 = TableB.col1

OR 

SELECT A.col1, B.col1 , col2 FROM TableA AS a
INNER JOIN TableB AS b
ON a.col1 = b.col1
IF common column then need to specifiy the table
If not common then no need to specify
*/

/*SELECT payment_id
, payment.customer_id
, first_name, last_name
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;

SELECT payment_id
, p.customer_id
, first_name, last_name
FROM payment AS p
INNER JOIN customer AS c
ON p.customer_id = c.customer_id;

SELECT p.*, first_name, last_name
FROM payment AS p
INNER JOIN staff AS s
ON p.staff_id = s.staff_id
WHERE p.staff_id = 2;
*/

--Challenge
SELECT S.fare_conditions AS "Fare Conditions"
, count(*) AS "Count"
FROM boarding_passes AS bp 
INNER JOIN flights AS fl
ON bp.flight_id = fl.flight_id
INNER JOIN SEATS AS s
ON s.aircraft_code = fl.aircraft_code AND bp.seat_no = S.seat_no
GROUP BY s.fare_conditions
ORDER BY 2;

