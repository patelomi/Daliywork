create schema if not exists cartSystem;
use cartSystem;

create table users(
	user_id bigint(20) auto_increment,
    user_firstName varchar(50) not null,
    user_middleName varchar(50) not null,
    user_lastName varcharacter(50) not null,
    user_mobile varchar(15) not null,
    user_email varchar(50) not null,
    user_passwordHash varchar(32) not null,
    user_admin tinyint(1),
    user_vendor tinyint(1),
    user_lastLogin datetime,
    user_intro tinytext,
    user_proflie text,
    primary key(user_id)
);

insert into cartSystem.users values(1,'Omi','Tarakbhi','Patel',9898925664,'Omi@gmail.com',87654321,1,1,'2020-02-03','hii i m omipatel','yes');
insert into cartSystem.users values(2,'Akki','Atulbhi','Patel',9898925664,'Akki@gmail.com',87653221,1,2,'2020-02-21','hii i m Akki patel','');
insert into cartSystem.users values(3,'Bhavik','Rameshbhi','Patel',9898434664,'Bhavik@gmail.com',843653221,0,2,'2020-12-21','',''),
(4,'Mahi','Bharatbhi','Patel',9798925664,'Mahi@gmail.com',67653221,1,2,'2020-02-21','',''),
(5,'Shil','Rambhi','Soni',9898925664,'Sahil@gmail.com',87653222,1,2,'2020-01-21','hii','');

create table category(
	category_id bigint(20) auto_increment,
    category_parentId bigint(20) not null,
    category_title varchar(75) not null,
    category_metaTitle varchar(100),
    category_slug varchar(100),
    category_content text,
    primary key(category_id)
);
insert into cartSystem.category values(1,0,'Male','Male','for the male','all type');
insert into cartSystem.category values(2,10,'Femal','Femal','for the Femal','all type'),
(3,9,'Kids','kids','for the kids','for all boys and girls'),
(4,3,'Footware','Footware','for Male and Femal Footware','Footware'),
(5,18,'Phone','Phone','all phones','all the type of Phones');

create table product(
	product_id bigint(20) auto_increment,
    user_id bigint(20),
    product_title varchar(75) not null,
    product_metaTitle varchar(100) not null,
    product_sluge varchar(100),
    product_summary tinyint,
    product_type smallint(6),
    product_sku varchar(100),
    product_price float not null,
    product_discount float,
    product_quantity smallint(6),
    product_shop tinyint(1),
    product_createDate datetime,
    product_updatedAt datetime,
    product_publishedAt datetime,
    product_startsAt datetime,
    product_endsAt datetime,
    product_content text,
    primary key(product_id)
);
alter table cartsystem.product
add foreign key(user_id) references users(user_id);
alter table cartsystem.product
add foreign key(category_id) references category(category_id);
alter table cartsystem.product
add category_id bigint(20);
alter table cartsystem.product
add stutas tinyint(1);
update cartsystem.product set stutas=0 where product_id=3;
insert into cartSystem.product values(1,1,'Tshirt in black','black cute tshirt for femals','xys',0,30,'xyz',1000,25.0,1,1,'2020-01-01','2020-01-01','2020-01-01','2020-01-01','2020-01-01','yes');
insert into cartSystem.product values(2,5,'Tshirt','black tshirt for boys','opq',1,10,'opq',1500,0,2,2,'2020-01-21','2020-01-21','2020-01-21','2020-01-21','2020-01-22','yes');
insert into cartSystem.product values(3,4,'Phone','Xomi','Data',1,50,'Data',15000,50.0,1,1,'2020-02-25','2020-02-26','2020-02-26','2020-02-26','2020-02-26','no');
insert into cartSystem.product values(4,2,'Mask','Mask in black','n95',1,50,'n95',100,0.0,5,1,'2019-02-25','2019-02-26','2019-02-26','2019-02-26','2019-02-26','no');
insert into cartSystem.product values(5,4,'Phone','Samsung','Data and camera',1,50,'Data',15000,50.0,1,1,'2020-02-25','2020-02-26','2020-02-26','2020-02-26','2020-02-26','no');
create table productMeta(
	productMeta_id bigint(20) auto_increment,
    product_id bigint(20) not null,
    productMeta_key varchar(50),
    productMeta_content text,
    primary key(productMeta_id),
    foreign key(product_id) references product(product_id)
);
insert into cartSystem.productMeta values(1,1,'120',null),(2,2,'100',null),(3,3,'145',null),(4,4,'14',null),(5,5,'12','good');
create table orderProduct(
	orderProduct_id bigint(20) auto_increment,
    user_Id bigint(20) not null,
    orderProduct_sessionId varchar(100) not null,
    orderProduct_token varchar(100) not null,
    orderProduct_status smallint(6),
    orderProduct_subTotal float,
    orderProduct_itemDiscount float,
    orderProduct_tax float,
    orderProduct_shipping float,
    orderProduct_total float,
    orderProduct_promo varchar(50),
    orderProduct_discount float,
    orderProduct_grandTotal float,
    firstname varchar(50) not null,
    middleName varchar(50) not null,
    lastName varcharacter(50) not null,
    mobile varchar(15) not null,
    email varchar(50) not null,
    line1 varchar(50),
    line2 varchar(50),
    city varchar(50) not null,
    province varchar(50) not null,
    country varchar(50) not null,
    orderProduct_createdAt datetime,
    orderProduct_updatedAt datetime,
    orderProduct_content text,
    primary key(orderProduct_id)
);
alter table cartsystem.orderProduct
add foreign key(product_id) references product(product_id);
alter table cartsystem.orderProduct
add product_id bigint(20);
update cartsystem.orderProduct set orderProduct_discount=30 where orderProduct_id=3;

