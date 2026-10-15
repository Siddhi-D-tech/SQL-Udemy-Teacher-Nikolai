/*
SYNTAX to create user

CREATE USER <user_name>
WITH PASSWORD 'pwd123'

DROP USER <user_name>

SYNTAX to create role

CREATE ROLE <role_name>
WITH LOGIN PASSWORD 'pwd123'

DROP ROLE <role_name>

1. By default, when we create a database there's always the schema "Public" included.
In public schema, when we create new users,these newly-created users will always be able
to use the public schema.
This means that they can create objects in that schema and they will be able to 
see those objects in that schema.

2. When a user is created we get the message "CREATE ROLE"  
this is because a role is technically a User + Login 

*/

CREATE USER sarah
WITH PASSWORD 'sarah1234';

CREATE ROLE alex
WITH LOGIN PASSWORD 'alex1234';