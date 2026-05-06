----- PRIMARY KEY CONSTRAINT -----
-- unique + not null --
/*
create table transactions (
transaction_id int primary key,
amount int );
*/

--- adding primary key to an existing table ---
/*
alter table transactions add constraint primary key transaction_id;
*/

-- changing datatype from into decimal ---
/*
alter table transactions modify column amount decimal (8,2);
*/

----- AUTO_INCREMENT ---

/*
create table MALL (
transaction_id int primary key auto_increment,
amount decimal (5,3)
);

alter table transactions auto_increment=112;

insert into mall (amount) values (12.3);
*/

---- deleting all rows from table --
/*
delete from mall;
*/

---- FOREIGN KEY ---
---- used to establish a link btw two links ----

/*
create table state_bank (
transaction_code int primary key auto_increment,
amount decimal (5,3),
transaction_id int,
FOREIGN KEY (transaction_id) REFERENCES mall(transaction_id)
);
*/

--- to drop a foreign key ----
/*
alter table state_bank
drop foreign key state_bank_ibfk_1 ;
*/

--- adding foreign key to existing table ----
/*
alter table state_bank 
Add foreign key (transaction_id) references mall(transaction_id) ;
*/

/*
----- PARENT TABLE ----
CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50)
);
----- CHILD TABLE ----
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(10,2),
    customer_id INT,
    FOREIGN KEY (customer_id)
    REFERENCES customer(customer_id)
);
*/



----- JOINS ----
 
 --- INNER JOIN ---
 /*
select * from transactions inner join customer
on transactions.customer_id = customer.customer_id;

select transaction_id,amount,first_name
from transactions inner join customer
on transactions.customer_id = customer.customer_id;
*/


/* 

 --- LEFT JOIN ---
select * from transactions left join customer
on transactions.customer_id = customer.customer_id;

--- RIGHT JOIN ---
select * from transactions right join customer
on transactions.customer_id = customer.customer_id;

*/


---- FUNCTIONS ---
/*
select count(amount) as count_of_transactions from transactions;
select max(amount) as maximum from transactions;
select min(amount) as minimum from transactions;
select avg(amount) as average_transaction from transactions;
select sum(amount) as sum_of_transactions from transactions;
select concat(first_name,' ',last_name) as full_name from employee;

*/


/*
CREATE TABLE employee(
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hourly_pay DECIMAL(5,3),
    hired_date DATE);

INSERT INTO employee VALUES
(1, 'Arjun', 'Menon', 25.500, '2023-06-15'),
(2, 'Neha', 'Joseph', 30.750, '2022-11-20'),
(3, 'Rahul', 'Nair', 18.250, '2024-01-10'),
(4, 'Anjali', 'Thomas', 22.900, '2023-08-05'),
(5, 'Vivek', 'Varghese', 27.300, '2022-12-28');
*/

---- add a new cloumn ---
/*
alter table employee add column job varchar(25) after hourly_pay ;
*/

--- update values to newly created column ---
/*
update employee set job =' Mechanic' where employee_id = 5;
*/

select * from employee;


