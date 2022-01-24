create schema if not exists caseFile;
use caseFile;
/*File-1*/
/*CASE-1*/

/*Write an SQL query to report all the duplicate emails. Return the result table in any order. The query result format is in the following example.*/

create table Person(
	Person_id bigint(20) auto_increment,
    Person_email varchar(50) not null,
    primary key(Person_id)
);
insert into caseFile.Person values(1,'Omi@gmail.com'),
(2,'Vedant@gmail.com'),
(3,'Disha@gmail.com'),
(4,'jagrut@gmail.com'),
(5,'Omi@gmail.com');

SELECT 
    Person_email
FROM
    Person
GROUP BY Person_email
HAVING COUNT(Person_email) > 1;

/*CASE-2*/

/*A company's executives are interested in seeing who earns the most money in each of the company's departments.
 A high earner in a department is an employee who has a salary in the top three unique salaries for that department.*/
 
 /*Write an SQL query to find the employees who are high earners in each of the departments. Return the result table in any order. 
 The query result format is in the following example.*/
 
 create table employee(
	employee_id int(20) auto_increment,
    employee_name varchar(50) not null,
    employee_salary int(6) not null,
    department_id int(6) not null,
    primary key(employee_id),
    foreign key(department_id) references department(department_id)
 );
 
 create table department(
	department_id int(20) auto_increment,
    department_name varchar(50) not null,
    primary key(department_id)
 );
 
insert into caseFile.employee values(1,'Omi',85000,1);
insert into caseFile.employee values(2,'Vedant',80000,2),(3,'Disha',60000,1),(4,'Sahil',90000,1),(5,'Jagrut',69000,2),(6,'Ram',85000,1),(7,'Vinita',70000,1);
 
insert into caseFile.department values(1,'IT');
insert into caseFile.department values(2,'Sales');

SELECT 
    d.department_name, e.employee_id, e.employee_salary
FROM
    caseFile.employee AS e
        JOIN
    caseFile.department AS d ON d.department_id = e.department_id
WHERE
    3 > (SELECT 
            COUNT(DISTINCT e.employee_salary)
        FROM
            employee AS e1
        WHERE
            e1.employee_salary > e.employee_salary
                AND e.department_id = e1.department_id
		);

/*File-2*/
/*CASE-1*/

/*Write an SQL query to find all dates' Id with higher temperatures compared to its previous dates (yesterday). Return the result table in any order. 
The query result format is in the following example.*/

create table weather(
	wId int(4) primary key auto_increment,
    recordDate date not null,
    temperature int(8) not null
);

insert into caseFile.weather values(1,'2015-1-1',10),(2,'2015-1-2',25),(3,'2015-1-3',20),(4,'2015-1-4',30);

SELECT 
    w1.wId
FROM
    weather AS w1
        LEFT JOIN
    weather AS w2 ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE
    w1.temperature > w2.temperature;


/*CASE-2*/

/*Write an SQL query to find all numbers that appear at least three times consecutively. 
Return the result table in any order. 
The query result format is in the following example.*/

create table Logs(
	id int(4) primary key,
    num varchar(8)
);

insert into Logs values(1,'1'),(2,'1'),(3,'1'),(4,'2'),(5,'1'),(6,'2'),(7,'2');

SELECT DISTINCT
    l1.id AS Consecutivenums
FROM
    Logs AS l1,
    Logs AS l2,
    Logs AS l3
WHERE
    l1.id = l2.id - 1 AND l2.id = l3.id - 1
        AND l1.num = l2.num
        AND l2.num = l3.num
;

/*CASE-3*/

/*Write an SQL query to report the nth highest salary from the Employee table. 
If there is no nth highest salary, the query should report null. 
The query result format is in the following example.*/

create table if not exists empp(
	id int(4)primary key,
    salary int(8)
);
drop table empp;
select * from empp;
insert into empp values(1,100),(2,200),(3,300);

DELIMITER $$
create function Highsalary(N int) returns int
begin set n=n-1;
	return(
		select salary from empp 
        order by salary desc
        limit 1 offset n
	);
end
DELIMITER ;
commit;

/*File-3*/
/*CASE-1*/

/*1. Create a database structure for employee leave application. It should include all the employee's information as well as their leave information.*/
create schema if not exists empLeave;
use empLeave;

create table employees(
	emp_id bigint(24) primary key auto_increment,
    deptid  bigint(24) not null,
    emp_email varchar(48) not null unique,
    emp_name char(48) not null,
    emp_password varchar(8) not null,
    emp_status smallint(1) not null,
    emp_address varchar(48),
    emp_createdAt datetime,
    emp_updatedAt datetime,
    emp_startAt datetime,
    emp_endAt datetime,
    foreign key(deptid) references dept(deptid) 
);

create table employeeLeave(
	leave_id bigint(24) primary key auto_increment,
	emp_id bigint(24) not null,
	leave_type varchar(32)not null,
	leave_reason text not null,
	leave_takenAt datetime not null,
    leave_status smallint(1),
	foreign key (emp_id) references employees(emp_id)
);

create table dept(
	deptid bigint(24) primary key auto_increment,
    dep_name varchar(12) not null unique,
    dep_type varchar(12) not null unique
);

