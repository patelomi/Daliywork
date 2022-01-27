/*QRY-7*/
/*Write an SQL query to find the team size of each of the employees.
Return result table in any order.*/
create table Employee(
	employee_id int primary key,
	team_id int
);

select employee_id,count(*) over (partition by team_id) team_id from Employee
order by employee_id;