insert into cartSystem.orderProduct values(1,2,2,2,0,2000,25,10,1,2500,'yes',25,3000,'Akki','Atulbhi','Patel',9898925664,'Akki@gmail.com','','','Ahemdabad','Gujrat','India','2020-04-05','2020-04-05','');
insert into cartSystem.orderProduct values(2,3,3,3,1,2030,2,12,1,2600,'yes',2,3100,'Bhavik','Rameshbhi','Patel',9898434664,'Bhavik@gmail.com','','','Ahemdabad','Gujrat','India','2020-06-05','2020-06-05','');
insert into cartSystem.orderProduct values(3,1,1,1,1,200,0,9,0,250,'no',0,300,'Omi','Tarakbhi','Patel',9898925664,'Omi@gmail.com','','','Ahemdabad','Gujrat','India','2020-06-06','2020-06-06','nothing'),
(4,4,4,4,1,200,0,9,0,250,'no',0,300,'Mahi','Bharatbhi','Patel',9798925664,'Mahi@gmail.com','E-35','happy shreet','Surat','Gujrat','India','2020-06-06','2020-06-06','nothing'),
(5,1,1,1,1,4000,50,1,1,4005,'no',50,5000,'Omi','Tarakbhi','Patel',9898925664,'Omi@gmail.com','','','Ahemdabad','Gujrat','India','2021-06-06','2021-06-06','');
create table tag(
	tag_id bigint(20) auto_increment,
    tag_title varchar(75) not null,
    tag_metaTitle varchar(100),
    tag_slug varchar(100),
    tag_content text,
    primary key(tag_id)
);
alter table cartsystem.tag
add foreign key(product_id) references product(product_id);
alter table cartsystem.tag
add product_id bigint(20);
update cartsystem.tag set product_id=4 where tag_id=5;
insert into cartSystem.tag values(1,'Cool','Great','234',''),(2,'Simple','Best of the best','34',''),(3,'Cool','Great','100',''),(4,'Nice','Good product','50',''),(5,'Simple','Best of the best','34','');
create table cart(
	cart_id bigint(20) auto_increment,
    user_id bigint(20),
    cart_sessionId varchar(100) not null,
    cart_token varbinary(100) not null,
    cart_status smallint(6),
    firstName varchar(50) not null,
    middleName varchar(50) not null,
    lastName varcharacter(50) not null,
    mobile varchar(15) not null,
    email varchar(50) not null,
    line1 varchar(50),
    line2 varchar(50),
    city varchar(50) not null,
    province varchar(50) not null,
    country varchar(50) not null,
    cart_createdAt datetime,
    cart_updatedAt datetime,
    cart_content text,
    primary key(cart_id),
    foreign key(user_id) references users(user_id)
);
insert into cartsystem.cart values(1,1,1,1,1,'Omi','Tarakbhi','Patel',9898925664,'Omi@gmail.com','','','Ahemdabad','Gujrat','India','2021-06-06','2021-06-06','');
insert into cartsystem.cart values(2,3,3,3,3,'Bhavik','Rameshbhi','Patel',9898434664,'Bhavik@gmail.com','','','Ahemdabad','Gujrat','India','2020-06-05','2020-06-05','Best'),
(3,2,2,2,2,'Akki','Atulbhi','Patel',9898925664,'Akki@gmail.com','','','Ahemdabad','Gujrat','India','2020-04-05','2020-04-05',''),
(4,1,1,1,1,'Omi','Tarakbhi','Patel',9898925664,'Omi@gmail.com','','','Ahemdabad','Gujrat','India','2021-06-06','2021-06-06',''),
(5,4,4,4,4,'Mahi','Bharatbhi','Patel',9798925664,'Mahi@gmail.com','E-35','happy shreet','Surat','Gujrat','India','2020-06-06','2020-06-06','nothing');
update cartsystem.cart set cart_status=0 where user_id =5;
select * from cartsystem.cart;

