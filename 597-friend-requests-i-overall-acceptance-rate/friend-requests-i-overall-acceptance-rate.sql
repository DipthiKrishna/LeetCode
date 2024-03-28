WITH c2 AS (SELECT COUNT(DISTINCT CONCAT(requester_id, accepter_id)) AS na
FROM requestaccepted ),
c1 AS (SELECT COUNT(DISTINCT CONCAT(sender_id, send_to_id)) AS nr
FROM FriendRequest)
SELECT ROUND(
    CASE 
        WHEN c1.nr <> 0 THEN c2.na/c1.nr::numeric 
        ELSE 0
    END
,2)AS accept_rate FROM c2, c1;
