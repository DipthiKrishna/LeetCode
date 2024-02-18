-- Write your PostgreSQL query statement below
/*SELECT s.name
FROM SalesPerson s
LEFT JOIN Orders o ON s.sales_id = o.sales_id
LEFT JOIN Company c ON o.com_id =c.com_id
GROUP BY s.name,c.name,o.order_id
HAVING o.order_id IS NULL OR c.name = 'RED' ;*/

--WITH redcomp AS
            
SELECT s.name
FROM SalesPerson s
WHERE s.sales_id NOT IN (SELECT o.sales_id
            FROM Orders o
            LEFT JOIN Company c ON o.com_id = c.com_id
            WHERE c.name = 'RED');

