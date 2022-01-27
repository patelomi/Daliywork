/*QRY-2*/
/*Write an SQL query to find the customer_number for the customer who has 
placed the largest number of orders.*/
create table orders(
	order_id int(11) primary key,
    customer_id int(11) not null
);

select customer_id from orders 
group by customer_id  
order by count(order_id) 
desc limit 1;  