-- Write your PostgreSQL query statement below
WITH employee1 AS(
    SELECT id,company,salary,
    ROW_NUMBER() OVER(PARTITION BY company ORDER BY salary ASC, id ASC) AS row_asc,
    ROW_NUMBER() OVER(PARTITION BY company ORDER BY salary DESC, id DESC) AS row_desc
    FROM employee
    )
SELECT id,company,salary
FROM employee1
WHERE row_asc BETWEEN row_desc-1 AND row_desc+1
ORDER BY company,salary

