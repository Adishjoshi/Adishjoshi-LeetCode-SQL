WITH Fridays AS (
    SELECT 
        '2023-11-03' AS date, 1 AS week_of_month UNION ALL
        SELECT '2023-11-10', 2 UNION ALL
        SELECT '2023-11-17', 3 UNION ALL
        SELECT '2023-11-24', 4
),
Spending AS (
    SELECT 
        u.membership,
        f.week_of_month,
        COALESCE(SUM(p.amount_spend), 0) AS total_amount
    FROM Fridays f
    LEFT JOIN Purchases p ON f.date = p.purchase_date
    JOIN Users u ON u.user_id = p.user_id AND u.membership IN ('Premium', 'VIP')
    GROUP BY u.membership, f.week_of_month
)
SELECT 
    f.week_of_month,
    m.membership,
    COALESCE(s.total_amount, 0) AS total_amount
FROM (
    SELECT 'Premium' AS membership UNION ALL
    SELECT 'VIP'
) m
CROSS JOIN Fridays f
LEFT JOIN Spending s ON s.week_of_month = f.week_of_month AND s.membership = m.membership
ORDER BY f.week_of_month, m.membership;
