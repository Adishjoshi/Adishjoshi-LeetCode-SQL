# Write your MySQL query statement below

WITH cte AS (
    SELECT 
        activity_date,
        user_id,
        RANK() OVER (PARTITION BY user_id ORDER BY activity_date ASC) AS rnk
    FROM Traffic
    WHERE 
        
        activity = 'login'
)
SELECT 
    activity_date AS login_date,
    COUNT( distinct user_id) AS user_count
FROM cte
WHERE rnk = 1 and activity_date BETWEEN DATE_SUB('2019-06-30', INTERVAL 90 DAY) AND '2019-06-30'
GROUP BY activity_date;

