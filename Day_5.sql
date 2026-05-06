-- INDEX
-- It is a type of data structure
-- It is used to find values within a specific column more quickly
-- MySQL normally searches sequentially through columns
-- The larger the column, the more expensive the operation is
-- UPDATE takes more time, SELECT faster

/*
-- Create index on a column

create index first_name_indx
on employee (first_name);


--- show indexes 
show index from employee;


-- Multi Column Index

create index first_last_name_index
on employee( first_name, last_name) ;


 -- Drop an index
 
 alter table employee
 drop index first_last_name_index ;
 */


-----------   SUBQUERY
-- A query within another query

 /*
select first_name, last_name, hourly_pay from employee 
where hourly_pay > 
	(select AVG(hourly_pay) from employee);
   
   
select first_name , last_name, customer_id from customer
where customer_id in
	(select customer_id from customer where customer_id is not null);
*/  



---------  GROUP BY
-- Aggregates rows by a specific column
-- Often used with aggregate functions
-- Examples: SUM(), MAX(), MIN(), AVG(), COUNT()

/*
select SUM(amount), order_date
from transaction
	GROUP BY order_date;
    
select count(amount), order_date
from transaction
	GROUP BY order_date;
    
select max(amount), order_date
from transaction
	GROUP BY order_date;
    
    
select min(amount), order_date
from transaction
	GROUP BY order_date;
    
select avg(amount), order_date
from transaction
	GROUP BY order_date;
*/


/*
-------   HAVING
-- GROUP BY and WHERE cannot be used together 
-- WHERE filters rows
-- HAVING filters grouped results

select sum(amount), customer_id
from transaction
Group By customer_id
		HAVING count(amount) > 1 AND
				customer_id is not null;
                
select * from transaction;

*/


------------ ROLLUP
-- Extension of GROUP BY clause
-- Produces another row and shows grand total
-- Rollup works only with aggregate columns

/*

SELECT COUNT(transaction_id) as 'id of orders', order_date
FROM transaction
GROUP BY order_date WITH ROLLUP;

SELECT COUNT(transaction_id), order_date
FROM transaction
GROUP BY order_date WITH ROLLUP;

*/


--------- ON DELETE CLAUSE
---- TWO TYPES
-------------- ON DELETE CASCADE
-- When foreign key row is deleted,
-- related rows in child table also get deleted
-----------    ON DELETE SET NULL
-- If parent row is deleted,
-- child table value becomes NULL

/*
ALTER TABLE transactions
ADD CONSTRAINT fk_customer_id
FOREIGN KEY (customer_id) 
REFERENCES customer(customer_id) 
ON DELETE SET NULL;

--- here table transactions is the child beacuse it contains the foreign key 
--- and table customer is the parent because it's primary key is being referenced.
*/

/*
delete from customer where first_name = "ron";

select * from transactions;
select * from customer;
*/
