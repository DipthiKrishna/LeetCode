/*WITH c2 AS (select count(distinct(concat(requester_id,accepter_id))) as na FROM requestaccepted),
c1 AS(select COUNT(distinct(concat(sender_id,send_to_id)))as nr FROM FriendRequest)
SELECT case when c1.nr =0.00 then 0 else cast(c2.na*1.0/c1.nr as decimal) end aS accept_rate;
from c2, c1;*/
WITH c2 AS (
    SELECT COUNT(DISTINCT CONCAT(requester_id, accepter_id)) AS na 
    FROM requestaccepted
),
c1 AS (
    SELECT COUNT(DISTINCT CONCAT(sender_id, send_to_id)) AS nr 
    FROM FriendRequest
)
SELECT ROUND(
    CASE 
        WHEN c1.nr = 0 THEN 0 
        ELSE CAST(c2.na * 1.0 / c1.nr AS DECIMAL)
    END ,2)AS accept_rate
FROM c2, c1;
