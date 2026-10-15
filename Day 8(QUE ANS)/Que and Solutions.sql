/*
1. Task: Create a list of all the different (distinct) replacement costs of the films.
Question: What's the lowest replacement cost?
Answer: 9.99
*/

SELECT Distinct replacement_cost
FROM film
ORDER BY replacement_cost
limit 1

/*
2. Task: Write a query that gives an overview of how many films have replacements costs 
in the following cost ranges

low: 9.99 - 19.99
medium: 20.00 - 24.99
high: 25.00 - 29.99
Question: How many films have a replacement cost in the "low" group?
Answer: 514
*/

-- THERE ANS
SELECT
CASE
WHEN replacement_cost <= 19.99 THEN 'low'
WHEN replacement_cost BETWEEN 20 AND 24.99 THEN 'medium' 
WHEN replacement_cost >24.99  THEN 'high'
END AS cost_category,
COUNT(*)
FROM film
GROUP BY cost_category
---
--MY ANS--
SELECT 
SUM(CASE WHEN replacement_cost BETWEEN 9.99 AND 19.99 THEN 1 else 0 END) AS "low"
, SUM(CASE WHEN replacement_cost < 25.00 THEN 1 else 0 END) AS "medium" 
, SUM(CASE WHEN replacement_cost < 29.99 THEN 1 else 0 END) AS "high"
FROM film
----
--given as in double quotes

/*
3. Task: Create a list of the film titles including their title, length, and category name ordered 
descendingly by length. Filter the results to only the movies in the category 'Drama' or 'Sports'.
Question: In which category is the longest film and how long is it?
Answer: Sports and 184
*/

SELECT title, length, name 
FROM film f
LEFT JOIN film_category fc
ON f.film_id = fc.film_id
LEFT JOIN category c
ON c.category_id = fc.category_id
WHERE name IN ('Drama', 'Sports')
ORDER BY length DESC
LIMIT 1

/*
4. Task: Create an overview of how many movies (titles) there are in each category (name).
Question: Which category (name) is the most common among the films?
Answer: Sports with 74 titles
*/

SELECT name,COUNT(*)
FROM film f
INNER JOIN film_category fc
ON f.film_id = fc.film_id
INNER JOIN category c
ON c.category_id = fc.category_id
GROUP BY name
ORDER BY COUNT(*) DESC 
limit 1

/*
5.  Create an overview of the actors' first and last names and in how many movies they appear in.
Question: Which actor is part of most movies?
Answer: Susan Davis with 54 movies
*/

-- MY ANS --
SELECT first_name,last_name,COUNT(*)
FROM actor a
LEFT JOIN film_actor fa
ON a.actor_id = fa.actor_id
GROUP BY first_name,last_name
ORDER BY COUNT(*) DESC
limit 1

-- THEIR ANS --
SELECT first_name,last_name,COUNT(*)
FROM film f
INNER JOIN film_actor fa
ON f.film_id = fa.film_id
INNER JOIN actor a
ON a.actor_id = fa.actor_id
GROUP BY first_name,last_name
ORDER BY COUNT(*) DESC
limit 1

/*
6. Create an overview of the addresses that are not associated to any customer.
Question: How many addresses are that?
Answer: 4
*/
SELECT count(*)
FROM address a
LEFT JOIN customer c
ON c.address_id = a.address_id
WHERE c.customer_id is null


/*
7. Task: Create the overview of the sales to determine the from which city 
(we are interested in the city in which the customer lives, not where the store is) 
most sales occur.

Question: What city is that and how much is the amount?
Answer: Cape Coral with a total amount of 221.55
*/

SELECT SUM(amount), city
FROM payment p
LEFT JOIN customer c
ON p.customer_id = c.customer_id
LEFT JOIN address a
ON c.address_id = a.address_id
LEFT JOIN city ct
ON ct.city_id = a.city_id
GROUP BY city
ORDER BY SUM(amount) DESC

/*
8. Task: Create an overview of the revenue (sum of amount) grouped by a column 
in the format "country, city".
Question: Which country, city has the least sales?
Answer: United States, Tallahassee with a total amount of 50.85.
*/

SELECT country ||', ' || city country_city,SUM(amount)
FROM payment p
LEFT JOIN customer c
ON p.customer_id = c.customer_id
LEFT JOIN address a
ON c.address_id = a.address_id
LEFT JOIN city ct
ON ct.city_id = a.city_id
LEFT JOIN country cn
ON ct.country_id = cn.country_id
GROUP BY country_city
ORDER BY SUM(amount)

/*
9. Task: Create a list with the average of the sales amount each staff_id has per customer.
Question: Which staff_id makes on average more revenue per customer?
Answer: staff_id 2 with an average revenue of 56.64 per customer.
*/

SELECT staff_id, ROUND(AVG(total_amount),2)
FROM 
(SELECT customer_id, staff_id, SUM(amount) total_amount FROM payment GROUP BY customer_id, staff_id) sub
GROUP BY staff_id

/*
10 .Task: Create a query that shows average daily revenue of all Sundays.
Question: What is the daily average revenue of all Sundays?
Answer: 1410.65
*/

SELECT ROUND(AVG(total_amount),2)
FROM 
(SELECT SUM(amount) total_amount, EXTRACT(DOW FROM payment_date), DATE(payment_date) extracted_date
FROM payment
WHERE EXTRACT(DOW FROM payment_date) = 0
GROUP BY EXTRACT(DOW FROM payment_date), extracted_date) sub

