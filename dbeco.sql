create schema if not exists dbEco;
use dbEco;
create table customerInfo
(
	customer_id int auto_increment,
    first_name char(100) not null,
    last_name char(100) not null,
    email varchar(255) not null,
    cust_password char(8) not null,
    cust_repassword char(8) not null,
    gender enum ('Male','Femal'),
    par_address varchar(255) not null,
    primary key(customer_id)
);

alter table customerInfo 
add unique key (email);

create table category
(
	category_id int auto_increment,
    catagory_name char(100) not null,
    catagory_description varchar(255),
    primary key(category_id)
);

create table subCategory
(
	subcategory_id int auto_increment,
    subcatagory_name char(100) not null,
    subcatagory_description varchar(255),
    category_id int,
    primary key(subcategory_id),
    foreign key (category_id) references category(category_id)
);

create table product
(
	product_id int auto_increment,
    product_name varchar(255) not null,
    product_info varchar(255),
    category_id int,
    primary key(product_id),
    foreign key(category_id) references category(category_id) on delete cascade 
);

alter table product
add column subcategory_id int;

alter table product
add foreign key(subcategory_id) references subcategory(subcategory_id) on delete cascade;


