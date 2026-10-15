/* CASE 
Like IF/THEN statement 
Goes through a set of conditions 
return a value if a condition is met
1. Result of first true condition
2. None of condition met o/p [null]
3. We can use many different functions in the condition.
4. operators from where filtering
CASE 
WHEN cond1 THEN result1
WHEN cond2 THEN result2
WHEN cond3 THEN result3
ELSE result
END
*/


SELECT
amount,
CASE
WHEN amount < 2 THEN 'low amount'
WHEN amount < 5 THEN 'medium amount'
ELSE 'high amount'
END
FROM payment;

--Database is different
SELECT 
TO_CHAR(book_date,'Dy')
, TO_CHAR(book_date,'Mon')
,CASE 
WHEN TO_CHAR(book_date,'Dy') = 'Mon' THEN 'Monday Special'
WHEN TO_CHAR(book_date,'Dy') = 'Jul' THEN 'July Special'
END
FROM bookings