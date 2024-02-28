-- Write your PostgreSQL query statement below
SELECT u.name,SUM(t.amount) AS balance
FROM users u
LEFT JOIN transactions t ON u.account = t.account
GROUP BY u.name HAVING SUM(t.amount) >10000;