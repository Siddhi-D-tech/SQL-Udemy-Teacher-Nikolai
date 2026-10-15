--Create the user mia with password 'mia123'
CREATE USER mia
WITH PASSWORD 'mia123';

--Create  the role analyst_emp
CREATE ROLE analyst_emp;

--Grant SELECT on all tables in the public schema to that role.
GRANT SELECT
ON ALL TABLES IN SCHEMA public
TO analyst_emp;

--Grant INSERT and UPDATE on the employees table to that role.
GRANT INSERT, UPDATE
ON employees
TO analyst_emp;

--Add the permission to create databases to that role.
ALTER ROLE analyst_emp CREATEDB; 

--Assign that role to mia and test the privileges with that user.
GRANT analyst_emp
TO ria;