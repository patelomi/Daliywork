use DBdemo;

create table Cust(
cust_id int primary key not null,
cust_name char(20) not null,
cust_email varchar(30) not null,
cust_password varchar(8) not null,
cust_repassword varchar(8) not null,
cust_gender boolean,
cust_age numeric(3),
cust_address varchar(100) not null,
cust_pairaddress varchar(100)
)

insert into values Cast(1,"Omi","omipatel213@gmail.com",12345678,12345678,22,"XYZ")
select * from Cust;
