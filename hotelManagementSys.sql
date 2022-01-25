/*DOC-3.3*/
/*CASE-1*/

create schema HotleManagementSys;
use HotleManagementSys;
drop schema HotleManagementSys;
create table user(
	uid bigint(8) auto_increment primary key,
    firstName varchar(48) not null,
    middleName varchar(48) not null,
    lastName varchar(48) not null,
    email varchar(48) not null,
    password varchar(8),
    admin tinyint(1),
    vender tinyint(1),
    chef tinyint(1),
    agent tinyint(1),
    registeredAt datetime,
    lastLogin datetime,
    intro tinytext,
    profile text
);
insert into user values(1,'omi','t','patel','omi@gmail.com','omi123',1,0,0,0,'22-1-1','22-1-25','admin',null),
(2,'vedant','u','achariya','ved@gmail.com','ved123',0,1,0,0,'22-1-2','22-1-24','vander',null),
(3,'akki','a','patel','akki@gmail.com','akki123',0,0,1,0,'22-1-2','22-1-25','chef',null),
(4,'bhavik','a','patel','bavik@gmail.com','bha123',0,0,0,1,'22-1-2','22-1-22','agent',null),
(5,'sunita','t','patel','sunita@gmail.com','suni123',0,1,0,0,'22-1-2','22-1-21','vander',null);
create table menu(
	mid bigint(8) auto_increment primary key,
    uid bigint(8) not null,
    title varchar(48),
    slug varchar(48) unique,
    sammary tinytext,
    type smallint(8),
    createdAt datetime,
    updatedAt datetime,
    content text,
    foreign key(uid) references user(uid)
);
insert into menu values(1,2,'palak','123','palak','1','22-1-2','22-1-2',null),
(2,3,'potato','456','potato','3','22-1-2','22-1-2',null);
create table item(
	iid bigint(8) auto_increment primary key,
    uid bigint(8) not null,
    vender tinyint(1),
    title varchar(48),
    slug varchar(48) unique,
    sammary tinytext,
    type smallint(8),
    cooking tinyint(1),
    sku varchar(48),
    price float,
    quantity float,
    unit smallint(8),
    recipe text,
    insruction text,
    createdAt datetime,
    updatedAt datetime,
    content text,
    foreign key(uid) references user(uid)
);

create table orders(
	oid bigint(8) auto_increment primary key,
    uid bigint(8) not null,
    vender tinyint(1) not null,
    token varchar(48) not null,
    status smallint(8),
    subTotal float,
    itemDiscount float,
    tex float,
    shipping float,
    total float,
    promo varchar(48),
    discount float,
    grandTotal float,
    firstName varchar(48) not null,
    middleName varchar(48) not null,
    lastName varchar(48) not null,
    email varchar(48) not null,
    line1 varchar(48),
    line2 varchar(48),
    city varchar(48),
    province varchar(48),
    country varchar(48),
    createdAt datetime,
    updatedAt datetime,
    content text,
    foreign key(uid) references user(uid)
);

create table booking(
	bookid bigint(8) auto_increment primary key,
    tid bigint(8) not null,
	uid bigint(8) not null,
	token varchar(48) not null,
    status smallint(8),
    firstName varchar(48) not null,
    middleName varchar(48) not null,
    lastName varchar(48) not null,
    email varchar(48) not null,
    line1 varchar(48),
    line2 varchar(48),
    city varchar(48),
    province varchar(48),
    country varchar(48),
    createdAt datetime,
    updatedAt datetime,
    content text,
    foreign key(uid) references user(uid),
    foreign key(tid) references table_top(tid)
);

create table table_top(
	tid bigint(8) auto_increment primary key,
    code varchar(128) not null,
    status smallint(8),
    capacity smallint(8),
    createdAt datetime,
    updatedAt datetime,
    content text
);
create table order_item(
	oiid bigint(8) auto_increment primary key,
    oid bigint(8) not null,
    iid bigint(8) not null,
    sku varchar(48),
    discount float,
    quantity smallint(6),
    unit smallint(6),
    status smallint(6),
    createdAt datetime,
    updatedAt datetime,
    content text,
    foreign key(iid) references item(iid),
    foreign key(oid) references orders(oid)
);

