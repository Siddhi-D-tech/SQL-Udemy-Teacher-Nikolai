--1.list of distinct district
select distinct district from address

--2. Latest rental date
select rental_date
from rental
order by rental_date desc
limit 1

-- How many films company have
select count(*)
from film

-- how many distinct last names
select count(distinct last_name)
from customer