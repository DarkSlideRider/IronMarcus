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
alter table sakila.staff drop column picture;
#7 A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
use sakila;
# LOADING DATA INTO A TABLE: INSERT COMMAND
select * from customer where last_name = "Sanders";
insert into staff (first_name, last_name, address_id, email, store_id, active, username) values (
"TAMMY", "SANDERS", 79, "TAMMY.SANDERS@sakilacustomer.org", 2, 1, "SandersT");
select * from staff;
delete from staff where staff_id = 3;
select * from staff;
insert into staff (first_name, last_name, address_id, email, store_id, active, username) values (
"TAMMY", "SANDERS", 79, "TAMMY.SANDERS@sakilastaff.com", 2, 1, "SandersT");
select * from staff;
#8 Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
# You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table 
# rental and see what information you would need to add there. You can query those pieces of information. 
# For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
select film_id from film where title = "Academy Dinosaur";
select * from store;
select inventory_id as dino_inv_id from inventory where film_id = (
select film_id from film where title = "Academy Dinosaur") and store_id = 1;
select * from rental where inventory_id in (
select inventory_id as dino_inv_id from inventory where film_id = (
select film_id from film where title = "Academy Dinosaur") and store_id = 1
);
select customer_id as hunter_id from customer where last_name = "Hunter";
select * from staff where last_name = "Hillyer";
insert into rental (rental_date, inventory_id, customer_id, return_date, staff_id) values (
"2021-08-26 17:00:00", 4, 130, "2021-08-31 17:00:00", 1);
delete from rental where rental_id = 16050;
insert into rental (rental_date, inventory_id, customer_id, staff_id) values (
"2021-08-26 17:00:00", 4, 130, 1);
# 9.Delete non-active users, but first, create a backup table deleted_users to store customer_id, 
# email, and the date for the users that would be deleted. Check if there are any non-active users,
# Create a table backup table as suggested, Insert the non active users in the table backup table
# Delete the non active users from the table customer
select * from customer where active = 0;
CREATE TABLE deleted_users AS
    SELECT customer_id, store_id, first_name, last_name, email, address_id, active, create_date, last_update
    FROM customer
    WHERE active = 0;
select * from deleted_users;
delete from customer where active = 0;
alter table customer
drop foreign key fk_customer_address;
alter table customer
drop foreign key fk_customer_store;