create table productTag(
	productTag_id bigint(20) auto_increment,
    tag_id bigint(20) not null,
    primary key(productTag_id),
    foreign key(tag_id) references tag(tag_id)
);

create table productReview(
	productReview_id bigint(20) auto_increment,
    product_id bigint(20) not null,
    productReview_parentId bigint(20) not null,
    productReview_title varchar(100),
    productReview_rating smallint(6),
    productReview_published tinyint(1),
    productReview_createAt datetime,
    productReview_publishedAt datetime,
    productReview_content text,
    primary key(productReview_id),
    foreign key(product_id) references product(product_id)
);
insert into cartsystem.productReview values(1,1,1,'Tshirt',5,1,'2020-01-01','2020-01-01','yes');
insert into cartsystem.productReview values(2,2,2,'watch',4,1,'2020-01-01','2020-01-01','yes'),
(3,3,3,'Mask',5,1,'2020-01-01','2020-01-01','yes'),
(4,4,4,'Shirt',4,1,'2020-01-01','2020-01-01','yes'),
(5,5,5,'Boots',5,1,'2020-01-01','2020-01-01','yes');
create table productCategory(
	productCategory_id bigint(20) auto_increment,
    category_id bigint,
    primary key(productCategory_id),
	foreign key (category_id) references category(category_id)
);
insert into cartsystem.productCategory values(1,1),(2,2),(3,3),(4,4),(5,5);
create table orderItem(
	orderItem_id bigint(20) auto_increment,
    product_id bigint(20) not null,
    orderProduct_id bigint(20) not null,
    orderItem_sku varchar(100),
    orderItem_price float,
    orderItem_discount float,
    orderItem_quantity smallint(6),
    orderItem_createdAt datetime,
    orderItem_updatedAt datetime,
    orderItem_content text,
    primary key(orderItem_id),
    foreign key(product_id) references product(product_id),
    foreign key(orderProduct_id) references orderProduct(orderProduct_id)
);
insert into cartsystem.orderItem values(1,2,3,'234',2000,5,2,'2020-04-05','2020-04-05','');
insert into cartsystem.orderItem values(2,2,1,'434',2500,10,1,'2020-02-05','2020-02-05','yes'),
(3,4,2,'44',1500,0,1,'2020-02-15','2020-02-15','no'),
(4,3,5,'66',250,0,2,'2020-02-05','2020-02-05','yes'),
(5,5,4,'199',40000,10,3,'2020-03-25','2020-03-25','');
create table teansaction(
	teansaction_id bigint(20) auto_increment,
    user_id bigint(20) not null,
    orderProduct_id bigint(20) not null,
    teansaction_code varchar(100) not null,
    teansaction_type smallint(6),
    teansaction_mode smallint(6),
    teansaction_status smallint(6),
    teansaction_createdAt datetime,
    teansaction_updatedAt datetime,
    teansaction_content text,
    primary key(teansaction_id),
    foreign key(user_id) references users(user_id),
    foreign key(orderProduct_id) references orderProduct(orderProduct_id)
);
insert into cartsystem.teansaction values(1,1,1,'235',1,1,1,'2020-08-08','2020-08-08','goo');
insert into cartsystem.teansaction values(2,2,2,'25',2,2,0,'2020-09-08','2020-09-08',''),
(3,3,3,'100',1,1,1,'2020-09-08','2020-09-08','good'),
(4,4,4,'35',2,2,0,'2020-10-12','2020-10-12',''),
(5,1,1,'145',2,2,1,'2020-09-08','2020-09-08','great');
create table cartItem(
	cartItem_id bigint(20) auto_increment,
    product_id bigint(20) not null,
    cart_id bigint(20) not null,
    cartItem_sku varchar(100),
    cartItem_price float not null,
    cartItem_discount float,
    cartItem_quantity smallint(6),
    cartItem_active tinyint(1),
    cartItem_createdAt datetime,
    cartItem_updatedAt datetime,
    cartItem_content text,
    primary key(cartItem_id),
    foreign key(product_id) references product(product_id),
    foreign key(cart_id) references cart(cart_id)
);
insert into cartsystem.cartItem values(1,2,3,'234',3000,15,2,1,'2020-04-05','2020-04-05','');
insert into cartsystem.cartItem values(2,1,2,'24',2000,10,1,2,'2020-06-05','2020-06-05','Best');
insert into cartsystem.cartItem values(3,2,1,'23',4000,50,1,1,'2020-06-06','2020-06-06','nothing');
insert into cartsystem.cartItem values(4,3,3,'34',100,0,1,2,'2021-06-06','2021-06-06','');
insert into cartsystem.cartItem values(5,4,5,'100',1500,15,2,1,'2020-04-05','2020-04-05','');

