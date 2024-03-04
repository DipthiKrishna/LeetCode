-- Write your PostgreSQL query statement below
SELECT o.customer_id,c.name
FROM customers c
JOIN Orders o ON o.customer_id=c.customer_id
JOIN product p ON o.product_id = p.product_id
WHERE EXTRACT(YEAR from o.order_date) = 2020
GROUP BY o.customer_id,c.name
HAVING SUM(CASE WHEN EXTRACT(month from o.order_date) IN (6)THEN (p.price*o.quantity) ELSE 0 END)>=100
    AND SUM(CASE WHEN EXTRACT(month from o.order_date) IN (7) THEN (p.price*o.quantity)ELSE 0 END)>=100;
