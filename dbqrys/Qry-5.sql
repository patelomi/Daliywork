/*QRY-5*/
/*Write a SQL query to find the highest grade with its corresponding course 
for each student. In case of a tie, you should find the course with the 
smallest course_id.
Return the result table ordered by student_id in ascending order.*/

create table Enrollments(
	student_id int,
    corse_id int,
    gread int
);
select student_id,min(corse_id) corse_id,gread from Enrollments
where(student_id,gread) in (select student_id,max(gread) from Enrollments
group by student_id)
group by student_id
order by student_id asc;