/*QRY-6*/
/*Write an SQL query to find the prices of all products on 2019-08-16. 
Assume the price of all products before any change is 10.
Return the result table in any order.
*/
create table Products(
	product_id int,
    new_price int,
    change_date date
);

select distinct product_id,new_price from Products
where (product_id,change_date) in (select product_id,max(change_date) from Products
where change_date<='19-8-16'
group by product_id)
union
select distinct product_id,10 as new_price from Products
where product_id not in (select product_id from Products
where change_date<='19-8-16')
order by new_price desc;