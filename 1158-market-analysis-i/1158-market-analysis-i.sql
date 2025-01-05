WITH cte AS (
    SELECT 
        u.user_id AS buyer_id,
        u.join_date,
        o.order_id,
        o.order_date
    FROM Users u
    LEFT JOIN Orders o ON u.user_id = o.buyer_id
)
SELECT 
    buyer_id, 
    join_date, 
    COUNT(CASE WHEN YEAR(order_date) = 2019 THEN 1 ELSE NULL END) AS orders_in_2019
FROM cte
GROUP BY buyer_id, join_date;
