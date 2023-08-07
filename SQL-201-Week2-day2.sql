#SQL-201-WEEk2-Day2-Tasks 21/05/23:

#Task-1:Write a query to generate a value for the activity_type 
#column which returns the string “Active” or “Inactive” 
#depending on the value of the customer.active column

select customer_id,active,
case 
when active =1 then 'Active'
when active =0 then 'Inactive'
end as status
from customer;
-- else:
select *,
case
when active=1 then "Active"
else "Inactive"
end "Actitvity status"
from customer;

#Task2:Write a query to retrieve the number of rentals
# for each active customer. For inactive customers 
#the result should be 0.Use case expression and 
#correlated subquery.
Select customer_id,
Case
When active = 1 Then (Select COUNT(*) From rental r Where r.customer_id = c.customer_id)
Else 0
End as rental_count
FROM customer c;

# Write a query, to count the no of rentals in the month of may
select count(*) as rental_count from rental
where month(rental_date)=5;

#Task3:Write a query to show the number of film rentals for
# May, June and July of 2005 in a single row.
-- group by
select count(*), month(rental_date) from rental
where month(rental_date) in (5,6,7) and year(rental_date)=2005
group by month(rental_date);

-- Case:


# Write a query to show the number of film rentals for q1(jan-mar)
#q2(apr-jun),q3(jul-sep) and q4 (oct-dec)of 2005

Select
SUM(Case when MONTH(rental_date) Between 1 and 3 and year(rental_date) = 2005 Then 1 Else 0 END) AS Q1Rentals,
SUM(Case when MONTH(rental_date) between 4 and 6 and year(rental_date) = 2005 Then 1 Else 0 END) AS Q2Rentals,
SUM(Case when MONTH(rental_date) between 7 and 9 and year(rental_date) = 2005 Then 1 Else 0 END) AS Q3Rentals,
SUM(Case when MONTH(rental_date) Between 10 and 12 and year(rental_date) = 2005 Then 1 Else 0 END) AS Q4Rentals
From rental;

# using dates:
select
sum(case when month(rental_date) in (1,2,3) then 1 else 0 end ) q1_count,
sum(case when month(rental_date) in (4,5,6) then 1 else 0 end ) q2_count,
sum(case when month(rental_date) in (7,8,9) then 1 else 0 end ) q3_count,
sum(case when month(rental_date) in (10,11,12) then 1 else 0 end ) q4_count
from rental;

#Task4:Write a query to categorize films based on the inventory level.
#If the count of copies is 0 then ‘Out of stock’
#If the count of copies is 1 or 2  then ‘Scarce’
#If the count of copies is 3 or 4 then ‘Available’
#If the count of copies is >= 5 then ‘Common’

select title,
case
when count(*)=0 then "out of stock"
when count(*) in (1,2) then "scarce"
when count(*) in (3,4) then "Available"
else "common"
end as stock
from inventory i join film f on i.film_id=f.film_id
group by f.film_id;

select title,
case
when count(*)=0 then "out of stock"
when count(*) in (1,2) then "scarce"
when count(*) in (3,4) then "Available"
else "common"
end as stock
from inventory i join film f on i.film_id=f.film_id group by f.film_id;


select title,(select count(*) from inventory i where i.film_id=f.film_id) as count,
case (select count(*) from inventory i where i.film_id=f.film_id)
when 0 then "Out of Stock"
when 1 then "Scarce"
when 2 then "Scarce"
when 3 then "Available"
when 4 then "Available"
else "common"
end stock
from film f;

#task5:Write a query to get each customer along with their total 
#payments,number of payments and average payment

SELECT customer_id,SUM(amount) AS total_payments,COUNT(*) AS number_of_payments,
AVG(amount) AS average_payment from payment GROUP BY customer_id;

Select c.first_name, c.last_name,
sum(p.amount) tot_payment,
count(p.amount) num_payments,
sum(p.amount) /
Case when count(p.amount) = 0 then 1
Else count(p.amount)
End avg_payment
From customer c
Left join payment p
On c.customer_id = p.customer_id
Group by c.first_name, c.last_name;

#Task 6: Write a query to create a single row containing the 
#number of films based on the ratings (G, PG and NC17)
SELECT
  COUNT(CASE WHEN rating = 'G' THEN 1 END) AS G_count,
  COUNT(CASE WHEN rating = 'PG' THEN 1 END) AS PG_count,
  COUNT(CASE WHEN rating = 'NC17' THEN 1 END) AS NC17_count
FROM film;

-- CTE TASKS:
# Task 1: Create a CTE with two named subqueries. The first one gets the 
#actors with last names starting with s. 
#The second one gets all the pg films acted by them. 
#Finally show the film id and title.

WITH s_actors AS 
(SELECT actor_id FROM actor
  WHERE last_name LIKE 'S%'), 
  pg_films AS (
  SELECT film_id FROM film
  WHERE rating = 'PG'
AND film_id IN (SELECT film_id FROM film_actor
WHERE actor_id IN (SELECT actor_id FROM s_actors)))
SELECT film.film_id, film.title FROM film
JOIN pg_films ON film.film_id = pg_films.film_id;


#2nd 
with
actor_s as( select * from actor where last_name like 's%'),
pg_films_actor_s as(
select a.actor_id, f.film_id, title, rating, first_name,last_name from film f join film_actor fa on f.film_id=fa.film_id
join actor_s a on a.actor_id=fa.actor_id
where rating='pg'
)
select * from pg_films_actor_s;

#create a cte for finding the actors who acted in pg films.
#the cte should have first and last names of the actors

WITH pg_actors AS (
  SELECT actor.first_name, actor.last_name
  FROM actor
  INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
  INNER JOIN film ON film_actor.film_id = film.film_id
  WHERE film.rating = 'PG'
)
SELECT first_name, last_name
FROM pg_actors;

#Task6: Add one more subquery to the previous CTE to get the revenues 
#of those movies
with
actor_s as( select * from actor where last_name like 's%'),
pg_films_actor_s as(
select a.actor_id, f.film_id, title, rating, first_name,last_name from film f join film_actor fa on f.film_id=fa.film_id
join actor_s a on a.actor_id=fa.actor_id
where rating='pg'),revenue as(
select f.film_id,title,sum(amount) as rev from
inventory i join pg_films_actor_s f on f.film_id=i.film_id
join rental r on r.inventory_id=i.inventory_id
join payment p on p.rental_id=r.rental_id
group by f.film_id, title)
select film_id, title, rev from revenue;