/*QRYS*/
/*Get all the categories which are having at least one sub category */
SELECT 
    *
FROM
    cartsystem.category
WHERE
    category_id IN (SELECT 
            category_parentId
        FROM
            cartsystem.category);

/*Get all the products which are having price between 50 to 100*/
SELECT 
    *
FROM
    cartsystem.product
WHERE
    product_price BETWEEN 50 AND 1000;

/*Get all the products sorted based on created date*/
SELECT 
    *
FROM
    cartsystem.product
ORDER BY product_createDate;

/*Get total sub total of all the orders*/
SELECT 
    SUM(orderProduct_subTotal) AS Sub_Total
FROM
    cartsystem.orderProduct;

/*Get total discount applied in all the orders*/
SELECT 
    orderProduct_id,
    SUM(orderProduct_itemDiscount) + SUM(orderProduct_discount) AS TotalDiscount
FROM
    cartsystem.orderProduct
GROUP BY orderProduct_id;

/*Get data of particular user that how many orders they are having */
SELECT 
    user_id
FROM
    cartsystem.orderProduct
GROUP BY user_id
HAVING COUNT(user_id);

/*Get orders list which is having promo applied in that order*/
SELECT 
    *
FROM
    cartsystem.orderProduct
WHERE
    orderProduct_promo = 'yes';

/*Get current active carts details*/
SELECT 
    *
FROM
    cartsystem.cart
WHERE
    cart_status = 1;

