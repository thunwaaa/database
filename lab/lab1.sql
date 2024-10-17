create schema parkworld;
use parkworld;
show tables;

create table themepark (
	park_code varchar(10) not null primary key, 
	park_name varchar(35) not null,
	park_city varchar(50) not null,
	park_country char(2) not null
	);

create table employee(
	emp_num numeric(4) not null check (emp_num >= 0000 and emp_num <= 9999) primary key,
    emp_title varchar(4),
    emp_Lname varchar(15) not null,
    emp_Fname varchar(15) not null,
    emp_DOB date not null,
    emp_hire_date date not null,
    emp_areacode varchar(4) not null,
    emp_phone varchar(12) not null,
    park_code varchar(10) not null,
    foreign key (park_code) references themepark(park_code)
	);
     
create table ticket(
	ticket_no numeric(10) not null primary key,
    ticket_price numeric(4,2),
    ticket_type varchar(10) not null,
    park_code varchar(10) not null,
    foreign key (park_code) references THEMEPARK
	);
    
create table attraction(
    attract_no numeric(10) not null primary key,
    park_code varchar(10) not null,
    attract_name varchar(35) not null,
    attract_age numeric(3) default 0 not null,
    attract_capacity numeric(3) not null,
    foreign key (park_code) references THEME_PARK
);

create table hour_park (
	emp_num numeric(4) not null primary key,
    attract_no numeric(10) not null primary key,
    hours_per_attract numeric(2) not null,
    hour_rate numeric(4,2) not null,
    date_worked date not null,
    foreign key (attract_no) references attraction,
    foreign key (emp_num) references employee
);