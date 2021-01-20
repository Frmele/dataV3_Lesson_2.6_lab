#Get release years.
#Get all films with ARMAGEDDON in the title.
#Get all films which title ends with APOLLO.
#Get 10 the longest films.
#How many films include Behind the Scenes content?
#Drop column picture from staff.
#A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
#Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
#select customer_id from sakila.customer
#where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
#Use similar method to get inventory_id, film_id, and staff_id.

#Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:

#Check if there are any non-active users
#Create a table backup table as suggested
#Insert the non active users in the table backup table
#Delete the non active users from the table customer

USE sakila;
SELECT distinct release_year FROM sakila.film;
SELECT title FROM sakila.film where title like '%Armageddon%';
SELECT title FROM sakila.film where title regexp 'Apollo$';
SELECT * from sakila.film
order by length desc limit 10;
select count(title) from sakila.film where special_features regexp "Behind the Scenes";
alter table staff
drop column picture;
SELECT *,staff_id FROM sakila.staff;

INSERT INTO staff (staff_id,first_name,last_name,address_id,email,store_id,active,username)
VALUES (3,'Tammy','Sanders',79,'TAMMY.SANDERS@sakilacustomer.org',2,1,'Tammy');

SELECT * from staff;

#Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
#You can use current date for the rental_date column in the rental table.
# Hint: Check the columns in the table rental and see what information you would need to add there. 
#You can query those pieces of information. For eg., you would notice that you need customer_id
# information as well. To get that you can use the following query:

select customer_id from sakila.customer where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
#customer_id 130

select *from rental;
#rental_id, rental_date, inventory_id, customer_id,return_date,staff_id,last_update
#x,x,1,130,x,2,x
select *from sakila.film where title like 'Academy Dinosaur';
#film_id 1 
select*from sakila.inventory where film_id like 1;
#inventory_id 1 


select DISTINCT(rental_id)
from rental
order by rental_id desc
limit 1;
#rental_id

INSERT INTO rental(rental_id,rental_date,inventory_id,customer_id,staff_id)
VALUES (16050,'2021-01-20',1,130,2);
select DISTINCT(rental_id)
from rental
order by rental_id desc
limit 1;
#check

SELECT *
FROM customer
WHERE active = 0;
16	2	SANDRA	MARTIN	SANDRA.MARTIN@sakilacustomer.org	20	0	2006-02-14 22:04:36	2006-02-15 04:57:20
64	2	JUDITH	COX	JUDITH.COX@sakilacustomer.org	68	0	2006-02-14 22:04:36	2006-02-15 04:57:20
124	1	SHEILA	WELLS	SHEILA.WELLS@sakilacustomer.org	128	0	2006-02-14 22:04:36	2006-02-15 04:57:20
169	2	ERICA	MATTHEWS	ERICA.MATTHEWS@sakilacustomer.org	173	0	2006-02-14 22:04:36	2006-02-15 04:57:20
241	2	HEIDI	LARSON	HEIDI.LARSON@sakilacustomer.org	245	0	2006-02-14 22:04:36	2006-02-15 04:57:20
271	1	PENNY	NEAL	PENNY.NEAL@sakilacustomer.org	276	0	2006-02-14 22:04:36	2006-02-15 04:57:20
315	2	KENNETH	GOODEN	KENNETH.GOODEN@sakilacustomer.org	320	0	2006-02-14 22:04:37	2006-02-15 04:57:20
368	1	HARRY	ARCE	HARRY.ARCE@sakilacustomer.org	373	0	2006-02-14 22:04:37	2006-02-15 04:57:20
406	1	NATHAN	RUNYON	NATHAN.RUNYON@sakilacustomer.org	411	0	2006-02-14 22:04:37	2006-02-15 04:57:20
446	2	THEODORE	CULP	THEODORE.CULP@sakilacustomer.org	451	0	2006-02-14 22:04:37	2006-02-15 04:57:20
482	1	MAURICE	CRAWLEY	MAURICE.CRAWLEY@sakilacustomer.org	487	0	2006-02-14 22:04:37	2006-02-15 04:57:20
510	2	BEN	EASTER	BEN.EASTER@sakilacustomer.org	515	0	2006-02-14 22:04:37	2006-02-15 04:57:20
534	1	CHRISTIAN	JUNG	CHRISTIAN.JUNG@sakilacustomer.org	540	0	2006-02-14 22:04:37	2006-02-15 04:57:20
558	1	JIMMIE	EGGLESTON	JIMMIE.EGGLESTON@sakilacustomer.org	564	0	2006-02-14 22:04:37	2006-02-15 04:57:20
592	1	TERRANCE	ROUSH	TERRANCE.ROUSH@sakilacustomer.org	598	0	2006-02-14 22:04:37	2006-02-15 04:57:20
								
Use sakila
CREATE TABLE NEW_TABLE_CUSTOMER AS
   SELECT [ customer_id, store_id,first_name,last_name,email,address_id,active,create_date,last_update]
   FROM customer
   WHERE active = 0;

Use sakila
SELECT * INTO new_customer FROM customer WHERE active = 0;




















