-- Write your PostgreSQL query statement below
SELECT seat_id
FROM Cinema
WHERE free=1 AND (seat_id -1 IN (SELECT seat_id FROM cinema WHERE free=1)OR
seat_id+1 IN (SELECT seat_id FROM cinema WHERE free=1))
ORDER BY seat_id;