/*
Data Types
1. Numeric
	type	   storage size  and   notes
'INT'      4 bytes (commonly used)

'SMALLINT' 2 bytes (better in term of performance)

'BIGINT'   8 bytes 

'NUMERIC'  DECIMAL data type,size is variable, user-defined precision
				numeric(precision, scale)
				Precision : total count of digits  24.99 has precision 4
				Scale :  count of decimal places 24.99 has scale 2
				
'SERIAL' 	  Auotincrementing integer

-----
2. Strings
	type	                 storage size  and   notes
character varying(n),        variable length with limit 
varchar(n)

character(n),        		 fixed length, space-padded, i.e. if not added the space added
char(n)						 e.g. "M"

text						 variable unlimited length


what is the appropriate data types for something like a ZIP code or phone numbers?
ANS. We can have things like leading zeros. that those values don't have a numerical meaning.
     And this is why we should not use a numeric data type rather use strings


3. Date/Time
   type	                 		  storage size  and   notes
date							  Just date without time  '2025-09-10'

time(with/without timezone)       Just time without date  '01:02:03.678'

								  '14:00:00:00+02'  +02 is is the UTC offset,
								  which would be the same as 12 o'clock in UTC time.
								  '12:00:00.000+00'

timestamp(with/without timezone)   Date and Time '2025-09-10 01:02:03.678+02'

intervals  						   time interval '3 days 01:02:03.678'

4. Others

type		 description				 			range
boolean 	state of true or false					TRUE, FALSE, NULL

enum 		a value of list of ordered values 		movie rating, user-defined

Values created will be in specific order, So if we want to order our table using this rating column
they will not be ordered alphabetically,but in this specific order that we have given

SYNTAX 
CREATE TYPE mppa_mapping AS ENUM('G', 'PG') 

array 		stores a list of values 	text[] or int[]    Depending on type

name 	phone
peter	{'+48-456356356', '+46-346346346'}

SELECT name, phone[1] FROM customers gives irst number of each person

*/

