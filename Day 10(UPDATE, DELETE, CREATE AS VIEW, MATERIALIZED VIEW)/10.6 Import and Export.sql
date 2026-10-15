/*
Import external data into an existing table
1. Tables need to be created first
2. The format, the data types all should match the table in our database
3. The data and the columns will be not matched by the order of the columns.

Export data from a table into CSV file
*/

CREATE TABLE sales (
transaction_id SERIAL PRIMARY KEY,
customer_id INT,
payment_type VARCHAR(20),
creditcard_no VARCHAR(20),
cost DECIMAL(5,2),
quantity INT,
price DECIMAL(5,2))