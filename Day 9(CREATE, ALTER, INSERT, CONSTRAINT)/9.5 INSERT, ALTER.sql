/*
SYNTAX
INSERT INTO <table>
VALUES (value1, value2, ...)

User same order that the columns are in this table
The data type must match the column that we have defined,
and also the constraints that we have defined

INSERT INTO <table>
(col2, col3)
VALUES (value2, value3)

OR

INSERT INTO <table>
(col3, col2)
VALUES (value3, value2)

Columns in which you don't want to enter values we don't even mention in here
If we change column adjust the values accordingly
*/
CREATE TABLE online_sales(
transaction_id SERIAL PRIMARY KEY, 
customer_id INT REFERENCES customer(customer_id),
film_id INT REFERENCES film(film_id),
amount NUMERIC(5,2) NOT NULL,
promotion_code VARCHAR(10) DEFAULT 'None'
)

INSERT INTO online_sales
(customer_id,film_id,amount,promotion_code)
VALUES (124,65,14.99,'PROMO2022'),
	   (225,231,12.99,'JULYPROMO'),
	   (119,53,15.99,'SUMMERDEAL')


SELECT * FROM online_sales

/*
ALTER TABLE
ADD/DROP/TYPE/RENAME/CONSTRIANTS the columns
ADD/DROP constraints
Rename columns/entire table

SYNTAX - DROP
ALTER TABLE <table_name>
DROP COLUMN <column_name>

We can even add the keyword if Exists, so this will then prevent an error message if that column
ALTER TABLE <table_name>
DROP COLUMN IF EXISTS <column_name>

SYNTAX - ADD
ALTER TABLE <table_name>
ADD COLUMN IF NOT EXISTS<column_name> data_type

SYNTAX - TYPE
ALTER TABLE <table_name>
ADD COLUMN <column_name> TYPE new_data_type

SYNTAX - CONSTRAINT(DEFAULT, NOT NULL, RENAME)
ALTER TABLE <table_name>
ALTER COLUMN <column_name> SET/DROP <constraint type>
or
RENAME COLUMN <column_name> TO new_NAME

TABLE CONSTRAINTS
ALTER TABLE <table_name>
ADD CONSTRAINT <constraint_name> UNIQUE(column1, column1,.. )

ALTER TABLE <table_name>
ADD CONSTRAINT <constraint_name> PRIMARY KEY(column1, column1,.. )

**Note**
All these steps can be conbined apart from the rename step,
it has perform in a single action, so we always need to use that individually.

ALTER TABLE old_table_name
RENAME TO new_table_name

*/

--Challenge

SELECT * 
FROM directors

ALTER TABLE director
ALTER COLUMN director_account_name TYPE VARCHAR(30),
ALTER COLUMN first_name DROP DEFAULT,
ALTER COLUMN first_name SET NOT NULL,
ADD COLUMN IF NOT EXISTS email VARCHAR(30)

ALTER TABLE director
RENAME COLUMN director_account_name TO account_name

ALTER TABLE director
RENAME TO directors