/*get the list of product ids which are having multiple categories.*/
SELECT 
    productCategory_id
FROM
    cartsystem.productCategory
GROUP BY productCategory_id
HAVING COUNT(category_id) > 0;

/*Get all the product ids which is having more than 2 reviews*/
SELECT 
    *
FROM
    cartsystem.productReview
HAVING COUNT(product_id) > 1;
 
/*Get all the products which are updated in last 2 hours*/
SELECT 
    *
FROM
    cartsystem.product
WHERE
    product_quantity > 2;

commit;


/*List all the product names which are assigned to category ID 1. */
SELECT 
    product.product_title,category.category_id
FROM
    cartSystem.product
        JOIN
    cartSystem.category ON product.product_id = category.category_id
WHERE
    category_id = 1
GROUP BY product_title;

 /*Get the active product count which is assigned to category ID 2. */
SELECT 
    p.product_startsAt, c.category_id
FROM
    cartSystem.product AS p
        JOIN
    cartSystem.category AS c ON p.category_id = c.category_id
WHERE
    c.category_id = 2;
  
/*Show all category names which are assigned to Product ID 1.*/
SELECT 
    c.category_title, p.product_id
FROM
    cartSystem.product AS p
        JOIN
    cartSystem.category AS c ON p.category_id = c.category_id
WHERE
    p.product_id = 1;

/*List out all the tag names which are assigned to Product ID 1.*/
SELECT 
    t.tag_title, p.product_id
FROM
    cartSystem.product AS p
        JOIN
    cartSystem.tag AS t ON t.product_id = p.product_id
WHERE
    p.product_id = 1;
    
/*Show product reviews with product name if product is active.*/    
SELECT 
    p.product_title,
    p.stutas,
    pr.productReview_id,
    pr.productReview_rating
FROM
    cartSystem.product AS p
        LEFT JOIN
    cartSystem.productReview AS pr ON p.product_id = pr.product_id
WHERE
    p.stutas = 1;

/*List out product names and product ids which have at least one order available.*/
SELECT 
    p.product_id, p.product_title
FROM
    cartSystem.product AS p
        JOIN
    cartSystem.orderItem AS oi ON p.product_id = oi.product_id
GROUP BY product_title
HAVING SUM(oi.orderProduct_id) > 1
ORDER BY p.product_id;

/*Show User ID and Order ID associated with that User.*/
SELECT 
    u.user_id, op.orderProduct_id
FROM
    cartSystem.users AS u
        LEFT JOIN
    cartSystem.orderProduct AS op ON u.user_id = op.user_id
ORDER BY u.user_id;

/*Show total subtotal of all the orders for user id 1.*/
SELECT 
    u.user_firstName,
    u.user_middleName,
    u.user_lastName,
    SUM(op.orderProduct_subTotal)
FROM
    cartSystem.users AS u
        JOIN
    cartSystem.orderProduct AS op ON u.user_id = op.user_id
WHERE
    u.user_id = 1;

/*Show all the orders which are created on 19th Jan.*/
SELECT 
    *
FROM
    cartSystem.orderProduct
WHERE
    orderProduct_createdAt = '2020-06-06';

/*Show product names and their product ids which are placed in order id 1.*/
SELECT 
    p.product_title, p.product_id, op.orderProduct_id
FROM
    cartSystem.product AS p
        JOIN
    cartSystem.orderProduct AS op ON p.product_id = op.product_id
WHERE
    op.orderProduct_id = 1;

/*List out the order of user ID 1 which has a discount greater than 100.*/
SELECT 
    u.user_id, op.orderProduct_discount
FROM
    cartSystem.users AS u
        JOIN
    cartSystem.orderProduct AS op ON u.user_id = op.user_id
WHERE
    u.user_id = 1
HAVING op.orderProduct_discount > 20;

/*Show the product names, ids and total qty purchased so far for each product.*/
SELECT 
    product_title, product_id, product_quantity
FROM
    cartSystem.product;

commit;