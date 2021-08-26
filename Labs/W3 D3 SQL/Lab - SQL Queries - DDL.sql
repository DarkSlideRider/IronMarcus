#1. Get release years.
select distinct(release_year) from film;
#2. Get all films with ARMAGEDDON in the title.
select title from film where title like "%ARMAGEDDON%";
#3. Get all films which title ends with APOLLO.
select title from film where title like "%APOLLO";
#4. Get 10 the longest films.
select title, length(title) as title_length from film order by title_length desc limit 10;
#5 How many films include Behind the Scenes content?
select count(film_id) from film where special_features like "%Behind the Scenes%";
#6 Drop column picture from staff.

#7 A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
#8 Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
# You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table 
# rental and see what information you would need to add there. You can query those pieces of information. 
# For eg., you would notice that you need customer_id information as well. To get that you can use the following query: