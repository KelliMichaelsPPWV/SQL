
--Question One
SELECT customer.first_name, customer.last_name, customer.customer_id
FROM customer
INNER JOIN address 
ON customer.address_id = address.address_id
WHERE address.district = 'Texas';

--Question Two
select customer.first_name , customer.last_name, payment.payment_id 
from customer 
inner join payment 
on payment.customer_id=customer.customer_id 
where amount >= 6.99;


--Question Three
select first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment
	where amount  > 175);


--Question Four
----Check Nepal country code
select country_id from country 
where country = 'Nepal'

----Run the query
select first_name, last_name 
from customer 
inner join address 
on customer.address_id = address.address_id 
where address.address_id in (
	select address_id 
	from address  inner join city 
	on city.city_id=address.city_id 
	where city.country_id =66);

--Question Five
select staff.staff_id, count(staff.staff_id)
from staff 
inner join payment 
on payment.staff_id = staff.staff_id 
group by staff.staff_id
order by count(staff.staff_id) desc;

--Question Six
--When I checked the table 'movies' it only had four things in it, 
--so I am using the ratings and movies from the 'film' table
SELECT rating, COUNT(*) AS film_count
FROM film
GROUP BY rating
order by film_count DESC;

--Question Seven 
SELECT customer.first_name, customer.last_name, customer.customer_id
FROM customer
where customer.customer_id in (
	select customer_id 
	from payment
	where payment.amount > 6.99);	
	
--Question Eight
select count(amount) from payment where amount=0;