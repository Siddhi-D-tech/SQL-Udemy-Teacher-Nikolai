/* EXTRACT
Used to extract parts of timestamp/dates

-- DATE/TIME types
1. Date - Just date without time - '2022-11-28' 'yyyy-mm-dd' - this is standard form
there are other format as well, bu using this is recommended

2. Time - Just time(with or without timezone)
- without timezone :'01:02:03.678'  with timezone :'01:02:03.678+02' localtime+2hrs, Time zone offset: UTC+2 hours

3. Timestamp - Date and time(with or without timezone)
'2022-11-28 '01:02:03.678+02'

4. Intervals - Time interval 
'01:02:03.678' - Difference of two different dates

SYNTAX
EXTRACT (field from Date/Time/Interval)
field - Part of Date/Time

EXTRACT - usually singulat - useful when creating new table
*/

SELECT 
EXTRACT(day from rental_date)
, count(*)
FROM rental
GROUP BY EXTRACT(day from rental_date)
ORDER BY count(*) DESC;

SELECT 
EXTRACT(month from rental_date)
, count(*)
FROM rental
GROUP BY EXTRACT(month from rental_date)
ORDER BY count(*) DESC;

-- Challenge
SELECT 
EXTRACT(month from payment_date) as "month"
,SUM(amount) as total_amount
FROM payment
GROUP BY "month"
ORDER BY total_amount DESC;

SELECT 
EXTRACT(DOW from payment_date) as day_of_week
,SUM(amount) as total_amount
FROM payment
GROUP BY day_of_week
ORDER BY total_amount DESC;

SELECT
customer_id
,EXTRACT(WEEK from payment_date)
,SUM(amount)
FROM payment
GROUP BY EXTRACT(WEEK from payment_date),customer_id
ORDER BY SUM(amount) DESC;