/*
11. Task: Create a list of movies - with their length and 
their replacement cost - that are longer than the average length in each replacement cost group.

Question: Which two movies are the shortest on that list and how long are they?
Answer: CELEBRITY HORN and SEATTLE EXPECTATIONS with 110 minutes.
*/

SELECT title, length, replacement_cost
FROM film f1
WHERE length > 
(SELECT AVG(length)
FROM film f2
WHERE f1.replacement_cost = f2.replacement_cost
)
ORDER BY length

/*
12. Task: Create a list that shows the "average customer lifetime value" grouped by the 
different districts.
Example:
If there are two customers in "District 1" where one customer has a total (lifetime) 
spent of $1000 and the second customer has a total spent of $2000 then the 
"average customer lifetime spent" in this district is $1500.
So, first, you need to calculate the total per customer and then the average of these 
totals per district.
Question: Which district has the highest average customer lifetime value?
Answer: Saint-Denis with an average customer lifetime value of 216.54.
*/
--MY ANS--
SELECT dist_name, ROUND(AVG(total_amount),2) "average customer lifetime value"
FROM 
(SELECT customer_id,SUM(amount) total_amount
FROM payment
GROUP BY customer_id) t1
LEFT JOIN
(SELECT customer_id, district dist_name
FROM customer c
LEFT JOIN address a
ON c.address_id = a.address_id) t2
ON t1.customer_id = t2.customer_id
GROUP BY dist_name
ORDER BY 2 DESC

--THERE ANS--
SELECT district, ROUND(AVG(total),2)
FROM 
(SELECT c.customer_id, district, SUM(amount) total
FROM payment p
LEFT JOIN customer c
ON p.customer_id = c.customer_id
LEFT JOIN address a
ON c.address_id = a.address_id
GROUP BY district, c.customer_id)
GROUP BY district
ORDER BY 2 DESC
/*
13. Task: Create a list that shows all payments including the payment_id, amount, 
and the film category (name) plus the total amount that was made in this category. 
Order the results ascendingly by the category (name) and as second order criterion by the payment_id 
ascendingly.

Question: What is the total revenue of the category 'Action' and what is the lowest payment_id 
in that category 'Action'?
Answer: Total revenue in the category 'Action' is 4375.85 and the lowest payment_id in that 
category is 16055.
*/
--My Ans--
SELECT payment_id, amount, t1.name, t2.total_amount
FROM (SELECT payment_id, amount, name 
FROM payment p1
LEFT JOIN rental r
ON p1.rental_id = r.rental_id
LEFT JOIN inventory i
ON i.inventory_id = r.inventory_id
LEFT JOIN film_category fc
ON fc.film_id = i.film_id
LEFT JOIN category ct
ON ct.category_id = fc.category_id) t1
LEFT JOIN
(SELECT SUM(amount) total_amount, name 
FROM payment p1
LEFT JOIN rental r
ON p1.rental_id = r.rental_id
LEFT JOIN inventory i
ON i.inventory_id = r.inventory_id
LEFT JOIN film_category fc
ON fc.film_id = i.film_id
LEFT JOIN category ct
ON ct.category_id = fc.category_id
GROUP BY name) t2
ON t1.name = t2.name
ORDER BY t1.name, payment_id

-- Their ans--

SELECT payment_id, amount, name,

(SELECT SUM(amount)
FROM payment p1
LEFT JOIN rental r
ON p1.rental_id = r.rental_id
LEFT JOIN inventory i
ON i.inventory_id = r.inventory_id
LEFT JOIN film_category fc
ON fc.film_id = i.film_id
LEFT JOIN category ct2
ON ct2.category_id = fc.category_id
WHERE ct2.name = ct1.name)

FROM payment p1
LEFT JOIN rental r
ON p1.rental_id = r.rental_id
LEFT JOIN inventory i
ON i.inventory_id = r.inventory_id
LEFT JOIN film_category fc
ON fc.film_id = i.film_id
LEFT JOIN category ct1
ON ct1.category_id = fc.category_id
ORDER BY name, payment_id

/*
14. Task: Create a list with the top overall revenue of a film title (sum of amount per title) 
for each category (name).

Question: Which is the top-performing film in the animation category?
Answer: DOGMA FAMILY with 178.70.
*/

SELECT title, name, SUM(amount) total
FROM payment p
INNER JOIN rental r
ON p.rental_id = r.rental_id
INNER JOIN inventory i
ON i.inventory_id = r.inventory_id
INNER JOIN film f
ON i.film_id = f.film_id
INNER JOIN film_category fc
ON fc.film_id = f.film_id
INNER JOIN category c
ON c.category_id = fc.category_id
GROUP BY name, title
HAVING SUM(amount) = (SELECT MAX(total)
						FROM(SELECT title, name, SUM(amount) total
						FROM payment p
						INNER JOIN rental r
						ON p.rental_id = r.rental_id
						INNER JOIN inventory i
						ON i.inventory_id = r.inventory_id
						INNER JOIN film f
						ON i.film_id = f.film_id
						INNER JOIN film_category fc
						ON fc.film_id = f.film_id
						INNER JOIN category c
						ON c.category_id = fc.category_id
						GROUP BY name, title) sub
						WHERE c.name = sub.name
						)

