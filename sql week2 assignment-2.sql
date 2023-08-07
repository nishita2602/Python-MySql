use odin_db;
create table employees(employee_id int ,name varchar(20),Age int,Department varchar(20));
Insert into employees
Values(1,'Alice',25,'Sales'),
(2,'Bob',30,'Marketing'),
(3,'Charlie',35,'IT'),
(4,'Dave',40,'Sales'),
(5,'Eve',45,'Marketing');
select name, age from employees
where age > 35;
drop table students;
create table students(student_id int,first_name varchar(20),last_name varchar(20),major varchar(20),gpa int);
Insert into students
values(1,'Alice','Smith','Biology',3.5),
(2,'Bob','Johnson','Chemistry',3.2),
(3,'Charlie','Brown','Physics',3.8),
(4,'Dave','Miller','Biology',3.4),
(5,'Eve','Davis','Chemistry',3.6);
Select first_name,last_name from students
where major ='Biology' or major='Chemistry';
Create table sales(sales_id int,date date,amount int);
Insert into sales
Values (1,'2022-01-01',1000),
(2,'2022-01-02',2000),
(3,'2022-01-03',1500),
(4,'2022-01-04',3000),
(5,'2022-01-05',2500);
Select avg (amount) from sales;
use mavenmovies;
Select *,lower(first_name),lower(last_name),concat(first_name,last_name) from actor limit 10;
Select * from rental where month(rental_date)=6;

