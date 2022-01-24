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

/*1.Get all the users who created in the last 15 days.*/

SELECT 
    *
FROM
    users u
WHERE
    user_lastLogin >= (SELECT 
            MAX(u1.user_lastLogin)
        FROM
            users u1
        WHERE
            u1.user_id = u.user_id) - INTERVAL 15 DAY;

/*2.Get all the users with their addresses who are active subscribers.*/

SELECT 
    u.user_id, u.user_firstName, a.add_city
FROM
    users AS u
        JOIN
    address AS a ON u.user_id = a.user_id
        JOIN
    subscriber AS s ON u.user_id = s.user_id
WHERE
    s.subscriber_active = 1;

/*3.Get all the users who subscribed in the last 30 days and are active currently.*/

SELECT DISTINCT
    (u.user_email)
FROM
    users u
        JOIN
    subscriber AS s ON u.user_id = s.user_id
        JOIN
    mailingList AS ml ON s.subscriber_id = s.subscriber_id
WHERE
    ml.mailingList_active = 1;

/*5.Get all the users email and newsletter title for which newsletter triggered today.*/

SELECT DISTINCT
    (u.user_email), n.news_title
FROM
    users u
        JOIN
    newsLatter n ON u.user_id = n.user_id
        JOIN
    newsLetterTri nlt ON n.newsLatter_id = nlt.newsLatter_id
WHERE
    nlt.newsLetterTri_delivared = CURDATE();