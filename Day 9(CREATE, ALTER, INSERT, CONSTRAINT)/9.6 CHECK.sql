/*
Limit the value range that can be placed in a column
SYNTAX
CREATE TABLE <table_name>(
<column_name> TYPE CHECK(condition))

If the condition is met then the row is allowed to be insert

To give the constraint a name
CREATE TABLE <table_name>(
<column_name> TYPE CONSTRAINT constraint_name CHECK(condition))

**NOTE**
Every constraint that we define always has a default name.
Default Name = <table_name>_<column>_check

Here column is the column name where we put condition in check
IF check condition has two name included then default_name ois table_check
Constraint is always something like a TABLE constraint.

WE can use CHECK in ALTER table Query 
*/

CREATE TABLE songs(
song_id INT PRIMARY KEY,
song_name VARCHAR(30) NOT NULL,
genre VARCHAR(30) DEFAULT 'Not Defined',
price NUMERIC(4,2) CHECK(price>=1.99),
release_date DATE CONSTRAINT date_check CHECK(release_date BETWEEN '01-01-1950' AND CURRENT_DATE))

)