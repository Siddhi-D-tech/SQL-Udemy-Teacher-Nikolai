/*
-self reference in a table
-we always have to give an alias because otherwise it will be exactly the same table name.
-It is best practice to to name it in such a descriptive way that the table 
alias is representing the purpose/use case
*/ 

CREATE TABLE employee
(
employee_id INT,
name VARCHAR(50),
manager_id INT
);

INSERT INTO employee 
VALUES
	(1, 'Liam Smith', NULL),
	(2, 'Oliver Brown', 1),
	(3, 'Elijah Jones', 1),
	(4, 'William Miller', 1),
	(5, 'James Davis', 2),
	(6, 'Olivia Hernandez', 2),
	(7, 'Emma Lopez', 2),
	(8, 'Sophia Andersen', 2),
	(9, 'Mia Lee', 3),
	(10, 'Ava Robinson', 3);

SELECT emp.employee_id,
emp.name as employee,
mng.name as manager,
mng2.name as manager_of_manager
FROM employee emp
LEFT JOIN employee mng
ON emp.manager_id = mng.employee_id
LEFT JOIN employee mng2
ON mng.manager_id = mng2.employee_id

--find all of the pairs of films with the same length
SELECT f1.title,
f2.title,
f1.length
FROM film f1
LEFT JOIN film f2
ON f1.length = f2.length
AND f1.title<>f2.title
ORDER BY length DESC