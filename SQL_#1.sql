--THIS IS MY FIRST SQL ASSIGNMENT

--1   How many actors are there with the last name ‘Wahlberg’?
select COUNT(last_name)
from actor
where last_name = 'Wahlberg';

--2   How many payments were made between $3.99 and $5.99?
select amount 
from payment 
where amount between 3.99 and 5.99;

--3   What film does the store have the most of? (search in inventory)
select film_id , count(film_id) as frequency
from inventory
group by film_id
order by count(film_id) desc;

--4   How many customers have the last name ‘William’?
select count(last_name) 
from customer
where last_name like 'William';


--5   What store employee (get the id) sold the most rentals?
select staff_id , count(staff_id)
from rental
group by staff_id 
order by count(staff_id) desc
limit 1; 

--6   How many different district names are there?
select count(distinct district) as unique_dist
from address;

--7   What film has the most actors in it? (use film_actor table and get film_id)
select film_id from film_actor
order by film_id desc
limit 1;

--8   From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select last_name from customer
where last_name like'%es';

--9   How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)

-- I was really confused on the wording for this one, sorry if this is not quite what you meant
select customer_id, amount, count(amount)
from payment 
where customer_id between 380 and 430 and rental_id > 250
group by amount, customer_id 
order by count(amount) desc;

--10   Within the film table, how many rating categories are there? And what rating has the most
--movies total?
select rating, count(rating) from film 
group by rating
order by rating;