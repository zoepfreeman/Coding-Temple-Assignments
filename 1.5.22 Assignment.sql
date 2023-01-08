--Question 1: List all customers who live in Texas (use JOINs)
select c.first_name, c.last_name, district
from customer c
join address a 
on c.address_id = a.address_id
where district = 'Texas';

--Question 2: List all payments of more than $7.00 with the customer’s first and last name
select c.first_name, c.last_name, amount
from customer c
join payment p 
on c.customer_id = p.customer_id 
where amount > 7.00;

--Question 3: Show all customer names who have made over $175 in payments (use subqueries)
select *
from customer c
where customer_id in (
	select customer_id
	from (
		select customer_id, sum(amount) as total
		from payment
		group by customer_id
	) as testing
	where total > 175
);

--Question 4: List all customers that live in Argentina (use the city table)
select cu.first_name, cu.last_name, a.district, ci.city, co.country
from customer cu
join address a
on cu.address_id = a.address_id 
join city ci 
on a.city_id = ci.city_id
join country co
on ci.country_id = co.country_id
where co.country = 'Argentina';

--Question 5: Show all the film categories with their count in descending order
select c.category_id, c.name, count(*) as num_movies_in_cat
from film_category fc
join category c
on fc.category_id = c.category_id
group by c.category_id
order by count(*) desc;

--Question 6: What film had the most actors in it (show film info)?
select f.film_id, f.title, count(*) as num_actors
from film_actor fa
join film f
on f.film_id = fa.film_id
group by f.film_id
order by num_actors desc
limit 1;

--Question 7: Which actor has been in the least movies?
select a.actor_id, a.first_name, a.last_name, count(*) as num_films
from film_actor fa
join actor a
on fa.actor_id = a.actor_id
group by a.actor_id
order by num_films asc
limit 1;

--Question 8: Which country has the most cities?
select co.country_id, co.country, count(*) as num_cities
from city ci
join country co
on ci.country_id = co.country_id 
group by co.country_id
order by num_cities desc 
limit 3;

--Question 9: List the actors who have been in between 20 and 25 films.
select actor_id, first_name, last_name, count
from(
	select fa.actor_id, a.first_name, a.last_name, count(*)
	from film_actor fa
	join actor a
	on a.actor_id = fa.actor_id
	group by fa.actor_id, a.first_name, a.last_name
) as counting
where count between 20 and 25;