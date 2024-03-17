-- Write your PostgreSQL query statement below
SELECT DISTINCT d.name AS Department,e.name as Employee,e.salary as Salary
FROM employee e
INNER JOIN department d ON e.departmentId = d.id
WHERE (d.id, e.salary) IN (SELECT departmentid,MAX(salary) FROM employee GROUP BY departmentid);
