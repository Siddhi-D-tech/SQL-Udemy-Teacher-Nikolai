/*
Constraints 
Are defined when table is created
Used to define rules for the data in a table
Prevent the insert of invalid data
Constraints can be defined either on a column or on a table level

Types of constraints 
1. Column constraints :

NOT NULL 	 Ensure that the column can not have null value
UNIQUE   	 Ensures that all of the values in a column are different
DEFAULT  	 Sets a default value for a column if no value is specified
PRIMARY KEY  Combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
REFERENCES   Ensures referencial integrity (only values of another column can be used)
CHECK 		 Ensures values in a column satisfies specific condition

2. Table constraints :

PRIMARY KEY(column[,..])
UNIQUE(column[,..])   Enter all of the columns that should have this unique constraint.
CHECK(search condition)

**Primary Key**
A primary key is one or multiple columns that uniquely identify each row in a table.
PK which indicates that this is the primary key column.
PK column needs to have unique values and NULL are not allowed

**Foreign Key**
Foreign Key is one or multiple columns that refer the primary key of another column.
Referencing table (Child table) where the the foreign key included
Referenced table (Parent table) from which the foreign key taken

Note:
-- Foreign Key does not need to be unique
-- We can have have multiple foreign keys
-- Primary Key and Foreign Key are usually used to create joints between the tables
-- Primary Key and Foreign Key can be created also in the creation process
*/ 

SELECT COUNT(*)
FROM film
WHERE 'Behind the Scenes' = ANY(special_features)