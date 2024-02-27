-- Write your PostgreSQL query statement below
SELECT CASE WHEN from_id < to_id THEN from_id ELSE to_id END as person1,
CASE WHEN from_id < to_id THEN to_id ELSE from_id END as person2,
COUNT(*) as call_count,SUM(duration) AS total_duration
FROM Calls
GROUP BY 1,2;