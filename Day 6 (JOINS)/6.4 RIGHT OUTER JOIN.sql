/*
The RIGHT JOIN keyword returns 
all records from the right table (table2), 
and the matching records from the left table (table1). 
The result is 0 records from the left side, if there is no match

If there is no match, 
the result will contain NULL values for columns from the left table.
*/

SELECT * 
FROM flights AS f
RIGHT JOIN aircrafts_data AS a
ON f.aircraft_code = a.aircraft_code
WHERE f.aircraft_code is null
