/*
User defined functions cannot execute transactions.

Stored Procedures supports transactions
We do not have this returns and then the data type in SP, Beacause 
SP does not return a value like the user defined function does.

SYNTAX

CREATE PROCEDURE <procedure_name> (param1, param2, ...)
	LANGUAGE plpgsql [sql|c|..]
AS
$$
DECLARE 
<variable declaration>;
BEGIN
<function definition>;
RETURN; -- this will immediately stop this stored procedure 
END;
$$

CALL <stored_procedure_name> (param1, param2, ...);
*/

CREATE PROCEDURE sp_transfer(tr_mount INT, sender INT, recipient INT)
LANGUAGE plpgsql
AS 
$$
BEGIN
-- substract from sender's balance
UPDATE acc_balance
SET amount = amount - tr_mount
WHERE id = sender;

-- add to recepient's balance
UPDATE acc_balance
SET amount = amount + tr_mount
WHERE id = recipient;

COMMIT;
END;
$$

CALL sp_transfer(100,1,2)
SELECT * FROM acc_balance

/* Challenge
Create a stored procedure called emp_swap that accepts now two parameters, 
emp1 and emp2 as an input and swap their position and their salary.
*/
SELECT * FROM employees

CREATE OR REPLACE PROCEDURE emp_swap(emp1 INT, emp2 INT)
LANGUAGE plpgsql
AS
$$
DECLARE 
emp1_position TEXT;
emp1_salary DECIMAL(8,2);
emp2_position TEXT;
emp2_salary DECIMAL(8,2);

BEGIN

-- store values in variable
SELECT position_title INTO emp1_position
FROM employees
WHERE emp_id = emp1; 

SELECT position_title INTO emp2_position
FROM employees
WHERE emp_id = emp2;

SELECT salary INTO emp1_salary
FROM employees
WHERE emp_id = emp1; 

SELECT salary INTO emp2_salary
FROM employees
WHERE emp_id = emp2;


-- Update values 

UPDATE employees
SET position_title = emp2_position, salary = emp2_salary 
WHERE emp_id = emp1;


UPDATE employees
SET position_title = emp1_position, salary = emp1_salary 
WHERE emp_id = emp2;

COMMIT;
END;
$$

 


