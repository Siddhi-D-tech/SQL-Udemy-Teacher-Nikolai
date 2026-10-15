/*
SYNTAX
CREATE MATERIALIZED VIEW <view_name>
AS query

ADVANTAGES
1. Data is stored physically
2. Performance ensured
3. We can update date in view either manually or we can use trigger,
REFRESH MATERIALIZED VIEW <view_name>

Generally mv/v can be added before table name 
*/

CREATE MATERIALIZED VIEW mv_customer_spendings
AS
SELECT first_name || ' ' || last_name name, SUM(amount) AS total_amount
FROM customer c
LEFT JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY name

SELECT *
FROM mv_customer_spendings 
WHERE name like '%TER%'

REFRESH MATERIALIZED VIEW mv_customer_spendings 
SELECT *
FROM customer
WHERE first_name like '%TER%' 

UPDATE customer
SET first_name = 'TERRY'
WHERE first_name = 'TER'

/*
ALTER VIEW/MATERIALIZED VIEW  
DROP VIEW/MATERIALIZED VIEW <name> 

CREATE/REPLACE VIEW --Not possible in MATERIALIZED VIEW/table creation  

CREATE OR REPLACE <view_name>
AS new_query
*/

CREATE VIEW v_customer_info
AS
SELECT cu.customer_id,
    cu.first_name || ' ' || cu.last_name AS name,
    a.address,
    a.postal_code,
    a.phone,
    city.city,
    country.country
     FROM customer cu
     JOIN address a ON cu.address_id = a.address_id
     JOIN city ON a.city_id = city.city_id
     JOIN country ON city.country_id = country.country_id
ORDER BY customer_id

--1) Rename the view to v_customer_information.
ALTER VIEW v_customer_info
RENAME TO v_customer_information

SELECT * FROM v_customer_information

--2) Rename the customer_id column to c_id.
ALTER VIEW v_customer_information
RENAME customer_id TO c_id

--3) Add also the initial column as the last column to the view by replacing the view.

CREATE OR REPLACE VIEW v_customer_information
AS
SELECT cu.customer_id AS c_id,
    cu.first_name || ' ' || cu.last_name AS name,
    a.address,
    a.postal_code,
    a.phone,
    city.city,
    country.country,
	LEFT(cu.first_name,1)||'.'||LEFT(cu.last_name,1) initials
     FROM customer cu
     JOIN address a ON cu.address_id = a.address_id
     JOIN city ON a.city_id = city.city_id
     JOIN country ON city.country_id = country.country_id
ORDER BY customer_id