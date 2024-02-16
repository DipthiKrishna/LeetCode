-- Write your PostgreSQL query statement below

WITH salrank AS (
    SELECT 
        e.departmentId,
        e.name AS employee,
        e.salary,
        DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS ranked
    FROM Employee e
)
SELECT 
    d.name AS Department,
    s.employee AS Employee,
    s.salary AS Salary
FROM 
    salrank s
JOIN 
    Department d ON s.departmentId = d.id
WHERE 
    s.ranked <= 3
ORDER BY 
    s.departmentId, s.ranked;
