-- Write your PostgreSQL query statement below
WITH ap AS
(SELECT sale_date,sold_num
FROM Sales
WHERE fruit = 'apples'),
os AS
(SELECT sale_date,sold_num
FROM Sales
WHERE fruit = 'oranges')
SELECT ap.sale_date,(ap.sold_num - os.sold_num)AS diff
FROM ap
JOIN os ON ap.sale_date = os.sale_date
GROUP BY ap.sale_date,ap.sold_num,os.sold_num
ORDER BY ap.sale_date;

