/*
A transaction is just one unit of work
and one unit of work can contain one or multiple operations

if we have not committed that transaction yet,
it will not be visible in other sessions.(This means especially for other users.)

SYNTAX
BEGIN;

OPERATION1;
OPERATION2;

COMMIT;

if we have not committed them,they will only be visible in our current session
So we can see that those operations have taken place ,but the other users will not see them
And then of course if we are happy with the result and we have formed 
those operations that form a unit,then we can commit it and then the operations,
then it will take place also for the other users.
*/


CREATE TABLE acc_balance (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
    amount DEC(9,2) NOT NULL    
);

INSERT INTO acc_balance
VALUES 
(1,'Tim','Brown',2500),
(2,'Sandra','Miller',1600)

SELECT * FROM acc_balance;

--Transaction
BEGIN;
UPDATE acc_balance
SET amount = amount - 100
WHERE id = 1;

UPDATE acc_balance
SET amount = amount + 100
WHERE id = 2;

COMMIT;

/*
Miller McQuarter and Christalle McKenny,have agreed to swap both their positions and their salaries
and now, we need to implement this in SQL.
*/

BEGIN;

UPDATE employees
SET 
position_title = (SELECT position_title FROM employees
					 WHERE first_name = 'Christalle' AND last_name = 'McKenny'),
salary = (SELECT salary FROM employees
					 WHERE first_name = 'Christalle' AND last_name = 'McKenny')
WHERE first_name = 'Miller' AND last_name = 'McQuarter'

UPDATE employees
SET 
position_title = 'Head Of BI', salary = '14614.00'
WHERE first_name = 'Christalle' AND last_name = 'McKenny'

SELECT * FROM employees ORDER BY emp_id

COMMIT;



