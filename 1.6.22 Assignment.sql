--1. Create a Stored Procedure that will insert a new film into the film table with the
--following arguments: title, description, release_year, language_id, rental_duration,
--rental_rate, length, replace_cost, rating

create or replace procedure add_film(title varchar, description text, release_year year, language_id integer, 
rental_duration integer, rental_rate numeric(4,2), length integer, replacement_cost numeric(5,2), rating mpaa_rating)
language plpgsql
as $$
begin
	insert into film(
		title,
		description,
		release_year,
		language_id,
		rental_duration,
		rental_rate,
		length,
		replacement_cost,
		rating
	) values (
		title,
		description,
		release_year,
		language_id,
		rental_duration,
		rental_rate,
		length,
		replacement_cost,
		rating
	);
end;
$$;

call add_film ('Fake Movie','A movie that is not real', 2004, 3, 4, 5.99, 40, 15.99, 'R');

select *
from film
where title = 'Fake Movie';


--2. Create a Stored Function that will take in a category_id and return the number of
--films in that category

create or replace function films_in_cat(_category_id integer)
returns integer
language plpgsql
as $$
	declare film_count integer;
begin
	select count(*) into film_count
	from film_category
	group by category_id
	having category_id = _category_id;
	return film_count;
end;
$$;

select films_in_cat(14);


