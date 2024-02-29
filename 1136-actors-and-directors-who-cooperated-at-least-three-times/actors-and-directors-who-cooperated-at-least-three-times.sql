-- Write your PostgreSQL query statement below
SELECT actor_id,director_id from ActorDirector
GROUP BY actor_id,director_id
HAVING COUNT(*)>=3;