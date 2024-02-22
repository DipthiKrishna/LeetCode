-- Write your PostgreSQL query statement below
select name as warehouse_name,SUM(units*width*length*height) as volume
from warehouse
left join products
using(product_id)
group by name;