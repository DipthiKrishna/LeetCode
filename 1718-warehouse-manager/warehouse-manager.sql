-- Write your PostgreSQL query statement below
SELECT warehouse.name AS warehouse_name,
SUM(units*width*products.length*height) AS volume
FROM warehouse
LEFT JOIN products
ON warehouse.product_id=products.product_id
GROUP BY warehouse.name;