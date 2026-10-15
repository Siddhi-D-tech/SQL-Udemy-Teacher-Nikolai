-- ALTER DATABASE greencycles SET timezone TO 'Europe/Berlin'; 
-- Between... AND...
-- Filter a range of values

SELECT 
payment_id, payment_date
FROM payment
WHERE amount BETWEEN 1.99 AND 6.99;
--- 1.99 and 6.99 both included

SELECT 
paymemnt_id, payment_date
FROM payment
WHERE amount NOT BETWEEN 1.99 AND 6.99;
-- 1.99 and 6.99 both not included

--Dates
SELECT payment_id, amount
FROM payment
--YY-MM-DD
WHERE payment_date BETWEEN '2020-01-24' AND '2020-01-26'

-- inernally transformed 
SELECT payment_id, amount
FROM payment
--YY-MM-DD
WHERE payment_date BETWEEN '2020-01-24 0:00' AND '2020-01-26 0:00'

-- 24  everythin included but 26 after midnight not included, means 25 midnight included