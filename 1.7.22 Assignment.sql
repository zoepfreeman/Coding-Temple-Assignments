create table customer(
customer_id serial primary key,
first_name VARCHAR(50),
last_name VARCHAR(50),
phone INTEGER,
email VARCHAR(100)
);

create table salesperson(
salesperson_id serial primary key,
first_name VARCHAR(50),
last_name VARCHAR(50)
);

create table mechanic(
mechanic_id serial primary key,
first_name VARCHAR(50),
last_name VARCHAR(50)
);

create table car(
car_id serial primary key,
_year INTEGER,
make VARCHAR(50),
model VARCHAR(50),
salesperson_id INTEGER,
serial INTEGER,
foreign key (salesperson_id) references salesperson(salesperson_id)
);

create table invoice(
invoice_id serial primary key,
price NUMERIC(8,2),
car_id INTEGER,
salesperson_id INTEGER,
foreign key (car_id) references car(car_id),
foreign key (salesperson_id) references salesperson(salesperson_id)
);

create table service_ticket(
service_ticket_id serial primary key,
service VARCHAR(200),
_cost NUMERIC(7,2),
serial INTEGER,
_date TIMESTAMP,
customer_id INTEGER,
mechanic_id INTEGER,
foreign key (customer_id) references customer(customer_id),
foreign key (mechanic_id) references mechanic(mechanic_id)
);

create table service_record(
car_id INTEGER,
service_ticket_id INTEGER,
foreign key (car_id) references car(car_id),
foreign key (service_ticket_id) references service_ticket(service_ticket_id)
);

create or replace procedure add_customer(
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	phone INTEGER,
	email VARCHAR(100)
	)
language plpgsql
as $$
begin
	insert into customer(
	first_name,
	last_name,
	phone,
	email
	) values (
	first_name,
	last_name,
	phone,
	email
	);
end;
$$;

call add_customer('Jane','Doe',1231231234,'janedoe@gmail.com');
call add_customer('John','Doe',1231231234,'johndoe@gmail.com');

create or replace procedure add_salesperson(
	first_name VARCHAR(50),
	last_name VARCHAR(50)
	)
language plpgsql
as $$
begin
	insert into salesperson(
	first_name,
	last_name
	) values (
	first_name,
	last_name
	);
end;
$$;

call add_salesperson('Seller','McSellerson');
call add_salesperson('Johnny','Salesman');
select * from salesperson;

create or replace procedure add_mechanic(
	first_name VARCHAR(50),
	last_name VARCHAR(50)
	)
language plpgsql
as $$
begin
	insert into mechanic(
	first_name,
	last_name
	) values (
	first_name,
	last_name
	);
end;
$$;

call add_mechanic('Work','Doer');
call add_mechanic('Car','Fixer');
select * from mechanic;

create or replace procedure add_car(
	_year INTEGER,
	make VARCHAR(50),
	model VARCHAR(50),
	salesperson_id INTEGER,
	serial INTEGER
	)
language plpgsql
as $$
begin
	insert into car(
	_year,
	make,
	model,
	salesperson_id,
	serial
	) values (
	_year,
	make,
	model,
	salesperson_id,
	serial
	);
end;
$$;

call add_car('2004','Nissan','Xterra',1,12345678);
call add_car('2022','Subaru','Crosstrek', 2, 87654321);
select * from car;


create or replace procedure create_invoice(
	price NUMERIC(8,2),
	car_id INTEGER,
	salesperson_id INTEGER
	)
language plpgsql
as $$
begin
	insert into invoice(
	price,
	car_id,
	salesperson_id 
	) values (
	price,
	car_id,
	salesperson_id
	);
end;
$$;

call create_invoice(30000,1,1);
call create_invoice(40000,2,2);
select * from invoice;

create or replace procedure add_service_ticket(
	service VARCHAR(200),
	_cost NUMERIC(7,2),
	serial INTEGER,
	customer_id INTEGER,
	mechanic_id INTEGER
	)
language plpgsql
as $$
begin
	insert into service_ticket(
		service,
		_cost,
		serial,
		_date,
		customer_id,
		mechanic_id
	) values (
		service,
		_cost,
		serial,
		NOW(),
		customer_id,
		mechanic_id
	);
end;
$$;

call add_service_ticket('Oil Change',60.00,12345678,1,1);
call add_service_ticket('Rotate Tires',40.00,87654321,2,2);
select * from service_ticket;

create or replace procedure add_service_record(
	car_id INTEGER,
	service_ticket_id INTEGER
	)
language plpgsql
as $$
begin
	insert into service_record(
		car_id,
		service_ticket_id
	) values (
		car_id,
		service_ticket_id
	);
end;
$$;

call add_service_record(1,2);
call add_service_record(2,1);
select * from service_record;





