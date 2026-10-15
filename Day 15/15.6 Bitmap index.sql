/*
1. A bitmap index is a special type of index that uses bitmaps (0s and 1s) 
to represent the existence of a value in a table row.
2. It is mainly used in 
data warehousing, 
read-heavy workloads, 
and columns with low cardinality (few distinct values).

3. How Bitmap Index Works

For a column, the database creates:
One bitmap (bit vector) for each distinct value.
Each bit represents a row:
1 → row contains the value
0 → row does not contain the value

4. Where Bitmap Index is Useful

Best when:
Columns have low cardinality
e.g., gender, status, department_id, yes/no fields.
Queries involve many AND/OR conditions.
Systems with more reads than writes (OLAP systems).

Not recommended for:
High-cardinality columns (e.g., employee_id)
OLTP systems with many updates (bitmap locking overhead)
*/