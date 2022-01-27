/*QRY-8*/
/*You are the restaurant owner and you want to analyze a possible expansion 
(there will be at least one customer every day).
Write an SQL query to compute the moving average of how much the customer 
paid in a seven days window (i.e., current day + 6 days before). 
average_amount should be rounded to two decimal places.
Return result table ordered by visited_on in ascending order.*/

create table Customer(
	customer_id int,
	name varchar(48),
	visited_on date,
	amount int 
);

/*QRY-8*/
/*You are the restaurant owner and you want to analyze a possible expansion 
(there will be at least one customer every day).
Write an SQL query to compute the moving average of how much the customer 
paid in a seven days window (i.e., current day + 6 days before). 
average_amount should be rounded to two decimal places.
Return result table ordered by visited_on in ascending order.*/

create table Customer(
	customer_id int,
	name varchar(48),
	visited_on date,
	amount int 
);

select c1.visited_on, sum(c2.amount) amount,round(avg(c2.amount),2) as average_amount from 
(select visited_on, sum(amount) amount from customer group by visited_on) c1
join 
(select visited_on,sum(amount) amount from customer group by visited_on) c2
on datediff(c1.visited_on, c2.visited_on) between 0 and 6
group by c1.visited_on
having count(c2.amount)=7