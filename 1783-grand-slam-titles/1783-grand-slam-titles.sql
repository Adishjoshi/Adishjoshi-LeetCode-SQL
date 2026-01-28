
WITH cte AS (
    SELECT year, 'Wimbledon' AS championship, Wimbledon AS player_id FROM Championships
    UNION ALL
    SELECT year, 'Fr_open' AS championship, Fr_open FROM Championships
    UNION ALL
    SELECT year, 'US_open' AS championship, US_open FROM Championships
    UNION ALL
    SELECT year, 'Au_open' AS championship, Au_open FROM Championships
)
SELECT 
    p.player_id,
    p.player_name,
    COUNT(cte.championship) AS grand_slams_count
FROM cte
JOIN Players AS p ON cte.player_id = p.player_id
GROUP BY 
    p.player_id, 
    p.player_name