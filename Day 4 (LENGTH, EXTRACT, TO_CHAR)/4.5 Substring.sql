/* Used to extract a substring from a string
SYNTAX
SUBSTRING(string from start[for length])
string : column/string that we want to extract from
start : position - WHERE To start from
optional for length : How many characters
When not specified, end of string considered
*/

SELECT
email
, SUBSTRING(email from POSITION('.' in email)+1 for LENGTH(last_name))
FROM customer;

SELECT
SUBSTRING(email from 3 for 2) 
FROM customer;

SELECT
SUBSTRING(email from POSITION('.' in email)+1 for POSITION('@' in email) - POSITION('.' in email)-1)
FROM customer;

-- Challenge
SELECT
email
,LEFT(email,1) || '***.' || SUBSTRING(email from POSITION('.' in email)+1 for 1) || '***' || SUBSTRING(email from POSITION('@' in email))
FROM customer;

SELECT 
email
, '***' || SUBSTRING(email from POSITION('.' in email)-1 for 3) || '***' || SUBSTRING(email from POSITION('@' in email))
FROM customer
