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
    primary key(customer_id)
);

drop table customerInfo;

alter table customerInfo 
add unique key (email);

create table product
(
	product_id int auto_increment,
    product_name varchar(255) not null,
    product_info varchar(255),
    category_id int,
    primary key(product_id),
    foreign key(category_id) references category(category_id) on delete cascade 
);

CREATE TABLE customerOrder (
    order_id INT AUTO_INCREMENT,
    customer_id INT,
    address_id INT,
    product_id INT,
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id)
        REFERENCES customerInfo (customer_id)
        ON DELETE CASCADE,
    FOREIGN KEY (product_id)
        REFERENCES product (product_id)
        ON DELETE CASCADE,
    FOREIGN KEY (address_id)
        REFERENCES address (address_id)
        ON DELETE CASCADE
);
drop table customerOrder;
select * from customerInfo;

CREATE TABLE address (
    address_id INT AUTO_INCREMENT,
    address varchar(100) not null,
    customer_id INT,
    PRIMARY KEY (address_id),
    FOREIGN KEY (customer_id)
        REFERENCES customerInfo (customer_id)
        ON DELETE CASCADE
);

drop table address;

CREATE TABLE category (
    category_id INT AUTO_INCREMENT,
    category_name CHAR(20) NOT NULL,
    subcategory_id INT,
    subcategory_name CHAR(20) NOT NULL,
    PRIMARY KEY (category_id),
    FOREIGN KEY (subcategory_id)
        REFERENCES category (category_id)
);
select * from category;
insert into customerInfo values(1,'omi','patel','omi@gmail.com','1234567','1234567','Femal');
insert into customerInfo values(2,'Akshat','patel','akki@gmail.com','1234567','1234567','Male');
insert into customerInfo values(3,'Sunita','patel','sunita@gmail.com','1234567','1234567','Femal');
insert into customerInfo values(4,'Vedant','acharya','ved@gmail.com','1234567','1234567','Male');
insert into customerInfo values(5,'Sangita','patel','sangita@gmail.com','1234567','1234567','Femal');
insert into customerInfo values(6,'Tarak','patel','tarak@gmail.com','1234567','1234567','Male');
insert into customerInfo values(7,'Manshi','jain','manshi@gmail.com','1234567','1234567','Femal');
insert into customerInfo values(8,'Pawan','takkar','pawan@gmail.com','1234567','1234567','Male');
SELECT 
    *
FROM
    customerInfo;
    
insert into address values(1,'chandlodiya',1);
insert into address values(2,'parbhatchok',2);
insert into address values(3,'ankur',3);
insert into address values(4,'scicity',4);
insert into address values(5,'chandlodiya',5);
insert into address values(6,'kalupur',6);
insert into address values(7,'ranip',7);
insert into address values(8,'kalupur',8);
insert into address values(9,'shola bhavat',1);

select * from address where customer_id=1;


 
