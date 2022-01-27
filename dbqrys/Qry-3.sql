/*QRY-3*/
/*Write a SQL query for a report that provides the pairs (actor_id, 
director_id) where the actor has cooperated with the director at least 
three times.*/
select actor_id,director_id from actor_director 
group by director_id,actor_id 
having count(*)>=3;