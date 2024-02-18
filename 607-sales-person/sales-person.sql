-- Write your PostgreSQL query statement below
/*SELECT s.name
FROM SalesPerson s
LEFT JOIN Orders o ON s.sales_id = o.sales_id
LEFT JOIN Company c ON o.com_id =c.com_id
GROUP BY s.name,c.name,o.order_id
HAVING o.order_id IS NULL OR c.name = 'RED' ;*/

--WITH redcomp AS
            
SELECT name
FROM SalesPerson
WHERE sales_id NOT IN 
(SELECT sales_id
FROM Orders
LEFT JOIN Company ON Orders.com_id = Company.com_id
WHERE name = 'RED');