/*Write an SQL query to report the movies with an odd-numbered ID and a description that is not "boring".
 Return the result table ordered by rating in descending order.*/

 create table cinema(
	c_id int primary key auto_increment,
    c_movie varchar(48) not null,
    c_description varchar(48),
    c_rating float
 );
 
 insert into cinema values(1,'war','great 3D',8.9),(2,'Science','fiction',8.5),(3,'irish','boring',6.2),(4,'Ice song','Fantacy',8.6),(5,'House card','Interesting',9.1);
 
 select * from cinema 
 where c_description not like '%boring%' and c_id % 2=1
 order by c_rating desc;
 
 /*3. Write an SQL query to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa) with a single update statement and no intermediate temporary tables.Note that you must write a single update statement,
 do not write any select statement for this problem.*/
 
 create table salary(
	s_id bigint(12) auto_increment primary key,
    s_name varchar(48),
    s_sex enum('m','f'),
    s_salary int
 );
 
insert into salary values(1,'a','m',2500),(2,'b','f',1500),(3,'c','m',5500),(4,'d','f',500);
update salary set s_sex = case when s_sex='m' then 'f' when s_sex= 'f' then 'm' end ;
select * from salary;
 
/*4. Write an SQL query to delete all the duplicate emails, keeping only one unique email with the smallest id.
 Return the result table in any order.*/
 
 create table person1(
	p_id int primary key auto_increment,
    p_email varchar(48)
 );
 
 insert into person1 values(1,'omi@gmail.com'),(2,'vedant@gmail.com'),(3,'omi@gmail.com');

delete from person1 where p_id not in
(select * from
(select min(p_id) from person1 group by p_email) as p);
select* from person1;

/*5.Write an SQL query to report all customers who never order anything. Return the result table in any order.*/

create table cust(
	c_id int primary key auto_increment,
    c_name varchar(48)
);
insert into cust values(1,'joe'),(2,'henry'),(3,'sam'),(4,'max');
create table orders(
	o_id int primary key auto_increment,
    c_id int
);
insert into orders values(1,3),(2,1);

select c.c_name from cust c 
left join orders o on c.c_id=o.c_id
where o.c_id is null;

/*6.Write an SQL query to create index on the email column.*/

create table index_table(
	id int primary key auto_increment,
    email varchar(48)
);

create index emailIndex 
on index_table(email);

/*7.Create a database schema for student grade system. 
It contains student data and their grade of each subject based on the different semester.*/

create schema studentGreadSys;
use studentGreadSys;

create table studentInfo(
	stu_id bigint(8) primary key auto_increment,
    stu_firstName varchar(48) not null,  
    stu_lastName varchar(48) not null,  
    stu_address varchar(48) not null, 
    stu_gender enum('m','f') not null,
    stu_joinedAt datetime,
    stu_complitedAt datetime,
    stu_number numeric(13) not null unique 
);

create table department(
	department_id bigint(8) primary key auto_increment,
    stu_id bigint(8) not null,
    department_name varchar(28) not null,
    foreign key (stu_id)references studentInfo(stu_id)
);

create table sam(
	sam_id bigint(8) primary key auto_increment,
    department_id bigint(8) not null,
	stu_id bigint(8) not null,
    sam_year varchar(12) not null,
    foreign key (department_id)references department(department_id),
    foreign key (stu_id)references studentInfo(stu_id)
);

create table greade(
	greade_id bigint(8) primary key auto_increment,
    sam_id bigint(8) not null,
    department_id bigint(8) not null,
	stu_id bigint(8) not null,
    greade float(4) not null,
    foreign key (department_id)references department(department_id),
    foreign key (stu_id)references studentInfo(stu_id),
    foreign key (sam_id)references sam(sam_id)
);

/*8.Write an SQL query to report the first name, last name, city, and state of each person in the Person table. 
If the address of a personId is not present in the Address table, report null instead. 
Return the result table in any order*/

create table per(
	per_id int primary key auto_increment,
    per_lastName varchar(48),
    per_firstName varchar(48)
);

create table address(
	add_id int primary key auto_increment,
    per_id int,
    add_city varchar(48),
    add_state varchar(48),
    foreign key (per_id) references per(per_id)
);

insert into per values(1,'patel','omi'),(2,'acharya','vedant');
insert into address values(1,2,'rajkot','gujrat');
insert into address values(2,3,'ahmedabad','gujrat');
select * from address;

select p.per_firstName,p.per_lastName,a.add_city,a.add_state from per p
left join address a on p.per_id=a.per_id;


/*File-4*/
/*CASE-1*/

/*1: Write an SQL query to report the first login date for each player. Return the result table in any order.*/

create table activity(
	player_id int,
    device_id int,
    event_date date,
    games_played int,
    primary key(player_id,device_id)
);

insert into activity values(1,2,'2016-03-01',5),(1,3,'2016-05-02',6),(2,3,'2017-06-25',1),(3,1,'2016-03-02',0),(3,4,'2018-07-03',5);

select player_id, min(event_date) as first_login
from activity
group by player_id;

/*2.Write an SQL query to report the device that is first logged in for each player.
Return the result table in any order*/

select player_id, device_id
from activity a1
where a1.event_date<=all(select a2.event_date from activity a2 where a1.player_id=a2.player_id);

/*3.Write an SQL query to report for each player and date, how many games played so far by the player.
 That is, the total number of games played by the player until that date. Check the example for clarity.
 Return the result table in any order.*/
 
select player_id, event_date, sum(games_played) over(partition by player_id order by event_date) as gamePlay
from activity;

/*CASE-2*/
/*Write an SQL query to report all the classes that have at least five students.
 Return the result table in any order.*/
 
 create table cources(
	student varchar(28),
    class varchar(28),
    primary key(student,class)
 );
 
 insert into cources values('a','math'),
 ('b','eng'),
 ('c','math'),
 ('d');