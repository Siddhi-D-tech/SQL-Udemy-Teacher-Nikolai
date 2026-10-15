/*
B-tree Index

Default index
Most databases use B-tree as the standard index type.

Unique columns (surrogate key, names)
Best for columns with many distinct values and frequent updates.

----
Bitmap Index

Slow to update
Not suitable for tables with lots of inserts/updates.

Storage efficient
Uses less space, especially for low-cardinality columns.

Great read performance
Very fast for analytical queries and filtering operations.



----Should we put an index on every column?

No! They come with a cost!
Extra storage required

Increased create/update time for the table

Use indexes only when necessary!

Purpose of indexes:
To avoid full table scans/reads
Small tables generally do not require indexes

Columns that are used as filters
*/