------ DAY 2 ------- 

/*
create table EMPLOYEE(
employee_id int,
first_name varchar(50),
last_name varchar(50),
hourly_pay decimal(5, 3),
hired_date date );
*/

/*
Insert into employee values
(2,"Alex","Titto",16.24,"2024-04-12"),
(4,"Jayakrishnan","K.V",45.444,"2023-07-19"),
(5,"Alex","Kuriakose",56.34,"2025-06-24"),
(6,"Ron","Thomas",17.84,"2024-05-26");
*/

/*
insert into employee (employee_id, first_name, last_name) values (8,"Lionel","Messi");
*/

/*
--- updating data in table ---
update employee set hourly_pay=33.23, hired_date="2023-03-31" where employee_id=8;

----deleting a row-----
delete from employee where employee_id = 8;
*/

/*
set autocommit = off;
commit;
rollback;
*/

--- creating table wit current date and time ---- 
/*
create table test(
my_date date, my_time time, my_data_and_time datetime );

insert into test values ( current_date(), current_time(), now() );
insert into test values ( current_date() -1, current_time(), now() );

*/

/*
---- UNIQUE CONSTRAINT ---
adding unique constraint to a column within the table for
avoiding duplication of items inside that particular column

Alter table table_name add constraint UNIQUE (column_name);
*/

--- NOT NULL CONSTRAINT ----
/*
alter table employee modify hourly_pay decimal (5,3) not null;
*/


--- CHECK CONSTRAINT--- 

/*
alter table employee
add constraint employee_chk_1 check (hourly_pay >= 10.00);

insert into employee values (8,'kevin', 'varkichan',9.999,"2023-05-13");
---not possible to insert value of hourly_pay since it is lower than 10---

----dropping/removing check constraint---
ALTER TABLE employee
DROP check employee_chk_1;
*/

---- Display the exact SQL query used to create a table ---
/*
SHOW CREATE TABLE employee;
*/


---- DEFAULT CONSTRAINT ---
/*
alter table employee
alter hourly_pay set DEFAULT 21.50;
*/

insert into employee (employee_id,first_name,last_name,hired_date) values 
(164,'devin', 'varki',"2023-05-13");

select * from employee;