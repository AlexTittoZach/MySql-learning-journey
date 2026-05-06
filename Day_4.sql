----- LOGICAL OPERATORS ----

--- AND operator
--- both condition must be true
/*
SELECT * 
FROM employee
WHERE hired_date < '2023-01-05' 
AND job = 'cook';
*/

--- OR operator
--- either condition must be true
/*
SELECT * 
FROM employee 
WHERE job = 'cook' 
OR job = 'cashier';
*/

-- NOT operator

/*
SELECT * 
FROM employee
WHERE NOT job = 'manager';
*/
-- (displays all except manager)

---- COMBINING LOGICAL OPERATORS ---

/*
SELECT * 
FROM employee
WHERE NOT job = ' sales lead' 
AND NOT job = ' asst.manager';
*/

---- BETWEEN OPERATOR
/*
SELECT * 
FROM employee
WHERE hired_date BETWEEN '2023-01-04' AND '2023-01-07';
*/

--- IN OPERATOR

/*
SELECT * 
FROM employee
WHERE job IN ('cook', 'cashier', 'janitor');
*/


--- WILDCARD CHARACTERS ( LIKE, __ )

/*
-- Starts with 'S'
SELECT * 
FROM employee
WHERE first_name LIKE 'p%';

-- Ends with 'sk'
SELECT * 
FROM employee
WHERE last_name LIKE '%sk';

-- Hire date in January (month = 01)
SELECT * 
FROM employees 
WHERE hired_date LIKE '____-01-__';
*/


---- ORDER BY CLAUSE
/*
-- Sort by hire_date descending
SELECT * 
FROM employee
ORDER BY hired_date DESC;

--- if hired_date has two same dates then sort those two based on employee_id
SELECT * 
FROM employee
ORDER BY hired_date, employee_id;
*/


-----  LIMIT CLAUSE
/*
-- Display only 1 record
SELECT * 
FROM employee
LIMIT 1;

-- Top 4 records ordered by name
SELECT * 
FROM employee
ORDER BY first_name DESC 
LIMIT 4;
*/

---- Offset limit
/*
-- Skip 2 row, take 10 row
select * from employee order by job asc limit 2, 10 ;
*/


----- UNION OPERATOR
/*
SELECT first_name, last_name 
FROM employee
UNION
SELECT first_name, last_name 
FROM customer;

SELECT first_name, last_name 
FROM employees
UNION
SELECT first_name, last_name 
FROM customers;

-- UNION ALL (includes duplicates)
SELECT first_name, last_name 
FROM employees
UNION ALL
SELECT first_name, last_name 
FROM customers;
*/


----- SELF JOIN
--- join a table with the copy of itself
/*
select 
		a.employee_id, a.first_name, a.last_name, CONCAT(b.first_name," ",b.last_name) AS referred_by 
from employee as a INNER JOIN employee as b 
ON a.referral_id = b.employee_id;
*/

---- VIEWS 
-- Create view
/*
create view employee_attendance as SELECT first_name, last_name from employee;

--- use view
select * from employee_attendance order by first_name desc;

--- drop view
Drop view employee_attendance;
*/
