-- Write your PostgreSQL query statement below
SELECT s.seller_name
FROM Seller s
LEFT JOIN (SELECT seller_id,order_id FROM orders
            WHERE EXTRACT(YEAR FROM sale_date)=2020)o
USING(seller_id)
WHERE o.order_id IS NULL 
ORDER BY s.seller_name ASC;