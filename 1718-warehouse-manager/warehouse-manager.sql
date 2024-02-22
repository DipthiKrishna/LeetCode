-- Write your PostgreSQL query statement below
SELECT name AS warehouse_name,
    SUM(units*width*length*height) AS volume
FROM warehouse
LEFT JOIN products ON warehouse.product_id = products.product_id
GROUP BY name;