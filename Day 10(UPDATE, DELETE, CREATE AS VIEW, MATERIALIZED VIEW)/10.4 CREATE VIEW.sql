/*
Create view and just store statement to avoid disadvantages of storing the table
In view the data will not be stored physically, but just the logic This means we just 
basically store the statement And then whenever we query from this view, this query 
that is behind the view will be executed

SYNTAX 
CREATE VIEW <view_name>
AS query

DISADVANTAGE
1. If query is slow view will be slow 
Sometimes a view is not really ideal because we can have very complex queries that take a lot
of time, and we could decide to just create a table,
*/

/*
Create a view called films_category that shows a list of the film titles including 
their title, length and category name ordered descendingly by the length.

Filter the results to only the movies in the category 'Action' and 'Comedy'.
*/
CREATE VIEW films_category
AS
SELECT title, name, length
FROM film f
LEFT JOIN film_category fc
ON f.film_id = fc.film_id
LEFT JOIN category c
ON fc.category_id = c.category_id
WHERE name IN ('Action', 'Comedy')
ORDER BY length DESC

SELECT * FROM films_category
