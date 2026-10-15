/*
Union combine the rows
Combine multiple select statements into one final output.

Syntax
SELECT col1,col2 FROM table1
UNION 
col1,col2 FROM table2

how are the columns matched?
1.The ORDER matches the column
The name of the columns, if they are different,will be used just from the first table.
2.The data types must match
3.The number of columns must also match
4.If we have one value occurring multiple times, then this will be decoupled
i.e. in the output, there will always be only one value. No duplicates
5.To have all of the duplicates use the UNION ALL command.
*/

SELECT first_name, 'actor' AS origin FROM actor
UNION 
SELECT first_name, 'customer' AS test1 FROM customer
UNION
SELECT first_name, 'staff' FROM staff
ORDER BY 1;

SELECT first_name FROM actor
UNION ALL
SELECT first_name FROM customer
ORDER BY 1;





