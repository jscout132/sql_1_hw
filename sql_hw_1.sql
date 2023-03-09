--Question 1: How many actors are there with the last name 'Wahlberg'
select first_name, last_name 
from actor
where last_name like 'Wahlberg';

--Question 2: How many payments were made between $3.99 and $5.99
select COUNT(amount) from payment 
where amount > 3.99 and amount < 5.99;

--Question 3: What film does the store have the most of?
select count(film_id), film_id  from inventory group by film_id 
order by count(film_id) desc;  


--Question 4: How many customers have the last name 'William'?
select count(last_name) from customer where last_name like 'William';


--Question 5: What store employee sold the most rentals (get the id)?
select count(rental_id), staff_id  
from rental 
group by staff_id 
order by count(rental_id) desc;


--Question 6: How many different district names are there?
select count(distinct district) 
from address; 


--Question 7: What film has the most actors in it? (use film_actor table and get film_id)
select COUNT(actor_id), film_id 
from film_actor 
group by film_id 
order by count(actor_id) desc


--Question 8: From store_id1, how many customers have a last name ending with 'es'? (use customer table)
-- returns the list of customers for question 8
select  store_id, COUNT(last_name),last_name  from customer  
where last_name like '%es' and store_id = 1 group by last_name, store_id; 
--returns just the amount of customers for question 8
select COUNT(last_name) from customer  
where last_name like '%es' and store_id = 1;


--Question 9: How many payment amounts (4.99,5.99, etc.) had a number of rentals above 250 for
--customers with ids between 380 and 430 (use group by and having > 250)
--is there a table that tracks the number of times a movie has been rented? what does
--rentals about 250 mean?
select amount, customer_id, rental_id  from payment 
where customer_id >= 380 and customer_id <=430 and rental_id > 250
group by amount, customer_id, rental_id 

select amount, customer_id, rental_id  from payment 
where customer_id >= 380 and customer_id <=430
group by amount, customer_id, rental_id  having rental_id > 250


--Question 10: Within the film table, how many rating categories are there? 5
--and what rating has the most movies total
select count(distinct rating) 
from film; 

select COUNT(rating), rating  
from film 
group by rating
order by count(rating) desc;