#SQL-201-Week1-Day2:

#Task1 :Construct a query against the film table that uses a filter condition 
#with a noncorrelated subquery against the category table to 
#find all Horror films

#solution using joins
Select title,c.category_id,c.name from film f
join film_category fc on f.film_id=fc.film_id
join category c on fc.category_id=c.category_id
where c.category_id =(select category_id from category where category.name='Horror'); 

#Subqueries
SELECT f.film_id,f.title from film f
WHERE film_id IN (
SELECT film_id FROM film_category
WHERE category_id = (SELECT category_id FROM category
WHERE category.name = 'Horror'));

#Task 2: Write a query that returns all cities that are not in China.
use mavenmovies;
select city from city
where country_id <> (select country_id from country where country ='China');

#Task3:Write a query that returns all cities that are in India or Pakistan.

Select city from city
where country_id in (select country_id from country where country in ('India','Pakistan'));

Select country_id,count(*) from city
where country_id in(select country_id from country where country='India' or country='pakistan')
group by country_id;

#Task4: Write a query to find all customers who have never gotten 
#a free film rental.(ie the zero amount paid for a rental). 
#Use the all operator.

Select * from customer
where customer_id not in (select distinct (customer_id) from payment where amount=0);

# Task1:Write a query to count the number of film rentals for each customer and the containing query 
#then retrieves those customers who have rented exactly 30 films. 

select * from customer c
where (select count(*) from rental r
 where r.customer_id = c.customer_id) = 30;

#Task2:Write a query to find all customers whose total payments for 
#all film rentals are between 100 and 150 dollars.

Select * from customer c
where(select sum(amount) from payment p
where p.customer_id=c.customer_id) between 100 and 150;

#Task3: Write a query to find all the customers who rented at least
# one film prior to June 01 2005 without regard for 
#how many films were rented. 

Select * from customer c
where exists (select * from rental r
where c.customer_id=r.customer_id
and r. rental_date < '2005-06-01');





