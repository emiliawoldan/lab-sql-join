/*
Instructions:
1. List number of films per category.
2. Display the first and last names, as well as the address, of each staff member.
3. Display the total amount rung up by each staff member in August of 2005.
4. List each film and the number of actors who are listed for that film.
5. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
*/

-- 1
SELECT category_id, title -- ,rank() over(order by category_id) as 'rank'
FROM sakila.film 
JOIN film_category USING(film_id);

-- 2
SELECT first_name, last_name, address
FROM sakila.staff
JOIN sakila.address USING(address_id);

-- 3
SELECT * FROM sakila.payment;
SELECT staff_id, first_name, sum(amount) as total_amount
FROM sakila.staff
JOIN payment USING(staff_id)
WHERE payment_date LIKE '2005-07%'
GROUP BY staff_id, first_name;

-- 4
SELECT title, count(actor_id) as 'number of actors'
FROM sakila.film
JOIN film_actor USING(film_id)
GROUP BY title;

-- 5 
SELECT CONCAT(first_name, last_name) as name, sum(amount) as 'paid amount'
FROM sakila.customer
JOIN payment USING(customer_id)
GROUP BY CONCAT(first_name, last_name)
ORDER BY name;