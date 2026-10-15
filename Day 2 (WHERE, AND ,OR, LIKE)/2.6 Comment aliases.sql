-- single line comment
/* multiline
comment */

-- Aliases
/* Used to rename the column name in output of single query */


SELECT 
title, 
description AS description_of_movie ,
release_year
FROM film;