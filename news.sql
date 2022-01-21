create schema if not exists news;
use news;

create table address(
	address_id bigint(12) auto_increment,
    user_id bigint(12) not null,
    add_firstName varchar(48),
    add_middleName varchar(60),
    add_lastname varchar(60),
    add_mobile varchar(60),
    add_email varchar(60),
    add_line1 varchar(60),
    add_line2 varchar(60),
    add_city varchar(60),
    add_province varchar(60),
    add_country varchar(60),
    add_areaCode varchar(60),
    add_createdAt datetime not null,
    add_updateAt datetime,
    primary key(address_id),
    foreign key(user_id) references users(user_id)
);

create table users(
	user_id bigint(12) auto_increment,
    user_firstName varchar(60) not null,
    user_middleName varchar(60) not null,
    user_lastName varcharacter(60) not null,
    user_mobile varchar(12) not null,
    user_email varchar(60) not null,
    user_passwordHash varchar(32) not null,
    user_admin tinyint(1),
    user_vendor tinyint(1),
    user_lastLogin datetime,
    user_intro tinytext,
    user_proflie text,
    primary key(user_id)
);
INSERT INTO `news`.`edition` (`edition_id`, `newsLatter_id`, `ecition_description`, `ecition_status`, `ecition_createdAt`, `ecition_updatedAt`, `ecition_publishedAt`) VALUES ('1', '1', 'xyz opq abc', 'yes', '20-2-20', '20-2-20', '21-2-20');

create table newsLatter(
	newsLatter_id bigint(12) auto_increment,
    user_id bigint(12),
    news_title varchar(2048) not null,
    news_description varchar(60),
    news_type smallint(8)not null,
    news_multipal tinyint(1)not null,
    news_global tinyint(1)not null,
    news_status smallint(8)not null,
    news_createdAt datetime not null,
    news_updatedAt datetime,
    news_publishedAt datetime,
    news_content text, 
    primary key(newsLatter_id),
	foreign key(user_id) references users(user_id)
);

create table edition(
	edition_id bigint(12) auto_increment,
    newsLatter_id bigint(12) not null,
    ecition_description varchar(2048),
    ecition_status smallint(8),
    ecition_createdAt datetime,
    ecition_updatedAt datetime,
    ecition_publishedAt datetime,
    ecition_content text,
    primary key(edition_id)
);

create table subscriber(
	subscriber_id bigint(12) auto_increment,
    user_id bigint(12) not null,
    subscriber_firstName varchar(2048),
    subscriber_middleName varchar(60) not null,
    subscriber_lastName varcharacter(60) not null,
    subscriber_mobile varchar(14) not null,
    subscriber_email varchar(60) not null,
	subscriber_phone varchar(60),
    subscriber_active tinyint(1),
    subscriber_createdAt datetime,
    subscriber_updatedAt datetime,
    primary key(subscriber_id),
    foreign key(user_id) references users(user_id)
);

create table newsLetterTri(
	newsLetterTri_id bigint(12) auto_increment,
    newsLatter_id bigint(12),
    eddition_id bigint(12),
    subscriber_id bigint(12),
    newsLetterTri_sent tinyint(1),
    newsLetterTri_delivared tinyint(1),
    newsLetterTri_mode smallint(4),
    newsLetterTri_createdAt datetime,
    newsLetterTri_updatedAt datetime,
    newsLetterTri_sentAt datetime,
    newsLetterTri_deliverdAt datetime,
    primary key(newsLetterTri_id),
    foreign key(newsLatter_id) references newsLatter(newsLatter_id)
);

create table mailingList(
	mailingList_id bigint(12) auto_increment,
    newsLetterTri_id bigint(12),
    subscriber_id bigint(12),
    mailingList_active tinyint(8),
    mailingList_createdAt datetime,
    mailingList_updatedAt datetime,
    primary key(mailingList_id),
    foreign key(newsLetterTri_id) references newsLetterTri(newsLetterTri_id),
    foreign key(subscriber_id) references subscriber(subscriber_id )
);

create table newsLatterMeta(
	newsLatterMeta_id bigint(12) auto_increment,
	newsLetterTri_id bigint(12),
	newsLatterMeta_type varchar(64),
    newsLatterMeta_key varchar(64),
    newsLatterMeta_content text,
    primary key(newsLatterMeta_id),
    foreign key(newsLetterTri_id) references newsLetterTri(newsLetterTri_id)
);