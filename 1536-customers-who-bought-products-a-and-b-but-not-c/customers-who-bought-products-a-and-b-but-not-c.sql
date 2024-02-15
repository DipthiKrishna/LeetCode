-- Write your PostgreSQL query statement below
SELECT o.customer_id, c.customer_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY o.customer_id, c.customer_name
HAVING COUNT(DISTINCT CASE WHEN o.product_name IN ('A','B') THEN o.product_name END)=2
    AND COUNT(DISTINCT CASE WHEN o.product_name = 'C' THEN o.product_name END)=0
ORDER BY o.customer_id;
