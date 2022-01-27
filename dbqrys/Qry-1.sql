/*QRY-1*/
/*Write an SQL query to report the respective department name and number of 
students majoring in each department for all departments in the 
Department table (even ones with no current students).
Return the result table ordered by student_number in descending order. In 
case of a tie, order them by dept_name alphabetically.*/
create schema exam;
use exam;

create table student (
	stu_id bigint primary key ,
    stu_name varchar(100) not null,
    gender varchar(10) not null,
    dept_id bigint not null
);
select * from department;
create table department (
	dept_id bigint primary key,
    dept_name varchar(100) not null
);

select d.dept_name,s.stu_id from student s 
left join department d on s.dept_id = d.dept_id;