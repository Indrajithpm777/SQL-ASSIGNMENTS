/*1.Table Creation (CREATE): Write the SQL statements to create a database named
employee and the following tables based on the provided schema
⦿ Departments
⦿ Location
⦿ Employees*/

create database Employee;
use employee;
create table departments(department_id int primary key, department_name varchar(100));
create table location(location_id int primary key,location varchar(30));
create table employees(employee_id int primary key,employee_name varchar(50),gender enum('m','f'),age int,hire_date date,designation varchar(100),department_id int , location_id int,salary decimal(10,2));
insert into employees(employee_id,employee_name,gender,age,hire_date,designation,department_id,location_id,salary) values(1,"sini",'f',30,'2000-12-24',"officer",501,1001,25000),(2,"anisha",'f',35,'2001-11-23',"manager",502,1002,30000);
insert into departments(department_id,department_name)values(501,"sales"),(502,"hr");
insert into location(location_id,location) values (1001,"thrissur"),(1002,"vazhalikkav");

/*2. Table Alteration (ALTER): Consider the following scenarios and write the SQL
statements to alter the structure of the tables accordingly:
⦿ Add a new column named "email" to the Employees table to store
employee email addresses.
⦿ Modify the data type of the "designation" column in the Employees
table to support a wider range of values.
⦿ Drop the “age” column from the Employees table.
⦿ Rename the “hire_date” column to “date_of_joining” */

alter table employees add column email varchar(100);
alter table employees modify designation varchar(350);
alter table employees drop column age;
select * from employees;
alter table employees rename column hire_date to date_of_joining;

/*3. Table Renaming (RENAME): Rewrite the SQL statements to rename the
following tables:
⦿ Rename the "Departments" table to "Departments_Info".
⦿ Rename the "Location" table to "Locations".*/
rename table departments to departments_info;
alter table location rename to locations;

/*4. Table Truncation (TRUNCATE): Write an SQL statement to truncate the
Employees table.*/
truncate table employees;

/*5. Database & Table Dropping (DROP): Write the SQL statements to drop the
Employees table and then the “employee” database.*/
drop table employees;
drop database employee;

/* Database Recreation:

⦿ Drop the 'employee' database if it exists and recreate it using the
provided schema, ensuring that all tables are created with the
appropriate constraints as instructed.*/

drop database if exists employee;
create database Employee;
use employee;

/* Departments Table:

⦿ Ensure that the "department_id" uniquely identifies each department.
⦿ Set up constraints on the "department_name" to avoid duplicate and null
entries.*/
create table departments(department_id int primary key, department_name varchar(100) unique not null);


/*. Location Table:

⦿ Establish a mechanism to automatically generate unique identifiers for
each location, ensuring that they are incremented sequentially.
⦿ Implement constraints to prevent the insertion of null and duplicate
locations.
  Employees Table:

⦿ Guarantee that each employee has a distinct identifier.
⦿ Create a restriction to ensure that the employee's name is always
provided.
⦿ Limit the acceptable values for the "gender" field to only 'M' or 'F'.
⦿ Enforce a condition to ensure that the employee's age is 18 or above.
⦿ Automatically assign the current date to the "hire_date" field if not
specified.
⦿ Establish links between the "department_id" and "location_id" fields in
the "employees" table and their respective tables.*/

create table location(location_id int auto_increment primary key,location varchar(30) not null unique);
create table employees(employee_id int primary key,employee_name varchar(50)not null,gender enum('m','f'),age int check(age>=18),hire_date date default(current_date),
designation varchar(100),department_id int , foreign key(department_id)references departments(department_id) ,
 location_id int,foreign key(location_id)references location(location_id),salary decimal(10,2));
select * from employees;


