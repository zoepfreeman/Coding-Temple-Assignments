create table customer(
customer_id serial primary key,
first_name VARCHAR(50),
last_name VARCHAR(50) not null,
rewards_member boolean default false,
);

create table ticket(
ticket_id serial primary key,
employee VARCHAR(50),
date_purchased TIMESTAMP,
theater INTEGER,
customer_id INTEGER,
foreign key(customer_id) references customer(customer_id),
movie_id INTEGER
);

create table movie(
movie_id serial primary key,
movie_name VARCHAR(50) not null,
rating VARCHAR(5) not null,
genre VARCHAR(50),
ticket_id INTEGER,
foreign key(ticket_id) references ticket(ticket_id)
);

alter table customer
add column ticket_id INTEGER;

alter table customer
add foreign key(ticket_id) references ticket(ticket_id);

alter table ticket 
add foreign key(movie_id) references movie(movie_id);

