create schema if not exists caseFile;
use caseFile;
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

select distinct person_email from caseFile.Person;

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


/*CASE-3*/

/*Write an SQL query to find all dates' Id with higher temperatures compared to its previous dates (yesterday). Return the result table in any order. 
The query result format is in the following example.*/

create table weather(
	wId int(4) primary key auto_increment,
    recordDate date not null,
    temperature int(8) not null
);

insert into caseFile.weather values(1,'2015-1-1',10),(2,'2015-1-2',25),(3,'2015-1-3',20),(4,'2015-1-4',30);

select w1.wId from weather as w1 
left join weather as w2 on datediff(w1.recordDate,w2.recordDate)=1 
where w1.temperature > w2.temperature;


/*CASE-4*/

/*Write an SQL query to find all numbers that appear at least three times consecutively. 
Return the result table in any order. 
The query result format is in the following example.*/

create table Logs(
	id int(4) primary key,
    num varchar(8)
);

insert into Logs values(1,'1'),(2,'1'),(3,'1'),(4,'2'),(5,'1'),(6,'2'),(7,'2');

SELECT distinct l1.id as Consecutivenums
FROM
    Logs as l1,
    Logs as l2,
    Logs as l3
WHERE
    l1.id = l2.id - 1
    AND l2.id = l3.id - 1
    AND l1.num = l2.num
    AND l2.num = l3.num
;

/*CASE-5*/

/*Write an SQL query to report the nth highest salary from the Employee table. 
If there is no nth highest salary, the query should report null. 
The query result format is in the following example.*/

create table empp(
	id int(4) primary key,
    salary int(8)
);

insert into empp values(1,100),(2,200),(3,300);

