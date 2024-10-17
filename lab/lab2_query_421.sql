use sakila;
select distinct rental_duration from film;
select all length from film where length between 60 and 100;
select city from city where city like 'G%' or city like '%Z%';
select actor_id, first_name, last_name from actor where last_name like 'Williams' or last_name like 'Davis';
select * from film order by rental_rate desc;