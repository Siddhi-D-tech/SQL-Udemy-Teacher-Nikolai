/*
SYNTEX
CREATE TABLE <table_name>(
column name1 DATA TYPE [CONSTRAINT],
column name2 DATA TYPE [CONSTRAINT]
) 
OR
CREATE TABLE <table_name>(
column name1 DATA TYPE [CONSTRAINT],
column name2 DATA TYPE [CONSTRAINT]
PRIMARY KEY(column[,..])
UNIQUE(column[,..])
) 

*/

CREATE TABLE director(
director_id SERIAL PRIMARY KEY,
director_account_name VARCHAR(20) UNIQUE,
first_name VARCHAR(50),
last_name VARCHAR(50) DEFAULT 'Not Specified',
date_of_birth DATE,
address_id INT REFERENCES address(address_id)
)

--SERIAL auto incremented
--even if the insert does not work because of an error, this ID will be used
--And then for the next insert the value will be incremented by one.

--Assignment

CREATE TABLE online_sales(
transaction_id SERIAL PRIMARY KEY, 
customer_id INT REFERENCES customer(customer_id),
film_id INT REFERENCES film(film_id),
amount NUMERIC(5,2) NOT NULL,
promotion_code VARCHAR(10) DEFAULT 'None'
)
