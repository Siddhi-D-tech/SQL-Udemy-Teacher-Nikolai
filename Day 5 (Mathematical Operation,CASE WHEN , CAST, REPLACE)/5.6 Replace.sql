/* 
Replaces text from a string in a column with another text
REPLACE(column,old_text,new_text)
*/

SELECT
CAST(REPLACE(passenger_id, ' ', '') AS BIGINT)
FROM tickets;

SELECT 
flight_no
, CAST(REPLACE(flight_no,'PG','') AS INT)
FROM flights