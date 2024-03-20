-- Write your PostgreSQL query statement below
WITH employee1 AS(
    SELECT id,company,salary,
    ROW_NUMBER() OVER(PARTITION BY company ORDER BY salary) AS rank,
    COUNT(*) OVER(PARTITION BY company) AS com_count
    FROM employee
    )
SELECT id,company,salary
FROM employee1
WHERE rank BETWEEN com_count/2::decimal AND (com_count/2)+1::decimal
ORDER BY company,salary;

