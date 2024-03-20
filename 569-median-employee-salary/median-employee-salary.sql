-- Write your PostgreSQL query statement below
WITH employee1 AS(
    SELECT id,company,
    ROW_NUMBER() OVER(PARTITION BY company ORDER BY salary ASC, id ASC) AS row_asc,
    ROW_NUMBER() OVER(PARTITION BY company ORDER BY salary DESC, id DESC) AS row_desc
    FROM employee
    )
SELECT e1.id,e1.company,e.salary
FROM employee1 e1 JOIN employee e USING(id)
WHERE row_asc BETWEEN row_desc-1 AND row_desc+1
ORDER BY e1.company,e.salary

