/*
Privileges
In general, they are what the users or these roles are allowed to do.

SYNTAX
GRANT privilege
ON database_object
TO USER | ROLE| PUBLIC

SYNTAX
REVOKE privilege
ON database_object
TO USER | ROLE| PUBLIC

SYNTAX
REVOKE privilege
ON database_object
TO USER | ROLE| PUBLIC
GRANTED BY USER | ROLE

SYNTAX
REVOKE GRANT OPTION FOR privilege
ON database_object
TO USER | ROLE| PUBLIC
GRANTED BY USER | ROLE

-----------Privilege---------
Privilege            Applicable Object Types
SELECT               TABLE (and table-like objects), table column
INSERT               TABLE, table column
UPDATE               TABLE, table column
DELETE               TABLE
TRUNCATE             TABLE
CREATE               DATABASE, SCHEMA
CONNECT              DATABASE
EXECUTE              FUNCTION, PROCEDURE
USAGE                SCHEMA
-----------------------------
*/

--Create User

CREATE USER ria
WITH PASSWORD 'ria123';

CREATE USER mike
WITH PASSWORD 'mike123';

--Create Roles
CREATE ROLE read_only;
CREATE ROLE read_update;

--Grant Usage(already granted)
/*
This means the user/role can see that the schema exists 
and can refer to objects within it (e.g., tables, views) — 
but cannot actually select data yet.
*/
-- In the public schema, this is not necessary,but otherwise we would have to grant
-- usage privilege on the schema
GRANT USAGE
ON SCHEMA PUBLIC 
TO read_only;

--Grant SELECT on tables 
GRANT SELECT
ON ALL TABLES IN SCHEMA PUBLIC
TO read_only;

GRANT read_only TO mike

--Assign read_only to read_update role
GRANT read_only
TO read_update;

--GRANT all privileges on all tables in public to role
GRANT ALL
ON ALL TABLES IN SCHEMA PUBLIC
TO read_update;

--Revoke some privileges
REVOKE DELETE, INSERT
ON ALL TABLES IN SCHEMA PUBLIC
FROM read_update;

--Assign role to users
GRANT read_update
TO ria;

--DROP roles

-- Remove owned objects by mike
DROP OWNED BY mike;

-- Finally drop the role
DROP ROLE mike;

--Removing dependancies
DROP OWNED BY read_update;
DROP ROLE read_update;

