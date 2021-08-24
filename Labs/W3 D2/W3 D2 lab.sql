# 1. How many films are there for each of the categories in the category table. 
# Use appropriate join to write this query.
select count(film.film_id), category.name from sakila.film inner join sakila.film_category 
on film.film_id = film_category.film_id
inner join category on film_category.category_id = category.category_id group by category.name;
# 2. Which actor has appeared in the most films?
select actor.actor_id, actor.first_name, actor.last_name, count(film_actor.film_id) from sakila.actor 
left join film_actor on actor.actor_id = film_actor.actor_id  
group by actor.actor_id 
order by count(film_actor.film_id) desc limit 1;
# 3. Most active customer (the customer that has rented the most number of films)
select customer.customer_id, customer.first_name, customer.last_name, count(rental.rental_id) 
from customer left join rental on customer.customer_id = rental.customer_id 
group by customer.customer_id order by count(rental.rental_id) desc limit 1;
#4 List number of films per category
select count(film.film_id), category.name from sakila.film inner join sakila.film_category 
on film.film_id = film_category.film_id
inner join category on film_category.category_id = category.category_id group by category.name;
#5. Display the first and last names, as well as the address, of each staff member.
select staff.first_name, staff.last_name, address.address, address.address2, address.district, city.city 
from staff 
left join address on address.address_id = staff.address_id 
left join city on address.city_id = city.city_id;
#6. Display the total amount rung up by each staff member in August of 2005.
select payment_date from payment;
select sum(payment.amount), staff.first_name, staff.last_name from payment 
left join staff on payment.staff_id = staff.staff_id where payment.payment_date 
like "2005-08-%" group by staff.staff_id;
#7. List each film and the number of actors who are listed for that film.
select film.title, count(film_actor.actor_id) from film 
left join film_actor on film.film_id = film_actor.film_id group by film.film_id 
order by count(film_actor.actor_id) desc;
#8. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
# List the customers alphabetically by last name.
select customer.first_name, customer.last_name, sum(payment.amount) 
from payment left join customer on payment.customer_id = customer.customer_id 
group by customer.customer_id order by customer.last_name asc;
#8. Bonus Which is the most rented film? 
# The answer is Bucket Brotherhood This query might require using more than one join statement.
select film.title, count(rental.rental_id) from film 
right join inventory on inventory.film_id = film.film_id 
right join rental on rental.inventory_id = inventory.inventory_id 
group by film.film_id order by count(rental.rental_id) desc limit 1;

