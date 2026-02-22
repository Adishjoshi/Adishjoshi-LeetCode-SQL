# Write your MySQL query statement below
WITH rolling AS (
    SELECT 
        user_id,
        steps_date,

        ROUND(AVG(steps_count) OVER (
            PARTITION BY user_id 
            ORDER BY steps_date 
            RANGE BETWEEN INTERVAL 2 DAY PRECEDING AND CURRENT ROW
        ), 2) AS rolling_average,

        COUNT(*) OVER (
            PARTITION BY user_id 
            ORDER BY steps_date 
            RANGE BETWEEN INTERVAL 2 DAY PRECEDING AND CURRENT ROW
        ) AS days_in_window
        
    FROM steps
)
SELECT 
    user_id,
    steps_date,
    rolling_average
FROM rolling
WHERE days_in_window = 3
ORDER BY user_id, steps_date
