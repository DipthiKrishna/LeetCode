-- Write your PostgreSQL query statement below
select email 
from (select count(*) as num,email from Person group by email)
where num >1;