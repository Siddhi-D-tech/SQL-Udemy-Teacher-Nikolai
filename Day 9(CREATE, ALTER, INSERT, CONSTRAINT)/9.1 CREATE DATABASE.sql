/*

Managing Tables
CREATE(Database, table, Schemas)
ALTER (Data Definition)(INSERT, UPDATE, DELETE)
DROP


SYNTAX
CREATE DATABASE <database_name>;

Ways to create database
Method 1: 
by using the interface.

Method 2:
CREATE DATABASE <database_name>;

Note: Don't use whitespace in the objects name, You can use underscore '_' instead if necessary
TO use whitespace, upper lower case combination use double quotes


if we are in a specific country with a specific set of characters,
we could use for example, a different type of encoding.
if we don't specify that at all, is UTF-8.

Syntax to add comment
COMMENT ON TYPE_OF_OBJECT name IS 'comment value'


***DROP***
We can use this drop command to delete any database object.
DROP object <object_name>

DROP database
DROP DATABASE [IF EXISTS] name;

DROP TABLE <table_name>
We can delete tables 

***TRUNCATE***
DOES not delte table but the data in the table
TRUNCATE TABLE table_name
OR 
Since truncate only works on tables we can also use
TRUNCATE table_name
*/

CREATE DATABASE sidchi_company;

COMMENT ON DATABASE sidchi_company IS 'This is our database'

DROP DATABASE companyx


-- Create table
CREATE TABLE emp_table 
(
	emp_id SERIAL PRIMARY KEY,
	emp_name TEXT
)

-- SELECT table
SELECT * FROM emp_table

-- Drop table
DROP TABLE emp_table

-- Insert rows
INSERT INTO emp_table
VALUES
(1,'Frank'),
(2,'Maria')

-- SELECT table
SELECT * FROM emp_table

-- Truncate table
TRUNCATE emp_table