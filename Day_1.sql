-------- DAY 1 ----------

/*
create table empployees(
employee_id int,
first_name varchar(50),
last_name varchar(50),
hourly_pay decimal(5, 2),
hired_date date
);
*/

/* 
select * from empployees;
rename table empployees to workers;
rename table workers to employees;
*/

/*
-- to add a column
alter table employees add phone_number varchar(15);
*/

/*
-- to rename a column
alter table employees rename column phone_number to email;
*/

/*
-- to change the datatype of column
alter table employees modify column email varchar(0110);
*/

/*
-- to move the position of columns
alter table employees modify email varchar(110) after last_name;
alter table employees modify email varchar (110) first;
*/
 /*
 --- to drop a column
alter table employees drop column email;
*/

/*
Insert into employees values
(2,"Alex","Titto",16.24,"2024-4-12"),
(4,"Jayakrishnan","K.V",45.444,"2023-7-19"),
(5,"Alex","Kuriakose",56.34,"2025-6-24"),
(6,"Ron","Thomas",17.84,"2024-5-26");
select * from employees;
*/

/*
alter table employees modify column hourly_pay decimal(5,3);
insert into employees (employee_id,first_name,last_name) values (4,"sangeetha","theja");
*/

/*
select first_name, last_name from employees where hourly_pay != 21;
select first_name, last_name from employees where employee_id = 63563;
*/
