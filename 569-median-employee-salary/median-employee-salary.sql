-- Write your PostgreSQL query statement below
WITH e1 AS(
    SELECT id,company,salary,
    ROW_NUMBER() OVER(PARTITION BY company ORDER BY salary) AS rank1,
    COUNT(*) OVER(PARTITION BY company) AS count1
    FROM employee    )
SELECT id,company,salary
FROM e1
WHERE rank1 BETWEEN count1/2::decimal AND (count1/2)::decimal+1
ORDER BY company,salary;

