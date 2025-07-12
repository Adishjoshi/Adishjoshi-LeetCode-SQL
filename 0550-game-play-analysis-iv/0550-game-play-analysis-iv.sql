SELECT ROUND((select COUNT(player_id) FROM (
    SELECT 
        player_id,
        event_date,
        LEAD(event_date) OVER(PARTITION BY player_id ORDER BY event_date) AS next_date,
        ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY event_date) AS login_time
    FROM Activity
) AS tmp 

WHERE datediff(next_date, event_date) = 1 AND login_time = 1) 
/ (SELECT COUNT(DISTINCT(player_id)) FROM Activity), 2) AS fraction;