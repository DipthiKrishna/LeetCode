WITH unbanned_users AS (
    SELECT 
        request_at,
        COUNT(*) AS unbanned
    FROM 
        trips 
    JOIN 
        users ON trips.client_id = users.users_id AND users.banned = 'No'
    WHERE 
        request_at BETWEEN '2013-10-01' AND '2013-10-03'
    GROUP BY 
        request_at
)
SELECT 
    t.request_at AS "Day",
    ROUND(
        SUM(
            CASE 
                WHEN t.status = 'cancelled_by_driver' OR t.status = 'cancelled_by_client' THEN 1 
                ELSE 0 
            END
        ) * 1.0 / NULLIF(u.unbanned, 0)
    , 2) AS "Cancellation Rate"
FROM 
    trips t
JOIN 
    users us ON t.client_id = us.users_id
LEFT JOIN 
    unbanned_users u ON t.request_at = u.request_at
WHERE 
    t.client_id not in (select users_id from Users where banned = 'Yes') 
    and t.driver_id not in (select users_id from Users where banned = 'Yes')
    AND t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY 
    t.request_at, u.unbanned
ORDER BY 
    t.request_at;
