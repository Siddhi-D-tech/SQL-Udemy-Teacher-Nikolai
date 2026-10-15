-- used to count no of rows in a output
-- used in combination with grouping and filtering

-- select count(*) 
-- from table1
-- null values will counted


-- select count(col1)
-- from table1
-- Note null values will not be counted

--select count(distinct first_name)
--from actor

select count(distinct first_name)
from customer

