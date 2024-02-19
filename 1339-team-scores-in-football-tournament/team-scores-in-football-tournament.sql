-- Write your PostgreSQL query statement below
WITH totpoints AS
                (SELECT host_team AS team_id,
                    SUM(CASE WHEN host_goals > guest_goals THEN 3
                         WHEN host_goals < guest_goals THEN 0
                         ELSE 1
                         END )points
                FROM Matches m
                GROUP BY team_id
                UNION ALL
                SELECT guest_team AS team_id,
                    SUM(CASE WHEN guest_goals > host_goals THEN 3
                         WHEN guest_goals < host_goals THEN 0
                         ELSE 1
                         END )points
                FROM Matches m
                GROUP BY team_id)

SELECT t.team_id,
    t.team_name,
    COALESCE(SUM(totpoints.points),0) AS num_points
FROM Teams t
LEFT JOIN totpoints ON t.team_id = totpoints.team_id
GROUP BY t.team_id,t.team_name
ORDER BY num_points DESC,team_id ASC;