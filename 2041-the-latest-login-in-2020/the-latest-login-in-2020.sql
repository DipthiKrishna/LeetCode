-- Write your PostgreSQL query statement below
SELECT DISTINCT user_id,
        MAX(time_stamp) AS last_stamp
FROM Logins
WHERE EXTRACT(Year FROM time_stamp)=2020
GROUP BY user_id;