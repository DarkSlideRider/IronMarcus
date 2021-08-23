select * from sakila.film;
select title from sakila.film;
#Explanation syntax: SELECT column_name(s) FROM table_name AS alias_name;
select name from sakila.language as language;
#How many stores?
select count(store_id) from sakila.store;
#How many employees?
select count(staff_id) from sakila.staff;
#List of first names of employees:
select first_name from sakila.staff;