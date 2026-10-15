/*
SYNTAX
CREATE TABLE <table_name>
AS query

--Disadvantages
1. Physical storage needed 
2. Data can change

*/

CREATE TABLE customer_address
AS
SELECT first_name, last_name, email, address, city
FROM customer c
LEFT JOIN address a
ON c.address_id = a.address_id
LEFT JOIN city ct
ON a.city_id = ct.city_id


SELECT *
FROM customer

CREATE TABLE customer_spendings
AS
SELECT first_name || ' ' || last_name name, SUM(amount) AS total_amount
FROM customer c
LEFT JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY name

SELECT *
FROM customer_spendings 


