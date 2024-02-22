-- Write your PostgreSQL query statement below
select warehouse.name as warehouse_name,SUM(units*width*products.length*height) as volume
from warehouse
left join products
using(product_id)
group by warehouse.name;