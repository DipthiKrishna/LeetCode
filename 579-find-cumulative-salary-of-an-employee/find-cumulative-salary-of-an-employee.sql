SELECT id,month,
SUM(salary)OVER(PARTITION BY id ORDER BY month
RANGE BETWEEN 2 PRECEDING AND CURRENT ROW) As salary
FROM employee
WHERE (id,month) NOT IN (SELECT id,MAX(month) as month FROM employee GROUP BY id)
ORDER BY id, month DESC;

