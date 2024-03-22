-- Write your PostgreSQL query statement below
SELECT c.name
FROM candidate c
LEFT JOIN vote v ON c.id=v.candidateId
GROUP BY v.candidateId,c.name
ORDER BY COUNT(v.id) DESC
LIMIT 1;