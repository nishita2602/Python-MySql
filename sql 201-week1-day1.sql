#SQL-201-WEEK-1:DAY1:

# Task1:Get the customers whose last name starts with a vowel 
#and ends with a consonant. 
use mavenmovies;
select last_name from customer 
where last_name regexp '^[aeiou]'and last_name regexp '[^aeiou]$';

#Task 2: Get the movies which has gold in its title.
Select title from film
where title regexp'gold';

#Task 3: Get the customer's first and last name
# whose postal code starts with 9 and ends with 5. 

Select first_name ,last_name from customer
join address
on customer.address_id=address.address_id
where postal_code regexp '^9' and postal_code regexp '5$';

#Task4:Get the films which are based on the subject ‘student’ 
select title,description from film
where description regexp 'student';

#Task 5: Find the customers whose last name does not contain
# w, j and b characters

Select last_name from customer 
where last_name regexp '[^wjb]';

Select last_name from customer 
where last_name not regexp 'wjb';

#Task 6: #Find the customers whose address starts with 1 
#and ends with parkway

Select first_name ,last_name,address from customer
join address
on customer.address_id=address.address_id
where address regexp '^1' and address regexp 'parkway$';

Select first_name ,last_name,address from customer
join address
on customer.address_id=address.address_id
where address regexp '^1.*parkway$';

# Task 7:Replace the term school to campus in “odinschool” 

select regexp_replace('odinschool','school','campus');

select customer_id, sum(amount) from payment
group by customer_id;


# Task 1:Write a query to group the rental data by customer_id.
#output customer_id and number of rentals done by customer

select customer_id, count(*) from rental
group by customer_id;

#Task2:Modify the above query to order the customers
# based on the number of rentals in descending order. 

select customer_id, count(*) as no_of_rentals from rental
group by customer_id order by no_of_rentals desc;

#Task3: Write a query to count the number of payments made by
# each customer. Show the customer id, the number of rentals 
#and the total amount paid for each customer. 

select customer_id,count(rental_id) as no_of_rental,sum(amount) from payment
group by customer_id ;

#Having 
select customer_id, staff_id, count(rental_id) from rental
group by customer_id,staff_id having count(rental_id)<10;

#fjwghsdo--->from,join,where,group by/aggregation,having,select,distinct,orderby
#faijalwoghasdo

#Task4:Modify the above query to include only those customers
# who have made at least 20 payments. 

select customer_id,count(rental_id) as no_of_rental,sum(amount) from payment
group by customer_id  having count(rental_id)>=20 ;


select customer_id, count(rental_id) as no_of_rentals, sum(amount) total_paid from payment group by customer_id
having no_of_rentals>=20;

#Task5:Write a query to find 
#the number of films acted by each actor_id using film_actor table.

select actor_id, count(film_id) from film_actor group by actor_id;

#Task6:Write a query to find the total number of films
# acted by each actor grouped by the film rating. 

Select actor_id,rating, count(f.film_id) as total_films from film_actor fa
join film f 
on fa.film_id=f.film_id
group by actor_id,rating;

#With Rollup:
Select actor_id,rating, count(f.film_id) as total_films from film_actor fa
join film f on fa.film_id=f.film_id
group by actor_id,rating with rollup;

#Task7:Using roll up, modify the above query to find the
# total count for each distinct actor i.e. 
#find the total number of films each actor has acted
# along with the count of different ratings

Select  actor_id,rating ,count(actor_id),count(rating), count(f.film_id) as total_films from film_actor fa
join film f on fa.film_id=f.film_id
group by actor_id,rating with rollup;

#Task8:Write a query to group the rentals by year and count them.

select year(rental_date) as rental_year,count(rental_id) from rental
group by rental_year;



