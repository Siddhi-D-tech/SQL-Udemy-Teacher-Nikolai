WITH RECURSIVE count_cte AS (
-- Step 1: Define recursive CTE 
	-- Anchor Member : Start with 1

	SELECT 1 AS number 
	
	UNION ALL 
	
	--Recursive member : Increament the number by 1 until 10
	SELECT number * 2
	FROM count_cte 
	WHERE number < 5
)

-- Select all numbers from the recursive CTE
SELECT number from count_cte

--Goal: Identify and list all subcategories of a specified category within a hierarchy 
WITH RECURSIVE cte_name AS (
	-- Anchor member
	SELECT columns
	FROM table
	WHERE condition
	
	UNION ALL
	
	-- Recursive member
	SELECT columns
	FROM table
	JOIN cte_name ON condition
)

-- Creating a New Hierarchical Category Table
-- Step 1 : Create new new table

CREATE TABLE hierarchical_category(
	category_id INTEGER PRIMARY KEY,
	name TEXT NOT NULL,
	parent_category_id INTEGER REFERENCES hierarchical_category(category_id)
);

-- Step 2: Insert Sample Data to Establish Hierarchical Relationships

INSERT INTO hierarchical_category (category_id, name, parent_category_id) VALUES
(1, 'Action', NULL),
(2, 'Animation', NULL),
(3, 'Children', 2),      -- Children under Animation
(4, 'Classics', 1),      -- Classics under Action
(5, 'Comedy', 1),        -- Comedy under Action
(6, 'Superhero', 4),     -- Superhero under Classics
(7, 'Slapstick', 5),     -- Slapstick under Comedy
(8, 'Documentary', NULL),
(9, 'Nature', 8),        -- Nature under Documentary
(10, 'Space', 9),        -- Space under Nature
(11, 'Astronomy', 10);   -- Astronomy under Space

--Step 3: Query new category table

SELECT * FROM hierarchical_category

-- Using a recursive CTE with the New Hierarchical Category Table

WITH RECURSIVE category_hierarchy AS(
	--Anchor Member
	SELECT * 
	FROM hierarchical_category c
	WHERE c.category_id = 1

	UNION ALL 

	--Recursive Member

	SELECT c.category_id, c.name, c.parent_category_id 
	FROM hierarchical_category c
	INNER JOIN category_hierarchy ch 
	ON c.parent_category_id = ch.category_id
)

-- Step 2 : SELECT all

SELECT category_id, name, parent_category_id 
FROM category_hierarchy

--Termination Condition
--Only two leveles should be visible

WITH RECURSIVE category_hierarchy AS(
	--Anchor Member
	SELECT c.category_id, c.name, c.parent_category_id, 1 AS depth 
	FROM hierarchical_category c
	WHERE c.category_id = 1

	UNION ALL 

	--Recursive Member

	SELECT c.category_id, c.name, c.parent_category_id , ch.depth+1
	FROM hierarchical_category c
	INNER JOIN category_hierarchy ch 
	ON c.parent_category_id = ch.category_id
	WHERE ch.depth < 2
)

-- Step 2 : SELECT all

SELECT category_id, name, parent_category_id 
FROM category_hierarchy


/* Challenge
1. Use a recursive CTE to find all subordinates of a given employee.
*/
-- Create the employee table
CREATE TABLE IF NOT EXISTS employee (
    employee_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    manager_id INTEGER REFERENCES employee(employee_id)
);

SELECT * 
FROM employee
-- Insert sample data to establish an employee hierarchy
INSERT INTO employee (employee_id, name, manager_id) VALUES
(1, 'Alice', NULL),       -- Alice is the CEO, no manager
(2, 'Bob', 1),            -- Bob reports to Alice
(3, 'Charlie', 1),        -- Charlie reports to Alice
(4, 'David', 2),          -- David reports to Bob
(5, 'Eve', 2),            -- Eve reports to Bob
(6, 'Frank', 3);          -- Frank reports to Charlie


WITH RECURSIVE subordinates_list AS(

	
	SELECT employee_id, name, manager_id
	FROM employee
	WHERE employee_id = 1
	
	UNION ALL

	SELECT e.employee_id, e.name, e.manager_id
	FROM employee e
	INNER JOIN subordinates_list sl
	ON e.manager_id = sl.employee_id
)

SELECT employee_id, name, manager_id
FROM subordinates_list
