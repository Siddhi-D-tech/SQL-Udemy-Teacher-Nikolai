/* COALESCE
It returns first value of a list of values which is not null
Syntax
COALESCE(col1,col2)
COALESCE(col1,'fixed value') fixed value has same data type as col1
We can use more than 2 values
*/

SELECT 
COALESCE(actual_arrival - scheduled_arrival, '0:00')
FROM flights