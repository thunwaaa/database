use sakila;

select * from film;
select * from film_text;
select * from film_category;
select * from payment;
select * from actor;
select * from film_actor;
select * from address;
select * from city;
select * from country;
select * from rental;
select * from customer;

desc film_text;
-- 2
select c.first_name,c.last_name,concat(a.address, a.district, a.postal_code, ci.city, co.country) address from customer c
inner join address a on c.address_id = a.address_id inner join city ci on ci.city_id = a.city_id 
inner join country co on co.country_id = ci.country_id;

-- 7
select first_name,last_name,count(film_id) as film from actor a join film_actor fa on fa.actor_id 
where a.actor_id = fa.actor_id
group by first_name,last_name;

-- 10
create schema expressway;
use expressway;
show table;
create table User(
	u_id 			smallint unsigned		not null Primary key,
    name			varchar(45)				not null,
    email			varchar(150)			not null,
    makes			int(500)				not null,
    a_id			smallint unsigned		not null,
    FOREIGN KEY (a_id) REFERENCES address(a_id)
);

create table EXP_ORDER(
	order_no		int(500)				not null Primary Key,
    order_amount	decimal(6,2)			not null,
    order_date		date					not null,
	makes			int(500)				not null,
    u_id 			smallint unsigned		not null,
	FOREIGN KEY (makes) REFERENCES User(makes),
    FOREIGN KEY (u_id) REFERENCES User(u_id)
);

create table Product(
	p_id			varchar(30)				not null Primary key,
    name			varchar(100)			not null,
    price			decimal(4,2)			not null,
    description		text				not null
);

create table Product_Category(
	c_id			varchar(10)				not null Primary Key,
    name			varchar(20)				not null,
    p_id			varchar(30)				not null,
    FOREIGN KEY (p_id) REFERENCES Product(p_id)
);

create table Payment(
	p_id			smallint unsigned		not null Primary Key,
    amount			decimal(6,2)			not null,
    method			varchar(50)				not null,
    u_id 			smallint unsigned		not null,
    FOREIGN KEY (u_id) REFERENCES User(u_id)
);

create table address(
	a_id			smallint unsigned		not null Primary Key,
    country			varchar(50)				not null,
    state			varchar(50)				not null,
    city			varchar(50)				not null,
    u_id 			smallint unsigned		not null,
    FOREIGN KEY (u_id) REFERENCES User(u_id)
);

create table TRACKING_DETAIL(
	t_id			smallint unsigned		not null Primary key,
    status			tinyint(2)				not null,
    order_no		int(500)				not null,
    FOREIGN KEY (order_no) REFERENCES EXP_ORDER(order_no)
);

create table Cart(
	cart_id			smallint unsigned		not null Primary key,
    u_id 			smallint unsigned		not null,
    FOREIGN KEY (u_id) REFERENCES User(u_id)
);

create table added_to(
	p_id 			smallint unsigned		not null primary key,
    cart_id			smallint unsigned		not null,
    FOREIGN KEY (p_id) REFERENCES Product(p_id),
    FOREIGN KEY (cart_id) REFERENCES Cart(cart_id)
);

-- 11
insert into User(u_id,name,email,makes,a_id) values ('1', 'Sabrina', 'mailmail@gmail.com', '1', '1');
insert into User(u_id,name,email,makes,a_id) values ('2', 'Mave', 'mave@gmail.com', '2', '2');
insert into User(u_id,name,email,makes,a_id) values ('3', 'Noi', 'noinha@gmail.com', '3', '3');

insert into EXP_ORDER(order_no,order_amount,order_date,makes,u_id) values ('1','20.00','2024-02-14','1','1');
insert into EXP_ORDER(order_no,order_amount,order_date,makes,u_id) values ('2','300.99','2024-03-26','3','2');
insert into EXP_ORDER(order_no,order_amount,order_date,makes,u_id) values ('3','420.50','2024-03-24','3','3');

insert into Product(p_id,name,price,description) values ('1','toothplate','03.00','use to brush teeth');
insert into Product(p_id,name,price,description) values ('2','topper','20.00','use for sleep');
insert into Product(p_id,name,price,description) values ('3','car toy','10.20','for kids');

insert into Product_Category(c_id,name,p_id) values ('1','toilet room','1');
insert into Product_Category(c_id,name,p_id) values ('2','bed room','2');
insert into Product_Category(c_id,name,p_id) values ('1','toy','3');

insert into Payment(p_id,amount,method,u_id) values ('1','360.99','visa','1');
insert into Payment(p_id,amount,method,u_id) values ('2','735.85','mastercard','2');
insert into Payment(p_id,amount,method,u_id) values ('3','71.89','visa','3');

insert into address(a_id,country,state,city,u_id) values ('1','Bangkok','Rayong','Tubma','1');
insert into address(a_id,country,state,city,u_id) values ('2','Canada','Toronto','xx','2');
insert into address(a_id,country,state,city,u_id) values ('3','America','Arisona','xxx','3');

insert into TRACKING_DETAIL(t_id,status,order_no) values ('1','otw','1');
insert into TRACKING_DETAIL(t_id,status,order_no) values ('2','processing','2');
insert into TRACKING_DETAIL(t_id,status,order_no) values ('3','complete','3');

insert into Cart(cart_id,u_id) values ('1','1');
insert into Cart(cart_id,u_id) values ('2','2');
insert into Cart(cart_id,u_id) values ('3','3');

insert into added_to(p_id,cart_id) values ('1','1');
insert into added_to(p_id,cart_id) values ('2','2');
insert into added_to(p_id,cart_id) values ('3','3');



