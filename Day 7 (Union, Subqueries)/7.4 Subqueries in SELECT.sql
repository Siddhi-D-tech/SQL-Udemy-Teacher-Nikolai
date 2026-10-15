/*
If we have a sub query and we want to use it in the select clause,
then it needs to be just one single value
*/

SELECT *
,(SELECT ROUND(AVG(amount),2) FROM payment)
FROM payment;

SELECT *
,(SELECT amount FROM payment LIMIT 1)
FROM payment;

/*
Challenge 

Show all of the payments together with how much this payment amount
of this specific row is below the maximum payment amount
*/

SELECT *,(SELECT MAX(amount) FROM payment)-amount difference
FROM payment