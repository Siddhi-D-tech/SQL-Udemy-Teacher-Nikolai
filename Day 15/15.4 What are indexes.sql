/*
1. Indexing in SQL improves query performance by allowing the database, it a  avoids full table scan 
and quickly see where are the values,and retrieve those data rows much, much faster
2. It slowers the data writing because now we also need to maintain additional index, 
this additional table, and thsi table can take up some additional storage
to locate rows faster without scanning the entire table
2. Data is stored without a particular order.
So for read queries afte table scan the resuld is returned, this descreases the perforamce. 
*/