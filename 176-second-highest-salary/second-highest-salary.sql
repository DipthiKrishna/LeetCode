## Write your MySQL query statement below
SELECT Max(salary) AS SecondHighestSalary
FROM Employee
WHERE salary <(SELECT Max(salary)
                FROM Employee
                ) OR salary IS NULL;