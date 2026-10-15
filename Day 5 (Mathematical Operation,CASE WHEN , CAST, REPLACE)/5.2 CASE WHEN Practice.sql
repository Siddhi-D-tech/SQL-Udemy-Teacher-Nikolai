--demo database
SELECT 
actual_departure - scheduled_departure,
CASE
WHEN actual_departure is null THEN 'No Departure Time'
WHEN actual_departure - scheduled_departure < '00:05' THEN 'On Time'
WHEN actual_departure - scheduled_departure < '01:00' THEN 'Little bit late'
ELSE 'Very Late'
END
FROM flights;

SELECT 
COUNT(*) as flights,
CASE
WHEN actual_departure is null THEN 'No Departure Time'
WHEN actual_departure - scheduled_departure < '00:05' THEN 'On Time'
WHEN actual_departure - scheduled_departure < '01:00' THEN 'Little bit late'
ELSE 'Very Late'
END as is_late
FROM flights
GROUP BY is_late;

-- Challenge
-- My solution
SELECT
COUNT(*)
,CASE
WHEN total_amount < 20000 THEN 'Low price ticket'
WHEN total_amount < 150000 THEN 'Mid price ticket'
ELSE  'High price ticket' 
END as category
FROM bookings
GROUP BY category;

-- There solution
SELECT ticket_price, count(1)
FROM(SELECT
book_ref,
CASE
WHEN total_amount < 20000 THEN 'low price ticket'
WHEN total_amount < 150000 THEN 'mid price ticket'
ELSE 'high price ticket'
END as ticket_price
FROM bookings
) a
GROUP BY ticket_price;

SELECT 
COUNT(*),
CASE
WHEN TO_CHAR(scheduled_departure,'FMMonth') IN ('December','January', 'February')
THEN 'WINTER'
WHEN TO_CHAR(scheduled_departure,'FMMonth') IN ('March','April', 'May')
THEN 'Spring'
WHEN TO_CHAR(scheduled_departure,'FMMonth') IN ('June','July', 'August')
THEN 'Summer'
WHEN TO_CHAR(scheduled_departure,'FMMonth') IN ('September','October', 'November')
THEN 'Fall'
END AS seasons
FROM flights
GROUP BY seasons;

-- their solutionm
SELECT 
COUNT(*) as flights,
CASE
WHEN EXTRACT(month from scheduled_departure) IN (12,1,2) THEN 'Winter'
WHEN EXTRACT (month from scheduled_departure) <= 5 THEN 'Spring'
WHEN EXTRACT (month from scheduled_departure) <= 8 THEN 'Summer'
ELSE 'Fall' 
END as season
FROM flights
GROUP BY season;



SELECT
title
,CASE
WHEN rating IN ('PG', 'PG-13') OR length > 210 THEN 'Great rating or long(tier 1)'
WHEN description like '%drama%' OR length > 90 THEN 'Long Drama(tier 2)'
WHEN description like '%drama%' THEN 'Short Drama(tier 3)'
WHEN rental_rate < 1 THEN 'Very Cheap(tier 4)'
END as type_of_film
FROM film
WHERE 
CASE
WHEN rating IN ('PG', 'PG-13') OR length > 210 THEN 'Great rating or long(tier 1)'
WHEN description like '%drama%' OR length > 90 THEN 'Long Drama(tier 2)'
WHEN description like '%drama%' THEN 'Short Drama(tier 3)'
WHEN rental_rate < 1 THEN 'Very Cheap(tier 4)'
END is not null

