-- ============================================
-- DAY 6
-- ============================================


-- ============================================
-- ON DELETE CASCADE
-- ============================================

ALTER TABLE transaction
ADD CONSTRAINT fk_transactions_id
FOREIGN KEY(customer_id)
REFERENCES customer(customer_id)
ON DELETE CASCADE;


-- Updating values

UPDATE transactions
SET customer_id = 5
WHERE transaction_id = 1005;

-- Similar to ON DELETE SET NULL,
-- but instead of setting NULL value,
-- the row itself gets deleted when
-- CASCADE is used.



-- ============================================
-- STORED PROCEDURE
-- ============================================

-- It is prepared SQL code that can be saved.
-- Used when there are queries that you write often.

-- Advantages:
-- Reduces network traffic
-- Increases performance
-- Increases memory usage


DELIMITER $$

CREATE PROCEDURE find_customer
(
    IN f_name VARCHAR(50),
    IN l_name VARCHAR(50)
)

BEGIN

SELECT *
FROM customer
WHERE first_name = f_name
AND last_name = l_name;

END $$

DELIMITER ;


-- Calling procedure

CALL find_customer("Larry", "Lobster");

-- What happens:
-- The stored procedure retrieves the row details
-- with first_name = Larry and last_name = Lobster.


-- Drop procedure

DROP PROCEDURE find_customer;



-- ============================================
-- TRIGGERS
-- ============================================

-- When an event happens, do something
-- Events:
-- INSERT
-- UPDATE
-- DELETE

-- Uses:
-- Checks data
-- Handles errors
-- Audit tables



-- ============================================
-- INSERT A NEW COLUMN
-- ============================================

ALTER TABLE employees
ADD COLUMN salary DECIMAL(10,2)
AFTER hourly_pay;



-- ============================================
-- TRIGGER EXAMPLE
-- ============================================

CREATE TRIGGER hourly_pay_salary_updation

BEFORE UPDATE ON employees

FOR EACH ROW

SET NEW.salary = (NEW.hourly_pay * 2080);


-- What happens:
-- Salary is automatically updated
-- when hourly_pay is increased or decreased.

-- Since there are 2080 working hours in a year:
-- Annual salary = hourly_pay * 2080



-- ============================================
-- SHOW / DROP TRIGGERS
-- ============================================

SHOW TRIGGERS;

DROP TRIGGER hourly_pay_salary_updation;



-- ============================================
-- ANOTHER TRIGGER EXAMPLE
-- ============================================

CREATE TRIGGER hourly_pay_salary_insertion

BEFORE INSERT ON employees

FOR EACH ROW

SET NEW.salary = NEW.hourly_pay * 2080;


-- What happens:
-- When a new row is inserted,
-- the trigger performs automatically on that row.


-- Explanation:
-- BEFORE INSERT ON employees
-- Trigger runs before a new row is inserted.

-- FOR EACH ROW
-- Runs for every new row inserted.

-- NEW
-- Refers to the new row being inserted.

-- Based on hourly_pay,
-- trigger handles salary.



-- ============================================
-- UPDATION USING NESTED QUERY
-- ============================================

UPDATE expenses

SET expense_total =
(
    SELECT SUM(salary)
    FROM employees
)

WHERE expense_name = "salaries";



-- ============================================
-- CREATE EXPENSES TABLE
-- ============================================

CREATE TABLE expenses
(
    expense_id INT PRIMARY KEY,
    expense_name VARCHAR(50),
    expense_total DECIMAL(10,2)
);


INSERT INTO expenses
VALUES
(1, "salaries", 0),
(2, "supplies", 0),
(3, "taxes", 0);



-- ============================================
-- TRIGGER TO UPDATE EXPENSES
-- WHEN EMPLOYEE IS DELETED
-- ============================================

CREATE TRIGGER after_salary_delete

AFTER DELETE ON employees

FOR EACH ROW

UPDATE expenses

SET expense_total = expense_total - OLD.salary

WHERE expense_name = "salaries";


-- What happens:
-- After a row is deleted from employees table,
-- expenses table is automatically updated
-- by subtracting old salary from expense_total.

-- Here two tables are involved:
-- employees and expenses



-- ============================================
-- TRIGGER AFTER INSERT
-- ============================================

CREATE TRIGGER after_salary_insert

AFTER INSERT ON employees

FOR EACH ROW

UPDATE expenses

SET expense_total = expense_total + NEW.salary

WHERE expense_name = "salaries";


-- What happens:
-- When a new employee is inserted,
-- the salary is added to expense_total.



-- ============================================
-- TRIGGER AFTER UPDATE
-- ============================================

CREATE TRIGGER after_salary_update

AFTER UPDATE ON employees

FOR EACH ROW

UPDATE expenses

SET expense_total = expense_total +
(NEW.salary - OLD.salary)

WHERE expense_name = "salaries";
