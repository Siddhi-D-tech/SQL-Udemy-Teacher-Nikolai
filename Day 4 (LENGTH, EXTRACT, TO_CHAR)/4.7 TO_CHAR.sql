/* 
Used to get custom formats timestamp/date/numbers
Output is always text

SYNTAX
TO_CHAR(timestamp/date/numbers, format)
TO_DATE(text,text) make date from text
*/

SELECT 
*
,EXTRACT(month from payment_date)
,TO_CHAR(payment_date, 'Day')
FROM payment;


SELECT 
EXTRACT(month from payment_date)
,TO_CHAR(payment_date, 'Day Month YYYY')
FROM payment;

-- NO blank space in day
SELECT 
EXTRACT(month from payment_date)
,TO_CHAR(payment_date, 'Dy Month YYYY')
FROM payment;

SELECT 
*
,EXTRACT(month from payment_date)
,TO_CHAR(payment_date, 'YYYY/MM')
FROM payment;

--Challenge
SELECT 
SUM(amount) AS total_amount
, TO_CHAR(payment_date, 'Dy, DD/MM/YYYY') as day
FROM payment
GROUP BY day
ORDER BY total_amount;

SELECT 
SUM(amount) AS total_amount
, TO_CHAR(payment_date, 'Mon, YYYY') as day
FROM payment
GROUP BY day
ORDER BY total_amount;

SELECT 
SUM(amount) AS total_amount
, TO_CHAR(payment_date, 'Dy, HH:MI') as day
FROM payment
GROUP BY day
ORDER BY total_amount DESC;