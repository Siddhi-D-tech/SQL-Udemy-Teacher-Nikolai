/*
SYNTAX
DELETE FROM <table>
WHERE condition

To delete all the rows don't give the where condition

To see this entire list of the deleted row, we can use the returning operator.
We can add the columns that we want to have returned of those deleted rows
DELETE FROM <table>
WHERE condition
RETURNING col1, col2
*/

SELECT *
FROM songs

DELETE FROM songs
WHERE genre = 'Pop music'

DELETE FROM songs
WHERE song_id = 4
RETURNING song_id, song_name

--Challenge
SELECT * 
FROM payment

DELETE FROM payment
WHERE payment_id IN (17064, 17067)
RETURNING payment_id

SELECT * FROM payment
WHERE payment_id IN (17064, 17067)