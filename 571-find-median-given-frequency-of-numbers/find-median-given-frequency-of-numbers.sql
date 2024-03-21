-- Write your PostgreSQL query statement below
WITH my_list AS(SELECT num,frequency,
SUM(frequency) OVER(ORDER BY num ASC)c1,
SUM(frequency) OVER(ORDER BY num DESC)c2
FROM numbers)
SELECT AVG(num*1.0) AS median
FROM my_list WHERE ABS(c1-c2)<=frequency;