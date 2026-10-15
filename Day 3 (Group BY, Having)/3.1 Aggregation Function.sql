/* Aggregate multiple rows to one value
1.Most commonly used aggregation function 
SUM() AVG() MIN() MAX() COUNT()
2.Count is the only function where we can/or can not(*) add column name
3.Can not use aggregate function with another column without aggregate function
SELECT SUM(amount)
 , payement_id -- can not be used
---- Only possible with grouping the data----
4. Multiple aggregation is possible
SELECT COUNT(*),
SUM(amount)
FROM payment
*/

SELECT 
SUM(amount)
,ROUND(AVG(amount),2) AS average
--,payment_id
FROM payment;

SELECT COUNT(*)
FROM payment;

SELECT COUNT(*),
SUM(amount)
FROM payment;
