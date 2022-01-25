/*DOC-3.3*/
/*CASE-2*/

create schema poll;
use poll;

create table users (
userId bigint(16) primary key,
firstName varchar(48),
middleName varchar(48),
lastName varchar(48),
mobile varchar(16),
email varchar(48),
passwordHash varchar(32),
userHost tinyint(1),
registeredAt datetime,
lastLogin datetime,
intro tinytext,
userProfile text  
);

create table poll (
pollId bigint(20) primary key,
hostId bigint(20),
title varchar(88),
metaTitle varchar(88),
slug varchar(88),
summary tinytext,
pollType smallint(6),
published tinyint(1),
createdAt datetime,
updatedAt datetime,
publishedAt datetime,
startsAt datetime,
endsAt datetime,
content text  
);
alter table poll add foreign key(hostId) references users(userId);
create table poll_meta(
pollMetaId bigint(16) primary key,
pollId bigint(18),
metaKey varchar(48),
content text,
foreign key (pollId) references poll(pollId)
);


create table poll_category(
pollCategoryId bigint(16) primary key,
categoryId bigint(16) 

);

create table category(
categoryId bigint(16) primary key,
parentId bigint(16),
title  varchar(88),
metatitle varchar(88),
slug varchar(88),
content text
);


create table poll_tag(
pollId bigint(16),
pollTagId bigint(16)
);
alter table poll_tag add foreign key(pollId) references poll(pollId);
alter table poll_tag add primary key(pollTagId);
create table tag(
tagId bigint(16) primary key,
title varchar(88),
metatitle varchar(88),
slug varchar(88),
content text
);

create table poll_question(
questionId bigint(16) primary key,
pollId bigint(16),
questionType varchar(48),
active tinyint(1),
createdAt datetime,
updatedAt datetime,
content text,
foreign key (pollId) references poll(pollId)
);

create table poll_answer(
answerId bigint(16) primary key,
pollId bigint(16),
questionId bigint(16),
active tinyint(1),
createdAt datetime,
updatedAt datetime,
content text,
foreign key (pollId) references poll(pollId),
foreign key (questionId) references poll_question(questionId)

);

create table poll_vote(
voteId bigint(16) primary key,
pollId bigint(16),
questionId bigint(16),
answerId bigint(16),
userId bigint(16),
createdAt datetime,
updatedAt datetime,
content text,
foreign key (pollId) references poll(pollId),
foreign key (questionId) references poll_question(questionId),
foreign key (answerId) references poll_answer(answerId),
foreign key (userId) references users(userId)
);

/*2.1.List out all questions with it’s answer which is having maximum vote.*/

select q.*,count(a.questionId) CountQ, a.* from poll_question q
right join poll_answer a on q.questionId=a.questionId
join poll_vote v on q.questionId=v.questionId
group by q.questionId
having max(v.questionId);

/*2.2.List out all the categories which is having multiple poll questions under it.*/

select c.* from category c
join 
join poll p on p.pollId=c.pollId
join poll_question pq on p.pollId=pq.pollId;

/*2.3.List out all the polls which are currently active.*/

select p.* from poll p 
join poll_question as pq on p.pollId = pq.pollId 
where pq.active= 1; 

/*2.4.List out all the users who is not logged in since last week.*/

select firstName from users 
where datediff('2022-01-25 00:00:00',lastLogin) between 0 and 6;

/*2.5.List out all the users whose email provider is not google.*/

select firstName from users
where email not like '%@gmail.com%';

/*2.6.List out all the polls which are published in 2021.*/

select title from poll
where publishedAt like '2022%';

/*2.7.List out all the users who did not answer any poll yet.*/

select u.* from users u
left join poll p on p.hostId=u.userHost
left join poll_answer a on p.pollId=a.pollId
where a.pollId is null;

/*2.8.Create all the possible unique key and indexes for this database schema*/

/*unique key*/
userId
email
pollmetaId
pollctegoryId
categoryId
pollId
slug
tagId
qId
aId
voteId

/*index*/
users(firstName,lastName)
all table ids
poll(title)