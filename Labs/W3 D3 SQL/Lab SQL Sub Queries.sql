#1. How many copies of the film Hunchback Impossible exist in the inventory system?
select join_film_inv.title, inv_count from
(select film.title, count(inventory.inventory_id) as inv_count from inventory 
left join film on inventory.film_id = film.film_id
group by film.title) as join_film_inv
where join_film_inv.title = "Hunchback Impossible";
# Filter first
select count(inventory.inventory_id) as no_copies from inventory 
where film_id = (select film.film_id from film where film.title = "Hunchback Impossible") group by film_id;
select film.film_id from film where film.title = "Hunchback Impossible";

#2. List all films whose length is longer than the average of all the films.
select film.title, film.length from film where film.length > (select avg(film.length) from film);
#3. Use subqueries to display all actors who appear in the film Alone Trip.
select film.film_id from film where film.title = "Alone Trip";
select * from actor where actor_id in (
select film_actor.actor_id from film_actor 
where film_id = (select film.film_id from film where film.title = "Alone Trip")
);
#4. Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
#   Identify all movies categorized as family films.
select category.category_id from category where category.name = "Family";
select film.title from film where film_id in
(select film_id from film_category 
where film_category.category_id = (select category.category_id from category where category.name = "Family"));

#5. Get name and email from customers from Canada using subqueries. Do the same with joins. 
#   Note that to create a join, you will have to identify the correct tables with their 
#   primary keys and foreign keys, that will help you get the relevant information.
select country_id from country where country = "Canada";
select city_id from city where country_id = (select country_id from country where country = "Canada");
select address_id from address where city_id in 
(select city_id from city where country_id = (select country_id from country where country = "Canada"));
select first_name, last_name, email from customer where address_id in 
	(select address_id from address where city_id in 
		(select city_id from city where country_id = 
			(select country_id from country where country = "Canada")));
#6. Which are films starred by the most prolific actor? Most prolific actor is defined as the actor 
#   that has acted in the most number of films. First you will have to find the most prolific actor 
#   and then use that actor_id to find the different films that he/she starred.
select actor_id from film_actor group by actor_id order by count(film_id) desc limit 1;
select film_id from film_actor where actor_id = (
select actor_id from film_actor group by actor_id order by count(film_id) desc limit 1);
select title from film where film_id in (select film_id from film_actor where actor_id = (
select actor_id from film_actor group by actor_id order by count(film_id) desc limit 1));
#7. Films rented by most profitable customer. You can use the customer table and payment table to find the 
#   most profitable customer ie the customer that has made the largest sum of payments
select customer_id from payment group by customer_id order by sum(amount) desc limit 1;
select inventory_id from rental where customer_id = (
select customer_id from payment group by customer_id order by sum(amount) desc limit 1
);
select film_id from inventory where inventory_id in (
	select inventory_id from rental where customer_id = (
		select customer_id from payment group by customer_id order by sum(amount) desc limit 1
)
);
select title from film where film_id in (
select film_id from inventory where inventory_id in (
	select inventory_id from rental where customer_id = (
		select customer_id from payment group by customer_id order by sum(amount) desc limit 1
)
)
);
#8. Customers who spent more than the average payments.
select * from customer where customer_id in (select customer_id from 
(
select customer_id, sum(amount) as total_paid from payment group by customer_id 
having total_paid > 
(select avg(total_paid) from (select sum(amount) as total_paid from payment group by customer_id) as calculation)
) as calculation2
);
select customer_id, sum(amount) as total_paid from payment group by customer_id 
having total_paid > 
(select avg(total_paid) from (select sum(amount) as total_paid from payment group by customer_id) as calculation);

select avg(total_paid) from (select sum(amount) as total_paid from payment group by customer_id) as calculation;
select customer_id from payment