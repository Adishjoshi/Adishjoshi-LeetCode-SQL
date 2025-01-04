WITH cte AS (
    SELECT 
        s.sale_id,
        s.product_id,
        s.user_id,
        s.quantity,
        p.price,
        (p.price * s.quantity) AS spend
    FROM 
        Sales s 
    LEFT JOIN 
        Product p ON s.product_id = p.product_id
),
cte2 AS (
    SELECT 
        user_id, 
        product_id, 
        SUM(spend) AS totalspend
    FROM 
        cte
    GROUP BY 
        user_id, 
        product_id
),
cte3 AS (
    SELECT 
        *,
        RANK() OVER (PARTITION BY user_id ORDER BY totalspend DESC) AS rnk
    FROM 
        cte2
)
SELECT 
    user_id, product_id
FROM 
    cte3 
    where rnk = '1'
