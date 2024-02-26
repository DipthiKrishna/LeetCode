-- Write your PostgreSQL query statement below
WITH ap AS (SELECT sale_date,SUM(sold_num) AS apple_sold
                FROM Sales
                WHERE fruit = 'apples'
                GROUP BY sale_date ),
    os AS (SELECT sale_date,SUM(sold_num) AS orange_sold
                FROM Sales
                WHERE fruit = 'oranges'
                GROUP BY sale_date )
SELECT ap.sale_date,(ap.apple_sold - os.orange_sold)AS diff
FROM ap
JOIN os ON ap.sale_date = os.sale_date
GROUP BY ap.sale_date,ap.apple_sold,os.orange_sold
ORDER BY ap.sale_date;

