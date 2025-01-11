-- Write your MySQL query statement below
SELECT 
    host_team,
    SUM(CASE 
        WHEN host_goals > guest_goals THEN 3
        WHEN host_goals = guest_goals THEN 1
        ELSE 0 
    END) AS total_score
FROM Matches
GROUP BY host_team
