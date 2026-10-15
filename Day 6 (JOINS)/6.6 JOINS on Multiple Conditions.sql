/*
This is required  we have multiple columns that make up a join between tables
like table needs to join on both first_name and last_name

SELECT A.col1, B.col1 , col2 FROM TableA AS a
INNER JOIN TableB AS b
ON a.col1 = b.col1
AND a.col2 = b.col2

We can also use a second condition, not only for a second joint column,
but also to filter the data.

SELECT A.col1, B.col1 , col2 FROM TableA AS a
INNER JOIN TableB AS b
ON a.col1 = b.col1
AND a.col2 = 'test'

There is no difference with the regular where condition 
but above one is more efficient than the regular where
*/

/* 
Same ticket number can have 2 different flights, hence ticket_no and light_id both required 
in join condition
*/

SELECT *
FROM ticket_flights;


SELECT *
FROM boarding_passes;

SELECT  b.seat_no, ROUND(AVG(t.amount),2)
FROM boarding_passes AS b
LEFT JOIN ticket_flights AS t
ON b.ticket_no = t.ticket_no
AND b.flight_id = t.flight_id
GROUP BY seat_no
ORDER BY 2 DESC;