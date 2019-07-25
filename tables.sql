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


create table order(
Order_No int(11) 
id int(11) 
product_id int(11) 
Qty_Sold int(11) 
Order_Date varchar(45) 
Order_Status varchar(45));

create table inquiry_data(
Inquiry_Id int(11) 
product_id int(11) 
id int(11) 
Qty int(11) 
date varchar(45) 
Status varchar(45));

create table payment(
Order_No int(10) 
Pay_Due int(11) 
Pay_Received int(11) 
Date varchar(45) 
id int(11));