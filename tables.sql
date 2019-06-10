create table employee
(id int auto_increment primary key, first_name varchar(255) not null, 
last_name varchar(255) not null, emailid varchar(255) not null unique, address varchar(255) not null, 
contact varchar(255) not null, employeeid varchar(255) not null unique,
username varchar(255) not null unique, password varchar(255) not null
);

create table customer
(id int auto_increment primary key, first_name varchar(255) not null, 
last_name varchar(255) not null, emailid varchar(255) not null unique, address varchar(255) not null, 
contact varchar(255) not null, username varchar(255) not null unique, password varchar(255) not null
);

create table product_master
(product_id int auto_increment primary key,product_name varchar(255) unique,price varchar(25),Qty varchar(25));