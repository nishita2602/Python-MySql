create database Studentcourse;
use Studentcourse;
Create table studenttb
(stu_id int primary key,stu_name varchar(20),
date_of_joining date);
insert into studenttb
values(1,'Sam','2023-1-1'),(2,'Leo','2023-02-02');
Create table studentcourses
(stu_id1 int,course_name varchar(20),
foreign key(stu_id1) references studenttb(stu_id));
insert into studentcourses
values(1,'Sql'),(1,'Excel'),(2,'python');
insert into studentcourses
values(3,'Sql');
truncate table studentcourses;
select* from studentcourses;

use mavenmovies;
select* from actor;

Select*from film
where rental_duration=3;
Select*from film
where rental_duration>3;
Select* from film
where rental_duration>3 and length>100;
Select* from country;
select* from customer
where active>=1;
select*from rental
where customer_id=1;
select distinct customer_id from payment;
select* from payment
order by amount desc;
select max(amount) from payment;
select count(customer_id) as Total,sum(amount) from payment
where customer_id=2;
Select count(amount) from payment
where amount>5;
use studentcourse;
SELECT * FROM studentcourses;
Insert into studentcourses
values (1,'Physics');
#29th April sql week 3
use odin_db;
Create table stu_name_tb1
(Id int,sname varchar(3));
Insert into stu_name_tb1
values(1,'A'),(2,'B'),(3,'C'),(4,'D');

create table stu_age(Id int,Age int);
Insert into stu_age
values(1,21),(2,22),(3,23),(4,24);
update stu_age
set id=5
where id=4;

#Inner join
Select * from stu_name_tb1
inner join stu_age
on stu_name_tb1.id= stu_age.id;

# left join
Select * from stu_name_tb1
left join stu_age
on stu_name_tb1.id= stu_age.id;

# Right join
Select * from stu_name_tb1
right join stu_age
on stu_name_tb1.id= stu_age.id;

use mavenmovies;

select * from customer;
select* from store;

select * from customer 
inner join store 
on customer.store_id= store.store_id;

select * from customer 
inner join store 
on customer.store_id= store.store_id
where manager_staff_id=1;

Select * from customer;
Select * from rental;

Select * from customer
inner join rental
on customer.customer_id= rental.customer_id;

select * from customer c
inner join rental r
on c.customer_id=r.customer_id;
 
 Select first_name,last_name,film_id from actor
 inner join film_actor
 on actor.actor_id=film_actor.actor_id;
# TASKS DAY 1 WEEK 3
Select first_name,last_name,email from customer;

Select * from city 
inner join country
on city.country_id=country.country_id
where country='India';

Select first_name,last_name, title from actor
 inner join film_actor
 on actor.actor_id=film_actor.actor_id
 inner join film
 on film.film_id=film_actor.film_id;
 
 Select title,name from film
 inner join film_category
 on film.film_id=film_category.film_id
 inner join category
 on film_category.category_id=category.category_id;
 
 
Select count(*) from film
 inner join film_category
 on film.film_id=film_category.film_id
 inner join category
 on film_category.category_id=category.category_id
 where name='Action';
 
 #Display the list of films, their actors where the length of the film is greater than 100 mins
 
 Select title,concat(first_name," ",last_name)as Name1, length from film
 inner join film_actor
 on film.film_id=film_actor.film_id
 inner join actor
 on actor.actor_id=film_actor.actor_id 
 where length> 100;
 
 #Display all the actor’s names who worked in either Animation or Children movies
 use mavenmovies;
Select first_name,last_name ,name from actor
inner join film_actor
on actor.actor_id=film_actor.actor_id
inner join film_category
on film_actor.film_id=film_category.film_id
inner join category
on category.category_id=film_category.category_id
where name in ('Animation','children');

#Display the cities from India whose names start with ‘B’
Select city from city 
inner join country
on city.country_id=country.country_id
where country='India' and city like 'b%';

#Display all the customers whose name starts with A and lives in India
Select first_name,last_name,city,country from customer
inner join address
on customer.address_id= address.address_id
inner join city
on city.city_id=address.city_id
inner join country
on country.country_id=city.country_id
where first_name like 'a%' and country='India';

#Display the count of addresses in Australia
Select count(*) from address
inner join city
on address.city_id=city.city_id
inner join country
on city.country_id=country.country_id
where country='Australia';



----------------------------
Select count(*) from address
inner join city
on address.city_id=city.city_id
inner join country
on city.country_id=country.country_id
where country='Afghanistan';

#30-04-2023- Week 3 day-2
use odin_db;
Select * from stu_name_tb1
cross join stu_age;

# actor with category join cross
use mavenmovies;
Select * from actor
cross join category;


use odin_db;
select* from stu_name_tb1
natural join stu_age;

use mavenmovies;
select* from actor
natural join film_actor;

use odin_db;
create table emp(empid int,emp_name varchar(4),manager_id int);
Insert into emp
values (1,'A',2),
		(2,'B',3),(3,'C',1),(4,'D',1),(5,'E',1);
select* from emp;

select emp.emp_name ,manager.emp_name as manager from emp
inner join emp as manager
on emp.manager_id=manager.empid;

# Day 2-Week 3 Tasks

#Display the names of customers who are from France
use mavenmovies;
Select first_name,last_name,country from customer
inner join address
on customer.address_id= address.address_id
inner join city
on city.city_id=address.city_id
inner join country
on country.country_id=city.country_id
where country='France';

#Display all cities from India which start with the letter A
Select city from city 
inner join country
on city.country_id=country.country_id
where country='India' and city like 'a%';

#Display the names and addresses of the customer whose first name starts with ‘A’ from countries which starts with the letter ‘C‘ and are active.
Select first_name,last_name,address,country,active from customer
inner join address
on customer.address_id= address.address_id
inner join city
on city.city_id=address.city_id
inner join country
on country.country_id=city.country_id
where first_name like'a%' and  country like'c%' and active=1;

#Create a quick reference of a list of distinct titles and their descriptions available in inventory at store 2 to provide easy information about titles.
Select distinct title,description from film
inner join inventory
on film.film_id=inventory.film_id
where store_id=2;

#List down the managers’ names at each store with the full address of each property
Select first_name,last_name,address from staff
inner join store
on staff.store_id = store.store_id
inner join address
on store.address_id=address.address_id;

#Provide list of each inventory item, including store_id, inventory_id, title, film’s rating, rental rate, and replacement cost
Select * from inventory
inner join film
on inventory.film_id=film.film_id;

#List of all customer names, which store they go to, active or inactive, full address

Select * from customer
inner join store
on customer.store_id=store.store_id
inner join address
on address.address_id=customer.address_id;

#Understand the replacement cost of your film — Identify replacement costs for films that are
#1) least expensive to replace,
#2) most expensive to replace, and
#3) the average replacement cost of all the films in store.

Select min(replacement_cost) from film;
Select max(replacement_cost) from film;
select avg(replacement_cost) from film;
Select replacement_cost from film
where replacement_cost>9.99;
Select replacement_cost from film
where replacement_cost>29.99;
Select replacement_cost from film
where replacement_cost>29.99;