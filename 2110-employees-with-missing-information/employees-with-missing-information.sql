SELECT COALESCE(e.employee_id , s.employee_id) AS employee_id
FROM employees e
FULL JOIN salaries s ON e.employee_id=s.employee_id
GROUP BY COALESCE(e.employee_id , s.employee_id),e.name,s.salary
HAVING e.name IS NULL OR s.salary IS NULL
ORDER BY employee_id;


