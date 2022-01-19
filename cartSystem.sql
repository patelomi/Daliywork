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

create table category(
	category_id bigint(20) auto_increment,
    category_parentId bigint(20) not null,
    category_title varchar(75) not null,
    category_metaTitle varchar(100),
    category_slug varchar(100),
    category_content text,
    primary key(category_id)
);

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

create table productMeta(
	productMeta_id bigint(20) auto_increment,
    product_id bigint(20) not null,
    productMeta_key varchar(50),
    productMeta_content text,
    primary key(productMeta_id),
    foreign key(product_id) references product(product_id)
);

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

create table tag(
	tag_id bigint(20) auto_increment,
    tag_title varchar(75) not null,
    tag_metaTitle varchar(100),
    tag_slug varchar(100),
    tag_content text,
    primary key(tag_id)
);

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

create table productCategory(
	productCategory_id bigint(20) auto_increment,
    category_id bigint,
    primary key(productCategory_id),
	foreign key (category_id) references category(category_id)
);

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

