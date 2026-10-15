/*
UPDATE <table>
SET <column> = value
*/

SELECT *
FROM songs

INSERT INTO songs
VALUES(5,'SQL Song','Not Defined',0.99,'09-08-1999')

INSERT INTO songs
VALUES(6,'SQL Song3','Pop music',0.99,'09-08-1999')

UPDATE songs
SET genre = 'Country Music'

UPDATE songs
SET genre = 'Country Music'
WHERE song_id = 5

UPDATE songs
SET price = price+song_id

SELECT *
FROM customer
WHERE customer_id=1

UPDATE customer
SET last_name = 'BROWN'
WHERE customer_id=1

UPDATE customer
SET email=lower(email)

--Challenge---
--1. Update rental prices that are 0.99 to a rental price of $1.99

SELECT *
FROM film
ORDER BY film_id 

UPDATE film
SET rental_rate = 1.99
WHERE rental_rate = 0.99

/*2. ALTER customer table
1. Add the column initials (VARCHAR(10))
2. Update the values to the actual initials
For example, if the first name is Frank and last name is Smith, the value in here should be F.S.
*/
ALTER TABLE customer
ADD column IF NOT EXISTS initials VARCHAR(10)

SELECT * FROM customer

UPDATE customer
SET initials =  LEFT(first_name,1) || '.' || LEFT(last_name,1) || '.'


