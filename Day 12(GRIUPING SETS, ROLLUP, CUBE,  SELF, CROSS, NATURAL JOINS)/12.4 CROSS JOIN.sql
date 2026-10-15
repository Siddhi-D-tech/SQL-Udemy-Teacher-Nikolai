/*
CROSS JOIN
This will basically just create the Cartesian product.
We get all of the possible combination of rows.
If we have duplicates in the initial table we also in the 
cross join result have those duplicates as well.

we don't need to specify on because there's no relationship between those tables
This is not the combination of values but the combination of rows.

SYNTAX
SELECT
t1.column
t2.column
FROM table t1
CROSS JOIN table t2
*/

SELECT *
FROM staff

SELECT *
FROM store

SELECT 
staff_id,
store.store_id
FROM staff
CROSS JOIN store