create table booking_item(
	bkid bigint(8) auto_increment primary key,
    iid bigint(8) not null,
    bookid bigint(8) not null,
    sku varchar(48),
    discount float,
    quantity smallint(6),
    unit smallint(6),
    status smallint(6),
    createdAt datetime,
    updatedAt datetime,
    content text,
    foreign key(iid) references item(iid),
    foreign key(bookid) references booking(bookid)
);
insert into booking_item values(1,1,1,'palak',20.5,2,10,1,'22-1-2','22-1-2',null),
(2,2,1,'haldhi',20.5,2,20,1,'22-1-2','22-1-2',null);
create table recipe(
	rid bigint(8) auto_increment primary key,
    iid bigint(8) not null,
    ingid bigint(8) not null,
    quantity float,
    unit smallint(6),
    instruction text,
    foreign key(iid) references item(iid),
    foreign key(ingid) references ingredient(ingid)
);
insert into recipe values(1,1,1,200,30,null),(2,2,2,300,40,null);
create table ingredient(
	ingid bigint(8) auto_increment primary key,
    uid bigint(8) not null,
    vender tinyint(1) not null,
    title varchar(48),
    slug varchar(48) unique,
    sammary tinytext,
    type smallint(8),
    sku varchar(48),
    price float,
    quantity float,
    unit smallint(8),
    recipe text,
    insruction text,
    createdAt datetime,
    foreign key(uid) references user(uid)
);
insert into ingredient values(1,3,5,'mirch','123','mirch',1,'mirch',120.0,2.5,10,'daltadaka','spicy','22-1-2'),
(2,3,2,'haldi','456','haldi',2,'haldi',220.0,2.5,50,'dal','midspicy','22-1-2');
create table transaction(
	triid bigint(8) auto_increment primary key,
    uid bigint(8) not null,
    vender tinyint(1) not null,
    oid bigint(8) not null,
    code varchar(128) not null,
    type smallint(8),
    mode smallint(8),
    status smallint(8),
    createdAt datetime,
    updatedAt datetime,
    content text,
    foreign key(uid) references user(uid),
    foreign key(oid) references orders(oid)
);
insert into transaction values(1,2,2,1,'123',1,1,1,'22-1-2','22-1-2',null),(2,2,2,2,'456',2,1,1,'22-1-2','22-1-2',null);
create table item_chef(
	icid bigint(8) auto_increment primary key,
    iid bigint(8) not null,
    chef tinyint(1) not null,
    active tinyint(1),
    foreign key(iid) references item(iid)
);
insert into item_chef values(1,1,3,1),(2,2,3,1);
create table menu_item(
	menuid bigint(8) auto_increment primary key,
    iid bigint(8) not null,
    mid bigint(8) not null,
    active tinyint(1),
    foreign key(iid) references item(iid),
    foreign key(mid) references menu(mid)
);
insert into menu_item values(1,1,1,1),(2,2,2,2);

/*1.1.Total income of Restaurant till now.*/

select sum(grandTotal)as TotalIncome from orders;

/*1.2.Customer who visited the restaurant more than twice.*/

select distinct(u.firstName) from user u
join orders o on u.uid=o.uid
where u.uid=o.uid
having count(o.uid)>2;

/*1.3.List of all menus with its menu items.*/

select * from menu m
join menu_item mi on m.mid=mi.mid;

/*1.4.List out all the unique ids and possible indexes for this DB schema*/

/*unique ids*/
all table ids
mobileno
email
slug
sku

/*index*/
user(firstName,middleName,lastName)
item(title,slug)
book_item(sku)
booking(firstName,middleName,lastName)
booking(city,province,country)
order(city,province,country)
order(firstName,middleName,lastName)

/*1.5.List out total order placed by each User.*/

select u.firstName,count(distinct(o.oid)) from user u
join orders o on u.uid=o.uid
group by u.firstName;

/*1.6.Make a list of each user and the highest-priced menu item he or she ordered.*/

select u.firstName,max(o.grandTotal)as Total from user u 
join orders o on u.uid=o.uid
join orders o1 on o.uid=o1.uid
group by o.uid;

/*1.7.Retrieve the name of a chef who prepares more recipes than any other chef.*/

select u.firstName,count(r.iid)as total from user u
join item i on u.uid=i.uid
join recipe r on i.iid=r.iid
group by i.iid;

/*1.8.Retrieve the amount of subtotal for all day on 9th November 2021. 
(It does not include the total, formula: item price * ordered qty).*/

select sum(price*quantity) as subTotal from item
where createdAt like '2022-01-25%'; 

/*1.9.List out user along with the average amount spend at the restaurant.*/

select u.firstName,avg(o.grandTotal) alltotal from user u
join orders o on u.uid=o.uid
group by o.grandTotal;

/*1.10.List out the menu items which are preferred by the customer at dinner time.*/

select * from item i
join order_item oi on i.iid=oi.iid
group by oi.oid
having oid.createdAt between '2022-01-25 19:00:00' and '2022-01-25 22:00:00';

