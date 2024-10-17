use sakila;

select * from rental;
select * from customer;
select * from payment;

alter table rental 
add constraint fk_rental_customer_id foreign key (customer_id)
references customer(customer_id) 
on delete restrict;

create index pay_amount_date_idx on payment(payment_date, amount);