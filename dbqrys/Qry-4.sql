/*QRY-4*/
/*Write an SQL query to report the customer ids from the Customer table 
that bought all the products in the Product table. Return the result 
table in any order.*/
create table product(
	product_key int primary key
);

create table customer(
	customer_id int,
    product_key int,
    foreign key(product_key) references product(product_key)
);

select customer_id from customer 
group by customer_id 
having count(distinct product_key)=(select count(1) from product);