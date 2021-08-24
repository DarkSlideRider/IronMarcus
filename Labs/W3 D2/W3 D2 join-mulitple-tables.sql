# 1. Write a query to display for each store its store ID, city, and country.
select store.store_id, city.city, country.country from store 
left join address on store.address_id = address.address_id 
left join city on address.city_id = city.city_id
left join country on city.country_id = country.country_id;
#2. Write a query to display how much business, in dollars, each store brought in.
select store.store_id, city.city, country.country from payment 
left join staff on payment.staff_id = staff.staff_id 
left join city on address.city_id = city.city_id
left join country on city.country_id = country.country_id;
#3. What is the average running time of films by category?
#4. Which film categories are longest?
#5. Display the most frequently rented movies in descending order.
#6. List the top five genres in gross revenue in descending order.
#7. Is "Academy Dinosaur" available for rent from Store 1?