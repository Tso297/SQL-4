--1. List all customers who live in Texas (use
--JOINs) Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, Ian Still
select first_name, last_name, address, district
from customer
full join address on customer.address_id =address.address_id
full join city 
on address.city_id = city.city_id
full join country 
on city.country_id = country.country_id
where district = 'Texas'
--2. Get all payments above $6.99 with the Customer's Full
--Name
select first_name, last_name, amount
from customer
full join payment on customer.customer_id = payment.customer_id
where amount > 6.99

--3. Show all customers names who have made payments over $175(use
--subqueries)

select first_name, last_name
from customer 
where customer_id in (
	select customer_id 
	from payment
	group by customer_id 
	having sum(amount) > 175
	order by sum(amount) desc
);

--4. List all customers that live in Nepal (use the city
--table) Nobody

select first_name, last_name, district
from customer
full join address on customer.address_id = address.address_id
where district = 'Nepal'

5. Which staff member had the most
transactions?
select first_name, last_name
from staff
full join payment on staff.staff_id = payment.staff_id
group by staff.staff_id
order by count(*) desc
limit 1;



6. How many movies of each rating are
there?
select rating, count(*)
from film
group by rating
order by count(*) desc

7.Show all customers who have made a single payment
above $6.99 (Use Subqueries)
--select first_name, last_name
--from payment
--full join customer on customer.customer_id = payment.customer_id
--where amount = 6.99
--group by customer.customer_id
--having count(*)=1

select first_name, last_name
from customer
where customer_id in 
(
select customer_id
from payment
where amount = 6.99
group by customer_id
having count(*)=1
)


--8. How many free rentals did our stores give away?
select count(amount)
from payment
where amount = 0

